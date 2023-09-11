-- ������ ��ȸ ��ɾ� - SELECT
-- SELECT �÷���, ...
-- FROM ���̺��
-- WHERE ����;

-- Ŀ�� �κ� ���� : ctrl + enter
-- ���� ��ü ���� : F5

-- 1.
conn system/123456;


-- 2.

-- HR(�λ���� ����) ���� �����͸� �����ͼ� �ǽ�
-- HR ������ ���� ���, HR���� ����

-- HR ���� �����ϱ�
-- 11g ���� ���ϴ� � �̸����ε� �������� ����
-- 12c ���� �̻󿡼��� 'c##' ���ξ �ٿ��� �����ϵ��� ��Ģ�� ����

-- ���� �����ϱ�
-- c## ���� ���� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER HR IDENTIFIED BY 123456;
-- ���̺� �����̽� ����
ALTER USER HR DEFAULT TABLESPACE users;
-- ������ ����� �� �ִ� �뷮 ���� (���Ѵ�)
ALTER USER HR QUOTA UNLIMITED ON users;
-- ������ ���� �ο� 
GRANT connect, resource TO HR;

-- ���� ����
DROP USER HR CASCADE;

-- HR ������ ��� �ִ� ���,
-- HR ���� ��� ����
ALTER USER HR ACCOUNT UNLOCK;


-- hr_main.sql �����Ͽ� HR ���� ������ ��������
-- 1. SQL PLUS 
-- 2. HR �������� ����
-- 3. ��ɾ� �Է� : @[���]\hr_main.sql
--    @? : ����Ŭ ��ġ�� �⺻ ���
--    @?/demo/schema/human_resources/hr_main.sql
--> 1  : 123456 [�����ȣ]
--> 2  : users [tablespace]  
--> 3  : temp [temp tablespace]
--> 4  : [log ���] - C:\KHM\SETUP\WINDOWS.X64_193000_db_home\demo\schema\log



-- 3. 
-- ���̺� EMPLOYEES �� ���̺� ������ ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ���̺� : ��� ���� �����͸� �����ϴ� �⺻ ����
-- �� = row = ���ڵ�   : �� �Ӽ��� ���� �ϳ��� �����͸� �ǹ�
-- �� = column = �Ӽ�  : �������� �̸�(Ư��)�� ����
DESC employees;

-- 3.
-- ���̺� EMPLOYEES ���� EMPLOYEE_ID, FIRST_NAME (ȸ����ȣ, �̸�) �� 
-- ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT employee_id, first_name
FROM employees;

-- 4.
-- ���̺� EMPLOYEES �� <����>�� ���� ��µǵ��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *        -- (*) [�����͸�ũ] : ��� �÷� ����
FROM employees;

-- AS (alias) : ��µǴ� �÷��� ������ ���� ��ɾ�
SELECT employee_id AS "��� ��ȣ"  -- ���Ⱑ ������, " " �� ǥ��
      ,first_name AS �̸�
      ,last_name AS ��
      ,email AS �̸���
      ,phone_number AS ��ȭ��ȣ
      ,hire_date AS �Ի�����
      ,salary AS �޿�
FROM employees;


-- 5.
-- ���̺� EMPLOYEES �� JOB_ID�� �ߺ��� �����͸� �����ϰ� 
-- ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT DISTINCT job_id
FROM employees;


-- 6. 
-- ���̺� EMPLOYEES �� SALARY(�޿�)�� 6000�� �ʰ��ϴ� ����� ��� �÷��� 
-- ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE salary > 6000;

-- 7.
-- ���̺� EMPLOYEES �� SALARY(�޿�)�� 10000�� ����� ��� �÷��� 
-- ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE salary = 10000;



-- 8.
-- ���̺� EMPLOYEES �� ��� �Ӽ����� 
-- SALARY �� �������� �������� �����ϰ�, 
-- FIRST_NAME �� �������� �������� �����Ͽ� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.

-- ���� ��ɾ�
-- ORDER BY �÷��� [ASC/DESC];
-- * ASC        : ��������
-- * DESC       : ��������
-- * (����)      : ���������� �⺻��
SELECT *
FROM employees
ORDER BY salary DESC, first_name ASC;




-- 9.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ���� ����
-- OR ���� : ~�Ǵ�, ~�̰ų�
-- WHERE A OR B;
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
   OR job_id = 'IT_PROG';


-- 10.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, IN Ű���带 ����Ͻÿ�.
SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG');

-- 11.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �ƴ�
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, IN Ű���带 ����Ͻÿ�.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG');


-- 12.
-- ���̺� EMPLOYEES �� JOB_ID�� ��IT_PROG�� �̸鼭 SALARY �� 6000 �̻��� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
  AND salary >= 6000;
  
-- 13.
-- ���̺� EMPLOYEES �� FIRST_NAME �� ��S���� �����ϴ� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE first_name LIKE 'S%';

-- 14. s�� ������
SELECT *
FROM employees
WHERE first_name LIKE '%s';

-- 15. s�� ���ԵǴ�
SELECT *
FROM employees
WHERE first_name LIKE '%s%';

-- 16.
-- ���̺� EMPLOYEES �� FIRST_NAME �� 5������ 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE first_name LIKE '_____';

-- LENGTH(�÷���) : ���� ���� ��ȯ�ϴ� �Լ�
SELECT *
FROM employees
WHERE LENGTH(first_name) = 5;


-- 17.
-- ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL �� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE commission_pct IS NULL;

-- 18.
-- ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL �� �ƴ� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

-- 19.
-- ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�� �̻���
-- ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE hire_date >= '04/01/01';


-- 20.
-- ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�⵵���� 05�⵵�� 
-- ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE hire_date >= '04/01/01'
  AND hire_date <= '05/12/31';
  
-- �÷� BETWEEN A AND B;
-- : A ���� ũ�ų� ���� B ���� �۰ų� ���� ���� (����)
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '05/12/31';

-- (�߰� ����)
-- first_name �� A~D �� �����ϴ� ����� ��ȸ
SELECT *
FROM employees
WHERE first_name BETWEEN 'A' AND 'D';   -- (A~CZZ ������ �̸��� ���� ���)




-- 21.
-- 12.45, -12.45 ���� ũ�ų� ���� ���� �� ���� ���� ���� 
-- ����ϴ� SQL ���� ���� �ۼ��Ͻÿ�.
-- * dual ?
-- : ��� ����, �Լ� ��� ���� Ȯ���غ� �� �ִ� �ӽ� ���̺�
-- CEIL() "õ��"
-- : ������ ������ ũ�ų� ���� ���� �� ���� ���� ���� ��ȯ�ϴ� �Լ�
SELECT CEIL(12.45) FROM dual;
SELECT CEIL(-12.45) FROM dual;
SELECT CEIL(12.45), CEIL(-12.45) FROM dual;


-- 22.
-- 12.55�� -12.55 ���� �۰ų� ���� ���� �� ���� ū ���� 
-- ����ϴ� SQL ���� ���� �ۼ��Ͻÿ�.
-- FLOOR() "�ٴ�"
-- : ������ ������ �۰ų� ���� ���� �� ���� ū ���� ��ȯ�ϴ� �Լ�
SELECT FLOOR(12.55) FROM dual;
SELECT FLOOR(-12.55) FROM dual;
SELECT FLOOR(12.55), FLOOR(-12.55) FROM dual;

-- 23.
-- ROUND(��, �ڸ���)
-- : ������ ����, �ش� �ڸ������� �ݿø��ϴ� �Լ�
-- a a a a a.bbbb
-- ...  -2-1.0123
-- 0.54 �� �Ҽ��� �Ʒ� ù° �ڸ����� �ݿø��Ͻÿ�
SELECT ROUND(0.54, 0) FROM dual;

-- 0.54 �� �Ҽ��� �Ʒ� ��° �ڸ����� �ݿø��Ͻÿ�
SELECT ROUND(0.54, 1) FROM dual;

-- 125.67 �� ���� �ڸ����� �ݿø��Ͻÿ�.
SELECT ROUND(125.67, -1) FROM dual;

-- 125.67 �� ���� �ڸ����� �ݿø��Ͻÿ�.
SELECT ROUND(125.67, -2) FROM dual;





-- 24.
-- �� �ҹ����� ���õ� �� ���� �̿��Ͽ� �������� ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- MOD( A, B )
-- : A�� B�� ���� �������� ���ϴ� �Լ�

-- 3�� 8�� ���� ������
SELECT MOD(3, 8) FROM dual;

-- 30�� 4�� ���� ������
SELECT MOD(30, 4) FROM dual;

-- 25. ������ ���ϱ�
-- POWER( A, B )
-- : A �� B ������ ���ϴ� �Լ�
-- 2�� 10 ������ ���Ͻÿ�.
SELECT POWER(2,10) FROM dual;

-- 2�� 31������ ���Ͻÿ�
SELECT POWER(2,31) FROM dual;


-- 26. ������ ���ϱ�
-- SQRT( A )
-- : A�� �������� ���ϴ� �Լ�
--   A�� ���� ������ �Ǽ��� ��� ����
-- 2�� �������� ���Ͻÿ�.
SELECT SQRT(2) FROM dual;

-- 100�� �������� ���Ͻÿ�.
SELECT SQRT(100) FROM dual;

-- 27.
-- TRUNC(�Ǽ�, �ڸ���) 
-- : �ش� ���� �����ϴ� �Լ�
-- 527425.1234 �Ҽ��� �Ʒ� ù° �ڸ����� ����
SELECT TRUNC(527425.1234, 0) FROM dual;

-- 527425.1234 �Ҽ��� �Ʒ� ��° �ڸ����� ����
SELECT TRUNC(527425.1234, 1) FROM dual;

-- 527425.1234 ���� �ڸ����� ����
SELECT TRUNC(527425.1234, -1) FROM dual;

-- 527425.1234 ���� �ڸ����� ����
SELECT TRUNC(527425.1234, -2) FROM dual;



-- 28. ���� ���ϱ�
-- ABS( A )
-- : �� A �� ������ ���Ͽ� ��ȯ�ϴ� �Լ�

-- -20 �� ���� ���ϱ�
SELECT ABS(-20) FROM dual;

-- -12.456 �� ���� ���ϱ�
SELECT ABS(-12.456) FROM dual;


SELECT first_name
      ,TO_CHAR(hire_date, 'YYYY"��"MM"��"DD"��"')
      ,TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM employees; 

-- 29.
-- <����>�� ���� ���ڿ��� �빮��, �ҹ���, ù���ڸ� �빮�ڷ� 
-- ��ȯ�ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT 'AlOhA WoRlD~!' AS ����
       ,UPPER('AlOhA WoRlD~!') AS �빮��
       ,LOWER('AlOhA WoRlD~!') AS �ҹ���
       ,INITCAP('AlOhA WoRlD~!') AS "ù���ڸ� �빮��"
