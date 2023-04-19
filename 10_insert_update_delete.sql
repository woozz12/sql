-- insert
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT�� ù��° ��� (��� �÷� �����͸� �� ���� ����)
INSERT INTO departments

--department_id , department_name, manager_id , location_id 
--values�� ��� �� ���� ��� ���� �� �־���� �Ѵ�.

VALUES(290,'������');

ROLLBACK; --���� ������ �ٽ� �ڷ� �ǵ����� Ű����

SELECT * FROM departments;


--INSERT�� �� ��° ���(���� �÷��� �����ϰ� ����, NOT NULL Ȯ���ϼ���!)
INSERT INTO departments
    (department_id,department_name, location_id)
VALUES
    (280, '������', 1700);

-- �纻 ���̺� ����
-- ������ ���� ���� ������ WHERE���� false�� �����
--�纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false�� (1 = 2)�����ϸ� -> ���̺��� ������ �����ϰ� �����ʹ� ���� X

-- �����ϰ� ���� �̸�
CREATE TABLE managers AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;
DROP TABLE managers; -- ���̺� ����

-- INSERT (��������)
-- ������ ä���ش� �� �ϳ��� ��߳��� INSERT�� ä���ټ� ����.
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

-------------------------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS�� ����ϸ� ���� ������ NOT NULL ����� ������� �ʽ��ϴ�. TABLE�� ���� ������ X
���� ������ ���� ��Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� ���� �͵���
DB �� ����Ǵ� ���� �����ϴ� �������� ����մϴ�.
*/

--set ���� ������ �ɾ���� �Ѵ�.
--UPDATE�� ������ ���� ������ ������ �� �� �����ؾ� �մϴ�.
--�׷��� ������ ���� ����� ���̺� ��ü�� ����˴ϴ�.
UPDATE emps SET salary = 30000;
SELECT * FROM emps;
ROLLBACK; -- �ǵ�����

UPDATE emps SET salary = 24000
WHERE employee_id = 100;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;

UPDATE emps SET
phone_number = '515.123.4567', manager_id = 102
WHERE employee_id = 100;


--UPDATE (��������)
UPDATE emps
    SET (job_id, salary, manager_id) = 
    (SELECT job_id, salary, manager_id
    FROM emps
    WHERE employee_id = 100
    )
WHERE employee_id = 101;

-- DELETE
DELETE FROM emps
WHERE employee_id = 103;

SELECT * FROM emps
WHERE employee_id = 103;

-- �纻���̺� ����
CREATE TABLE depts AS (SELECT * FROM departments);
SELECT * FROM depts;

-- DELETE(��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM depts
                        WHERE department_id = 100);

DELETE FROM emps
WHERE department_id = (SELECT department_id FROM depts
                        WHERE department_name = 'IT');

SELECT * FROM emps;








