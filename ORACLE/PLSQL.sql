-- PLSQL 
-- �͸� ���
SET SERVEROUTPUT ON                 -- ������ ����ϵ��� ����
DECLARE
    vi_num NUMBER;                  -- �����
BEGIN
    vi_num := 100;                  -- �����
    DBMS_OUTPUT.PUT_LINE(vi_num);
END;
/



-- ��ȸ ��� ������ �����ϱ� (INTO)
DECLARE
    -- vs_emp_name VARCHAR2(100);       -- �����
    -- vs_dept_name VARCHAR2(100);      -- �μ���
    vs_emp_name employee.emp_name%TYPE;             -- ������ : ���̺��.�÷���%TYPE
    vs_dept_name department.dept_title%TYPE;      
BEGIN
    SELECT e.emp_name, d.dept_title
      INTO vs_emp_name, vs_dept_name       -- ��ȸ����� ������ ����
    FROM employee e
        ,department d
    WHERE e.dept_code = d.dept_id
      AND e.emp_id = 200;

    DBMS_OUTPUT.PUT_LINE(vs_emp_name || ' : ' || vs_dept_name);
END
;
/


-- ���ǹ�
-- IF 
DECLARE
    vn_num1 NUMBER := 10;
    vn_num2 NUMBER := 20;
BEGIN
    IF vn_num1 > vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 || '�� �� Ů�ϴ�');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 || '�� �� Ů�ϴ�');
    END IF;
END;
/


-- IF ~ ELSIF
DECLARE
    vn_dept_code department.dept_id%TYPE := 'D1';     -- �μ�ID
    vn_salary NUMBER := 0;
BEGIN
    
    SELECT MAX(salary)
      INTO vn_salary
      FROM employee
     WHERE dept_code = vn_dept_code;
     
    DBMS_OUTPUT.PUT_LINE('D1 �μ� �ִ�޿� : ' || vn_salary);
      
    IF vn_salary BETWEEN 1000000 AND  2000000 THEN
        DBMS_OUTPUT.PUT_LINE('1');    
    ELSIF vn_salary BETWEEN 2000001 AND  3000000 THEN
        DBMS_OUTPUT.PUT_LINE('2');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('3');    
    END IF;
END;
/


-- CASE
DECLARE
    vn_dept_code department.dept_id%TYPE := 'D1';     -- �μ�ID
    vn_salary NUMBER := 0;
BEGIN
    SELECT MAX(salary)
      INTO vn_salary
      FROM employee
     WHERE dept_code = vn_dept_code;
    DBMS_OUTPUT.PUT_LINE('D1 �μ� �ִ�޿� : ' || vn_salary);
    
    CASE WHEN vn_salary BETWEEN 1000000 AND 2000000 THEN
            DBMS_OUTPUT.PUT_LINE(1);
        WHEN vn_salary BETWEEN 2000001 AND 3000000 THEN
            DBMS_OUTPUT.PUT_LINE(2);
        ELSE
            DBMS_OUTPUT.PUT_LINE(3);
    END CASE;
END;
/

-- �ݺ���
-- LOOP
DECLARE
    vn_base_num NUMBER := 3;
    vn_cnt NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '=' || 
                             vn_base_num * vn_cnt);
        vn_cnt := vn_cnt + 1;
        
        EXIT WHEN vn_cnt > 9;        
    END LOOP;
END;
/

-- WHILE LOOP
DECLARE
    vn_base_num NUMBER := 3;
    vn_cnt NUMBER := 1;
BEGIN
    WHILE vn_cnt <= 9 LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || vn_cnt || '=' || 
                             vn_base_num * vn_cnt);
        vn_cnt := vn_cnt + 1;
    END LOOP;
END;
/

-- FOR LOOP
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN 1..9 
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '=' || 
                             vn_base_num * i);
    END LOOP;
END;
/

-- FOR LOOP (REVERSE)
DECLARE
    vn_base_num NUMBER := 3;
BEGIN
    FOR i IN REVERSE 1..9 
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '=' || 
                             vn_base_num * i);
    END LOOP;
END;
/


-- CONTINUE
DECLARE
    vn_num NUMBER := 1;
BEGIN
    FOR i IN 1..20
    LOOP
        CONTINUE WHEN MOD(i, 2) = 0;
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- NULL ��
DECLARE
    vn_var VARCHAR2(10) := 'A';
BEGIN
    CASE
        WHEN vn_var = 'A' THEN
            DBMS_OUTPUT.PUT_LINE('A');
        WHEN vn_var = 'B' THEN
            DBMS_OUTPUT.PUT_LINE('B');
        ELSE
            NULL;       -- �ƹ��͵� ó������ �ʴ� NULL ��
    END CASE;
END;
/




-- �Լ� ����
-- �����ȣ�� �μ����� ���ϴ� �Լ�
CREATE OR REPLACE FUNCTION get_dept_title( p_emp_id NUMBER )
RETURN VARCHAR2
IS
    out_title department.dept_title%TYPE ;
