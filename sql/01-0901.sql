

SELECT CONCAT('cd /home/www/conversion-api-koa; sudo node bin/main.js NonethVideo1Command --id=',vd.id , ' --url="',


  CASE WHEN path REGEXP '^https?://' THEN path 
  
  WHEN path NOT REGEXP '^/' THEN CONCAT('https://download.eny7kg.com/', path)
  ELSE CONCAT('https://download.eny7kg.com', path) 
  
  END,

  '" --filename="', CASE
    WHEN vv.file_name REGEXP '\\.[a-zA-Z0-9]+$' THEN vv.file_name
    ELSE CONCAT(vv.file_name, '.mp4')
  END,'"', IF(MOD(vd.id, 4) = 0, ';', ';') , ' #',  v.d_id, ' ', vv.sort, ' ' ,vd.resolution)  FROM `mac_vod` AS v
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
WHERE vd.path NOT REGEXP '/aac/h264/hls/' AND v.d_hide = 0 AND v.d_status = 1
ORDER BY vv.id ASC LIMIT 0, 1000000;