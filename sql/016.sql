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