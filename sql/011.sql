## q2wjmspnn.ybdxjy.com   qqc 未加密视频域名
## f68c.fa135ka.com   qqc 加密视频域名


SELECT 


FROM 

(SELECT 
    m.id AS video_id,
    m.video_name,
    m.cdn_number,
    -- 地址来源判断
    CASE 
        WHEN m.url IS NOT NULL AND m.url != '' THEN 'videos表'
        ELSE 'movie_urls表'
    END AS url_source,
    -- 实际使用的解密地址
    CASE 
        WHEN m.url IS NOT NULL AND m.url != '' THEN m.url
        ELSE d.path
    END AS actual_url,
    -- 拼接完整的解密播放地址
    CASE 
        WHEN m.url IS NOT NULL AND m.url != '' 
            THEN CONCAT(TRIM(TRAILING '/' FROM 'https://q2wjmspnn.ybdxjy.com'), '/', TRIM(LEADING '/' FROM m.url))
        ELSE CONCAT(TRIM(TRAILING '/' FROM 'https://q2wjmspnn.ybdxjy.com'), '/', TRIM(LEADING '/' FROM d.path))
    END AS decryption_full_url,
    -- 拼接完整的加密播放地址
    CASE 
        WHEN m.url IS NOT NULL AND m.url != '' 
            THEN CONCAT(TRIM(TRAILING '/' FROM 'https://f68c.fa135ka.com'), '/', TRIM(LEADING '/' FROM m.url))
        WHEN e.path IS NOT NULL AND e.path != ''
            THEN CONCAT(TRIM(TRAILING '/' FROM 'https://f68c.fa135ka.com'), '/', TRIM(LEADING '/' FROM e.path))
        ELSE NULL
    END AS encryption_full_url
FROM video_movies m
-- 解密地址（LEFT JOIN，允许为空）
LEFT JOIN video_movie_urls d ON d.movie_id = m.id 
    AND d.type_file = 'DECRYPTION' 
    AND d.type_extension = '.m3u8'
-- 加密地址（LEFT JOIN，允许为空）
LEFT JOIN video_movie_urls e ON e.movie_id = m.id 
    AND e.type_file = 'ENCRYPTION' 
    AND e.type_extension = '.m3u8'
-- 未加密CDN
LEFT JOIN (
    SELECT number, domain
    FROM video_cdns 
    WHERE TYPE = '0' 
        AND is_encrypt = 0 
        AND STATUS = '0'
        AND app_id IN (0, 3)
    ORDER BY app_id DESC, balance_weight DESC
) cdn_d ON cdn_d.number = m.cdn_number
-- 加密CDN
LEFT JOIN (
    SELECT number, domain
    FROM video_cdns 
    WHERE TYPE = '0' 
        AND is_encrypt = 1 
        AND STATUS = '0'
        AND app_id IN (0, 3)
    ORDER BY app_id DESC, balance_weight DESC
) cdn_e ON cdn_e.number = m.cdn_number
WHERE m.status = 1
    AND m.qz_video_id = 0
    -- 必须有地址可用（videos.url 或 movie_urls.path 至少有一个）
    AND (
        (m.url IS NOT NULL AND m.url != '')
        OR (d.path IS NOT NULL AND d.path != '')
    )
    -- 必须有CDN配置
    AND cdn_d.domain IS NOT NULL
GROUP BY m.id
ORDER BY m.id ASC) AS t;