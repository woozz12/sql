-- SQL의 실행순서!!!
-- 그룹 함수 AVG,MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; --총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; --null이 아닌 행의 수
SELECT COUNT(manager_id) FROM employees; --null이 아닌 행의 수

-- 부서별로 그룹화, 그룹함수의 사용
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

-- 주의할 점
--그룹 함수는 일반 컬럽과 동시에 그냥 출력할 수는 없습니다.
SELECT 
    department_id, -- 이것을 그룹화해야한다. 그냥은 출력 불가능
    AVG(salary)
FROM employees; -- 에러

-- GROUP BY절을 사용할 때 GROUP절에 묶이지 않으면 다른 컬럼을 조회할 수 없습니다.
SELECT 
    job_id, -- department_id에 그룹화에 묶여 사용할 수 없다.
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- 에러   (그룹-> select)

-- GROUP BY절을 2개 이상 사용

SELECT 
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- GROUP BY를 통해 그룹화를 할 때 조건을 걸 경우 HAVING을 사용한다.
SELECT 
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;-- HEVING 그룹화를 시킬 때 사용


SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

--부서 아이디가 50이상인 것들은 그룹화 시키고, 그룹 월급 평균이 5000 이상만 조회
SELECT
    department_id,
    AVG(salary) AS 평균
FROM employees -- 모든 요소
WHERE department_id >= 50 --조회 조건
GROUP BY department_id -- 그룹화
HAVING AVG(salary) >= 5000 -- 그룹화 조건
ORDER BY department_id DESC; --정렬





























