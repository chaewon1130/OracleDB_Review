--SELECT * FROM tab;
--SELECT * FROM emp;
--SELECT * FROM dept;
--SELECT * FROM salgrade;
--SELECT * FROM bonus;
--DESC dept;
--DESC emp;
--DESC salgrade;
--DESC bonus;
--SELECT ename, job, sal FROM emp;
--SELECT grade, losal, hisal FROM salgrade;
--SELECT ename, 'good morning!' "GOOD" FROM emp;
--SELECT ename, 'IT''S MONDAY' "QUERY" FROM emp;
--SELECT q'[I'M]' "INTRODUCE", ename FROM emp;
--SELECT deptno "부서번호" FROM dept;
--SELECT dname AS "부서명", loc 위치 FROM dept;
--SELECT DISTINCT deptno,job FROM emp;
--SELECT DISTINCT job, deptno FROM emp ORDER BY 1,2;
--SELECT ALL job, deptno FROM emp;
--SELECT ename, sal, sal*12+comm AS ANNSAL, comm FROM emp;
--SELECT * FROM emp ORDER BY deptno ASC, sal DESC;
--SELECT DISTINCT job FROM emp;
SELECT
    empno AS employee_no,
    ename AS employee_name,
    mgr AS manager,
    sal AS salary,
    comm AS commission,
    deptno AS department_no
FROM
    emp
ORDER BY
    department_no DESC,
    employee_name;