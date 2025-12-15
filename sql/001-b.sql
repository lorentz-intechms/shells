SELECT CONCAT('DELETE FROM mac_vurl_detail WHERE vurl_id =', vurl_id, " AND resolution='480' ;", )
FROM mac_vurl_detail GROUP BY vurl_id 

HAVING COUNT(*) = 3
ORDER BY vurl_id;