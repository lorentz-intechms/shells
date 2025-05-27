SELECT CONCAT('sudo node bin/main.js NonethM3u8Command --app_id=4 --id=', ap.id, ' --url="https://enlvd4cili.ahplm.com/', ausa.key, '" --filename="', ap.name, '" --algorithm="aes-128-ecb" --key="saIZXc4yMvq0Iz56";  # video_bit_rate=', ap.video_bit_rate, '  ,resolution=', ap.width, '_', ap.height) 
FROM `cv-003_0004-app_pipelines` AS ap
LEFT JOIN `cv-003_0004-app_uploader_stages` AS aus ON ap.id = aus.id 
LEFT JOIN `cv-003_0004-app_uploader_stage_actions` AS ausa ON aus.id = ausa.app_uploader_stage_id
WHERE ausa.app_converter_producer_id = 11 AND ausa.file = 1 AND ausa.step = 3;
