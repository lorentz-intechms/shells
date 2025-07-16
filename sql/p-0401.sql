SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --id=', id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', id, '.mp4"; # filename=', filename)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') limit 1000;