FROM dual;

-- 30.
-- <����>�� ���� ���ڿ��� ���� ���� ����Ʈ ���� 
-- ����ϴ� SQL���� �ۼ��Ͻÿ�.
-- LENGTH('���ڿ�')  : ���� ��
-- LENGTHB('���ڿ�') : ����Ʈ ��
-- * ����, ����, ��ĭ  : 1 byte
-- * �ѱ�             : 3 byte
SELECT LENGTH('ALOHA WORLD') AS "���� ��"
      ,LENGTHB('ALOHA WORLD') AS "����Ʈ ��"
FROM dual;

SELECT LENGTH('�˷��� ����') AS "���� ��"
      ,LENGTHB('�˷��� ����') AS "����Ʈ ��"
FROM dual;

-- 31.
-- �� ���ڿ��� �����ϱ�
SELECT CONCAT('ALOHA', 'WORLD') AS "�Լ�"
      ,'ALOHA' || 'WORLD' AS "��ȣ"
FROM dual;


-- 32.
-- ���ڿ� �κ� ����ϱ�
-- SUBSTR( ���ڿ�, ���۹�ȣ, ���ڼ� )
-- 'www.alohacampus.com'
SELECT SUBSTR('www.alohacampus.com', 1, 3) AS "1"
      ,SUBSTR('www.alohacampus.com', 5, 11) AS "2"
      ,SUBSTR('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

SELECT SUBSTRB('www.alohacampus.com', 1, 3) AS "1"
      ,SUBSTRB('www.alohacampus.com', 5, 11) AS "2"
      ,SUBSTRB('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

-- 'www.�˷���ķ�۽�.com'
SELECT SUBSTR('www.�˷���ķ�۽�.com', 1, 3) AS "1"
      ,SUBSTR('www.�˷���ķ�۽�.com', 5, 6) AS "2"
      ,SUBSTR('www.�˷���ķ�۽�.com', -3, 3) AS "3"
FROM dual;

SELECT SUBSTRB('www.�˷���ķ�۽�.com', 1, 3) AS "1"
      ,SUBSTRB('www.�˷���ķ�۽�.com', 5, 18) AS "2"
      ,SUBSTRB('www.�˷���ķ�۽�.com', -3, 3) AS "3"
FROM dual;


-- 33. 
-- ���ڿ����� Ư�� ������ ��ġ�� ���ϴ� �Լ�
-- INSTR( ���ڿ�, ã�� ����, ���� ��ȣ, ���� )
-- ex) 'ALOHACAMPUS'
-- �ش� ���ڿ����� ù���� ���� ã�Ƽ�, 2��° A�� ��ġ�� ���Ͻÿ�.
-- INSTR('ALOHACAMPUS', 'A', 1, 2)

SELECT INSTR('ALOHACAMPUS', 'A', 1, 1) AS "1��° A"
      ,INSTR('ALOHACAMPUS', 'A', 1, 2) AS "2��° A"
      ,INSTR('ALOHACAMPUS', 'A', 1, 3) AS "3��° A"
FROM dual;


-- 34.
-- ���ڿ��� ����/�����ʿ� ����ϰ�, ������� Ư�� ���ڷ� ä��� �Լ�
-- LPAD( ���ڿ�, ĭ�� ��, ä�� ���� )
-- : ���ڿ��� ������ ĭ�� Ȯ���ϰ�, ���ʿ� Ư�� ���ڷ� ä��

-- RPAD( ���ڿ�, ĭ�� ��, ä�� ���� )
-- : ���ڿ��� ������ ĭ�� Ȯ���ϰ�, �����ʿ� Ư�� ���ڷ� ä��

SELECT LPAD('ALOHACMAPUS', 20, '#') AS "����"
      ,RPAD('ALOHACMAPUS', 20, '#') AS "������"
FROM dual;

-- 35.
-- HIRE_DATE �Ի����ڸ� ��¥������ �����Ͽ� ����Ͻÿ�.
-- TO_CHAR( ������, '��¥/���� ����' )
-- : Ư�� �����͸� ���ڿ� �������� ��ȯ�ϴ� �Լ�
SELECT first_name AS �̸�
      ,TO_CHAR(hire_date, 'YYYY-MM-DD (dy) HH:MI:SS') AS �Ի�����
FROM employees;


-- 36.
-- SALARY �޿��� ��ȭ�������� �����Ͽ� ����Ͻÿ�.
SELECT first_name �̸�
      ,TO_CHAR(salary, '$999,999,999.00') AS �޿�
FROM employees;

-- 37.
-- TO_DATE( ������ )
-- : ������ �����͸� ��¥�� �����ͷ� ��ȯ�ϴ� �Լ�
SELECT 20230522 AS ����
      ,TO_DATE('20230522', 'YYYYMMDD') AS ��¥
FROM dual;

-- 38.
-- TO_NUMBER( ������ )
-- : ������ �����͸� ������ �����ͷ� ��ȯ�ϴ� �Լ�
SELECT '1,200,000' AS ����
      ,TO_NUMBER('1,200,000', '999,999,999') AS ����
FROM dual;


-- 39.
-- ����, ����, ���� ��¥�� ����Ͻÿ�.
-- sysdate : ���� ��¥/�ð� ������ ������ �ִ� Ű����
-- 2023/05/22 - YYYY/MM/DD �������� ���
-- ��¥ ������ --> ���� ������ ��ȯ
SELECT sysdate FROM dual;

SELECT sysdate-1 AS ����
      ,sysdate AS ����
      ,sysdate+1 AS ����
FROM dual;

-- 40.
-- ����� �ٹ��޼��� �ټӿ����� ���Ͻÿ�.
-- MONTHS_BETWEEN( A, B)
-- - ��¥ A���� B���� ���� �� ���̸� ��ȯ�ϴ� �Լ�
--   (��, A > B ��, A�� �� �ֱ� ��¥�� �����ؾ� ����� ��ȯ)
SELECT first_name �̸�
      ,TO_CHAR(hire_date, 'YYYY.MM.DD') �Ի�����
      ,TO_CHAR(SYSDATE, 'YYYY.MM.DD') ����
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) || '����' �ٹ��޼�
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date) / 12) || '��' �ټӿ���
FROM employees;

-- 41.
-- ���÷κ��� 6���� ���� ��¥�� ���Ͻÿ�.
-- ADD_MONTHS( ��¥, ���� �� )
-- : ������ ��¥�κ��� �ش� ���� ���� ���� ��¥�� ��ȯ�ϴ� �Լ�
SELECT sysdate ����
      ,ADD_MONTHS(sysdate, 6) "6���� ��"
FROM dual;

SELECT '2023/04/17' ����
      ,ADD_MONTHS('2023/04/17', 6) ����
FROM dual;

-- 42.
-- ���� ���� ���ƿ��� ������� ���Ͻÿ�.
-- NEXT_DAY( ��¥, ���� )
-- : ������ ��¥ ���� ���ƿ��� ������ ��ȯ�ϴ� �Լ�
-- �� �� ȭ �� �� �� ��
-- 1  2  3  4  5 6  7
SELECT sysdate ����
      ,NEXT_DAY( sysdate, 7 ) "���� �����"
FROM dual;


SELECT NEXT_DAY( sysdate, 1 ) "���� �Ͽ���"
      ,NEXT_DAY( sysdate, 2 ) "���� ������"
      ,NEXT_DAY( sysdate, 3 ) "���� ȭ����"
      ,NEXT_DAY( sysdate, 4 ) "���� ������"
      ,NEXT_DAY( sysdate, 5 ) "���� �����"
      ,NEXT_DAY( sysdate, 6 ) "���� �ݿ���"
      ,NEXT_DAY( sysdate, 7 ) "���� �����"
FROM dual;

-- 43.
-- ���� ��¥�� �ش� ���� ����, ���� ���ڸ� ���Ͻÿ�.
-- LAST_DAY( ��¥ )
-- : ������ ��¥�� ������ ���� ���� ���ڸ� ��ȯ�ϴ� �Լ�
-- ��¥ : XXXXXX.YYYYYYY
-- 1970��01��01�� 00��00��00��00ms �� 2023��5��22�� .... 
-- ���� ���ڸ� ������ ���, �ð������� �Ҽ��κ����� ���
-- xxxx.yyyyy --> 2023��5��22��
-- �� ���� �Ʒ��� �����ϸ�, ���ʸ� ���� �� �ִ�
SELECT TRUNC( sysdate, 'MM' ) ����
      ,sysdate ����
      ,LAST_DAY( sysdate ) ����
FROM dual;


-- 44.
-- ���̺� EMPLOYEES �� COMMISSION_PCT �� �ߺ����� �˻��ϵ�, 
-- NULL �̸� 0���� ��ȸ�ϰ� ������������ �����ϴ� SQL ���� �ۼ��Ͻÿ�.

-- NVL( ��, ��ü�� �� ) : �ش� ���� NULL �̸� ������ ������ ��ȯ�ϴ� �Լ�
SELECT DISTINCT NVL(commission_pct, 0) "Ŀ�̼�(%)"
FROM employees
ORDER BY NVL(commission_pct, 0) DESC
;

-- ��ȸ�� �÷��� ��Ī���� ORDER BY ������ ����� �� �ִ�.
SELECT DISTINCT NVL(commission_pct, 0) "Ŀ�̼�(%)"
FROM employees
ORDER BY "Ŀ�̼�(%)" DESC
;

-- 45.
-- EMPLOYEES �� FIRST_NAME, SALARY, COMMISSION_PCT �Ӽ��� �̿��Ͽ� 
-- �޿�, Ŀ�̼�, �����޿��� ��ȸ�Ͻÿ�.
-- * �����޿� = �޿� + (�޿� * Ŀ�̼�)
-- * NVL2( ��, NULL �ƴ� �� ��, NULL �� �� �� )

SELECT first_name �̸�
      ,salary �޿�
      ,NVL(commission_pct, 0) Ŀ�̼�
      ,NVL2(commission_pct, salary+(salary*commission_pct), salary) �����޿�
FROM employees
ORDER BY �����޿� DESC
;

-- 46.
-- DEPARTMENTS ���̺��� �����Ͽ�, ����� �̸��� �μ����� ����Ͻÿ�.
-- DECODE( �÷���, ���ǰ�1, ��ȯ��1, ���ǰ�2, ��ȯ��2, ... )
-- : ������ �÷��� ���� ���ǰ��� ��ġ�ϸ� �ٷ� ���� ��ȯ���� ����ϴ� �Լ�
SELECT first_name �̸�
      ,DECODE( department_id, 10, 'Administration',
                              20, 'Marketing',
                              30, 'Purchasing',
                              40, 'Human Resources',
                              50, 'Shipping',
                              60, 'IT',
                              70, 'Public Relations',
                              80, 'Sales',
                              90, 'Executive',
                              100, 'Finance'
     ) �μ�
