SELECT CONCAT('DELETE FROM mac_vurl_detail WHERE vurl_id =', vurl_id, " AND resolution='480' ;")
FROM mac_vurl_detail GROUP BY vurl_id 

HAVING COUNT(*) >= 3
ORDER BY vurl_id;


全量切片那边开到满，一个月平均下来
瓜子：一台可以处理 630 视频，75GB 流量，6000 分钟时常
果酱：一台可以处理 290 视频，170GB 流量，1900 分钟时常

全量这边基本上就是开到满，线性去转码
增量那边不是，增量的运营至少 一天24小时中尖峰的 4小时，上传今天 80% 的量。
增量那边无法完全保证 运营上传了 就系统有空间给他用，尤其是 周五晚上 瓜子 果酱 都在上传的时候
