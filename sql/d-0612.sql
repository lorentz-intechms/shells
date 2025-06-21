SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-app" node bin/main.js NonethVideo4Command --app_id=4 --id=', id, ' --url="https://nl4cgvem.xwzh022.com', IF(enc_url_265 = '', enc_url, enc_url_265), '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # ', subtitle, ' -- ', updated_at, ' --https://qzpwa-hw.point-memory.com', pwa_url) 
FROM `video_movies` 
WHERE enc_url NOT REGEXP '/aac/h264/hls/' AND 
enc_url != '' AND 
tencent_enc_url = '' AND
 is_transcoding = 1 

 ORDER BY  `updated_at`  DESC;