SELECT
    sal,
    sal*12+comm AS annual_sal,
    comm
FROM
    emp;
    
SELECT
    ename
    || q'['s job is ]'
    || job AS SEN
FROM
    emp;
    
SELECT
    *
FROM
    emp
ORDER BY
    2;

SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC, sal DESC;
    
SELECT
    empno,
    ename,
    deptno
FROM
    emp
WHERE
    empno IN (7369, 7499);
    
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
SELECT
   *
FROM
    emp
WHERE
    ename LIKE '%T%';

SELECT
    empno,
    ename,
    comm
FROM
    emp
WHERE
    comm IS NULL;