SELECT empno,
    t1.deptno,
    dname
FROM emp t1, dept t2
--WHERE t1.deptno = t2.deptno
;

SELECT a.no,
    a.name,
    b.name
FROM cat_a a, cat_b b
WHERE a.no = b.no
;

SELECT *
FROM cat_a
;

SELECT a.no,
    a.name,
    b.name,
    c.name
FROM cat_a a, cat_b b, cat_c c
WHERE a.no = b.no AND b.no = c.no
;

SELECT
    t1.empno,
    t1.ename,
    t2.dname
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
;

SELECT
    t1.empno,
    t1.ename,
    t2.dname,
    t2.deptno
FROM emp t1 INNER JOIN dept t2
ON t1.deptno = t2.deptno
;

SELECT t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1, professor t2
WHERE t1.profno = t2.profno(+)
;

SELECT t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1 LEFT OUTER JOIN professor t2
ON t1.profno = t2.profno
;

SELECT t1.name AS "STUD_NAME",
    t2.dname AS "DEPT_NAME",
    t3.name AS "PROF_NAME"
FROM student t1, department t2, professor t3
WHERE t1.deptno1 = t2.deptno
    AND t1.profno = t3.profno
;

SELECT *
FROM student
;

SELECT t1.name AS "STUD_NAME",
    t2.dname AS "DEPT_NAME",
    t3.name AS "PROF_NAME"
FROM (student t1 JOIN department t2 ON t1.deptno1 = t2.deptno)
    JOIN professor t3 ON t1.profno = t3.profno
;

SELECT
    t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1, professor t2
WHERE t1.profno = t2.profno
    AND t1.deptno1 = 101
;

SELECT
    t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1 INNER JOIN professor t2
ON t1.profno = t2.profno
WHERE t1.deptno1 = 101
;

SELECT t1.empno,
    t1.ename,
    t1.sal,
    t1.job,
    t2.grade
FROM emp t1, salgrade t2
WHERE t1.sal BETWEEN t2.losal AND t2.hisal
;

SELECT t1.empno,
    t1.ename,
    t1.sal,
    t1.job,
    t2.grade
FROM emp t1 INNER JOIN salgrade t2
ON t1.sal BETWEEN t2.losal AND t2.hisal
;

SELECT t1.gname,
    t1.point,
    t2.gname
FROM customer t1, gift t2
WHERE t1.point BETWEEN t2.g_start AND t2.g_end
;

SELECT t1.gname,
    t1.point,
    t2.gname
FROM customer t1 INNER JOIN gift t2
ON t1.point BETWEEN t2.g_start AND t2.g_end
;

SELECT t1.gname,
    t1.point,
    t2.gname
FROM customer t1, gift t2
WHERE t1.point >= t2.g_start AND t1.point <= t2.g_end
;

SELECT t1.gname,
    t1.point,
    t2.gname
FROM customer t1 INNER JOIN gift t2
ON t1.point >= t2.g_start 
    AND t1.point <= t2.g_end
;

SELECT t1.name,
    t2.total,
    t3.grade
FROM student t1, score t2, hakjum t3
WHERE t1.studno = t2.studno
    AND (t2.total BETWEEN t3.min_point AND t3.max_point)
;

SELECT t1.name,
    t2.total,
    t3.grade
FROM (student t1 JOIN score t2 ON t1.studno = t2.studno)
    JOIN hakjum t3 ON t2.total BETWEEN t3.min_point AND t3.max_point
;

SELECT t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1, professor t2
WHERE t1.profno = t2.profno(+)
;

SELECT *
FROM student
;

SELECT t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1 LEFT OUTER JOIN professor t2
ON t1.profno = t2.profno
;

SELECT t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1, professor t2
WHERE t1.profno(+) = t2.profno
;

SELECT *
FROM professor
;

SELECT t1.name AS "STUD_NAME",
    t2.name AS "PROF_NAME"
FROM student t1 RIGHT OUTER JOIN professor t2
ON t1.profno = t2.profno
;

SELECT t1.name AS "STUD_NAME",
    t2.name as "PROF_NAME"
FROM student t1, professor t2
WHERE t1.profno = t2.profno(+)
UNION
SELECT t1.name AS "STUD_NAME",
    t2.name as "PROF_NAME"
FROM student t1, professor t2
WHERE t1.profno(+) = t2.profno
;

SELECT t1.name AS "STUD_NAME",
    t2.name as "PROF_NAME"
FROM student t1 FULL OUTER JOIN professor t2
ON t1.profno = t2.profno
;

SELECT t1.empno,
    t1.ename,
    t2.ename AS "MGR_NAME"
FROM emp t1, emp t2
WHERE t1.mgr = t2.empno
;

SELECT t1.empno,
    t1.ename,
    t2.ename AS "MGR_NAME"
FROM emp t1 JOIN emp t2
ON t1.mgr = t2.empno
;

SELECT t1.empno,
    t1.ename,
    t2.ename AS "MGR_NAME"
FROM emp t1, emp t2
WHERE t1.mgr = t2.empno(+)
;

SELECT t1.empno,
    t1.ename,
    t2.ename AS "MGR_NAME"
FROM emp t1, emp t2
WHERE t1.mgr(+) = t2.empno
;

SELECT *
FROM emp
;

