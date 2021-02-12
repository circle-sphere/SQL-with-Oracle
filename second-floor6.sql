-- 둘째마당 6장
-- 단일행 함수

-- 문자열 함수

-- UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
SELECT *
    FROM EMP
  WHERE UPPER(ENAME) = UPPER('scott');

SELECT *
    FROM EMP
  WHERE UPPER(ENAME) LIKE UPPER('%scott%');
  
-- LENGTH
SELECT ENAME, LENGTH(ENAME)
    FROM EMP;

SELECT ENAME, LENGTH(ENAME)
    FROM EMP
  WHERE LENGTH(ENAME) >= 5;
  
SELECT LENGTH('한글'), LENGTHB('한글')
    FROM DUAL; -- DUAL 테이블은 SYS 계정 소유의 테이블로, 임시 연산이나 결과 확인 용도로 자주 사용
    
-- SUBSTR
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
    FROM EMP;
    
SELECT JOB,
       SUBSTR(JOB, -LENGTH(JOB)),
       SUBSTR(JOB, -LENGTH(JOB),2),
       SUBSTR(JOB, -3)
    FROM EMP;

/*    
INSTR(대상문자열(필수), 찾으려는 문자(필수),
      시작 위치(default=1), 찾으려는 문자 순서(default=1))
  RETURN = IDX
*/
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
       INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
       INSTR('HELLO, ORACLE!', 'L', 2,2) AS INSTR_3
    FROM DUAL;
    
SELECT *
    FROM EMP
  WHERE INSTR(ENAME, 'S') > 0;
  
SELECT *
    FROM EMP
  WHERE ENAME LIKE '%S%';
  
-- REPLACE(text, expression, repl(default=''))
SELECT '010-1234-5678' AS REPLACE_BEFORE,
       REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
/*
LPAD(text, idx, padding text(default=' '))
RPAD is same as above
*/
SELECT 'Oracle',
       LPAD('Oracle', 10, '#') AS LPAD_1,
       RPAD('Oracle', 10, '*') AS RPAD_1,
       LPAD('Oracle', 10) AS LPAD_2,
       RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO,
       RPAD('010-1234-', 13, '*') AS RPAD_PHONE
    FROM DUAL;
    
--CONCAT
SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP
  WHERE ENAME = 'SCOTT';

SELECT EMPNO || ENAME,
       EMPNO || ' : ' || ENAME
    FROM EMP
  WHERE ENAME = 'SCOTT';

