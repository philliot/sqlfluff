SELECT
    a.id   AS id,                       -- id                       bigint(20) UN AI PK
    a.id   AS original_id,              -- original_id              temp copy
    a.name AS 'name'                  -- name                     varchar(255)
FROM
    agencies a
WHERE
    a.id IS NOT NULL
    AND a.created_at IS NOT NULL
    AND a.active = 1
ORDER BY id ASC
INTO OUTFILE S3 's3://{{ bucket }}/{{ path }}/{{ file }}'
    FORMAT CSV HEADER
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '\"'
    LINES TERMINATED BY '\n'
    OVERWRITE ON;