SELECT t1.empno,
    t1.ename,
    t2.ename AS "MGR_NAME"
FROM emp t1 FULL OUTER JOIN emp t2
ON t1.mgr = t2.empno
;

SELECT t2.deptno,
    t2.dname,
    t1.empno,
    t1.ename,
    t1.sal
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
    AND t1.sal > 2000
ORDER BY t1.deptno, t1.sal
;

SELECT t2.deptno,
    t2.dname,
    t1.empno,
    t1.ename,
    t1.sal
FROM emp t1 INNER JOIN dept t2
ON t1.deptno = t2.deptno
WHERE t1.sal > 2000
ORDER BY t1.deptno, t1.sal
;

SELECT t1.deptno,
    t2.dname,
    TRUNC(AVG(t1.sal)),
    MAX(t1.sal),
    MIN(t1.sal),
    COUNT(*)
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
GROUP BY t1.deptno, t2.dname
;

SELECT t1.deptno,
    t2.dname,
    TRUNC(AVG(t1.sal)),
    MAX(t1.sal),
    MIN(t1.sal),
    COUNT(*)
FROM emp t1 INNER JOIN dept t2
ON t1.deptno = t2.deptno
GROUP BY t1.deptno, t2.dname
;

SELECT t2.deptno,
    t2.dname,
    t1.AVG,
    t1.MAX,
    t1.MIN,
    t1.CNT
FROM(
    SELECT deptno,
        TRUNC(AVG(sal)) AS "AVG",
        MAX(sal) AS "MAX",
        MIN(sal) AS "MIN",
        COUNT(*) AS "CNT"
    FROM emp
    GROUP BY deptno
) t1, dept t2
WHERE t1.deptno = t2.deptno
;

SELECT t2.deptno,
    t2.dname,
    t1.AVG,
    t1.MAX,
    t1.MIN,
    t1.CNT
FROM(
    SELECT deptno,
        TRUNC(AVG(sal)) AS "AVG",
        MAX(sal) AS "MAX",
        MIN(sal) AS "MIN",
        COUNT(*) AS "CNT"
    FROM emp
    GROUP BY deptno
) t1 INNER JOIN dept t2
ON t1.deptno = t2.deptno
;

SELECT t2.deptno,
    t2.dname,
    t1.empno,
    t1.ename,
    t1.job,
    t1.sal
FROM emp t1, dept t2
WHERE t1.deptno(+) = t2.deptno
;

SELECT t2.deptno,
    t2.dname,
    t1.empno,
    t1.ename,
    t1.job,
    t1.sal
FROM emp t1 RIGHT OUTER JOIN dept t2
ON t1.deptno = t2.deptno
ORDER BY t2.deptno, t1.ename
;

SELECT t1.deptno,
    t1.dname,
    t2.empno,
    t2.ename,
    t2.mgr,
    t2.sal,
    t2.deptno AS "DEPTNO_1",
    t3.losal,
    t3.hisal,
    t3.grade,
    t4.empno AS "MGR_EMPNO",
    t4.ename AS "MGR_ENAME"
FROM dept t1, emp t2, salgrade t3, emp t4
WHERE t1.deptno = t2.deptno(+)
    AND t2.sal BETWEEN t3.losal(+) AND t3.hisal(+)
    AND t2.mgr = t4.empno(+)
ORDER BY t1.deptno, t2.empno
;

SELECT t1.deptno,
    t1.dname,
    t2.empno,
    t2.ename,
    t2.mgr,
    t2.sal,
    t2.deptno AS "DEPTNO_1",
    t3.losal,
    t3.hisal,
    t3.grade,
    t4.empno AS "MGR_EMPNO",
    t4.ename AS "MGR_ENAME"
FROM dept t1 LEFT OUTER JOIN emp t2 ON t1.deptno = t2.deptno
    LEFT OUTER JOIN salgrade t3 ON t2.sal BETWEEN t3.losal AND t3.hisal
    LEFT OUTER JOIN emp t4 ON t2.mgr = t4.empno
ORDER BY t1.deptno, t2.empno
;

SELECT t1.gname,
    t1.point,
    t2.gname AS "GIFT_NAME"
FROM customer t1, gift t2
WHERE t1.point >= t2.g_start
    AND t2.gname = 'Notebook'
;

SELECT t1.gname,
    t1.point,
    t2.gname AS "GIFT_NAME"
FROM customer t1 INNER JOIN gift t2
ON t1.point >= t2.g_start
AND t2.gname = 'Notebook'
;

SELECT t1.profno,
    t1.name,
    TO_CHAR(t1.hiredate, 'YYYY/MM/DD') AS "HIREDATE",
    COUNT(t2.hiredate)
FROM professor t1, professor t2
WHERE t1.hiredate > t2.hiredate(+)
GROUP BY t1.profno, t1.name, t1.hiredate
ORDER BY t1.hiredate
;

SELECT *
FROM professor
;

SELECT t1.profno,
    t1.name,
    TO_CHAR(t1.hiredate, 'YYYY/MM/DD') AS "HIREDATE",
    COUNT(t2.hiredate)
FROM professor t1 LEFT OUTER JOIN professor t2
ON t1.hiredate > t2.hiredate
GROUP BY t1.profno, t1.name, t1.hiredate
ORDER BY t1.hiredate
;