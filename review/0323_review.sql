SELECT
    COUNT(*),
    SUM(sal),
    AVG(NVL(comm, 0)),
    AVG(comm)
FROM
    emp;
    
SELECT MAX(sal),
    MIN(sal),
    MAX(hiredate),
    MIN(hiredate),
    VARIANCE(sal),
    STDDEV(sal)
FROM emp;

SELECT
    '10',
    SUM(sal)
FROM emp
WHERE deptno = 10
UNION
SELECT
    '20',
    SUM(sal)
FROM emp
WHERE deptno = 20;

SELECT
    deptno,
    sal
FROM emp;

SELECT
    deptno,
    job,
    SUM(sal)
FROM emp
GROUP BY deptno, job
ORDER BY deptno, job
;

SELECT
    deptno,
    AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;

SELECT
    deptno,
    job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY deptno, job
UNION
SELECT
    deptno,
    NULL AS job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY deptno
UNION
SELECT
    NULL AS deptno,
    NULL AS job,
    AVG(sal),
    COUNT(*)
FROM emp;

SELECT
    deptno,
    job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY ROLLUP(deptno, job);

SELECT
    deptno,
    NULL AS job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY deptno
UNION
SELECT
    NULL AS deptno,
    job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY job
UNION
SELECT
    deptno,
    job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY deptno, job
UNION
SELECT
    NULL AS deptno,
    NULL AS job,
    AVG(sal),
    COUNT(*)
FROM emp;

SELECT
    deptno,
    job,
    AVG(sal),
    COUNT(*)
FROM emp
GROUP BY CUBE(deptno, job)
ORDER BY 1,2;

SELECT
    deptno,
    job,
    COUNT(*)
FROM emp
GROUP BY ROLLUP(deptno)
, job;

SELECT
    deptno,
    job,
    COUNT(*)
FROM emp
GROUP BY deptno, job;

SELECT
    deptno,
    LISTAGG(ename, ',')
    WITHIN GROUP(ORDER BY ENAME) AS ENAMES
FROM emp
GROUP BY deptno;

SELECT
    deptno,
    job,
    MAX(sal)
FROM emp
GROUP BY deptno, job;

SELECT *
FROM(
    SELECT deptno, job, sal
    FROM emp
    )
PIVOT(MAX(sal)
    FOR deptno
    IN(10, 20, 30)
)
ORDER BY job;

SELECT *
FROM(SELECT deptno, job, sal
    FROM emp
)
PIVOT(MAX(sal)
    FOR job
    IN('ANALYST',
    'CLERK',
    'MANAGER',
    'PRESIDENT',
    'SALESMAN'
    )
)
ORDER BY deptno;

SELECT *
FROM(
    SELECT
        job,
        MAX(DECODE(deptno, 10, SAL)) AS "10",
        MAX(DECODE(deptno, 20, SAL)) AS "20",
        MAX(DECODE(deptno, 30, SAL)) AS "30"
    FROM
        emp
    GROUP BY job
    ORDER BY job
    )
UNPIVOT(
    sal FOR deptno IN (10, 20, 30))
ORDER BY deptno, job;

SELECT deptno,
    XMLELEMENT(name, ',', ename) AS "XML_ENAME"
FROM emp;

SELECT deptno,
    SUBSTR(XMLAGG(XMLELEMENT(name, ',' ,ename) ORDER BY ename)
    .extract('//text()').getStringVal(), 2) AS "XML_NAME"
FROM emp
GROUP BY deptno;

SELECT
    *
FROM cal;

SELECT 
    year,
    MAX(DECODE(MONTH, 1, MONTH)) AS "MO1",
    MAX(DECODE(MONTH, 2, MONTH)) AS "MO2",
    MAX(DECODE(MONTH, 3, MONTH)) AS "MO3",
    MAX(DECODE(MONTH, 4, MONTH)) AS "MO4",
    MAX(DECODE(MONTH, 5, MONTH)) AS "MO5",
    MAX(DECODE(MONTH, 6, MONTH)) AS "MO6",
    MAX(DECODE(MONTH, 7, MONTH)) AS "MO7",
    MAX(DECODE(MONTH, 8, MONTH)) AS "MO8",
    MAX(DECODE(MONTH, 9, MONTH)) AS "MO9",
    MAX(DECODE(MONTH, 10, MONTH)) AS "M10",
    MAX(DECODE(MONTH, 11, MONTH)) AS "M11",
    MAX(DECODE(MONTH, 12, MONTH)) AS "M12"
FROM tb_pivot
GROUP BY year;

SELECT *
FROM cal;

