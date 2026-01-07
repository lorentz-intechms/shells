## q2wjmspnn.ybdxjy.com   qqc 未加密视频域名
## f68c.fa135ka.com   qqc 加密视频域名


SELECT 

    CONCAT("sudo node bin/main.js NonethVideo11Command --app_id=11 --id=", video_id, " --url='https://f68c.fa135ka.com", encryption_url,  "' --filename='", video_id, ".mp4' --algorithm='aes-128-ecb' --key='saIZXc4yMvq0Iz56';")


FROM 

(SELECT 
    m.id AS video_id,
    m.video_name,
    m.cdn_number,
    -- 未加密地址
    CASE 
        WHEN m.url IS NOT NULL AND m.url != '' THEN m.url
        ELSE d.path
    END AS decryption_url,
    -- 加密地址
    CASE 
        WHEN m.url IS NOT NULL AND m.url != '' THEN m.url
        ELSE e.path
    END AS encryption_url
FROM video_movies m
LEFT JOIN video_movie_urls d ON d.movie_id = m.id 
    AND d.type_file = 'DECRYPTION' 
    AND d.type_extension = '.m3u8'
LEFT JOIN video_movie_urls e ON e.movie_id = m.id 
    AND e.type_file = 'ENCRYPTION' 
    AND e.type_extension = '.m3u8'
LEFT JOIN video_cdns cdn_d ON cdn_d.number = m.cdn_number 
    AND cdn_d.type = '0' 
    AND cdn_d.is_encrypt = 0 
    AND cdn_d.status = '0'
WHERE m.status = 1
    AND m.qz_video_id = 0
    AND (
        (m.url IS NOT NULL AND m.url != '')
        OR (d.path IS NOT NULL AND d.path != '')
    )
    AND cdn_d.domain IS NOT NULL
GROUP BY m.id
ORDER BY m.id ASC) AS t;