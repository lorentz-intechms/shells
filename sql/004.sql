SELECT CONCAT('sudo node bin/main.js NonethM3u8Command --app_id=4 --id=', ap.id, ' --url="https://enlvd4cili.ahplm.com/', ausa.key, '" --filename="', ap.name, '" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # video_bit_rate=', ap.video_bit_rate, '  ,resolution=', ap.width, '_', ap.height) 
FROM `cv-003_0004-app_pipelines` AS ap
LEFT JOIN `cv-003_0004-app_uploader_stages` AS aus ON ap.id = aus.id 
LEFT JOIN `cv-003_0004-app_uploader_stage_actions` AS ausa ON aus.id = ausa.app_uploader_stage_id
WHERE ausa.app_converter_producer_id = 11 AND ausa.file = 1 AND ausa.step = 3;


-- PWA cdn https://qzpwa-hw.point-memory.com

SELECT CONCAT('cd /home/www/conversion-api-koa; FFMPEG_BIN="./bin/ffmpeg-app" node bin/main.js NonethVideo4Command --app_id=4 --id=', id, ' --url="https://enlvd4cili.ahplm.com', 
  CASE
    WHEN LOCATE('/hls/', url) > 0 THEN
      CONCAT(
        LEFT(
          url,
          LOCATE('/hls/', url) - 1 - 
            LOCATE('/', REVERSE(LEFT(url, LOCATE('/hls/', url) - 1))) + 1
        ),
        SUBSTRING(url, LOCATE('/hls/', url) + LENGTH('/hls/'))
      )
    ELSE url
  END


	, '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # ', subtitle, ' -- ', updated_at) 
FROM `video_movies` 
WHERE url NOT REGEXP '/aac/h264/hls/' AND 
url != '' AND 
tencent_enc_url = '' AND
id IN 

(10043,
10042,
10041,
10040,
10037,
10036,
10035,
10034,
10033,
10032,
10031,
10030,
10029,
10028,
10027,
10026,
10025,
10024,
10023)
 AND is_transcoding = 0

ORDER BY  `updated_at`  DESC;




SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-app" node bin/main.js NonethVideo4Command --app_id=4 --id=', id, ' --url="https://enlvd4cili.ahplm.com', IF(enc_url_265 = '', enc_url, enc_url_265), '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # ', subtitle, ' -- ', updated_at) 
FROM `video_movies` 
WHERE enc_url NOT REGEXP '/aac/h264/hls/' AND 
enc_url != '' AND 
tencent_enc_url = '' 
 AND is_transcoding = 1 ORDER BY  `updated_at`  DESC;





SELECT SUM(IF(is_transcoding = 0, 1, 0)) AS 't0', SUM(IF(is_transcoding = 1, 1, 0)) AS 't1' 
FROM video_movies
ORDER BY  `updated_at`  DESC
WHERE `updated_at` >= '2025-06-01 00:00:00';


