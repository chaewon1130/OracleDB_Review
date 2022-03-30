CREATE TABLE charge_01(
    u_date VARCHAR2(6),
    cust_no NUMBER,
    u_time NUMBER,
    charge NUMBER
);

CREATE TABLE charge_02(
    u_date VARCHAR2(6),
    cust_no NUMBER,
    u_time NUMBER,
    charge NUMBER
);

CREATE TABLE ch_total(
    u_date VARCHAR2(6),
    cust_no NUMBER,
    u_time NUMBER,
    charge NUMBER
);

INSERT INTO CHARGE_01
    VALUES('141001', 1000, 2, 1000);
INSERT INTO CHARGE_01
    VALUES('141001', 1001, 2, 1000);
INSERT INTO CHARGE_01
    VALUES('141001', 1002, 1, 500);
SELECT * FROM CHARGE_01;

INSERT INTO CHARGE_02
    VALUES('141002', 1000, 3, 1500);
INSERT INTO CHARGE_02
    VALUES('141002', 1001, 4, 2000);
INSERT INTO CHARGE_02
    VALUES('141002', 1003, 1, 500);
SELECT * FROM CHARGE_02;
COMMIT;

MERGE INTO ch_total total
USING charge_01 ch01
ON(total.u_date = ch01.u_date)
WHEN MATCHED THEN
    UPDATE SET total.cust_no = ch01.cust_no
WHEN NOT MATCHED THEN
    INSERT VALUES(ch01.u_date, ch01.cust_no, ch01.u_time, ch01.charge);
SELECT * FROM ch_total;

MERGE INTO ch_total total
USING charge_02 ch02
ON (total.u_date = ch02.u_date)
WHEN MATCHED THEN
    UPDATE SET total.cust_no = ch02.cust_no
WHEN NOT MATCHED THEN
    INSERT VALUES(ch02.u_date, ch02.cust_no, ch02.u_time, ch02.charge);
SELECT * FROM ch_total;

CREATE TABLE sawon
AS (
    SELECT empno,
        ename,
        hiredate,
        deptno
    FROM emp
    WHERE 1 = 2
);

SELECT * FROM sawon;

MERGE INTO sawon ta
USING(
    SELECT :empno AS empno,
        :ename AS ename,
        SYSDATE AS hiredate,
        :deptno AS deptno
    FROM dual
) tb
ON(ta.empno = tb.empno)
WHEN MATCHED THEN
    UPDATE SET ta.ename = tb.ename,
        ta.hiredate = tb.hiredate,
        ta.deptno = tb.deptno
WHEN NOT MATCHED THEN
    INSERT VALUES(tb.empno, tb.ename, tb.hiredate, tb.deptno);
SELECT * FROM SAWON;

CREATE TABLE dept_tcl
AS SELECT * FROM dept;
SELECT * FROM dept_tcl;

INSERT INTO dept_tcl
    VALUES(50, 'DATABASE', 'SEOUL');
UPDATE dept_tcl
SET loc = 'BUSAN'
WHERE deptno = 40;
DELETE FROM dept_tcl
WHERE dname = 'RESEARCH';
SELECT * FROM dept_tcl;
ROLLBACK;
COMMIT;