#!/usr/bin/env php
<?php
/**
 * Jira 工时统计脚本
 * 用法：php jira_worklog.php --month=2025-09
 */

// ====================== 基本配置 ======================
$jiraUrl  = "http://newjira.eyzee2.com:8080";
$username = "lorentz";      // Jira 用户名
$password = "ntU0000!";   // 密码或 API Token

// ====================== 参数处理 ======================
$options = getopt("", ["month:"]);
if (empty($options['month'])) {
    echo "❌ 用法: php jira_worklog.php --month=YYYY-MM\n";
    exit(1);
}

$month = $options['month']; // 例如 2025-09
if (!preg_match('/^\d{4}-\d{2}$/', $month)) {
    echo "❌ 参数格式错误，应为 YYYY-MM，例如 2025-09\n";
    exit(1);
}

// 计算起止日期
$startDate = "$month-01";
$endDate   = date("Y-m-d", strtotime("$startDate +1 month"));

// ====================== 构造 JQL ======================
$jql = urlencode("worklogAuthor = currentUser() AND worklogDate >= \"$startDate\" AND worklogDate < \"$endDate\"");
$url = "$jiraUrl/rest/api/2/search?jql=$jql&fields=worklog,project,summary,versions,key,status&maxResults=1000";
// ====================== 调用 Jira API ======================
$ch = curl_init();
curl_setopt_array($ch, [
    CURLOPT_URL => $url,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_USERPWD => "$username:$password",
    CURLOPT_HTTPHEADER => ["Content-Type: application/json"],
]);
$response = curl_exec($ch);

if (curl_errno($ch)) {
    die("Curl error: " . curl_error($ch));
}
curl_close($ch);

// ====================== 解析结果 ======================
$data = json_decode($response, true);
if (!$data || !isset($data['issues'])) {
    die("Invalid response: " . substr($response, 0, 200) . "...\n");
}

// ====================== 状态定义 ======================
$doneKeywords = ['done', 'closed', 'resolved', '完成', '已完成', '关闭', '发布', '通过'];
$doingKeyword = ['处理中'];

// ====================== 统计逻辑 ======================
$results = [];

foreach ($data['issues'] as $issue) {
    $projectName = $issue['fields']['project']['name'];
    $issueKey    = $issue['key'];
    $summary     = $issue['fields']['summary'];
    $statusName  = $issue['fields']['status']['name'];
    $versions    = $issue['fields']['versions'];
    $versionName = !empty($versions) ? $versions[0]['name'] : null;

    if (!isset($results[$projectName])) {
        $results[$projectName] = [
            'versions' => [],
            'noVersion' => []
        ];
    }

    
    $isDone = false;
    $isDoing = false;

    // 判断是否为"已完成"
    foreach ($doneKeywords as $kw) {
        if (stripos($statusName, $kw) !== false) {
            $isDone = true;
            break;
        }
    }
    
    // 判断是否为"处理中"
    foreach ($doingKeyword as $kw) {
        if (stripos($statusName, $kw) !== false) {
            $isDoing = true;
            break;
        }
    }

    // 初始化版本项
    if ($versionName) {
        if (!isset($results[$projectName]['versions'][$versionName])) {
            $results[$projectName]['versions'][$versionName] = [
                'seconds' => 0,
                'jiraCount' => 0,
                'doneCount' => 0,
                'doingCount' => 0,
            ];
        }
        $results[$projectName]['versions'][$versionName]['jiraCount'] += 1;
        if ($isDone) {
            $results[$projectName]['versions'][$versionName]['doneCount'] += 1;
        }
        if ($isDoing) {
            $results[$projectName]['versions'][$versionName]['doingCount'] += 1;
        }
    }

    // 工时统计
    if (isset($issue['fields']['worklog']['worklogs'])) {
        foreach ($issue['fields']['worklog']['worklogs'] as $worklog) {
            $author = $worklog['author']['name'] ?? $worklog['author']['key'] ?? '';
            $started = substr($worklog['started'], 0, 10);
            if ($author === $username && $started >= $startDate && $started < $endDate) {

                $seconds = $worklog['timeSpentSeconds'];
                if ($versionName) {
                    $results[$projectName]['versions'][$versionName]['seconds'] += $seconds;
                } else {
                    if (!isset($results[$projectName]['noVersion'][$issueKey])) {
                        $results[$projectName]['noVersion'][$issueKey] = [
                            'seconds' => 0,
                            'summary' => $summary,
                            'status' => $statusName,
                            'isDone' => $isDone,
                            'isDoing' => $isDoing
                        ];
                    }
                    $results[$projectName]['noVersion'][$issueKey]['seconds'] += $seconds;
                }
            }
        }
    }
}

// ====================== 输出结果 ======================
echo "==== {$month} 工时统计（按项目 + 版本/非版本） ====\n\n";

foreach ($results as $project => $data) {
    echo "【项目】 $project\n";

    // 有版本
    if (!empty($data['versions'])) {
        echo "  [版本汇总]\n";
        foreach ($data['versions'] as $version => $info) {
            $hours = round($info['seconds'] / 3600, 2);
            $unstart = $info['jiraCount']-$info['doneCount']-$info['doingCount'];
            
            // 使用 str_pad 对齐输出
            $versionPad = str_pad($version, 15);
            $hoursPad = str_pad("{$hours} h", 10);
            $jiraCountPad = str_pad("总Jira: {$info['jiraCount']}", 12);
            $doneCountPad = str_pad("已完成: {$info['doneCount']}", 12);
            $doingCountPad = str_pad("处理中: {$info['doingCount']}", 12);
            $unstartPad = str_pad("待办中: {$unstart}", 12);
            
            echo "    - {$versionPad} | {$hoursPad} | {$jiraCountPad} | {$doneCountPad} | {$doingCountPad} | {$unstartPad}\n";
        }
    }

    // 无版本
    if (!empty($data['noVersion'])) {
        echo "  [无版本汇总]\n";
        
        // 计算无版本事项的汇总数据
        $totalSeconds = 0;
        $totalJira = count($data['noVersion']);
        $doneCount = 0;
        $doingCount = 0;
        
        // 收集所有无版本事项的状态信息
        foreach ($data['noVersion'] as $issueKey => $info) {
            $totalSeconds += $info['seconds'];
            if ($info['isDone']) {
                $doneCount++;
            }
            if ($info['isDoing']) {
                $doingCount++;
            }
        }
        
        // 输出汇总行
        $totalHours = round($totalSeconds / 3600, 2);
        $summaryPad = str_pad("底下列表合计", 15);
        $hoursPad = str_pad("{$totalHours} 小时", 10);
        $jiraCountPad = str_pad("总Jira: {$totalJira}", 12);
        $doneCountPad = str_pad("已完成: {$doneCount}", 12);
        $doingCountPad = str_pad("处理中: {$doingCount}", 12);
        $unstartPad = str_pad("待办中: " . ($totalJira-$doneCount-$doingCount), 12);
        
        echo "    - {$summaryPad} | {$hoursPad} | {$jiraCountPad} | {$doneCountPad} | {$doingCountPad} | {$unstartPad}\n";
        
        // 输出详细事项
        foreach ($data['noVersion'] as $issueKey => $info) {
            $hours = round($info['seconds'] / 3600, 2);
            
            // 使用 str_pad 对齐输出
            $issuePad = str_pad($issueKey, 15);
            $hoursPad = str_pad("{$hours} 小时", 10);
            $summaryPad = str_pad($info['summary'], 50);
            
            echo "    - {$issuePad} | {$hoursPad} | {$summaryPad}\n";
        }
    }

    echo "\n";
}