FROM employees;


-- 47.
-- CASE ��
-- : ���ǽ��� ������ ��, ����� ���� �����ϴ� ����
-- �� �� ���� : ctrl + shift + D
SELECT first_name �̸�
      ,CASE WHEN department_id = 10 THEN 'Administration'
            WHEN department_id = 20 THEN 'Marketing'                 
            WHEN department_id = 30 THEN 'Purchasing'                 
            WHEN department_id = 40 THEN 'Human Resources'                 
            WHEN department_id = 50 THEN 'Shipping'                 
            WHEN department_id = 60 THEN 'IT'                 
            WHEN department_id = 70 THEN 'Public Relations'                 
            WHEN department_id = 80 THEN 'Sales'                 
            WHEN department_id = 90 THEN 'Executive'                 
            WHEN department_id = 100 THEN 'Finance'        
      END �μ�
FROM employees;


-- �׷��Լ�
-- 48.
-- EMPLOYEES ���̺�� ���� ��ü ��� ���� ���Ͻÿ�.
-- COUNT( �÷��� )
-- : �÷��� �����Ͽ� NULL �� ������ ������ ������ ��ȯ�ϴ� �Լ�
-- * NULL �� ���� �����Ͷ�� � �÷��� �����ϴ��� ������ �����Ƿ�,
--   �Ϲ������� COUNT(*) �� ������ ���Ѵ�.
SELECT COUNT(*) �����
FROM employees;




-- 49.
-- ������� �ְ�޿��� �����޿��� ���Ͻÿ�.
SELECT MAX(salary) �ְ�޿�
      ,MIN(salary) �����޿�
FROM employees;

-- 50.
-- ������� �޿� �հ�� ����� ���Ͻÿ�.
SELECT SUM(salary) �޿��հ�
      ,ROUND( AVG(salary), 2 ) �޿����
FROM employees;

-- 51.
-- ������� �޿� ǥ�������� �л��� ���Ͻÿ�.
SELECT ROUND( STDDEV(salary), 2 ) �޿�ǥ������
      ,ROUND( VARIANCE(salary), 2 ) �޿��л�
FROM employees;

-- 52.
-- MS_STUDENT ���̺��� �����Ͻÿ�.
-- * ���̺� ����
/*
    CREATE TABLE ���̺�� (
        �÷���1 Ÿ��     [NOT NULL/NULL] [��������],
        �÷���2 Ÿ��     [NOT NULL/NULL] [��������],
        �÷���3 Ÿ��     [NOT NULL/NULL] [��������],
        ...
    );
*/
-- * ���̺� ����
/*
    DROP TABLE ���̺��;
*/
DROP TABLE MS_STUDENT;

CREATE TABLE MS_STUDENT (
     ST_NO      NUMBER          NOT NULL
    ,NAME       VARCHAR2(20)    NOT NULL
    ,CTZ_NO     CHAR(14)        NOT NULL
    ,EMAIL      VARCHAR2(100)   NOT NULL
    ,ADDRESS    VARCHAR2(1000)  NULL
    ,DEPT_NO    NUMBER          NOT NULL
    ,MJ_NO      NUMBER          NOT NULL
    ,REG_DATE   DATE    DEFAULT sysdate NOT NULL
    ,UPD_DATE   DATE    DEFAULT sysdate NOT NULL
    ,ETC        VARCHAR2(1000)  DEFAULT '����' NULL
    ,
    CONSTRAINT MS_STUDENT_PK PRIMARY KEY(ST_NO) ENABLE
);

-- UQ (����Ű) �߰�
ALTER TABLE MS_STUDENT ADD CONSTRAINT MS_STUDENT_UK1 UNIQUE ( EMAIL ) ENABLE;

COMMENT ON TABLE MS_STUDENT IS '�л����� ������ �����Ѵ�.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '�л� ��ȣ';
COMMENT ON COLUMN MS_STUDENT.NAME IS '�̸�';
COMMENT ON COLUMN MS_STUDENT.CTZ_NO IS '�ֹι�ȣ';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '�̸���';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '�ּ�';
COMMENT ON COLUMN MS_STUDENT.DEPT_NO IS '�μ���ȣ';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '������ȣ';
COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '�������';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '��������';
COMMENT ON COLUMN MS_STUDENT.ETC IS 'Ư�̻���';


-- 53.
-- MS_STUDENT ���̺� ����, ����, ��������, �������� �Ӽ��� �߰��Ͻÿ�.

-- ���̺� �Ӽ� �߰�
-- ALTER TABLE ���̺�� ADD �÷��� Ÿ�� DEFAULT �⺻�� [NOT NULL];
ALTER TABLE MS_STUDENT ADD GENDER CHAR(6) DEFAULT '��Ÿ' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.GENDER IS '����';

ALTER TABLE MS_STUDENT ADD STATUS VARCHAR2(10) DEFAULT '���' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.STATUS IS '����';

ALTER TABLE MS_STUDENT ADD ADM_DATE DATE NULL;
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '��������';

ALTER TABLE MS_STUDENT ADD GRD_DATE DATE NULL;
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '��������';

-- ���̺� �Ӽ� ����
-- ALTER TABLE ���̺�� DROP COLUMN �÷���;
ALTER TABLE MS_STUDENT DROP COLUMN GENDER;
ALTER TABLE MS_STUDENT DROP COLUMN STATUS;
ALTER TABLE MS_STUDENT DROP COLUMN ADM_DATE;
ALTER TABLE MS_STUDENT DROP COLUMN GRD_DATE;

-- 54
-- MS_STUDENT ���̺��� CTZ_NO �Ӽ��� BIRTH �� �̸��� �����ϰ�
-- ������ Ÿ���� DATE �� �����Ͻÿ�.
-- �׸���, ���� '�������'�� �����Ͻÿ�.
ALTER TABLE MS_STUDENT RENAME COLUMN CTZ_NO TO BIRTH;
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '�������';

-- �Ӽ� ���� - Ÿ�� ����
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
-- �Ӽ� ���� - NULL ���� ����
ALTER TABLE MS_STUDENT MODIFY BIRTH NULL;
-- �Ӽ� ���� - DEFAULT ����
ALTER TABLE MS_STUDENT MODIFY BIRTH DEFAULT sysdate;

-- ���ÿ� ���� ����
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE DEFAULT sysdate NOT NULL;



-- 55.
-- MS_STUDENT ���̺��� �к� ��ȣ(DEPT_NO) �Ӽ��� �����Ͻÿ�.
ALTER TABLE MS_STUDENT DROP COLUMN DEPT_NO;


-- 56.
-- MS_STUDENT ���̺��� �����Ͻÿ�.
DROP TABLE MS_STUDENT;


-- 57.
--
CREATE TABLE MS_STUDENT (
     ST_NO      NUMBER          NOT NULL 
    ,NAME       VARCHAR2(20)    NOT NULL
    ,BIRTH      DATE            NOT NULL
    ,EMAIL      VARCHAR2(100)   NOT NULL
    ,ADDRESS    VARCHAR2(1000)  NULL
    ,MJ_NO      NUMBER          NOT NULL
    ,GENDER     CHAR(6)         DEFAULT '��Ÿ'    NOT NULL
    ,STATUS     VARCHAR2(10)    DEFAULT '���'    NOT NULL
    ,ADM_DATE   DATE    NULL
    ,GRD_DATE   DATE    NULL
    ,REG_DATE   DATE    DEFAULT sysdate NOT NULL
    ,UPD_DATE   DATE    DEFAULT sysdate NOT NULL
    ,ETC        VARCHAR2(1000)  DEFAULT '����' NULL
    ,
    CONSTRAINT MS_STUDENT_PK PRIMARY KEY(ST_NO) ENABLE
);

-- UQ (����Ű) �߰�
ALTER TABLE MS_STUDENT ADD CONSTRAINT MS_STUDENT_UK1 UNIQUE ( EMAIL ) ENABLE;

COMMENT ON TABLE MS_STUDENT IS '�л����� ������ �����Ѵ�.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '�л� ��ȣ';
COMMENT ON COLUMN MS_STUDENT.NAME IS '�̸�';
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '�������';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '�̸���';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '�ּ�';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '������ȣ';

COMMENT ON COLUMN MS_STUDENT.GENDER IS '����';
COMMENT ON COLUMN MS_STUDENT.STATUS IS '����';
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '��������';
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '��������';

COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '�������';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '��������';
COMMENT ON COLUMN MS_STUDENT.ETC IS 'Ư�̻���';

