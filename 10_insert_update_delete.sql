-- insert
-- 테이블 구조 확인
DESC departments;

-- INSERT의 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정)
INSERT INTO departments

--department_id , department_name, manager_id , location_id 
--values를 사용 할 때는 모든 값을 다 넣어줘야 한다.

VALUES(290,'영업부');

ROLLBACK; --실행 시점을 다시 뒤로 되돌리는 키워드

SELECT * FROM departments;


--INSERT의 두 번째 방법(직접 컬럼을 지정하고 저장, NOT NULL 확인하세요!)
INSERT INTO departments
    (department_id,department_name, location_id)
VALUES
    (280, '개발자', 1700);

-- 사본 테이블 생성
-- 구조만 가져 오고 싶으면 WHERE절에 false를 만든다
--사본 테이블을 생성할 때 그냥 생성하면 -> 조회된 데이터까지 모두 복사
-- WHERE절에 false값 (1 = 2)지정하면 -> 테이블의 구조만 복사하고 데이터는 복사 X

-- 지정하고 싶은 이름
CREATE TABLE managers AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;
DROP TABLE managers; -- 테이블 삭제

-- INSERT (서브쿼리)
-- 내용을 채워준다 단 하나라도 어긋나면 INSERT로 채워줄수 없다.
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

-------------------------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사되지 않습니다. TABLE에 제약 조건은 X
제약 조건은 업무 규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이
DB 에 저장되는 것을 방지하는 목적으로 사용합니다.
*/



















