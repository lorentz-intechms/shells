SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --app_user_name="one_auto_01" ', '--id=', cv.id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', CASE 
    WHEN download_path LIKE '/one/%' THEN SUBSTRING(download_path, 6)
    WHEN download_path LIKE '/%' THEN SUBSTRING(download_path, 2)
    ELSE download_path
  END, '" ; # id=', cv.id, 'filename=', cv.filename, ' title=', IFNULL(cv.title, "--"), ', encrypt_path=', encrypt_path, ', path=', cv.path)

FROM `one_content_videos` AS cv LEFT JOIN `one_contents` AS c 
ON cv.content_id = c.id
WHERE cv.type IN ('main', 'preview') AND cv.path NOT REGEXP '/aac/h264/hls/' AND c.status = 1
ORDER BY cv.id ASC;






SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --app_user_name="one_auto_01" ', '--id=', cv.id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', cv.id '.mp4" ; # id=', cv.id, 'filename=', cv.id, '.mp4 title=', IFNULL(cv.title, "--"), ', encrypt_path=', encrypt_path, ', path=', cv.path)

FROM `one_content_videos` AS cv LEFT JOIN `one_contents` AS c 
ON cv.content_id = c.id
WHERE cv.type IN ('main', 'preview') AND cv.path NOT REGEXP '/aac/h264/hls/' AND c.status = 1
ORDER BY cv.id ASC;