ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER note IDENTIFIED BY 123456;
ALTER USER note DEFAULT TABLESPACE users;
ALTER USER note QUOTA UNLIMITED ON users;
GRANT dba TO note;

-- �������� import (CMD)
cd �������� ���
imp note/123456 file=expall.dmp log=expall.log ignore=y grants=y rows=y indexes=y full=y


--
SELECT *
FROM kor_loan_status;


SELECT a.*
FROM (  
        SELECT period, region, SUM(loan_jan_amt) jan_amt
        FROM kor_loan_status
        GROUP BY period, region
    ) a -- ������, ������ �Ⱓ, ����, �����հ�
    ,
    (  
        SELECT c.period, MAX(c.jan_amt) max_jan_amt -- ������ ���� �����ܾ� �ִ�
        FROM 
            (
                SELECT period, region, SUM(loan_jan_amt) jan_amt
                FROM kor_loan_status
                GROUP BY period, region
            ) c -- �Ⱓ��, ������ ����ݾ� �հ�
            ,
            (
                SELECT MAX(period) max_month   -- ������
                FROM kor_loan_status
                GROUP BY SUBSTR(period, 1, 4)   -- ������
            ) d -- ������ ������
        WHERE c.period = d.max_month  -- �Ⱓ = ������
        GROUP BY c.period

    ) b -- ������ ������ ���� �����ܾ� �ִ�
WHERE a.period = b.period
  AND a.jan_amt = b.max_jan_amt     --  ��
;

