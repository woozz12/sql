-- SQL�� �������!!!
-- �׷� �Լ� AVG,MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; --�� �� �������� ��
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; --null�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees; --null�� �ƴ� ���� ��

-- �μ����� �׷�ȭ, �׷��Լ��� ���
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

-- ������ ��
--�׷� �Լ��� �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�.
SELECT 
    department_id, -- �̰��� �׷�ȭ�ؾ��Ѵ�. �׳��� ��� �Ұ���
    AVG(salary)
FROM employees; -- ����

-- GROUP BY���� ����� �� GROUP���� ������ ������ �ٸ� �÷��� ��ȸ�� �� �����ϴ�.
SELECT 
    job_id, -- department_id�� �׷�ȭ�� ���� ����� �� ����.
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- ����   (�׷�-> select)

-- GROUP BY���� 2�� �̻� ���

SELECT 
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- GROUP BY�� ���� �׷�ȭ�� �� �� ������ �� ��� HAVING�� ����Ѵ�.
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;-- HEVING �׷�ȭ�� ��ų �� ���


SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

--�μ� ���̵� 50�̻��� �͵��� �׷�ȭ ��Ű��, �׷� ���� ����� 5000 �̻� ��ȸ
SELECT  5 
    department_id,
    AVG(salary) AS ���
FROM employees -- ��� ��� 1
WHERE department_id >= 50 --��ȸ ���� 2 
GROUP BY department_id -- �׷�ȭ 3
HAVING AVG(salary) >= 5000 -- �׷�ȭ ���� 4
ORDER BY department_id DESC; --����  6


/*
���� 1.
��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
*/

SELECT
    job_id,
    count(*) AS �����
FROM employees 
GROUP BY job_id;
                                                                      

SELECT
    job_id,
    AVG(salary) AS ��տ���
FROM employees
GROUP BY ��տ���;

/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/

SELECT
    TO_CHAR(hrie_date, 'YY'),
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY') 



/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/

SELECT
    department_id,
    AVG(salary) AS ��ձ޿�
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;




/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���

*/

SELECT
    department_id,
    TRUNC (AVG(salary + (salary*commission_pct)),2),
    SUM(salary + salary*commission_pct),
    COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL 
GROUP BY department_id;

























