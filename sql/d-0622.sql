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


  , '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # ', subtitle, ' -- ', updated_at, ' -- ', ' --https://qzpwa-hw.point-memory.com', pwa_url) 
FROM `video_movies` 
WHERE url NOT REGEXP '/aac/h264/hls/' AND 
url != '' AND 
tencent_enc_url = '' AND is_transcoding = 0

ORDER BY  `updated_at`  DESC;