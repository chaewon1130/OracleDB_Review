SELECT ename,
    comm
FROM emp
WHERE comm < (
    SELECT comm
    FROM emp
    WHERE ename = 'WARD'
);

SELECT t1.name AS "STUD_NAME",
    t2.dname AS "DEPT_NAME"
FROM student t1, department t2
WHERE t1.deptno1 = t2.deptno
    AND deptno = (
    SELECT deptno1
    FROM student
    WHERE name = 'Anthony Hopkins'
)
;

SELECT t1.name AS "PROF_NAME",
    TO_CHAR(t1.hiredate, 'YYYY-MM-DD') AS "HIREDATE",
    t2.dname AS "DEPT_NAME"
FROM professor t1, department t2
WHERE t1.deptno = t2.deptno
    AND hiredate > (
    SELECT hiredate
    FROM professor
    WHERE name = 'Meg Ryan'
);

SELECT name,
    weight
FROM student
WHERE weight > (
    SELECT AVG(weight)
    FROM student
    WHERE deptno1 = 201
)
;

SELECT t1.empno,
    t1.ename,
    t1.job,
    t1.sal,
    t2.deptno,
    t2.dname,
    t2.loc
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
    AND sal <= (
    SELECT AVG(sal)
    FROM emp)
    AND t1.deptno = 20
;

SELECT empno,
    ename,
    job,
    sal,
    deptno
FROM emp
WHERE sal IN (
    SELECT MAX(sal)
    FROM emp
    GROUP BY deptno
)
;

SELECT *
FROM emp
WHERE EXISTS (
    SELECT deptno
    FROM emp
    WHERE deptno = &dno
)
;

SELECT name,
    position,
    TO_CHAR(pay, '$999,999,999') AS "SALARY"
FROM emp2
WHERE pay > ANY (
    SELECT pay
    FROM emp2
    WHERE position = 'Section head'
)
ORDER BY SALARY DESC
;

SELECT name,
    grade,
    weight
FROM student
WHERE weight < ALL (
    SELECT weight
    FROM student
    WHERE grade = 2
)
;

SELECT t2.dname,
    t1.name,
    TO_CHAR(t1.pay, '$999,999,999') AS "SALARY"
FROM emp2 t1, dept2 t2
WHERE t1.deptno = t2.dcode
    AND pay < ALL (
    SELECT AVG(pay)
    FROM emp2
    GROUP BY deptno
)
ORDER BY SALARY
;

SELECT grade,
    name,
    weight
FROM student
WHERE (grade, weight) IN (
    SELECT grade,
        MAX(weight)
    FROM student
    GROUP BY grade
)
ORDER BY grade
;

SELECT t1.profno,
    t1.name,
    t2.dname
FROM professor t1, department t2
WHERE t1.deptno = t2.deptno
    AND (t1.deptno, hiredate) IN (
    SELECT deptno,
        MIN(hiredate)
    FROM professor
    GROUP BY deptno
);

SELECT t1.name,
    t1.position,
    t1.pay
FROM emp2 t1
WHERE t1.pay >= (
    SELECT AVG(pay)
    FROM emp2 t2
    WHERE t1.position = t2.position
);

SELECT t1.name,
    (SELECT t2.dname
    FROM dept2 t2
    WHERE t1.deptno = t2.dcode) AS "dname"
FROM emp2 t1
;

SELECT t1.name,
    t2.dname
FROM emp2 t1 JOIN dept2 t2
ON t1.deptno = t2.dcode
;

CREATE TABLE t3(
    no NUMBER,
    name VARCHAR2(10),
    deptno NUMBER
)
;
INSERT INTO t3 VALUES (1, 'AAA', 100);
INSERT INTO t3 VALUES (2, 'BBB', 200);
INSERT INTO t3 VALUES (3, 'CCC', 300);
COMMIT;

CREATE TABLE t4(
    deptno NUMBER,
    dname VARCHAR2(10)
)
;
INSERT INTO t4 VALUES (100, 'DDD');
INSERT INTO t4 VALUES (100, 'EEE'); -- ERROR ³¯ ¿¹Á¤
INSERT INTO t4 VALUES (200, 'FFF');
INSERT INTO t4 VALUES (300, 'GGG');
COMMIT;

SELECT * FROM t3;
SELECT * FROM t4;

SELECT t3.no,
    t3.name,
    (SELECT dname
    FROM t4
    WHERE t3.deptno = t4.deptno
    )
FROM t3
;

UPDATE t4
SET deptno = 400
WHERE dname = 'DDD'
;
COMMIT;

SELECT t3.no,
    t3.name,
    (SELECT t4.dname
    FROM t4
    WHERE t3.deptno = t4.deptno
    )
FROM t3
;

SELECT t3.no,
    t3.name,
    (SELECT dname, deptno
    FROM t4
    WHERE t3.deptno = t4.deptno
    )
FROM t3
;

SELECT t1.job,
    t1.empno,
    t1.ename,
    t1.sal,
    t2.deptno,
    t2.dname
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
    AND job = (
    SELECT job
    FROM emp
    WHERE ename = 'ALLEN'
)
;

SELECT t1.empno,
    t1.ename,
    t2.dname,
    TO_CHAR(t1.hiredate, 'YYYY-MM-DD') AS "HIREDATE",
    t2.loc,
    t1.sal,
    t3.grade
FROM emp t1, dept t2, salgrade t3
WHERE t1.sal BETWEEN t3.losal AND t3.hisal
    AND t1.deptno = t2.deptno
    AND sal > (
    SELECT AVG(sal)
    FROM emp
)
ORDER BY t1.sal DESC, t1.empno
;

SELECT t1.empno,
    t1.ename,
    t1.job,
    t2.deptno,
    t2.dname,
    t2.loc
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
    AND job NOT IN (
    SELECT job
    FROM emp
    WHERE deptno = 30)
    AND t2.deptno = 10
;

SELECT t1.empno,
    t1.ename,
    t1.sal,
    t2.grade
FROM emp t1, salgrade t2
WHERE t1.sal >= t2.losal
    AND t1.sal <= t2.hisal
    AND sal > (
    SELECT MAX(sal)
    FROM emp
    WHERE job = 'SALESMAN'
)
;

SELECT t1.empno,
    t1.ename,
    t1.sal,
    t2.grade
FROM emp t1, salgrade t2
WHERE t1.sal >= t2.losal
    AND t1.sal <= t2.hisal
    AND sal > ALL (
    SELECT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
;