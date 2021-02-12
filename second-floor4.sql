-- 둘째마당 4장

-- DESC는 View(df) + str(df) in R or df.display() + df.describe() in python 같은 느낌
DESC EMP;
DESC DEPT;
DESC SALGRADE;

-- SELECT와 FROM 콤보
SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
    
-- DISTINCT는 중복 제거문
SELECT DISTINCT DEPTNO
    FROM EMP;
    
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
    
-- ALL은 중복 제거 없이 다 출력
-- 사실 ALL은 쓰나마나
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
-- 연간 총 수입 계산
-- 연산 결과가 뜨지 않는 값들은 COMM에 NULL이 있기 때문
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;

-- 연산 열에 별칭(alias) 지정
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;
    
    
-- ORDER BY
SELECT *
    FROM EMP
  ORDER BY SAL;

SELECT *
    FROM EMP
  ORDER BY SAL DESC;

SELECT *
    FROM EMP
  ORDER BY DEPTNO ASC, SAL DESC;

-- P.92 QUIZ 2
SELECT DISTINCT JOB FROM EMP;

-- P.92 QUIZ 3
SELECT ALL EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,
           MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION,
           DEPTNO AS DEPARTMENT_NO
    FROM EMP
  ORDER BY DEPTNO DESC, EMPNO ASC;
