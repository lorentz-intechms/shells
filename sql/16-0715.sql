SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --app_user_name="one_auto_01" ', '--id=', id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', CASE 
    WHEN LEFT(download_path, 1) = '/' THEN SUBSTRING(download_path, 2)
    ELSE download_path
  END, '" ; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') ORDER BY id ASC;