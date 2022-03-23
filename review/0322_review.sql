SELECT
    text
FROM
    t_reg
WHERE
--    REGEXP_LIKE(text, '[0-9]{4}')
--    REGEXP_LIKE(text, '^[a-zA-Z0-9]');
    REGEXP_LIKE(text, '[a-zA-Z0-9]$');

SELECT
    id
FROM
    student
WHERE
    REGEXP_LIKE(id, '^M(a|o)');
    
SELECT
    SUM(sal),
    SUM(ALL sal),
    SUM(DISTINCT sal)
FROM
    emp;
    
SELECT
    COUNT(*)
FROM
    emp
WHERE
    deptno = 10;
    
SELECT
    COUNT(sal),
    COUNT(DISTINCT sal),
    COUNT(ALL sal)
FROM
    emp;
    
SELECT
    COUNT(comm)
FROM
    emp
WHERE
    comm IS NOT NULL;
    
SELECT
    MAX(sal),
    COUNT(sal),
    SUM(sal),
    MIN(sal)
FROM
    emp
WHERE
    deptno = 10;
    
SELECT
    MAX(hiredate),
    MIN(hiredate)
FROM
    emp;
    
SELECT
    AVG(sal),
    SUM(sal),
    COUNT(sal),
    COUNT(DISTINCT sal),
    SUM(DISTINCT sal),
    AVG(DISTINCT sal)
FROM
    emp
WHERE
    deptno = 30;
    
SELECT
    10 AS deptno,
    AVG(sal)
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    20,
    AVG(sal)
FROM
    emp
WHERE
    deptno = 20;
    
SELECT
    deptno,
    AVG(sal)
FROM
    emp
GROUP BY deptno;

SELECT
    deptno,
    empno,
    AVG(sal)
FROM
    emp
GROUP BY deptno, empno
HAVING AVG(sal) > 2000
ORDER BY deptno;

SELECT
    sal
FROM
    emp;
    
SELECT
    deptno, job, empno, AVG(sal), MAX(sal), MIN(sal)
FROM
    emp
GROUP BY CUBE(deptno, job, empno);

SELECT
    deptno, job, COUNT(*)
FROM
    emp
GROUP BY deptno, ROLLUP(job);