BEGIN
    SELECT dept_title
      INTO out_title
      FROM employee e
          ,department d
     WHERE e.dept_code = d.dept_id
       AND e.emp_id = p_emp_id;
    RETURN out_title;
END;
/

-- SELECT ������ �Լ� ����
SELECT emp_name
      ,get_dept_title(emp_id) �μ���
FROM employee;

-- ��� ���� �Լ� ����
DECLARE
    result department.dept_title%TYPE;
BEGIN
    result := get_dept_title( 200 );
    DBMS_OUTPUT.PUT_LINE(result);
END;
/


-- �Լ� ����2
-- ���� �޿�
CREATE OR REPLACE FUNCTION func_sal_tax (
    IN_SALARY IN NUMBER
)
RETURN NUMBER
IS
    tax NUMBER := 0.10;
    result NUMBER;
BEGIN
    result := TRUNC( IN_SALARY - ( IN_SALARY * tax ), 2 );
    return result;
END;
/

SELECT emp_id, emp_name, 
       salary �����޿�
       ,func_sal_tax( salary ) ���ı޿�
FROM employee;
  

-- �Լ� ����
-- emp_id �� ���ڷ� �Ѱ��ָ�,
-- ��� ������ '�Ŵ���', '���' ���� ��ȯ�ϴ� �Լ��� �����غ�����.
-- �Լ���: get_emp_type( )
SELECT emp_id
      ,emp_name
      ,get_dept_title( emp_id ) �μ���
      ,get_emp_type( emp_id )
FROM employee;

--
CREATE OR REPLACE FUNCTION get_emp_type( p_emp_id NUMBER )
RETURN VARCHAR2
IS
    result VARCHAR2(10);
BEGIN
    -- ���� Ÿ�� ��ȸ
    SELECT
        CASE
            WHEN EXISTS (SELECT 1 FROM employee WHERE manager_id = p_emp_id)
            THEN '�Ŵ���'
            ELSE '���'
        END
    INTO result
    FROM dual;
    
    RETURN result;
END;
/

-- ���ν��� ����
CREATE OR REPLACE PROCEDURE pro_print
IS
    V_A NUMBER := 10;
    V_B NUMBER := 20;
    V_C NUMBER;
    
BEGIN
    V_C := V_A + V_B;
    DBMS_OUTPUT.PUT_LINE('V_C : ' || V_C );
END;
/

SET SERVEROUTPUT ON;
-- ���ν��� ����
EXECUTE pro_print();

-- human ��Ű��
-- board ���̺� ���� 
CREATE TABLE board (
     board_no NUMBER PRIMARY KEY
    ,title VARCHAR2(100) NOT NULL
    ,writer VARCHAR2(100) NOT NULL
    ,content VARCHAR2(2000) NULL
    ,reg_date DATE DEFAULT sysdate NOT NULL
    ,upd_date DATE DEFAULT sysdate NOT NULL
);

-- SEQ_BOARD ������ ����
CREATE SEQUENCE seq_board
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000;

-- ���ν��� (�Ķ���� ���)
-- �Է� : �����ȣ, ����, ����
-- board ���̺� ��������� �۾��⸦ �ϴ� ���α׷�
CREATE OR REPLACE PROCEDURE pro_emp_write
(
    IN_EMP_ID employee.emp_id%TYPE,
    IN_TITLE IN VARCHAR2 DEFAULT '�������',
    IN_CONTENT IN VARCHAR2 DEFAULT '�������'
)
IS
    V_EMP_NAME employee.emp_name%TYPE;
BEGIN
    SELECT emp_name INTO V_EMP_NAME
    FROM employee
    WHERE emp_id = IN_EMP_ID;
    
    INSERT INTO board(board_no, title, writer, content)
    VALUES ( SEQ_BOARD.nextval, IN_TITLE , V_EMP_NAME, IN_CONTENT);
END;
/

EXECUTE pro_emp_write( '200', '����' ,'����' );
EXECUTE pro_emp_write( '206' );

SELECT * FROM board;

-- ���ν��� + ���ǹ�
-- ����� ���� �̷��� �����ϴ� ���ν���
CREATE OR REPLACE PROCEDURE pro_app_emp (
    -- �Ķ����
    IN_EMP_ID IN employees.employee_id%TYPE,    -- �����ȣ
    IN_JOB_ID IN jobs.job_id%TYPE,              -- ����ID
    IN_STD_DATE IN DATE,                        -- ���� ������
    IN_END_DATE IN DATE                         -- ���� ������
)
IS  
    -- �����
    V_DEPT_ID employees.department_id%TYPE;
    V_CNT NUMBER := 0;                          -- �����̷� ����
