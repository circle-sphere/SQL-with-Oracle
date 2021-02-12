-- p.174 QUIZ 1
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1,2), LENGTH(EMPNO), '*') AS MASKING_EMPNO,
       ENAME, RPAD(SUBSTR(ENAME, 1,1), LENGTH(ENAME), '*') AS MASKING_ENAME
  FROM EMP 
 WHERE LENGTH(ENAME) BETWEEN 5 AND 6;

-- p.174 QUIZ 2
SELECT EMPNO, ENAME, SAL,
       TRUNC(SAL/21.5, 2) AS DAY_PAY,
       ROUND(SAL/21.5/8, 1)    AS TIME_PAY
  FROM EMP; 

-- p.175 QUIZ 3
SELECT EMPNO, ENAME, HIREDATE,
       NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'월요일') AS R_JOB,
       NVL(TO_CHAR(COMM),'N/A') -- 숫자(COMM) 'N/A'간의 데이터 타입 맞춰주기
    FROM EMP;
    
-- p.175 QUIZ 4
SELECT EMPNO, ENAME, MGR,
    CASE
      WHEN MGR IS NULL THEN '0000'
      WHEN SUBSTR(MGR,1,2) = 75 THEN '5555'
      WHEN SUBSTR(MGR,1,2) = 76 THEN '6666'
      WHEN SUBSTR(MGR,1,2) = 77 THEN '7777'
      WHEN SUBSTR(MGR,1,2) = 78 THEN '8888'
      ELSE TO_CHAR(MGR) -- 데이터 타입 맞춰주기
    END AS CHG_MGR
    FROM EMP;