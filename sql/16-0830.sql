SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --app_user_name="one_auto_01" ', '--id=', id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', CASE 
    WHEN download_path LIKE '/one/%' THEN SUBSTRING(download_path, 6)
    WHEN download_path LIKE '/%' THEN SUBSTRING(download_path, 2)
    ELSE download_path
  END, '" ; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') AND path NOT REGEXP '/aac/h264/hls/' 
ORDER BY id ASC;