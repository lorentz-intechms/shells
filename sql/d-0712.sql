SELECT CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo31Command --app_id=31 --id=', id, ' --url="https://gjvd-new-obs.obs.ap-southeast-3.myhuaweicloud.com', IF(enc_url_265 = '', enc_url, enc_url_265), '" --filename="', id, '.mp4" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # ', ' -- ', updated_at, ' ', pwa_url) 
FROM `video_content_expands` 
WHERE enc_url NOT REGEXP '/aac/h264/hls/' AND 
enc_url != ''  AND tencent_enc_url = ''

ORDER BY  `id`  ASC;

