SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --id=', id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', id, '.mp4"; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') ORDER BY id ASC;







SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethM3u8Command --app_id=16 --id=', id, ' --url="https://one-encryption-obs.obs.la-north-2.myhuaweicloud.com',
encrypt_path, '" --filename="', id, '.mp4"  --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56"; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') ORDER BY id ASC;

# 1119
# 
# https://one-encryption-obs.obs.la-north-2.myhuaweicloud.com/encry/vd/20250716/NTYxY2M2NzEz/120436/1024_576/aac/h264/hls/decrypt/index.m3u8   

https://vdmk.mfpt8g.com/one/20230217/NSFS-113C.mp4

https://vdmk.mfpt8g.com/20250713/yingying20250716.mp4
