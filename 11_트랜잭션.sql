
--  오토커밋 여부 확인
SHOW AUTOCOMMIT
-- 오토커밋 온
SET AUTOCOMMIT ON;
-- 오토커밋 오프
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
    
-- 보류중인 모든 데이터 변경사항을 취소(폐기), 
-- 직전 커밋 단계로 회귀(돌아가기) 및 트랜잭션 종료
ROLLBACK 


SAVEPOINT insert_park;

INSERT INTO emps
    (employee_id, last_name, email, hire_date,job_id)
VALUES
    (305,'park','park4321@gmail.com',sysdate,1800);




-- 보류중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 종료
-- 커밋한 이후에는 어떠한 방법을 사용하더라도 되돌릴 수 없습니다.
COMMIT;

