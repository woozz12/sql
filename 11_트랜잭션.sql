
--  ����Ŀ�� ���� Ȯ��
SHOW AUTOCOMMIT
-- ����Ŀ�� ��
SET AUTOCOMMIT ON;
-- ����Ŀ�� ����
SET AUTOCOMMIT OFF;



SELECT * FROM emps;

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (303,'Lee', 'abc1234@naver.com',sysdate,1800);
    
 /*  
   INSERT INTO emps
    (employee_id, last_name, email,phone_number, hire_date, job_id,salary,department_id)
VALUES
    (101,'Neena', 'Kochhar','NKOCHHAR',515.123.4568, 05/09/21,'AD_PRES',24000,90 ); 
   */ 
    
-- �������� ��� ������ ��������� ���(���), 
-- ���� Ŀ�� �ܰ�� ȸ��(���ư���) �� Ʈ����� ����
ROLLBACK 


SAVEPOINT insert_park;

INSERT INTO emps
    (employee_id, last_name, email, hire_date,job_id)
VALUES
    (305,'park','park4321@gmail.com',sysdate,1800);




-- �������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ����
-- Ŀ���� ���Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� �����ϴ�.
COMMIT;

