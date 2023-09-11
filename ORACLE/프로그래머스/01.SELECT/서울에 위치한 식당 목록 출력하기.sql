SELECT a.REST_ID,
       a.REST_NAME,
       a.FOOD_TYPE,
       a.FAVORITES,
       a.ADDRESS,
       round(avg(REVIEW_SCORE),2) score
from REST_INFO a
    , rest_review b
where a.rest_id = b.rest_id
  and a.address like '%서울%'
group by a.REST_ID
        , a.REST_NAME
        , a.FOOD_TYPE
        , a.FAVORITES
        , a.ADDRESS
order by score desc
        , a.FAVORITES desc

-- 식당별 식당 ID, 리뷰평균점수 조회

SELECT rest_id
      ,ROUND(AVG(review_score),2)score

FROM REST_REVIEW
GROUP BY rest_id
;

--
SELECT a.rest_id
      ,a.rest_name
      ,a.food_type
      ,a.favorites
      ,a.address
      ,b.score
FROM REST_INFO a
     ,(
        SELECT rest_id
            ,ROUND(AVG(review_score),2)score

        FROM REST_REVIEW
        GROUP BY rest_id
        ;

     ) b
WHERE a.rest_id = b.rest_id
    AND a.address LIKE '서울%'
ORDER BY score DESC
          ,a.faverites DESC
          ;