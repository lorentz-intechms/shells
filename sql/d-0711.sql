SELECT text FROM 
(SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo5Command --app_id=5 --id=', id, ' --url="https://nl4cgvem.xwzh022.com', IF(enc_url_265 = '', enc_url, enc_url_265), '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # is_transcoding=', is_transcoding, ', -- ', updated_at, ' --https://qzpwa-hw.point-memory.com', pwa_url, ', status=', status) AS text, status
FROM `video_micro_movies` AS v1
WHERE enc_url NOT REGEXP '/aac/h264/hls/' AND 
enc_url != '' AND 
tencent_enc_url = '' 
 AND is_transcoding = 1  AND cdn_number != 4
 

 UNION


 SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo5Command --app_id=5 --id=', id, ' --url="https://nl4cgvem.xwzh022.com', 
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


  , '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # is_transcoding=', is_transcoding, ', ' , subtitle, ' -- ', updated_at, ' -- ', pwa_url, ', status=', status) AS text ,status
FROM `video_micro_movies`  AS v2
WHERE url NOT REGEXP '/aac/h264/hls/' 
url != '' AND 
tencent_enc_url = '' AND is_transcoding = 0 AND cdn_number != 4
) AS tt 
ORDER BY status ASC;

