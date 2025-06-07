SELECT
    CONCAT('sudo node bin/main.js NonethVideo16Command --id=', c.id, ' --url="https://mkvd.2pqf97y.com', v.download_path , '" --filename="', v.filename, '" & #', v.content_id, ' ', v.filename, ' ', f.issue)
FROM
    one_contents c
LEFT JOIN
    one_content_videos v ON v.content_id = c.id
LEFT JOIN
    one_feedback f ON f.article_id = c.id
WHERE
    c.status = 1
    AND  f.issue  like "%画质%"
    -- AND f.created_at >= '2025-06-01 00:00:00'
group by v.filename
ORDER BY
    f.id DESC;


SELECT ap.id, ap.name, ap.width, ap.height, ap.duration, ap.video_bit_rate, ap.added_time, 
    ausa.key, ausa.file, ausa.step
FROM `cv-008_0016-app_pipelines` AS ap 
LEFT JOIN `cv-008_0016-app_uploader_stages` AS aus ON ap.id = aus.id
LEFT JOIN `cv-008_0016-app_uploader_stage_actions` AS ausa ON aus.id = ausa.app_uploader_stage_id

WHERE  name IN
('tuitepupu-0511-sample.mp4',
'tuitepupu-0511.mp4',
'FC2PPV-4595652-1-sample.mp4',
'FC2PPV-4595652-1.mp4',
'20250501-Baixi.mp4',
'Wishone-sample.mp4',
'Wishone.mp4',
'nanataipei0501-sample.mp4',
'nanataipei0501.mp4',
'xiaoshui-0427.mp4',
'FC2PPV-4673562-SAMPLE.mp4',
'FC2PPV-4673562.mp4',
'FC2PPV-4673073.mp4',
'FC2PPV-4673073-sample.mp4',
'xiemi0427-sample.mp4',
'xiemi0427.mp4',
'anan20250426_sample.mp4',
'anan20250426.mp4',
'pfes00085hhb.mp4',
'PFES-085.mp4',
'EBWH-054-UC_sample.mp4',
'EBWH-054-UC.mp4',
'dounianglishi20250425_sample.mp4',
'dounianglishi20250425.mp4',
'atid00620hhb.mp4',
'ATID-620.mp4',
'START-220-UC_sample.mp4',
'START-220-UC.mp4',
'DASS-531-U_sample.mp4',
'DASS-531-UC.mp4',
'OXiang-1119-sample.mp4',
'OXiang-1119.mp4',
'1fsdss242_mhb_w.mp4',
'FSDSS-242-U.mp4',
'Deadpool-Wolverine-sample.mp4',
'DeadpoolWolverine.mp4',
'GuoChanYouZhi-HJ-240421.mp4',
'AlexisCrystalKyokoMakiseNurseInterracialFoursome-sample.mp4',
'AlexisCrystalKyokoMakiseNurseInterracialFoursome.mp4',
'n1148_SAMPLE.mp4',
'n1148.mp4',
'n0417_honokasato_sample.mp4',
'n0417_honoka_sato.mp4',
'mefeitu0519.mp4',
'mefeitu0519-sample.mp4',
'JPYWXSH20220425_sample.mp4',
'JPYWXSH20220425.mp4',
'WE-DaJiuZi-QianQi-sample.mp4',
'WE-DaJiuZi-QianQi.mp4',
'ipzz00035_dmb_w.mp4',
'IPZZ-035.mp4',
'Puplizashultz202009_sample.mp4',
'Puplizashultz202009.mp4') AND ( (ausa.file = 0 AND ausa.step = 3) OR  (ausa.file = 0 AND ausa.step = 2))
ORDER BY ap.duration DESC
limit 1000;