/*
TRIM(dlt_option(default=BOTH), dlt_exp(default=' ')) FROM text
dlt_exp는 하나만 지정 가능
*/
-- 공백 제거 출력
SELECT '[' || TRIM('_ _Oracle_ _') || ']' AS TRIM,
       '[' || TRIM(LEADING FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
    FROM DUAL;
    
-- 공백 제거 출력 (dlt_exp 존재 시)
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM,
       '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
    FROM DUAL;
    
/*
LTRIM(text, dlt_exp_set(default=' '))
RTRIM is same as above
*/
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
       '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2,
       '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
       '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2
    FROM DUAL;
    
-- 숫자 함수
-- ROUND
SELECT ROUND(1234,5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
    FROM DUAL;
    
-- TRUNC
SELECT TRUNC(1234,5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC_0,
       TRUNC(1234.5678, 1) AS TRUNC_1,
       TRUNC(1234.5678, 2) AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
    FROM DUAL;
    
-- CEIL, FLOOR
SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
    FROM DUAL;
    
-- MOD
SELECT MOD(15, 6),
       MOD(10, 2),
       MOD(11, 2)
    FROM DUAL;
    
-- 날짜 함수
-- SYSDATE (== datetime.date.today())
SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
    FROM DUAL;
    
-- ADD_MONTHS
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE
    FROM EMP
  WHERE ADD_MONTHS(HIREDATE, 420) > SYSDATE; -- 420MONTHS == 35YEARS
  
-- MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
    FROM EMP;

/*    
NEXT_DAY(date, day of the week), 돌아오는 요일의 날짜
LAST_DAY(date), 해당 날짜가 속한 달의 마지막날
*/
SELECT SYSDATE,
       NEXT_DAY(SYSDATE,'월요일'),
       LAST_DAY(SYSDATE)
    FROM DUAL;
       
    
-- ROUND AND TRUNC with date
SELECT SYSDATE,
       ROUND(SYSDATE, 'CC') AS FORMAT_CC,
       ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
       ROUND(SYSDATE, 'Q') AS FORMAT_Q,
       ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
       ROUND(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;

SELECT SYSDATE,
       TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
       TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
       TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
       TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
       TRUNC(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;


-- 자료형변환 함수
-- TO_CHAR(date, result_shape, 'NLS_DATE_LANGUAGE = language')
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
    from DUAL;
    
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON') AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD') AS DD,
       TO_CHAR(SYSDATE, 'DY') AS DY,
       TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;
    
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
       TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_KOR,
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_ENG,
       TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN
    FROM DUAL;       

SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'DD') AS DD,
       TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS DY_KOR,
       TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY_ENG,
       TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
       TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS DAY_KOR,
       TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DAY_ENG,
       TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN
    FROM DUAL;       
    
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
       TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HH12MISS_AM,
       TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HH24MISS_PM
    FROM DUAL;

SELECT SAL,
       TO_CHAR(SAL, '$999,999') AS SAL_$,
       TO_CHAR(SAL, 'L999,999') AS SAL_L,
       TO_CHAR(SAL, '999,999.00') AS SAL_1,
       TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
       TO_CHAR(SAL, '000999999.99') AS SAL_3,
       TO_CHAR(SAL, '999,999,00') AS SAL_4
    FROM EMP;
    
-- TO_NUMBER(text, result_shape(STR or DATE))
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
    from DUAL;
    
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
    FROM DUAL;
    
SELECT *
    FROM EMP
  WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');

SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49,
       TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49,
       TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50,
       TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50,
       TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51,
       TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
    FROM DUAL;
    
-- NULL 처리 함수
-- NVL(input data, return if True)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
       NVL(COMM,0),
       SAL+NVL(COMM,0)
    FROM EMP;

-- NVL2(input data, return(value or formula) if False, return(value or formula) if Ture)
SELECT EMPNO, ENAME, COMM,
       NVL2(COMM, 'O', 'X'),
       NVL2(COMM, SAL*12 + COMM, SAL*12) AS ANNSAL
    FROM EMP;

-- 상황에 따라 RETURN을 정하는 함수  
-- DECODE와 CASE 모두 조건별로 동일한 자료형을 return 해야 함  
/*
DECODE is like case-switch in C
DECODE(data,
       cond1, return if cond1,
       cond2, return if cond2,
       ...,
       return else)
*/
SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
              'MANAGER' , SAL*1.1,
              'SALESMAN', SAL*1.05,
              'ANALYST' , SAL,
              SAL*1.03) AS UPSAL
    FROM EMP;

/*
CASE
    WHEN eleemnt THEN return
    WHEN eleemnt THEN return
    ELSE return
END
is similar to DECODE,
but it doesn't need to have data necessarily 
*/
SELECT EMPNO, ENAME, JOB, SAL,
  CASE JOB
       WHEN 'MANAGER'  THEN SAL*1.1
       WHEN 'SALESMAN' THEN SAL*1.05
       WHEN 'ANALYST'  THEN SAL
       ELSE SAL*1.03
  END AS UPSAL
  FROM EMP;
  
SELECT EMPNO, ENAME, COMM,
  CASE
    WHEN COMM IS NULL THEN '해당사항 없음'
    WHEN COMM = 0 THEN '수당없음'
    WHEN COMM > 0 THEN '수당 : ' || COMM
  END AS COMM_TEXT
  FROM EMP;

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
