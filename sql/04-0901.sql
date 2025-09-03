SELECT text FROM 
(SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo4Command --app_id=4 --id=', id, ' --url="https://gjvd-new-obs.obs.ap-southeast-3.myhuaweicloud.com', enc_url, '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # is_transcoding=', is_transcoding, ', -- ', updated_at, ' enc_url_265=', enc_url_265, ', status=', status) AS text, id, status, enc_url_265
FROM `video_movies` AS v1
WHERE is_transcoding = 1 
 

 UNION


 SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo4Command --app_id=4 --id=', id, ' --url="https://gjvd-new-obs.obs.ap-southeast-3.myhuaweicloud.com', 
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


  , '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # is_transcoding=', is_transcoding, ', ' , subtitle, ' -- ', updated_at, ' -- ', pwa_url, ', status=', status) AS text , id,status, enc_url_265
FROM `video_movies`  AS v2
WHERE is_transcoding = 0 
) AS tt  WHERE status != 0 AND id IN 
(

)
ORDER BY enc_url_265 ASC
LIMIT 0000, 1000;

