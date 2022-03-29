CREATE TABLE dept_temp
AS SELECT *
    FROM dept
;
DROP TABLE dept_temp;

DESC dept_temp;

ROLLBACK;
COMMIT;

INSERT INTO dept_temp(deptno, dname, loc)
    VALUES(50, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_TEMP;
COMMIT;
ROLLBACK;

INSERT INTO dept_temp(deptno, dname)
    VALUES(50, 'DATABASE', 'SEOUL');
    
INSERT INTO dept_temp(deptno, dname, loc)
    VALUES('50', 'DATABASE', 'SEOUL');
    
INSERT INTO dept_temp
    VALUES(60, 'NETWORK', 'BUSAN');
SELECT * FROM DEPT_TEMP;
COMMIT;

INSERT INTO dept_temp
    VALUES(70, 'WEB', NULL);
SELECT * FROM DEPT_TEMP;

INSERT INTO dept_temp
    VALUES(80, 'MOBILE', '');
SELECT * FROM dept_temp;

COMMIT;
INSERT INTO dept_temp(deptno, loc, dname)
    VALUES(90, 'MOKDONG', 'IT');
SELECT * FROM dept_temp;
ROLLBACK;

INSERT INTO dept_temp(deptno, loc)
    VALUES(90, 'INCHEON');
SELECT * FROM dept_temp;
COMMIT;

CREATE TABLE emp_temp
AS SELECT *
    FROM emp
    WHERE 1 <> 1;
DESC EMP_TEMP;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    'ȫ�浿',
    'PRESIDENT',
    NULL,
    '2001/01/01',
    5000,
    1000,
    10
);

SELECT * FROM EMP_TEMP;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    9999,
    'ȫ�浿',
    'PRESIDENT',
    NULL,
    '01/01/01',
    5000,
    1000,
    10
);
SELECT TO_CHAR(hiredate,'RRRR-MM-DD') FROM EMP_TEMP;
COMMIT;
ROLLBACK;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    'ȫ�浿3',
    'PRESIDENT',
    NULL,
    '2001-01-01',
    5000,
    1000,
    10
);

COMMIT;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    2112,
    'ȫ�浿4',
    'PRESIDENT',
    NULL,
    TO_DATE('01/01/2001', 'DD/MM/YYYY'),
    5000,
    1000,
    10
);

SELECT * FROM EMP_TEMP;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    2113,
    'ȫ�浿5',
    'PRESIDENT',
    NULL,
    SYSDATE,
    5000,
    1000,
    10
);
SELECT * FROM EMP_TEMP;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) SELECT t1.empno,
        t1.ename,
        t1.job,
        t1.mgr,
        t1.hiredate,
        t1.sal,
        t1.comm,
        t1.deptno
    FROM emp t1, salgrade t2
    WHERE t1.sal BETWEEN t2.losal AND t2.hisal
    AND t2.grade = 1
;

SELECT * FROM EMP_TEMP;

CREATE TABLE dept_temp2
AS SELECT * FROM dept;

SELECT * FROM DEPT_TEMP2;
COMMIT;

UPDATE DEPT_TEMP2
SET loc = 'SEOUL';

ROLLBACK;

UPDATE dept_temp2
SET dname = 'DATABASE',
    loc = 'SEOUL'
WHERE deptno = 40;

SELECT * FROM DEPT_TEMP2;
COMMIT;

UPDATE emp_temp
SET comm = 50
WHERE sal <= 2500;

SELECT * FROM emp_temp;
ROLLBACK;

UPDATE dept_temp2
SET (dname, loc) = (SELECT dname, loc
                    FROM dept
                    WHERE deptno = 40)
WHERE deptno = 40
;

SELECT * FROM dept_temp2;

UPDATE dept_temp2
SET dname = (SELECT dname
            FROM dept
            WHERE deptno = 40),
    loc = (SELECT loc
            FROM dept
            WHERE deptno = 40)
WHERE deptno = 40;
COMMIT;

CREATE TABLE emp_temp2
AS SELECT * FROM emp;

SELECT * FROM emp_temp2;

DELETE FROM emp_temp2
WHERE job = 'MANAGER'
;
COMMIT;

DELETE FROM emp_temp2
WHERE empno IN (
            SELECT t1.empno
            FROM emp_temp2 t1, salgrade t2
            WHERE t1.sal BETWEEN t2.losal AND t2.hisal
                AND t2.grade = 3
                AND t1.deptno = 30)
;

SELECT * FROM emp_temp2;
COMMIT;

CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

SELECT *
FROM CHAP10HW_DEPT;

INSERT INTO CHAP10HW_DEPT
    VALUES(50,'ORACLE', 'BUSAN');
INSERT INTO CHAP10HW_DEPT
    VALUES(60,'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT
    VALUES(70,'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT
    VALUES(80,'DML', 'BUNDANG');
COMMIT;

SELECT * FROM CHAP10HW_EMP;
INSERT INTO CHAP10HW_EMP
    VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO CHAP10HW_EMP
    VALUES(7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO CHAP10HW_EMP
    VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO CHAP10HW_EMP
    VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO CHAP10HW_EMP
    VALUES(7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP
    VALUES(7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO CHAP10HW_EMP
    VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO CHAP10HW_EMP
    VALUES(7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80);
COMMIT;

UPDATE CHAP10HW_EMP
SET deptno = 70
WHERE sal > (
            SELECT AVG(sal)
            FROM CHAP10HW_EMP
            WHERE deptno = 50
);

SELECT *
FROM CHAP10HW_EMP
ORDER BY DEPTNO DESC
;
COMMIT;

UPDATE CHAP10HW_EMP
SET sal = sal * 1.1,
    deptno = 80
WHERE hiredate > (
                SELECT MIN(hiredate)
                FROM CHAP10HW_EMP
                WHERE deptno = 60
);

SELECT * FROM CHAP10HW_EMP;
COMMIT;

DELETE FROM CHAP10HW_EMP
WHERE empno IN (
                SELECT t1.empno
                FROM CHAP10HW_EMP t1, salgrade t2
                WHERE t1.sal BETWEEN t2.losal AND t2.hisal
                    AND t2.grade = 5
)
;

SELECT * FROM CHAP10HW_EMP;