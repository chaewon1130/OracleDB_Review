SELECT
--    TO_CHAR(1234, '99999'),
--    TO_CHAR(1234, '00000'),
--    TO_CHAR(1234, '999'),
--    TO_CHAR(1234, '00'),
--    TO_CHAR(1234, '9900'),
--    TO_CHAR(1234, '9099'),
--    TO_CHAR(1234, '90000'),
--    TO_CHAR(1234, '$999.999'),
--    TO_CHAR(1234, '000,000'),
--    TO_CHAR(1234, 'L9999'),
--    TO_CHAR(1234, '009,999')
    TO_CHAR(1234, '9999.99'),
    TO_CHAR(1234, '9999.00')
FROM
    dual;
    
SELECT
    empno,
    ename,
    TO_CHAR(sal * 12 + comm, '$999,999')
    AS ANN_SAL
FROM
    emp
WHERE
    ename = 'ALLEN';
    
SELECT
    empno,
    ename,
    hiredate,
    TO_CHAR(sal * 12 + comm, '$99,999')
    AS SAL,
    TO_CHAR((sal * 12 + comm) * 1.15, '$99,999')
    AS "15%UP"
FROM
    emp
WHERE
    comm IS NOT NULL;
    
SELECT
    '1300' - '500',
    TO_NUMBER('1,300', '9,999')
FROM
    dual;
    
ALTER SESSION SET NLS_DATE_FORMAT = 'RRRR-MM-DD';
SELECT
    SYSDATE,
    TO_DATE('2022/03/21'),
--    TO_DATE('2022-03-21', 'YYYY-MM-DD'),
    TO_DATE(19941130, 'YY-MM-DD')
FROM
    dual;
    
SELECT
    empno,
    ename,
    hiredate
FROM
    emp
WHERE
    TO_DATE(19810601) < hiredate;
    
SELECT
    empno,
    ename,
    sal,
    comm,
    NVL(comm, 0),
    sal * 12 + NVL(comm, 0)
FROM
    emp;
    
SELECT
    empno,
    ename,
    comm,
    NVL2(comm, 'o', 'x'),
    NVL2(comm, sal*12+comm, sal*12)
FROM
    emp;

SELECT
    deptno,
    name,
    DECODE(deptno, 101,'CE', 'NA') AS DNAME
FROM
    professor;
    
SELECT
    deptno,
    name,
    DECODE(deptno, 101, 'CE',
        102, 'ME',
        103, 'SE',
        'ETC')
FROM
    professor;
    
SELECT
    name,
    deptno,
    DECODE(deptno, 101,
        DECODE(name, 'Audie Murphy', 'BEST!', 'GOOD!'), 'BAD!')
        AS DECODE
FROM
    professor;
    
SELECT
    name,
    jumin,
    DECODE(SUBSTR(jumin,7,1), '1', 'MALE', 'FEMALE')
    AS GENDER
FROM
    student
WHERE
    deptno1 = 101;
    
SELECT
    name,
    jumin,
    DECODE(SUBSTR(jumin,7,1), '1', 'MALE',
        '2', 'FEMALE',
        '3', 'MALE',
        '4', 'FEMALE')
FROM
    student
WHERE
    deptno1 = 101;
    
SELECT
    name,
    tel,
    DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1),
        '02', 'SEOUL',
        '055', 'GYEONGNAM') AS LOCAL,
    CASE SUBSTR(tel, 1, INSTR(tel, ')')-1)
        WHEN '02' THEN 'SEOUL'
        WHEN '055' THEN 'GYEONGNAM'
    END AS LOCAL2
FROM
    student
WHERE
    deptno1 = 101;
    
SELECT
    name,
    jumin,
    CASE
        WHEN SUBSTR(jumin,3,2) >= 01 AND SUBSTR(jumin,3,2) <= 03 THEN '1/4'
    END    
FROM
    student;
    
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER' THEN TO_CHAR(sal * 1.1, '$9,999')
        WHEN 'SALESMAN' THEN TO_CHAR(sal * 1.05, '$9,999')
        WHEN 'ANALYST' THEN TO_CHAR(sal, '$9,999')
        ELSE TO_CHAR(sal * 1.03, '$9,999')
    END AS INC_SAL
FROM
    emp;

SELECT
    empno,
    RPAD(SUBSTR(empno,1,2), LENGTH(empno), '**') AS MASKING_EMPNO,
    ename,
    RPAD(SUBSTR(ename,1,1), LENGTH(ename), '****') AS MASKING_ENAME
FROM
    emp
WHERE
    LENGTH(ename) >= 5 AND LENGTH(ename) < 6;
    
SELECT
    empno,
    ename,
    sal,
    TRUNC(sal/21.5, 2) AS DAY_PAY,
    ROUND(TRUNC(sal/21.5, 2)/8, 1) AS TIME_PAY
FROM
    emp;

SELECT
    empno,
    ename,
    TO_CHAR(hiredate,'YYYY/MM/DD') AS HIREDATE,
    NEXT_DAY(ADD_MONTHS(hiredate, 3), '¿ù') AS R_JOB,
    NVL2(comm, TO_CHAR(comm),'N/A') AS NVL2,
    DECODE(comm, null, 'N/A', TO_CHAR(comm)) AS DECODE,
    CASE
        WHEN comm IS NULL THEN 'N/A'
        WHEN comm IS NOT NULL THEN TO_CHAR(comm)
    END AS "CASE"
FROM
    emp;
    
SELECT
    empno,
    ename,
    mgr,
    CASE 
        WHEN mgr IS NULL THEN '0000'
        WHEN SUBSTR(mgr, 1, 2) = '75' THEN '5555'
        WHEN SUBSTR(mgr, 1, 2) = '76' THEN '6666'
        WHEN SUBSTR(mgr, 1, 2) = '77' THEN '7777'
        WHEN SUBSTR(mgr, 1, 2) = '78' THEN '8888'
        ELSE TO_CHAR(mgr)
    END AS CHG_MGR      
FROM
    emp;