-- 58.
-- ������ ���� (INSERT)
INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20180001', '�ּ���', '991005', 'csa@univ.ac.kr', '����', 'I01',
         '��', '����', '2018/03/01', NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20210001', '�ڼ���', TO_DATE('2002/05/04', 'YYYY/MM/DD'), 'psj@univ.ac.kr', '����', 'B02',
         '��', '����', TO_DATE('2021/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20210002', '�����', TO_DATE('2002/05/04', 'YYYY/MM/DD'), 'kay@univ.ac.kr', '��õ', 'S01',
         '��', '����', TO_DATE('2021/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20160001', '������', TO_DATE('1997/02/10', 'YYYY/MM/DD'), 'jsa@univ.ac.kr', '�泲', 'J01',
         '��', '����', TO_DATE('2016/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20150010', '������', TO_DATE('1996/03/11', 'YYYY/MM/DD'), 'ydh@univ.ac.kr', '����', 'K01',
         '��', '����', TO_DATE('2016/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20130007', '�Ⱦƶ�', TO_DATE('1994/11/24', 'YYYY/MM/DD'), 'aar@univ.ac.kr', '���', 'Y01',
         '��', '����', TO_DATE('2013/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, '���󿹼� Ư����' );


INSERT INTO MS_STUDENT ( ST_NO, NAME, BIRTH, EMAIL, ADDRESS, MJ_NO, 
                        GENDER, STATUS, ADM_DATE, GRD_DATE, REG_DATE, UPD_DATE, ETC )
VALUES ( '20110002', '�Ѽ�ȣ', TO_DATE('1992/10/07', 'YYYY/MM/DD'), 'hsh@univ.ac.kr', '����', 'E03',
         '��', '����', TO_DATE('2015/03/01', 'YYYY/MM/DD'), NULL, sysdate, sysdate, NULL );

SELECT * FROM MS_STUDENT;

-- 59.
-- MS_STUDENT ���̺��� �����͸� ����
-- UPDATE
/*
    UPDATE ���̺��
       SET �÷�1 = ������ ��,
           �÷�2 = ������ ��,
           ...
   [WHERE] ����;
*/
-- 1) �л���ȣ�� 20160001 �� �л��� �ּҸ� '����'��,
--    �������¸� '����'���� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET address = '����'
      ,status = '����'
WHERE st_no = 20160001;

-- 2) �л���ȣ�� 20150010 �� �л��� �ּҸ� '����'��,
--    ���� ���¸� '����', �������ڸ� '20200220', �������� ���糯¥�� 
--    �׸��� Ư�̻����� '����'���� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET address = '����', status = '����', grd_date = '2020/02/02',
       upd_date = sysdate, etc = '����'
 WHERE st_no = 20150010;
 
 
-- 3) �л���ȣ�� 20130007 �� �л��� ���� ���¸� '����', �������ڸ� '20200220', 
--    �������� ���糯¥�� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET status = '����', 
       grd_date = '2020/02/02',
       upd_date = sysdate
 WHERE st_no = 20130007;

-- 4) �л���ȣ�� 20110002 �� �л��� ���� ���¸� '����', 
--    �������ڸ� ���糯¥, Ư�̻��� '���� ����' ���� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET status = '����', 
       upd_date = sysdate,
       etc = '���� ����'
 WHERE st_no = 20110002;


SELECT * FROM MS_STUDENT;


-- 60.
-- MS_STUDENT ���̺��� �й��� 20110002 �� �л��� �����Ͻÿ�.
DELETE FROM MS_STUDENT WHERE ST_NO = 20110002;

-- 61.
-- MS_STUDENT ���̺��� ��� �Ӽ��� ��ȸ�Ͻÿ�.
SELECT * 
FROM MS_STUDENT;

-- 62.
-- MS_STUDENT ���̺��� ��ȸ�Ͽ� MS_STUDENT_BACK ���̺� �����Ͻÿ�.
-- ��� ���̺� �����
CREATE TABLE MS_STUDENT_BACK
AS SELECT * FROM MS_STUDENT;

SELECT * FROM MS_STUDENT_BACK;

-- 63.
-- MS_STUDENT ���̺��� Ʃ���� �����Ͻÿ�.
DELETE FROM MS_STUDENT;

SELECT * FROM MS_STUDENT;

-- 64.
-- MS_STUDENT_BACK ���̺��� ��� �Ӽ��� ��ȸ�Ͽ�
-- MS_STUDENT ���̺� �����Ͻÿ�.
INSERT INTO MS_STUDENT 
SELECT * FROM MS_STUDENT_BACK;

SELECT * FROM MS_STUDENT;

-- 65.
-- MS_STUDENT ���̺��� ����(gender) �Ӽ��� ���Ͽ�,
-- ('��', '��', '��Ÿ') ���� �Է°����ϵ��� ���������� �߰��Ͻÿ�.
ALTER TABLE MS_STUDENT
ADD CONSTRAINT MS_STD_GENDER_CHECK
CHECK (gender IN ('��','��', '��Ÿ') );

UPDATE MS_STUDENT
SET gender = '???'
;
-- * ������ ���� �ƴ� �ٸ� ���� �Է�/�����ϴ� ���
-- "üũ ��������(HR.MS_STD_GENDER_CHECK)�� ����Ǿ����ϴ�" ���� �߻�

-- KEY
-- �⺻Ű (PRIMARY KEY)
-- : �ߺ� �Ұ�, NULL �Ұ�(�ʼ� �Է�)
--   * �ش� ���̺��� �����͸� �����ϰ� ������ �� �ִ� �Ӽ����� ����

-- ����Ű (UNIQUE KEY)
-- : �ߺ� �Ұ�, NULL ���
--   * �ߺ����� �ʾƾ��� ������(ID, �ֹι�ȣ, �̸���, ...)


-- 66.
-- ���̺� ������� �����Ͽ� MS_USER ���̺��� �����Ͻÿ�.
CREATE TABLE MS_USER (
    USER_NO     NUMBER            NOT NULL    PRIMARY KEY ,
    USER_ID     VARCHAR2(100)     NOT NULL    UNIQUE ,
    USER_PW     VARCHAR2(200)     NOT NULL ,
    USER_NAME   VARCHAR2(50)      NOT NULL ,
    BIRTH       DATE              NOT NULL ,
    TEL         VARCHAR2(20)      NOT NULL    UNIQUE ,
    ADDRESS     VARCHAR2(200)     NULL ,
    REG_DATE    DATE              DEFAULT sysdate NOT NULL,
    UPD_DATE    DATE              DEFAULT sysdate NOT NULL
);

COMMENT ON TABLE MS_USER IS 'ȸ��';
COMMENT ON COLUMN MS_USER.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MS_USER.USER_ID IS '���̵�';
COMMENT ON COLUMN MS_USER.USER_PW IS '��й�ȣ';
COMMENT ON COLUMN MS_USER.USER_NAME IS '�̸�';
COMMENT ON COLUMN MS_USER.BIRTH IS '�������';
COMMENT ON COLUMN MS_USER.TEL IS '��ȭ��ȣ';
COMMENT ON COLUMN MS_USER.ADDRESS IS '�ּ�';
COMMENT ON COLUMN MS_USER.REG_DATE IS '�������';
COMMENT ON COLUMN MS_USER.UPD_DATE IS '��������';



-- 67.
-- MS_BOARD ���̺��� �����Ͻÿ�.
CREATE TABLE MS_BOARD (
    BOARD_NO    NUMBER            NOT NULL PRIMARY KEY ,
    TITLE       VARCHAR2(200)     NOT NULL ,
    CONTENT     CLOB              NOT NULL ,
    WRITER      VARCHAR2(100)     NOT NULL ,
    HIT         NUMBER            NOT NULL ,
    LIKE_CNT    NUMBER            NOT NULL ,
    DEL_YN      CHAR(2)           NULL ,
    DEL_DATE    DATE              NULL ,
    REG_DATE    DATE              DEFAULT sysdate NOT NULL ,
    UPD_DATE    DATE              DEFAULT sysdate NOT NULL 
);

COMMENT ON TABLE MS_BOARD IS '�Խ���';
COMMENT ON COLUMN MS_BOARD.BOARD_NO IS '�Խñ� ��ȣ';
COMMENT ON COLUMN MS_BOARD.TITLE IS '����';
COMMENT ON COLUMN MS_BOARD.CONTENT IS '����';
COMMENT ON COLUMN MS_BOARD.WRITER IS '�ۼ���';
COMMENT ON COLUMN MS_BOARD.HIT IS '��ȸ��';
COMMENT ON COLUMN MS_BOARD.LIKE_CNT IS '���ƿ� ��';
COMMENT ON COLUMN MS_BOARD.DEL_YN IS '��������';
COMMENT ON COLUMN MS_BOARD.DEL_DATE IS '��������';
COMMENT ON COLUMN MS_BOARD.REG_DATE IS '�������';
COMMENT ON COLUMN MS_BOARD.UPD_DATE IS '��������';


-- 68.
-- MS_FILE ���̺��� �����Ͻÿ�.
CREATE TABLE MS_FILE (
      FILE_NO     NUMBER NOT NULL PRIMARY KEY ,
      BOARD_NO    NUMBER NOT NULL ,
      FILE_NAME   VARCHAR2(2000) NOT NULL ,
      FILE_DATA   BLOB  NOT NULL ,
      REG_DATE    DATE  DEFAULT sysdate NOT NULL ,
      UPD_DATE    DATE  DEFAULT sysdate NOT NULL 
);

COMMENT ON TABLE MS_FILE IS '÷������';
COMMENT ON COLUMN MS_FILE.FILE_NO IS '���Ϲ�ȣ';
COMMENT ON COLUMN MS_FILE.BOARD_NO IS '�۹�ȣ';
COMMENT ON COLUMN MS_FILE.FILE_NAME IS '���ϸ�';
COMMENT ON COLUMN MS_FILE.FILE_DATA IS '����';
COMMENT ON COLUMN MS_FILE.REG_DATE IS '�������';
COMMENT ON COLUMN MS_FILE.UPD_DATE IS '��������';

-- 69.
-- MS_REPLY ���̺��� �����Ͻÿ�.
CREATE TABLE MS_REPLY (
    REPLY_NO    NUMBER      NOT NULL PRIMARY KEY ,
    BOARD_NO    NUMBER      NOT NULL ,
    CONTENT     VARCHAR2(2000)    NOT NULL ,
    WRITER      VARCHAR2(100)    NOT NULL ,
    DEL_YN      CHAR(2)     DEFAULT 'N' NULL ,
    DEL_DATE    DATE        NULL ,
    REG_DATE    DATE        DEFAULT sysdate NOT NULL ,
    UPD_DATE    DATE        DEFAULT sysdate NOT NULL 
);

COMMENT ON TABLE MS_REPLY IS '���';
COMMENT ON COLUMN MS_REPLY.REPLY_NO IS '��۹�ȣ';
COMMENT ON COLUMN MS_REPLY.BOARD_NO IS '�۹�ȣ';
COMMENT ON COLUMN MS_REPLY.CONTENT IS '����';
COMMENT ON COLUMN MS_REPLY.WRITER IS '�ۼ���';
COMMENT ON COLUMN MS_REPLY.DEL_YN IS '��������';
COMMENT ON COLUMN MS_REPLY.DEL_DATE IS '��������';
COMMENT ON COLUMN MS_REPLY.REG_DATE IS '�������';
COMMENT ON COLUMN MS_REPLY.UPD_DATE IS '��������';




-- 70.
-- human ������ �ִ� ��� �����͸� human2 �������� �������� ���ؼ�
-- human.dmp ������ �������.
-- human2 �������� �����Ͽ�, human.dmp ������ import �Ͻÿ�.


-- 1. human, human2  ���� ����
-- 2. human.dmp ���� import

-- human ���� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER human IDENTIFIED BY 123456;
ALTER USER human QUOTA UNLIMITED ON users;
GRANT DBA TO human;

-- human2 ���� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER human2 IDENTIFIED BY 123456;
ALTER USER human2 QUOTA UNLIMITED ON users;
GRANT DBA TO human2;

-- community.dmp �� human �������� �������� (CMD)
imp userid=system/123456 file=C:\KHM\ORACLE\community.dmp fromuser=human touser=human

-- human.dmp �� human2 �������� �������� (CMD)
imp userid=system/123456 file=C:\KHM\ORACLE\human.dmp fromuser=human touser=human2




-- 71.
-- human ������ �����ϰ� �ִ� �����͸�
-- "human_exp.dmp" �������Ϸ� export �ϴ� ��ɾ �ۼ��Ͻÿ�.

-- human_exp.dmp �������� �����ϱ� (CMD)
exp userid=human/123456 file=C:\KHM\ORACLE\human_exp.dmp 
                        log=C:\KHM\ORACLE\human_exp.log

-- 72.
-- MS_BOARD �� WRITER �Ӽ��� NUMBER Ÿ������ �����ϰ�
-- MS_USER �� USER_NO �� �����ϴ� �ܷ�Ű�� �����Ͻÿ�.

-- 1)
-- ������ Ÿ�� ����
ALTER TABLE MS_BOARD MODIFY WRITER NUMBER;

