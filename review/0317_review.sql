SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    empno = &empno;
    
SELECT
    studno,
    name,
    deptno1
FROM
    student
WHERE
    deptno1 = 101
UNION ALL
SELECT
    profno,
    name,
    deptno
FROM
    professor
WHERE
    deptno = 101;
    
SELECT
    studno,
    name
FROM
    student
WHERE
    deptno1 = &deptno1
UNION ALL
SELECT
    studno,
    name
FROM
    student
WHERE
    deptno2 = &deptno2;
    
SELECT
    studno,
    name
FROM
    student
WHERE
    deptno1 = 101
MINUS
SELECT
    studno,
    name
FROM
    student
WHERE
    deptno2 = 201;
    
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S';
    
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 30
    AND job = 'SALESMAN';

SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN (20,30)
    AND sal > 2000;
    
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    (deptno = 20
    OR deptno = 30)
    AND sal > 2000;
    
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 3000;
    
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;
    
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ('MANAGER', 'CLERK')
    AND ename NOT LIKE '_L%';
    
SELECT
    ename,
    LOWER(ename),
    INITCAP(ename)
FROM
    emp;
    
SELECT
    ename,
    LENGTH(ename)
FROM
    emp;
    
SELECT
    job,
    LENGTH(job),
    SUBSTR(job, -3)
FROM
    emp;
    
SELECT
    INSTR('HIHI', 'I'),
    INSTR('HIHI', 'I', 1, 2)
FROM
    dual;
    
SELECT
    name,
    tel,
    INSTR(tel, ')')
FROM
    student
WHERE
    deptno1 = 201;
    
SELECT
    SUBSTR(tel, 1, INSTR(tel, ')')-1),
    INSTR(tel, ')')
FROM
    student
WHERE
    deptno1 = 201;
    
SELECT
    REPLACE('010-9995-1658', '-', '')
FROM
    dual;
    
SELECT
    REPLACE(ename,SUBSTR(ename,1,2),'**')
FROM
    emp;
    
SELECT
    *
FROM
    emp
WHERE
    LOWER(ename) LIKE '%adams%';
    
SELECT
    LENGTH('�赿ȣ'),
    LENGTHB('�赿ȣ')
FROM
    dual;

SELECT
    *
FROM
    emp
WHERE
    INSTR(ename, 'S') > 0;
    
SELECT
    REPLACE('01099951658', '0', '*')
FROM
    dual;
    
