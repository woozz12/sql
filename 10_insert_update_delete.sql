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



















