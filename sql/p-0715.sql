SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --id=', id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', id, '.mp4"; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') ORDER BY id ASC;







SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethM3u8Command --app_id=16 --id=', id, ' --url="https://gjvd-new-obs.obs.ap-southeast-3.myhuaweicloud.com',
encrypt_path, '" --filename="', id, '.mp4"; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') ORDER BY id ASC;



# https://one-encryption-obs.obs.la-north-2.myhuaweicloud.com