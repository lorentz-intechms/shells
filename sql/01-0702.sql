

SELECT CONCAT('cd /home/www/conversion-api-koa; sudo node bin/main.js NonethVideo1Command --id=',vd.id , ' --url="',


  CASE WHEN path REGEXP '^https?://' THEN path 
  
  WHEN path NOT REGEXP '^/' THEN CONCAT('https://download.eny7kg.com/', path)
  ELSE CONCAT('https://download.eny7kg.com', path) 
  
  END,

  '" --filename="', CASE
    WHEN vv.file_name REGEXP '\\.[a-zA-Z0-9]+$' THEN vv.file_name
    ELSE CONCAT(vv.file_name, '.mp4')
  END,'"', IF(MOD(vd.id, 4) = 0, ';', ';') , ' #',  v.d_id, ' ', vv.sort, ' ' ,vd.resolution)  FROM `mac_vod` AS v
LEFT JOIN `mac_vurl` AS vv ON v.d_id = vv.d_id
LEFT JOIN
(
SELECT *
FROM mac_vurl_detail d1
WHERE CAST(d1.resolution AS UNSIGNED) = (
    SELECT MAX(CAST(resolution AS UNSIGNED))
    FROM mac_vurl_detail d2
    WHERE d2.vurl_id = d1.vurl_id AND d2.type = 'DECRYPTION'
) AND d1.type = 'DECRYPTION'



) AS vd
 ON vv.id = vd.vurl_id
WHERE v.d_id IN
(129,
306,
381,
18829,
43836,
53307,
53378,
28524,
87343,
77922,
63463,
73018,
38689,
63709,
1185,
48663,
10360,
1774,
58382,
10589,
1902,
20100,
83650,
20273,
34965,
78020,
44825,
30331,
78430,
29702,
39253,
39257,
78886,
15234,
40580,
88660,
64846,
2359,
50805,
50779,
2595,
59265,
50875,
35799,
45254,
45406,
21884,
21882,
79200,
80547,
41117,
41251,
7704,
16789,
75779,
51818,
36259,
61424,
46057,
61802,
71137,
22438,
46398,
22499,
46580,
71572,
22797,
22776,
32490,
8417,
42353,
17521,
27158,
17787,
17880,
17939,
27456,
27648,
27650,
27676,
62109,
52869,
4735,
13730,
62736,
47167,
86726,
47289,
47350,
86923,
23552,
23497,
47858,
72918,
57467,
57712,
9535,
9855,
43729,
53207,
548,
18969,
14173,
5537,
87839,
1022,
24737,
58151,
34284,
10505,
34699,
44149,
58673,
68229,
68421,
20565,
19656,
44840,
20875,
30345,
30392,
20943,
54405,
40195,
6514,
88200,
39206,
6689,
6747,
6957,
6958)

 AND vd.path NOT REGEXP '/aac/h264/hls/'
ORDER BY vd.path ASC;