SELECT
    MAX(DECODE(day, 'SUN', dayno)) AS "SUN",
    MAX(DECODE(day, 'MON', dayno)) AS "MON",
    MAX(DECODE(day, 'TUE', dayno)) AS "TUE",
    MAX(DECODE(day, 'WED', dayno)) AS "WED",
    MAX(DECODE(day, 'THU', dayno)) AS "THU",
    MAX(DECODE(day, 'FRI', dayno)) AS "FRI",
    MAX(DECODE(day, 'SAT', dayno)) AS "SAT"
FROM cal
GROUP BY weekno
ORDER BY weekno;

SELECT *
FROM (SELECT weekno, day, dayno
    FROM cal
)
PIVOT(
    MAX(dayno)
    FOR day
    IN (
        'SUN' AS "SUN",
        'MON' AS "MON",
        'TUE' AS "TUE",
        'WED' AS "WED",
        'THU' AS "THU",
        'FRI' AS "FRI",
        'SAT' AS "SAT"
    )
)
ORDER BY weekno;

SELECT
    deptno,
    job,
    MAX(sal)
FROM emp
GROUP BY deptno, job
ORDER BY 1,2;

SELECT *
FROM(SELECT deptno, job, sal
    FROM emp
)
PIVOT(
    MAX(sal)
    FOR deptno
    IN (10, 20, 30)
);

SELECT *
FROM(
    SELECT job, deptno, sal
    FROM emp
)
PIVOT(
    MAX(sal)
    FOR job
    IN (
        'CLERK',
        'SALESMAN',
        'PRESIDENT',
        'MANAGER',
        'ANALYST'
    )
)
ORDER BY deptno;

SELECT *
FROM(
    SELECT deptno,
        MAX(DECODE(job, 'CLERK', sal)) AS "CLERK",
        MAX(DECODE(job, 'SALESMAN', sal)) AS "SALESMAN",
        MAX(DECODE(job, 'ANALYST', sal)) AS "ANALYST",
        MAX(DECODE(job, 'MANAGER', sal)) AS "MANAGER",
        MAX(DECODE(job, 'PRESIDENT', sal)) AS "PRESIDENT"
    FROM emp
    GROUP BY deptno
    ORDER BY deptno
)
UNPIVOT(
    sal
    FOR job
    IN (
        CLERK,
        SALESMAN,
        ANALYST,
        MANAGER,
        PRESIDENT
    )
);

SELECT
    ename,
    hiredate,
    sal,
    LEAD(sal, 3, 99)
    OVER(ORDER BY sal) AS "LAG"
FROM emp;

SELECT empno,
    ename,
    sal,
    deptno,
    RANK()
    OVER(ORDER BY sal) AS "RANK",
    DENSE_RANK()
    OVER(ORDER BY sal) AS "D_RANK"
FROM emp;

SELECT
    p_date,
    p_code,
    p_qty,
    p_total,
    SUM(p_total)
    OVER(PARTITION BY p_code ORDER BY p_total) AS "TOTAL"
FROM panmae
WHERE p_store = 1000;

SELECT
    deptno,
    TRUNC(AVG(sal)),
    MAX(sal),
    MIN(sal),
    COUNT(*)
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT
    job,
    COUNT(*)
FROM emp
GROUP BY job
HAVING COUNT(*) >= 3;

SELECT TO_CHAR(hiredate, 'YYYY'),
    deptno,
    COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY'), deptno;

SELECT
    NVL2(comm, 'O', 'X'),
    COUNT(*)
FROM emp
GROUP BY NVL2(comm, 'O', 'X')
ORDER BY COUNT(*) DESC;

SELECT EXIST_COMM,
    COUNT(*)
FROM(
    SELECT
        CASE
            WHEN comm IS NOT NULL THEN 'O'
            ELSE 'X'
        END AS "EXIST_COMM"
    FROM emp
    )
GROUP BY EXIST_COMM;

SELECT
    deptno,
    TO_CHAR(hiredate, 'YYYY'),
    COUNT(*),
    MAX(SAL),
    SUM(SAL),
    AVG(SAL)
FROM emp
GROUP BY ROLLUP(deptno, TO_CHAR(hiredate, 'YYYY'));

SELECT
    deptno,
    TO_CHAR(hiredate, 'YYYY'),
    COUNT(*),
    MAX(SAL),
    SUM(SAL),
    AVG(SAL)
FROM emp
GROUP BY deptno, TO_CHAR(hiredate, 'YYYY')
UNION ALL
SELECT
    deptno,
    NULL AS HIRE_DATE,
    COUNT(*),
    MAX(SAL),
    SUM(SAL),
    AVG(SAL)
FROM emp
GROUP BY deptno
UNION ALL
SELECT
    NULL AS DEPTNO,
    NULL AS HIREDATE,
    COUNT(*),
    MAX(SAL),
    SUM(SAL),
    AVG(SAL)
FROM emp
ORDER BY 1,2