-- �ܷ�Ű ����
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ�
-- FOREIGN KEY (�ܷ�Ű�÷�) REFERENCES �������̺�(�⺻Ű);
ALTER TABLE MS_BOARD ADD CONSTRAINT MS_BOARD_WRITER_FK
FOREIGN KEY (WRITER) REFERENCES MS_USER(USER_NO);


-- 2) �ܷ�Ű : MS_FILE (BOARD_NO)  ---->  MS_BOARD (BOARD_NO)
ALTER TABLE MS_FILE ADD CONSTRAINT MS_FILE_BOARD_NO_FK
FOREIGN KEY (BOARD_NO) REFERENCES MS_BOARD(BOARD_NO);


-- 3) �ܷ�Ű : MS_REPLY (BOARD_NO)  ---->  MS_BOARD (BOARD_NO)
ALTER TABLE MS_REPLY ADD CONSTRAINT MS_REPLY_BOARD_NO_FK
FOREIGN KEY (BOARD_NO) REFERENCES MS_BOARD(BOARD_NO);


-- �������� ����
ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;

-- 73.
-- MS_USER ���̺� �Ӽ��� �߰��Ͻÿ�.
ALTER TABLE MS_USER ADD CTZ_NO CHAR(14) NOT NULL UNIQUE;
ALTER TABLE MS_USER ADD GENDER CHAR(6) NOT NULL;

COMMENT ON COLUMN MS_USER.CTZ_NO IS '�ֹι�ȣ';
COMMENT ON COLUMN MS_USER.GENDER IS '����';

DESC MS_USER;


-- 74.
-- MS_USER �� GENDER �Ӽ��� ('��', '��', '��Ÿ') ���� ������
-- ���������� �߰��Ͻÿ�.
-- CHECK �������� �߰�
ALTER TABLE MS_USER
ADD CONSTRAINT MS_USER_GENDER_CHECK
CHECK (gender IN ('��', '��', '��Ÿ') )
;

-- 75.
-- MS_FILE ���̺� Ȯ����(EXT) �Ӽ��� �߰��Ͻÿ�.
ALTER TABLE MS_FILE ADD EXT VARCHAR2(10) NULL;
COMMENT ON COLUMN MS_FILE.EXT IS 'Ȯ����';

-- 76.
-- 
MERGE INTO MS_FILE T        -- ��� ���̺� ����
-- ����� �������� �ڿ��� ����
USING ( SELECT FILE_NO, FILE_NAME FROM MS_FILE ) F
-- ON (update �� ����)
ON (T.FILE_NO = F.FILE_NO)
-- ��ġ���ǿ� ������ ���
WHEN MATCHED THEN
    -- SUBSTR( ���ڿ�, ���۹�ȣ )
    -- ex. SUBSTR( '/upload/������.png', 12 ) --> png
    UPDATE SET T.EXT = SUBSTR(F.FILE_NAME, INSTR(F.FILE_NAME, '.', -1) +1 )
    DELETE WHERE SUBSTR(F.FILE_NAME, INSTR(F.FILE_NAME, '.', -1) +1 )
                NOT IN ('jpeg', 'jpg', 'gif', 'png')
-- WHEN NOT MATCHED THEN
-- [��ġ�� �� �� ��,]
;


-- ���� �߰�
INSERT INTO MS_FILE ( 
            FILE_NO, BOARD_NO, FILE_NAME, FILE_DATA, REG_DATE, UPD_DATE, EXT
            )
VALUES (1, 1, '������.png', '123', sysdate, sysdate, 'jpg' );


INSERT INTO MS_FILE ( 
            FILE_NO, BOARD_NO, FILE_NAME, FILE_DATA, REG_DATE, UPD_DATE, EXT
            )
VALUES (2, 1, 'main.html', '123', sysdate, sysdate, 'jpg' );


-- �Խñ� �߰�
INSERT INTO MS_BOARD (
                BOARD_NO, TITLE, CONTENT, WRITER, HIT, LIKE_CNT,
                DEL_YN, DEL_DATE, REG_DATE, UPD_DATE
                )
VALUES (
        1, '����', '����', 1, 0, 0, 'N', NULL, sysdate, sysdate
        );
        
-- ���� �߰�
INSERT INTO MS_USER(
                USER_NO, USER_ID, USER_PW, USER_NAME, BIRTH,
                TEL, ADDRESS, REG_DATE, UPD_DATE,
                CTZ_NO, GENDER
                )
VALUES ( 1, 'ALOHA', '123456', '���޸�', TO_DATE('2003/01/01', 'YYYY/MM/DD'),
         '010-1234-1234', '������', sysdate, sysdate,
         '030101-3334444', '��Ÿ');
            
        
SELECT * FROM MS_USER;
SELECT * FROM MS_BOARD;
SELECT * FROM MS_FILE;


-- 77.
-- ���̺� MS_FILE �� EXT �Ӽ���
-- ('jpg', 'jpeg', 'gif', 'png') ���� ������ �ϴ� ���������� �߰��Ͻÿ�.

ALTER TABLE MS_FILE
ADD CONSTRAINT MS_FILE_EXT_CHECK
CHECK (EXT IN('jpg', 'jpeg', 'gif', 'png') );

ALTER TABLE MS_FILE
DROP CONSTRAINT MS_FILE_EXT_CHECK;



-- 78.
-- MS_USER, MS_BOARD, MS_FILE, MS_REPLY ���̺���
-- ��� �����͸� �����ϴ� ��ɾ �ۼ��Ͻÿ�.
TRUNCATE TABLE MS_USER;
TRUNCATE TABLE MS_BOARD;
TRUNCATE TABLE MS_FILE;
TRUNCATE TABLE MS_REPLY;

DELETE FROM MS_USER;
DELETE FROM MS_BOARD;
DELETE FROM MS_FILE;
DELETE FROM MS_REPLY;

SELECT * FROM MS_USER;
SELECT * FROM MS_BOARD;
SELECT * FROM MS_FILE;
SELECT * FROM MS_REPLY;

-- DDL, DML , DCL

-- DELETE vs TRUNCATE
-- * DELETE - ������ ���۾� (DML)
--   - �� �� ������ �����͸� �����Ѵ�
--   - COMMIT, ROLLABCK �� �̿��Ͽ� ��������� �����ϰų� �ǵ��� �� ����

-- * TRUNCATE - ������ ���Ǿ� (DDL)
--   - ��� ���� �����Ѵ�
--   - ������ �����͸� �ǵ��� �� ����


-- 79.
-- ���̺��� �Ӽ��� �����Ͻÿ�.
-- * MS_BOARD ���̺��� WRITER �Ӽ�
-- * MS_FILE ���̺��� BOARD_NO �Ӽ�
-- * MS_REPLY ���̺��� BOARD_NO �Ӽ�
ALTER TABLE MS_BOARD DROP COLUMN WRITER;
ALTER TABLE MS_FILE DROP COLUMN BOARD_NO;
ALTER TABLE MS_REPLY DROP COLUMN BOARD_NO;

-- 80.
-- �� ���̺� �Ӽ����� �߰��� ��, �ܷ�Ű�� �����Ͻÿ�.
-- �ش� �ܷ�Ű�� ���Ͽ� ���� ���̺��� ������ ���� ��,
-- ����� �Ӽ��� ���� �����ϴ� �ɼǵ� �����Ͻÿ�.

-- 1)
-- MS_BOARD �� WRITER �Ӽ� �߰�
ALTER TABLE MS_BOARD ADD WRITER NUMBER NOT NULL;

-- WRITER �Ӽ��� �ܷ�Ű�� ����
-- + ���� ���̺� ������ ���� ��, ���������� �Բ� �����ϴ� �ɼ� ����
ALTER TABLE MS_BOARD
ADD CONSTRAINT MS_BOARD_WRITER_FK 
FOREIGN KEY (WRITER) REFERENCES MS_USER(USER_NO)
ON DELETE CASCADE;
-- ON DELETE [NO ACTION, RESTRICT, CASCADE, SET NULL]
-- * RESTRICT : �ڽ� ���̺��� �����Ͱ� �����ϸ�, ���� �� ��
-- * CASCADE  : �ڽ� ���̺��� �����͵� �Բ� ����
-- * SET NULL : �ڽ� ���̺��� �����͸� NULL �� ����

-- 2)
-- MS_FILE �� BOARD_NO �Ӽ� �߰�
ALTER TABLE MS_FILE ADD BOARD_NO NUMBER NOT NULL;

-- BOARD_NO �Ӽ��� �ܷ�Ű�� �߰�
-- �������̺� : MS_BOARD, ���� �Ӽ� : BOARD_NO
-- + ���� ���̺� ������ ���� ��, ���������� �Բ� �����ϴ� �ɼ� ����
ALTER TABLE MS_FILE
ADD CONSTRAINT MS_FILE_BOARD_NO_FK FOREIGN KEY(BOARD_NO)
REFERENCES MS_BOARD(BOARD_NO)
ON DELETE CASCADE;

-- 3)
-- MS_REPLY �� BOARD_NO �Ӽ� �߰�
ALTER TABLE MS_REPLY ADD BOARD_NO NUMBER NOT NULL;

-- BOARD_NO �Ӽ��� �ܷ�Ű�� �߰�
-- �������̺� : MS_BOARD, ���� �Ӽ� : BOARD_NO
-- + ���� ���̺� ������ ���� ��, ���������� �Բ� �����ϴ� �ɼ� ����
ALTER TABLE MS_REPLY
ADD CONSTRAINT MS_REPLY_BOARD_NO_FK FOREIGN KEY(BOARD_NO)
REFERENCES MS_BOARD(BOARD_NO)
ON DELETE CASCADE;


SELECT * FROM MS_USER;
SELECT * FROM MS_BOARD;
SELECT * FROM MS_FILE;

-- ȸ��Ż�� (ȸ����ȣ:1)
DELETE FROM MS_USER WHERE USER_NO = 1;

-- ON DELETE CASCADE �ɼ����� �ܷ�Ű ���� ��,
-- MS_USER �� �����͸� ���� �ϸ�,
-- MS_BOARD �� ������ �����͵� ���������� �����ȴ�.

-- MS_BOARD �� �����Ͱ� ���� �Ǹ�,
-- MS_FILE, MS_FILE �� ������ �����͵� ���������� �����ȴ�.


-- �ܷ�Ű �������� ����
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� FOREIGN KEY (�ܷ�Ű �Ӽ�)
REFERENCES �������̺�(���� �Ӽ�);
-- �ɼ�
-- ON UPDATE            -- ���� ���̺� ���� ��,
--  * CASCADE           : �ڽ� ������ ����
--  * SET NULL          : �ڽ� �����ʹ� NULL 
--  * SET DEFAULT       : �ڽ� �����ʹ� �⺻��
--  * RESTRICT          : �ڽ� ���̺��� �����ϴ� �����Ͱ� �����ϸ�, �θ� ������ ���� �Ұ�
--  * NO ACTION         : �ƹ��� ������ ������ �ʴ´� (�⺻��)

