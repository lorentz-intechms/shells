SELECT
CONCAT('cd /home/www/conversion-api-koa; sudo FFMPEG_BIN="./bin/ffmpeg-tencent" node bin/main.js NonethVideo16Command --app_id=16 --app_user_name="one_auto_01" ', '--id=', id, ' --url="https://vdmk.mfpt8g.com',
download_path, '" --filename="', CASE 
    WHEN download_path LIKE '/one/%' THEN SUBSTRING(download_path, 6)
    WHEN download_path LIKE '/%' THEN SUBSTRING(download_path, 2)
    ELSE download_path
  END, '" ; # filename=', filename, ' title=', title)

FROM `one_content_videos` 
WHERE type IN ('main', 'preview') AND 
content_id IN (









48 ,
4081 ,
4084 ,
4380 ,
4973 ,
5774 ,
7292 ,
7634 ,
8227 ,
8634 ,
8819 ,
10018 ,
17629 ,
21826 ,
23546 ,
23784 ,
33941 ,
33944 ,
33945 ,
33948 ,
4973 ,
5774 ,
5952 ,
6155 ,
7292 ,
7634 ,
8227 ,
8634 ,
8819 ,
10018 ,
10059 ,
12519 ,
16853 ,
17077 ,
21826 ,
21990 ,
23546 ,
23784 ,
26813 ,
28550 ,
29304 ,
29718 ,
30031 ,
33941 ,
33945 
)
ORDER BY id ASC;