ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER note IDENTIFIED BY 123456;
ALTER USER note DEFAULT TABLESPACE users;
ALTER USER note QUOTA UNLIMITED ON users;
GRANT dba TO note;

-- 덤프파일 import (CMD)
cd 덤프파일 경로
imp note/123456 file=expall.dmp log=expall.log ignore=y grants=y rows=y indexes=y full=y


--
SELECT *
FROM kor_loan_status;


SELECT a.*
FROM (  
        SELECT period, region, SUM(loan_jan_amt) jan_amt
        FROM kor_loan_status
        GROUP BY period, region
    ) a -- 지역별, 월별의 기간, 지역, 대출합계
    ,
    (  
        SELECT c.period, MAX(c.jan_amt) max_jan_amt -- 최종월 기준 대출잔액 최댓값
        FROM 
            (
                SELECT period, region, SUM(loan_jan_amt) jan_amt
                FROM kor_loan_status
                GROUP BY period, region
            ) c -- 기간별, 지역별 대출금액 합계
            ,
            (
                SELECT MAX(period) max_month   -- 최종월
                FROM kor_loan_status
                GROUP BY SUBSTR(period, 1, 4)   -- 연도별
            ) d -- 연도별 최종월
        WHERE c.period = d.max_month  -- 기간 = 최종월
        GROUP BY c.period

    ) b -- 연도별 최종월 기준 대출잔액 최댓값
WHERE a.period = b.period
  AND a.jan_amt = b.max_jan_amt     --  ⓒ
;