BEGIN
    -- �����
    -- 1. ������� ��ȸ
    SELECT department_id INTO V_DEPT_ID
      FROM employees
     WHERE employee_id = IN_EMP_ID;

    -- 2. ��� ���̺��� JOB_ID ����
    -- AC_MAG --> IT_PROG
    UPDATE employees
       SET job_id = IN_JOB_ID
     WHERE employee_id = IN_EMP_ID;

    -- 3. �����̷� ���̺� �����̷� ����
    -- ���� ��¥�� ���ԵǴ� �����̷� Ȯ��
    SELECT COUNT(*) INTO V_CNT
      FROM job_history
     WHERE sysdate BETWEEN start_date AND end_date
       AND employee_id = IN_EMP_ID;

    DBMS_OUTPUT.PUT_LINE('�������� ���� : ' || V_CNT);

    -- �ش� �Ⱓ��
    -- ���� �̷��� ������, ���� �߰�
    IF V_CNT = 0 THEN
        INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
        VALUES ( IN_EMP_ID, IN_STD_DATE, IN_END_DATE, IN_JOB_ID, V_DEPT_ID );
    -- ���� �̷��� ������, ������ ������ ����
    ELSE
        UPDATE job_history
           SET start_date = IN_STD_DATE
              ,end_date = IN_END_DATE
        WHERE employee_id = IN_EMP_ID
          AND job_id = IN_JOB_ID;
    END IF;
END;
/

-- 
EXECUTE pro_app_emp ('200','IT_PROG','2025/01/01', '2026/01/01' );
EXECUTE pro_app_emp ('200','MK_MAN','2026/02/01', '2030/01/01' );

SELECT * FROM job_history WHERE employee_id = 200
ORDER BY start_date ASC;
   
   
   
 SELECT *
FROM job_history
WHERE sysdate BETWEEN start_date AND end_date
;
  
   
   
-- OUT �Ķ���ͷ� ���ν��� ����ϱ�
CREATE OR REPLACE PROCEDURE pro_out_emp (
    IN_EMP_ID IN employee.emp_id%TYPE,
    OUT_RESULT_STR OUT CLOB
    )
IS
    V_EMP employee%ROWTYPE;
    -- %ROWTPYE
    -- : �ش� ���̺� �Ǵ� ���� �÷����� ����Ÿ������ ����
BEGIN
    SELECT * INTO V_EMP
        FROM employee
    WHERE emp_id = IN_EMP_ID;
    
    OUT_RESULT_STR := V_EMP.emp_id
                        || '/' || V_EMP.emp_name
                        || '/' || V_EMP.salary;
END;
/

SET SERVEROUTPUT ON;
DECLARE
    out_result_str CLOB;
BEGIN
    pro_out_emp( '200' , out_result_str );
    DBMS_OUTPUT.PUT_LINE( out_result_str );
END;    
/

-- ���ν����� OUT �Ķ���� 2�� �̻� ����ϱ�
CREATE OR REPLACE PROCEDURE pro_out_mul (
    IN_EMP_ID IN employee.emp_id%TYPE,
    OUT_DEPT_CODE OUT employee.dept_code%TYPE,
    OUT_JOB_CODE OUT employee.job_code%TYPE

)
IS
    V_EMP employee%ROWTYPE;
BEGIN
    SELECT * INTO V_EMP
    FROM employee
    WHERE emp_id = IN_EMP_ID;
    
    OUT_DEPT_CODE := V_EMP.dept_code;
    OUT_JOB_CODE := V_EMP.job_code;
END;
/

-- ���ν��� ȣ��
-- 1) �Ű������� ���ų�, IN �Ű����� �� : EXECUTE ���ν�����(����1,����2);
-- 2) OUT �Ű�����                   : PL/SQL ��� �ȿ��� ȣ��

-- EXECUTE pro_out_mul(1,2,3)       -- OUT �Ķ���Ͱ� �־, ��� �ȿ��� ȣ���ؾ���
DECLARE
    out_dept_code employee.dept_code%TYPE;
    out_job_code employee.job_code%TYPE;
BEGIN
    pro_out_mul('200', out_dept_code, out_job_code);
    DBMS_OUTPUT.PUT_LINE( out_dept_code );
    DBMS_OUTPUT.PUT_LINE( out_job_code );
END;
/


-- ���ν������� ����ó��
CREATE OR REPLACE PROCEDURE pro_print_emp (
    IN_EMP_ID IN employee.emp_id%TYPE
    )
IS
    STR_EMP_INFO CLOB;
    V_EMP employee%ROWTYPE;
BEGIN
    SELECT * INTO V_EMP
    FROM employee
    WHERE emp_id = IN_EMP_ID;
    -- CHR(10) : �ٹٲ� (����)
    STR_EMP_INFO := '�������' || CHR(10) ||
                    '����� : ' || V_EMP.emp_name || CHR(10) ||
                    '�̸��� : ' || V_EMP.email || CHR(10) ||
                    '��ȭ��ȣ : ' || V_EMP.phone;
                
            DBMS_OUTPUT.PUT_LINE( STR_EMP_INFO );
                    
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                   
                    STR_EMP_INFO := '�������� �ʴ� ���ID �Դϴ�.';
                    DBMS_OUTPUT.PUT_LINE( STR_EMP_INFO );
                    
END;
/

EXECUTE pro_print_emp('200');
EXECUTE pro_print_emp('300');
-- �������� �ʴ� �����ȣ (���ܹ߻�)
