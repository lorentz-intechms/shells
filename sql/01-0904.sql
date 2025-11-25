



SELECT 
  CONCAT('DELETE FROM `mac_vurl_detail` WHERE vurl_id=', vd.vurl_id, '`; #v.d_name=', v.d_name, ', vv.sort=', vv.sort, ', vv.file_name=' ,vv.file_name, ', https://download.eny7kg.com', vd.path)  

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
WHERE vd.path NOT REGEXP '/aac/h264/hls/' AND v.d_hide = 0 AND v.d_status = 1 AND vd.path LIKE '/%'  AND vv.file_name
IN

(
  '678_第5集_4.mp4',
  '1376_第25集_24.mp4',
  '1376_第27集_26.mp4',
  '1379_第5集_4.mp4'
)

ORDER BY vd.path 
LIMIT 0, 10000000000000;




