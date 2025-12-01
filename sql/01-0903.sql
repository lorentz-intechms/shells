



SELECT 
  v.d_name AS '劇集名稱', 
  vv.title AS '集抬頭', 
    CASE WHEN path REGEXP '^https?://' THEN path 
  
  WHEN path NOT REGEXP '^/' THEN CONCAT('https://download.eny7kg.com/', path)
  ELSE CONCAT('https://download.eny7kg.com', path) 
  
  END AS '播放地址',
  vv.sort AS '集',
  vv.id AS '集數ID', 
  v.d_id AS '劇集ID'  

FROM `mac_vod` AS v
LEFT JOIN `mac_vurl` AS vv ON v.d_id = vv.d_id
LEFT JOIN
(
SELECT *
FROM mac_vurl_detail d1
WHERE CAST(d1.resolution AS UNSIGNED) = (
    SELECT MAX(CAST(resolution AS UNSIGNED))
    FROM mac_vurl_detail d2
    WHERE d2.vurl_id = d1.vurl_id AND d2.type = 'DECRYPTION'
) AND d1.type = 'DECRYPTION'



) AS vd
 ON vv.id = vd.vurl_id
WHERE vd.path NOT REGEXP '/aac/h264/hls/' AND v.d_hide = 0 AND v.d_status = 1 AND vd.path LIKE '/%'  

ORDER BY vd.path 
LIMIT 0, 10000000000000;