-- ON DELETE            -- ���� ���̺� ���� ��,
--  * CASCADE           : �ڽ� ������ ����
--  * SET NULL          : �ڽ� �����ʹ� NULL 
--  * SET DEFAULT       : �ڽ� �����ʹ� �⺻��
--  * RESTRICT          : �ڽ� ���̺��� �����ϴ� �����Ͱ� �����ϸ�, �θ� ������ ���� �Ұ�
--  * NO ACTION         : �ƹ��� ������ ������ �ʴ´� (�⺻��)





-- �� ��������
/*
    : SQL �� ���ο� ����ϴ� SELECT ��
    * �������� : ���������� ����ϴ� �������� SELECT ��
    
    * �������� ����
    - ��Į�� ��������    : SELECT ������ ����ϴ� ��������
    - �ζ��� ��         : FROM ������ ����ϴ� ��������
    - ���� ����         : WHERE ������ ����ϴ� ��������
*/

-- 81.
-- EMPLOYEE, DEPARTMENT, JOB ���̺��� ����Ͽ�
-- ��Į�� ���������� ��°���� ���� ��ȸ�Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM job;

SELECT emp_id AS �����ȣ
      ,emp_name AS ������
      ,(SELECT dept_title FROM department d WHERE d.dept_id = e.dept_code) �μ���
      ,(SELECT job_name FROM job j WHERE j.job_code = e.job_code) ���޸� 
FROM employee e;

-- JOIN
-- INNER JOIN(��������)
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ���޸�
FROM employee e
     JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
;

-- EQUI JOIN
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ���޸�
FROM employee e, department d, job j
WHERE e.dept_code = d.dept_id
  AND e.job_code = j.job_code
;



-- 82.
-- ��°���� �����Ͽ�,
-- �ζ��� �並 �̿��� �μ����� �ְ�޿��� �޴� ������ ��ȸ�Ͻÿ�.

-- 1. �μ����� �ְ�޿��� ��ȸ
SELECT dept_code
      ,MAX(salary) MAX_SAL
      ,MIN(salary) MIN_SAL
      ,AVG(salary) AVG_SAL
FROM employee
GROUP BY dept_code
;

-- 2. �μ��� �ְ�޿� ��ȸ����� ��������(�ζ��� ��)�� ����
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,e.salary �޿�
      ,t.max_sal �ְ�޿�
      ,t.min_sal �����޿�
      ,ROUND(t.avg_sal, 2) ��ձ޿�
FROM employee e, department d,
     (SELECT dept_code
            ,MAX(salary) MAX_SAL
            ,MIN(salary) MIN_SAL
            ,AVG(salary) AVG_SAL
      FROM employee
      GROUP BY dept_code ) t
WHERE e.dept_code = d.dept_id
  AND e.salary = t.max_sal;

-- 83.
-- ���������� �̿��Ͽ�,
-- �������� '���¸�' �� ����� ���� �μ��� �������� ��ȸ�Ͻÿ�.
SELECT emp_id �����ȣ
      ,emp_name ������
      ,email �̸���
      ,phone ��ȭ��ȣ
FROM employee 
WHERE dept_code = (
                    SELECT dept_code 
                    FROM employee 
                    WHERE emp_name = '���¸�'
                    )
;

    



-- 84.
-- ��� ���̺� �����ϴ� �μ��ڵ常 �����ϴ� �μ��� ��ȸ�Ͻÿ�.
-- (����� �����ϴ� �μ��� ��ȸ�Ͻÿ�.)
SELECT dept_id FROM department; -- D1~D9
SELECT DISTINCT dept_code FROM employee; -- D1,D2,D5,D6,D8,D9
-- ����� ���� �μ� : D3,D4,D7

-- 1) ��������
SELECT dept_id �μ���ȣ
      ,dept_title �μ���
      ,location_id ������
FROM department
WHERE dept_id IN (
                    SELECT DISTINCT dept_code
                    FROM employee
                    WHERE dept_code IS NOT NULL
                 )
ORDER BY dept_id ASC
;

-- 2) EXISTS
SELECT dept_id �μ���ȣ
      ,dept_title �μ���
      ,location_id ������
FROM department d
WHERE EXISTS ( SELECT * FROM employee e WHERE e.dept_code = d.dept_id )
ORDER BY dept_id ASC
;


-- 85.
-- ��� ���̺� �������� �ʴ� �μ��ڵ常 �����ϴ� �μ��� ��ȸ�Ͻÿ�.
-- (����� �������� �ʴ� �μ��� ��ȸ�Ͻÿ�.)
SELECT dept_id FROM department; -- D1~D9
SELECT DISTINCT dept_code FROM employee; -- D1,D2,D5,D6,D8,D9
-- ����� ���� �μ� : D3,D4,D7

-- 1) ��������
SELECT dept_id �μ���ȣ
      ,dept_title �μ���
      ,location_id ������
FROM department
WHERE dept_id NOT IN (
                    SELECT DISTINCT dept_code
                    FROM employee
                    WHERE dept_code IS NOT NULL
                 )
ORDER BY dept_id ASC
;

-- 2) EXISTS
SELECT dept_id �μ���ȣ
      ,dept_title �μ���
      ,location_id ������
FROM department d
WHERE NOT EXISTS ( SELECT * FROM employee e WHERE e.dept_code = d.dept_id )
ORDER BY dept_id ASC
;


-- 86.
-- EMPLOYEE ���̺��� DEPT_CODE �� 'D1' �� �μ��� �ִ�޿� ����
-- �� ū �޿��� �޴� ����� ��ȸ�Ͻÿ�.

SELECT *
FROM employee, department       -- 23 x 9 = 207
;

SELECT * FROM employee;         -- 23��
SELECT * FROM department;       -- 9��


SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,e.salary �޿�
FROM employee e, department d
WHERE e.dept_code = d.dept_id
;

-- 1)
-- 1.�μ��ڵ尡 'D1'�� ����� �ִ�޿�
SELECT MAX(salary)
FROM employee
WHERE dept_code = 'D1';

-- 2. �޿��� 366000 ���� ū ��� ��ȸ
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,e.salary �޿�
FROM employee e, department d
WHERE e.dept_code = d.dept_id
  AND e.salary > 3660000
;

-- 3. 366000 �ڸ��� 1���� ���������� ����
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,TO_CHAR(e.salary, '999,999,999') �޿�
FROM employee e, department d
WHERE e.dept_code = d.dept_id
  AND e.salary > (
                  SELECT MAX(salary)
                  FROM employee
                  WHERE dept_code = 'D1'
                  )
;

-- 2)
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,TO_CHAR(e.salary, '999,999,999') �޿�
FROM employee e, department d
WHERE e.dept_code = d.dept_id
  AND e.salary > ALL (
                        SELECT salary
                        FROM employee
                        WHERE dept_code = 'D1'   
                     )
;

-- 87.
-- EMPLOYEE ���̺��� DEPT_CODE �� 'D9' �� �μ��� �����޿� ����
-- �� ū �޿��� �޴� ����� ��ȸ�Ͻÿ�.

-- 1)
-- 1. DEPT_CODE �� 'D9'�� �μ��� �����޿�
SELECT MIN(salary)
FROM employee
WHERE dept_code = 'D9';

-- 2. �޿� > �����޿� 
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,TO_CHAR(e.salary, '999,999,999') �޿�
FROM employee e
    ,department d
WHERE e.dept_code = d.dept_id
  AND e.salary > (
                  SELECT MIN(salary)
                  FROM employee  
                  WHERE dept_code = 'D9'
                  )
;



-- 2)
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,TO_CHAR(e.salary, '999,999,999') �޿�
FROM employee e
    ,department d
WHERE e.dept_code = d.dept_id
  AND e.salary > ANY (
                        SELECT salary
                        FROM employee  
                        WHERE dept_code = 'D9'
                     )
;

-- 88.
-- EMPLOYEE �� DEPARTMENT ���̺��� �����Ͽ� ����ϵ�,
-- �μ��� ���� ������ �����Ͽ� ����Ͻÿ�.
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,NVL(d.dept_id, '(����)') �μ���ȣ
      ,NVL(d.dept_title, '(����)') �μ���
FROM employee e
     LEFT JOIN department d
     ON ( e.dept_code = d.dept_id )
;

-- NULL �� ������ ������ : �μ��� ���� ���


-- 89.
-- EMPLOYEE �� DEPARTMENT ���̺��� �����Ͽ� ����ϵ�,
-- ������ ���� �μ��� �����Ͽ� ����Ͻÿ�.

SELECT NVL(e.emp_id, '(����)') �����ȣ
      ,NVL(e.emp_name, '(����)') ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
FROM employee e
     RIGHT JOIN department d
     ON (e.dept_code = d.dept_id)
;

-- null ������ ������ : ����� ���� �μ�


--90.
-- ���� �� �μ� ������ ������� ����ϴ� SQL���� �ۼ��Ͻÿ�.

SELECT NVL( e.emp_id, '(����)') �����ȣ
      ,NVL( e.emp_name, '(����)') ������
      ,NVL( d.dept_id, '(����)') �μ���ȣ
      ,NVL( d.dept_title, '(����)') �μ���
FROM employee e
      FULL JOIN department d
      ON (e.dept_code = d.dept_id)
;

-- 91.
-- �����ȣ, ������, �μ���ȣ, ������, ������, �޿�, �Ի����ڸ� ����Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM location;
SELECT * FROM national;

SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_id �μ���ȣ
      ,d.dept_title �μ���
      ,l.local_name ������
      ,n.national_name ������
      ,e.salary �޿�
      ,e.hire_date �Ի�����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     LEFT JOIN location l ON d.location_id = l.local_code
     LEFT JOIN national n ON l.national_code = n.national_code
     ;


-- 92.
-- ����� �� �Ŵ����� ����Ͻÿ�.
-- �����ȣ, ������, �μ���, ����, ����('�Ŵ���')

-- 1.
-- manager_id �÷��� NULL �� �ƴ� ����� �ߺ����� ��ȸ
-- �Ŵ������� ��� ��ȣ
SELECT DISTINCT manager_id
FROM employee
WHERE manager_id IS NOT NULL;

-- 2.
-- employee, department, job ���̺��� �����Ͽ� ��ȸ
SELECT *
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
;

-- 3.
-- ���� ��� ��, emp_id �� �Ŵ��� �����ȣ�� ��츸�� ��ȸ

SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ����
      ,'�Ŵ���' ����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
WHERE emp_id IN ( 
                  SELECT DISTINCT manager_id
                  FROM employee
                  WHERE manager_id IS NOT NULL
                )
;






-- 93.
-- ���(�Ŵ����� �ƴ�)�� ��ȸ�Ͻÿ�.
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ����
      ,'���' ����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
