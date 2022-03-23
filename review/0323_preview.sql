SELECT
    *
FROM emp e, dept d
WHERE e.deptno = d.deptno
ORDER BY empno;

SELECT
    e.empno,
    e.ename,
    e.sal,
    d.deptno,
    d.dname,
    d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno
    AND e.sal >= 3000;
    
SELECT *
FROM emp e, salgrade s
WHERE e.sal BETWEEN s.losal AND s.hisal;

SELECT *
FROM emp e, copy_emp c
WHERE e.mgr = c.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

SELECT
    e.empno,
    e.ename,
    e.job,
    e.mgr,
    e.hiredate,
    e.sal,
    e.comm,
    deptno,
    d.dname,
    d.loc
FROM emp e NATURAL JOIN dept d
ORDER BY deptno, e.empno;

SELECT
    e.empno,
    e.ename,
    e.job,
    e.mgr,
    e.hiredate,
    e.sal,
    e.comm,
    deptno,
    d.dname,
    d.loc
FROM emp e JOIN dept d USING(deptno)
ORDER BY deptno;

SELECT
    e.empno,
    e.ename,
    e.job,
    e.mgr,
    e.hiredate,
    e.sal,
    e.comm,
    e.deptno,
    d.dname,
    d.loc
FROM emp e JOIN dept d ON (e.deptno = d.deptno);

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM emp e1 FULL OUTER JOIN emp e2 ON(e1.mgr = e2.empno);