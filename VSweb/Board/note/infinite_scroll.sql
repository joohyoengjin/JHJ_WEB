-- 페이지 처리(일반화)
SELECT *
FROM (
    SELECT ROWNUM no
          ,board_no
          ,writer
          ,content
          ,reg_date
          ,upd_date
          ,views
    FROM gellery
    ORDER BY gallery_no DESC
) b
WHERE no >= ((page-1)*count)    -- 시작 글번호
  AND no <= (page*count)        -- 끝 글번호
;


-- 페이징 처리 (일반화) - MySQL
SELECT *
FROM gallery
ORDER BY gallery_no DESC
LIMIT(index), (count)           -- 시작 인덱스, 개수