WHERE emp_id NOT IN ( 
                        SELECT DISTINCT manager_id
                        FROM employee
                        WHERE manager_id IS NOT NULL
                   )
;


-- 94.
-- UNION Ű���带 ����Ͽ�,
-- �Ŵ����� ��� �����Ͽ� ��ȸ�Ͻÿ�.
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ����
      ,'�Ŵ���' ����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
WHERE emp_id IN ( 
                  SELECT DISTINCT manager_id
                  FROM employee
                  WHERE manager_id IS NOT NULL
                )
UNION
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ����
      ,'���' ����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
WHERE emp_id NOT IN ( 
                        SELECT DISTINCT manager_id
                        FROM employee
                        WHERE manager_id IS NOT NULL
                   )
;


-- 95.
-- CASE Ű���带 ����Ͽ�,
-- �Ŵ����� ����� �����Ͽ� ����Ͻÿ�
SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ����
      --
      , CASE
            WHEN emp_id IN (
                              SELECT DISTINCT manager_id
                              FROM employee
                              WHERE manager_id IS NOT NULL
                           )
            THEN '�Ŵ���'
            ELSE '���'
        END ����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j ON e.job_code = j.job_code
;


-- 96.
-- EMPLOYEE, DEPARTMENT, JOB ���̺��� �����Ͽ� ��ȸ�Ͻÿ�
-- ����� ���̿� ������ ���Ͽ� ����ϰ�,
-- �ֹε�Ϲ�ȣ ���ڸ� ù���ڸ� �����ϰ� ����ŷ�Ͽ� ����Ͻÿ�.

SELECT e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ���޸�
      , CASE
            WHEN emp_id IN (
                              SELECT DISTINCT manager_id 
                              FROM employee
                              WHERE manager_id IS NOT NULL
                           )
            THEN '�Ŵ���'
            ELSE '���'
        END ����
      -- ���� (�ֹε�Ϲ�ȣ ���ڸ� ù����)
      -- 1,3(����), 2,4(����)
      , CASE
            WHEN SUBSTR(emp_no, 8, 1) IN ('1','3') THEN '����'
            WHEN SUBSTR(emp_no, 8, 1) IN ('2','4') THEN '����'
        END ����
      -- ����
      ,TO_CHAR(sysdate, 'YYYY')
      -
      ( CASE 
            -- 1900��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('1','2') THEN '19'
            -- 2000��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('3','4') THEN '20'
      END || SUBSTR(emp_no, 1, 2) ) + 1 ���糪��       
      -- �ֹι�ȣ(����ŷ)
      -- 861015-1356452 (14)
      ,RPAD( SUBSTR(emp_no, 1, 8), 14, '*' ) �ֹε�Ϲ�ȣ
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j USING(job_code)
;
-- USING : �����ϰ��� �ϴ� �� ���̺��� �÷����� ������,
--         ON Ű���� ��� ���� ������ �����ϰ� �ۼ��ϴ� Ű����

-- �� ����???
SELECT emp_name
      , "�� ����"
FROM employee;

-- 
SELECT  TRUNC(MONTHS_BETWEEN( sysdate, TO_DATE(
                        CASE 
                              WHEN SUBSTR(emp_no, 8, 1) IN ('1','2') THEN '19'
                              WHEN SUBSTR(emp_no, 8, 1) IN ('3','4') THEN '20'
                        END || SUBSTR(emp_no, 1, 6) , 'YYYYMMDD' 
                       )

                    ) / 12 )  ������
FROM employee;






-- �ֹε�Ϲ�ȣ ���ڸ� ù���� ��������
SELECT SUBSTR(emp_no, 8, 1)
FROM employee;


-- �ֹε�Ϲ�ȣ���� ������� �����ϱ�
-- 1985.05.04  --> 850504  --  �� ù 1,2 
-- 2002.10.06  --> 021006  --  �� ù 3,4
SELECT emp_name,
      CASE 
            -- 1900��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('1','2') THEN '19'
            -- 2000��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('3','4') THEN '20'
      END || SUBSTR(emp_no, 1, 2) �������        -- 85, 02
      -- 1985, 2002
FROM employee;

-- ���翬�� ���ϱ�
SELECT TO_CHAR(sysdate, 'YYYY') ���翬��
FROM dual;



-- ���� ���ϱ�
-- �� ���翬�� - ������� + 1 = ����
SELECT emp_name,
      TO_CHAR(sysdate, 'YYYY')
      -
      ( CASE 
            -- 1900��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('1','2') THEN '19'
            -- 2000��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('3','4') THEN '20'
      END || SUBSTR(emp_no, 1, 2) ) + 1 ����        -- 85, 02
      -- 1985, 2002
FROM employee;


-- 97.
-- 96�� ��ȸ����� 
-- ����, ������, �ټӿ���, �Ի�����, ������ �߰��Ͻÿ�.
SELECT ROWNUM ����
      ,e.emp_id �����ȣ
      ,e.emp_name ������
      ,d.dept_title �μ���
      ,j.job_name ���޸�
      , CASE
            WHEN emp_id IN (
                              SELECT DISTINCT manager_id 
                              FROM employee
                              WHERE manager_id IS NOT NULL
                           )
            THEN '�Ŵ���'
            ELSE '���'
        END ����
      -- ���� (�ֹε�Ϲ�ȣ ���ڸ� ù����)
      -- 1,3(����), 2,4(����)
      , CASE
            WHEN SUBSTR(emp_no, 8, 1) IN ('1','3') THEN '����'
            WHEN SUBSTR(emp_no, 8, 1) IN ('2','4') THEN '����'
        END ����
      -- ����
      ,TO_CHAR(sysdate, 'YYYY')
      -
      ( CASE 
            -- 1900��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('1','2') THEN '19'
            -- 2000��� ���
            WHEN SUBSTR(emp_no, 8, 1) IN ('3','4') THEN '20'
      END || SUBSTR(emp_no, 1, 2) ) + 1 ���糪��      
      -- ������
      ,TRUNC(
            MONTHS_BETWEEN( 
                  sysdate, 
                  TO_DATE(
                        CASE 
                              WHEN SUBSTR(emp_no, 8, 1) IN ('1','2') THEN '19'
                              WHEN SUBSTR(emp_no, 8, 1) IN ('3','4') THEN '20'
                        END || SUBSTR(emp_no, 1, 6) , 'YYYYMMDD' 
                  )
            ) / 12 )  ������ 
      -- �ټӿ��� : ��������-�Ի����� [����]
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date) / 12) �ټӿ���
      -- �ֹι�ȣ(����ŷ)
      ,RPAD( SUBSTR(emp_no, 1, 8), 14, '*' ) �ֹε�Ϲ�ȣ
      -- �Ի�����
      ,TO_CHAR( hire_date, 'YYYY.MM.DD') �Ի�����
      -- ���� : (�޿� + (�޿�*���ʽ�)) * 12
      ,TO_CHAR( ( salary + NVL( (salary*bonus), 0) ) * 12, '999,999,999,999' ) ����
FROM employee e
     LEFT JOIN department d ON e.dept_code = d.dept_id
     JOIN job j USING(job_code)
;

select * FROM employee;





-- �� �����ϱ�
-- ���, �μ� ���̺� ���� ��ȸ�� ����� ��� ����
-- 1. ���, �μ� ���̺� ����
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
FROM employee e
     LEFT JOIN department d
     ON e.dept_code = d.dept_id
;

-- 2. �� ����
CREATE VIEW v_emp_dept AS
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
FROM employee e
     LEFT JOIN department d
     ON e.dept_code = d.dept_id
;

-- �� ����
DROP VIEW v_emp_dept;


-- 98.
-- employee, department ���̺��� �����Ͽ�,
-- �����ȣ, ������, �μ���ȣ, �μ���, �̸���, ��ȭ��ȣ
-- �ֹι�ȣ, �Ի�����, �޿�, ������ ��ȸ�Ͻÿ�.
-- CREATE OR REPLACE ��ü
-- - ������, ���� ����
-- - ������, ��ü (������ ���� �Ǿ� �־ �����߻�X)
CREATE OR REPLACE VIEW VE_EMP_DEPT AS
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
      ,e.email
      ,e.phone
      -- �ֹε�Ϲ�ȣ
      ,RPAD( SUBSTR(emp_no, 1, 8), 14, '*' ) emp_no
      -- �Ի�����
      ,TO_CHAR( hire_date, 'YYYY.MM.DD' ) hire_date
      -- �޿�
      ,TO_CHAR( salary, '999,999,999' ) salary
      -- ����
      ,TO_CHAR( (salary + NVL( salary*bonus, 0)) * 12, '999,999,999,999') yr_salary
FROM employee e
     LEFT JOIN department d ON (e.dept_code = d.dept_id)
;

SELECT * 
FROM VE_EMP_DEPT;




-- ������ ����
/*
      CREATE SEQUENCE ��������
      INCREMENT BY ��������
      START WITH ���ۼ���
      MINVALUE �ּڰ�
      MAXVALUE �ִ�;
*/

-- ������ ����
CREATE SEQUENCE my_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000;

-- ���� ����
SELECT my_seq.currval FROM dual;

-- ���� ����
SELECT my_seq.nextval FROM dual;


-- ������ ����
DROP SEQUENCE my_seq;

-- 99.
-- �������� �����Ͻÿ�.
-- SEQ_MS_USER
-- SEQ_MS_BOARD
-- SEQ_MS_FILE
-- SEQ_MS_REPLY
-- (����: 1, ������: 1, �ּڰ�: 1, �ִ�: 1000000)
-- ������ ����
CREATE SEQUENCE seq_ms_user
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000;

CREATE SEQUENCE seq_ms_board
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000;

CREATE SEQUENCE seq_ms_file
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000;

CREATE SEQUENCE seq_ms_reply
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000000;

-- 100.
-- SEQ_MS_USER �� ���� ��ȭ�� ���� ��ȣ�� ����Ͻÿ�.
SELECT SEQ_MS_USER.nextval FROM dual;
SELECT SEQ_MS_USER.currval FROM dual;

-- 101.
-- SEQ_MS_USER �� �����Ͻÿ�.
DROP SEQUENCE seq_ms_user;


-- 102.
-- SEQ_MS_USER �� �̿��Ͽ�, MS_USER �� user_no ��
-- ����ʽ� ��ȣ�� ����� �� �ֵ��� �����͸� �߰��غ��ÿ�.
TRUNCATE TABLE MS_USER;

INSERT INTO MS_USER(user_no, user_id, user_pw, user_name,
                   birth, tel, address, reg_date, upd_date, ctz_no, gender)
VALUES (
      SEQ_MS_USER.nextval, 'human', '123456', '���޸�',
      '2002/01/01', '010-1234-1234', '���� ������', sysdate, sysdate,
      '020101-1234567', '��'
);

