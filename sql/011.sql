## q2wjmspnn.ybdxjy.com   qqc 未加密视频域名
## f68c.fa135ka.com   qqc 加密视频域名


SELECT 
    m.id AS video_id,
    m.video_name AS video_name,
    CONCAT(TRIM(TRAILING '/' FROM cdn_d.domain), '/', TRIM(LEADING '/' FROM d.path)) AS decryption_url,
    CONCAT(TRIM(TRAILING '/' FROM cdn_e.domain), '/', TRIM(LEADING '/' FROM e.path)) AS encryption_url
FROM video_movies m
INNER JOIN video_movie_urls d ON d.movie_id = m.id 
    AND d.type_file = 'DECRYPTION' 
    AND d.type_extension = '.m3u8'
INNER JOIN video_movie_urls e ON e.movie_id = m.id 
    AND e.type_file = 'ENCRYPTION' 
    AND e.type_extension = '.m3u8'
-- 未加密CDN
INNER JOIN (
    SELECT number, domain
    FROM video_cdns 
    WHERE type = '0' 
        AND is_encrypt = 0 
        AND status = '0'
        AND app_id IN (0, 3)
    ORDER BY app_id DESC, balance_weight DESC
) cdn_d ON cdn_d.number = m.cdn_number
-- 加密CDN
INNER JOIN (
    SELECT number, domain
    FROM video_cdns 
    WHERE type = '0' 
        AND is_encrypt = 1 
        AND status = '0'
        AND app_id IN (0, 3)
    ORDER BY app_id DESC, balance_weight DESC
) cdn_e ON cdn_e.number = m.cdn_number
WHERE m.status = 1
    AND m.qz_video_id = 0
    AND d.path IS NOT NULL AND d.path != ''
    AND e.path IS NOT NULL AND e.path != ''
GROUP BY m.id;







SELECT 

	CONCAT("sudo node bin/main.js NonethVideo11Command --app_id=11 --id=", m.id, " --url='https://f68c.fa135ka.com/", TRIM(LEADING '/' FROM e.path), "' --filename='", m.id, ".mp4' --algorithm='aes-128-ecb' --key='saIZXc4yMvq0Iz56';")

FROM video_movies m
INNER JOIN video_movie_urls d ON d.movie_id = m.id 
    AND d.type_file = 'DECRYPTION' 
    AND d.type_extension = '.m3u8'
INNER JOIN video_movie_urls e ON e.movie_id = m.id 
    AND e.type_file = 'ENCRYPTION' 
    AND e.type_extension = '.m3u8'
-- 未加密CDN
INNER JOIN (
    SELECT number, domain
    FROM video_cdns 
    WHERE type = '0' 
        AND is_encrypt = 0 
        AND status = '0'
        AND app_id IN (0, 3)
    ORDER BY app_id DESC, balance_weight DESC
) cdn_d ON cdn_d.number = m.cdn_number
-- 加密CDN
INNER JOIN (
    SELECT number, domain
    FROM video_cdns 
    WHERE type = '0' 
        AND is_encrypt = 1 
        AND status = '0'
        AND app_id IN (0, 3)
    ORDER BY app_id DESC, balance_weight DESC
) cdn_e ON cdn_e.number = m.cdn_number
WHERE m.status = 1
    AND m.qz_video_id = 0
    AND d.path IS NOT NULL AND d.path != ''
    AND e.path IS NOT NULL AND e.path != ''
GROUP BY m.id;