INSERT INTO MS_USER(user_no, user_id, user_pw, user_name,
                   birth, tel, address, reg_date, upd_date, ctz_no, gender)
VALUES (
      SEQ_MS_USER.nextval, 'human2', '123456', '���޸�',
      '2013/01/01', '010-1111-1111', '���� ����', sysdate, sysdate,
      '130101-2223333', '��'
      
);
SELECT * FROM ms_user;


-- 103.
-- ������ SEQ_MS_USER �� �ִ񤡹��� 100,000,000 ���� �����Ͻÿ�.
ALTER SEQUENCE SEQ_MS_USER MAXVALUE 100000000;

-- 104.
-- USER_IND_COLUMNS ���̺��� ��ȸ�Ͻÿ�.
-- * ����ڰ� ������ �ε��� ������ ����ִ�.
SELECT index_name, table_name, column_name
FROM user_ind_columns;


-- 105.
-- MS_USER ���̺��� USER_NAME �� ����
-- �ε��� IDX_MS_USER_NAME �� �����Ͻÿ�.

-- �ε��� ����
CREATE INDEX IDX_MS_USER_NAME ON MS_USER(user_name);

-- �ε��� ����
DROP INDEX IDX_MS_USER_NAME;


-- �߰� �ǽ�
-- COALESCE()
SELECT employee_id �����ȣ
      ,first_name  �̸�
      ,COALESCE( salary + (salary * commission_pct), salary, 0 ) �����޿�
      ,commission_pct
FROM employees;


-- LNNVL(���ǽ�)
-- TRUE --> FALSE
-- FALSE, NULL --> TRUE
SELECT employee_id, commission_pct
FROM employees
WHERE LNNVL(commission_pct >= 0.2);

SELECT employee_id, commission_pct
FROM employees
WHERE NVL(commission_pct, 0) < 0.2;

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct < 0.2;


-- NULLIF()
SELECT employee_id
      ,TO_CHAR(start_date, 'YYYY') start_year
      ,TO_CHAR(end_date, 'YYYY') end_year
      ,NULLIF(TO_CHAR(end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY')) nullif_year
FROM job_history;

-- �׷� ���� �Լ�

-- ROLLUP
-- �μ���, ���޺� �޿� �ִ�, �հ�, ���
-- * ROLLUP �̻��
SELECT dept_code, job_code
      ,COUNT(*), MAX(salary), SUM(salary), TRUNC( AVG(salary), 2)
FROM employee
GROUP BY dept_code, job_code
ORDER BY dept_code, job_code
;

-- * ROLLUP ���
-- : �׷� �������� ������ ����� �߰������� �� ���� ���� ����ϴ� �Լ�
SELECT dept_code, job_code
      ,COUNT(*), MAX(salary), SUM(salary), TRUNC( AVG(salary), 2)
FROM employee
GROUP BY ROLLUP(dept_code, job_code)
ORDER BY dept_code, job_code
;

-- CUBE
SELECT dept_code, job_code
      ,COUNT(*), MAX(salary), SUM(salary), TRUNC( AVG(salary), 2)
FROM employee
WHERE dept_code IS NOT NULL
  AND job_code IS NOT NULL
GROUP BY CUBE(dept_code, job_code)
ORDER BY dept_code, job_code
;

-- GROUPING SETS()
-- ���� �μ���, ���޺� ������ �ο� ��
SELECT dept_code, job_code, COUNT(*)
FROM employee
GROUP BY GROUPING SETS( (dept_code), (job_code) )
ORDER BY dept_code, job_code
;

-- Ư�� �μ��� ���޺� �ο� ��
SELECT dept_code, job_code, COUNT(*)
FROM employee
GROUP BY dept_code, job_code
ORDER BY dept_code, job_code
;


-- GROUPING
SELECT dept_code
      , job_code
      ,COUNT(*)
      , MAX(salary)
      , SUM(salary)
      , TRUNC( AVG(salary), 2)
      , GROUPING(dept_code) "�μ��ڵ� �׷쿩��"
      , GROUPING(job_code) "�����ڵ� �׷쿩��"
FROM employee
WHERE dept_code IS NOT NULL
  AND job_code IS NOT NULL
GROUP BY CUBE(dept_code, job_code)
ORDER BY dept_code, job_code
;


-- LISTAGG
SELECT dept_code �μ��ڵ�
      ,LISTAGG( emp_name, ', ')
       WITHIN GROUP(ORDER BY emp_name) "�μ��� ����̸����"
FROM employee
GROUP BY dept_code
ORDER BY dept_code
;

-- PIVOT
-- ������ �࿡ ǥ��, �μ��� ���� �׷�ȭ�Ͽ� �ְ�޿��� ����Ͻÿ�.
SELECT *
FROM (
        SELECT dept_code, job_code, salary
        FROM employee
     )
     PIVOT (
        MAX(salary)
        -- ���� �ø� �÷���
        FOR dept_code IN ('D1','D2','D3','D4','D5','D6','D7','D8','D9')
        /*
        FOR dept_code IN (
                            SELECT LISTAGG(dept_id, ',')
                            FROM department
                         )
        */
     )
ORDER BY job_code;

SELECT LISTAGG(dept_id, ',')
FROM department
;

SELECT *
FROM
    (
      SELECT dept_code
             ,MAX( DECODE(job_code, 'j1', salary) ) J1
             ,MAX( DECODE(job_code, 'j2', salary) ) J2
             ,MAX( DECODE(job_code, 'j3', salary) ) J3
             ,MAX( DECODE(job_code, 'j4', salary) ) J4
             ,MAX( DECODE(job_code, 'j5', salary) ) J5
             ,MAX( DECODE(job_code, 'j6', salary) ) J6
             ,MAX( DECODE(job_code, 'j7', salary) ) J7
     FROM employee 
     GROUP BY dept_code
     ORDER BY dept_code
     )
     UNPIVOT (
        salary
        FOR job_code IN (J1, J1, J3, J4, J5 , J6, J7)
        )
    ;
    
-- ��Ÿ �Լ�
-- GREATEST ()
-- LEAST ()
-- ���� : ǥ����
SELECT GREATEST(1,2,3,4,5)
        ,LEAST(1,2,3,4,5)
FROM dual;

SELECT GREATEST('���޸�','���޸�','ȫ�޸�') "���� �� ������"
        ,LEAST('���޸�','���޸�','ȫ�޸�') "���� �� ó��"
FROM dual;


-- ����
-- * ��������
-- ��������

SELECT *
FROM employees e
    ,department d
WHERE e.department_id = d.department_id;

SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.employee_id
      ,e.first_name
      ,e.department_id
      ,e.department_name
FROM employees e
    ,department d
WHERE e.department_id = d.department_id

-- ���� ����
SELECT department_id, department_name
FROM departments d
WHERE EXISTS(SELECT *
             FROM employees e
             WHERE e.department_id = d.department_id
             AND   e.salary > 3000 )
ORDER BY d.department_name;

-- IN ���
SELECT department_id, department_name
FROM departments d
WHERE d.department_id IN ( SELECT e.department_id
                           FROM employees e
                           WHERE e.salary > 3000 )
ORDER BY d.department_name
;

-- ��Ƽ ����
-- NOT EXISTS ���
SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS(SELECT *
             FROM employees e
             WHERE e.department_id = d.department_id
             AND   e.salary > 3000 )
ORDER BY d.department_name;

-- IN ���
SELECT e.employee_id
      ,e.first_name
      ,d.department_id
      ,d.department_name
FROM employees e
    ,departments d
WHERE e.department_id = d.deaprtment_id
AND e.department_id NOT IN (
                            SELECT department_id
                            FROM departments
                            WHERE manager_id IS NULL
                            )
;

-- ��������
-- ����� �����ڸ� �Բ� ��ȸ�Ͻÿ�.
SELECT a.employee_id   �����ȣ
      ,a.first_name    �����
      ,b.employee_id   �����ڹ�ȣ
      ,b.first_name    �����ڸ�
      ,a.department_id �μ���ȣ
FROM employees a,
     employees b
WHERE a.manager_id = b.employee_id
  AND a.department_id = b.department_id
--  AND a.department_id = 20;


-- LEFT OUTER JOIN
-- (+)
-- : ���� ���ǿ��� �����Ͱ� ����(NULL) ���Ժ��� �÷��� ��ȣ�� �ٿ��ش�.
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
FROM employee e
    ,department d
WHERE e.dept_code = d.dept_id(+)
;


-- ANSI
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
FROM employee e LEFT OUTER JOIN department d -- OUTER ��������
                ON e.dept_code = d.dept_id;
                

-- RIGHT OUTER JOIN
-- (+)
-- : ���� ���ǿ��� �����Ͱ� ����(NULL) ���Ժ��� �÷��� ��ȣ�� �ٿ��ش�.
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
FROM employee e
    ,department d
WHERE e.dept_code(+) = d.dept_id
;


-- ANSI
SELECT e.emp_id
      ,e.emp_name
      ,d.dept_id
      ,d.dept_title
FROM employee e RIGHT OUTER JOIN department d -- OUTER ��������
                ON e.dept_code = d.dept_id;



-- �ܺ� ���� ���ǻ���
-- * �� ���̺��� ���� ������ �Ǵ� ���� �÷��� ��� (+) ��ȣ�� �ٿ����Ѵ�
-- ex) �����÷� : employee_id, department_id
SELECT e.employee_id
      ,e.first_name
      ,j.job_id
      ,j.department_id
  FROM employees e
      ,job_history j
WHERE e.employee_id = j.employee_id(+)
  AND e.department_id = j.department_id(+)
;

SELECT * FROM employees;
SELECT * FROM job_history;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM job_history;

-- FULL OUTER JOIN
SELECT *
  FROM employee e
      ,department d
WHERE e.dept_code(+) = d.dept_id(+); -- (+)��ȣ�δ� FULL JOIN �Ұ�

SELECT e.emp_name
      ,d.dept_title
 FROM employee e
      FULL OUTER JOIN department d
      ON dept_code = d.dept_id;


ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER note IDENTIFIED BY 123456;
ALTER USER note DEFAULT TABLESPACE users;
ALTER USER note QUOTA UNLIMITED ON users;
GRANT dba TO note;

             
-- ������ ���� ��
SELECT *
  FROM user_table
WHERE table_name LIKE '%EMP%'
  ;


-- board ���̺� ����
CREATE TABLE board(
    board_no NUMBER PRIMARY KEY
    ,title VARCHAR2(100) NOT NULL
    ,writer VARCHAR2(100) NOT NULL
    ,content VARCHAR2(2000) NULL
    ,reg_date DATE  DEFAULT sysdate NOT NULL
    ,upd_date DATE  DEFAULT sysdate NOT NULL
);

--������ ����
  CREATE SEQUENCE seq_board
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 10000
  MINVALUE 1;
  


