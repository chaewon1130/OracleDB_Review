CREATE TABLE dept_ddl
AS(
    SELECT *
    FROM dept
);

SELECT * FROM dept_ddl;

CREATE TABLE dept3
AS (
    SELECT deptno, dname
    FROM dept
);

SELECT * FROM dept3;

CREATE TABLE dept_ddl_30
AS (
    SELECT *
    FROM dept
    WHERE deptno = 30
);

SELECT * FROM dept_ddl_30;

CREATE TABLE dept_ddl_40
AS (
    SELECT *
    FROM dept
    WHERE 1 <> 1
);

SELECT * FROM dept_ddl_40;

CREATE TABLE dept6
AS (
    SELECT dcode, dname
    FROM dept2
    WHERE dcode IN (1000,1001,1002)
);
SELECT * FROM dept6;

ALTER TABLE dept6
ADD(locations VARCHAR2(10));

UPDATE dept6
SET locations = 'SEOUL';

ROLLBACK;

ALTER TABLE dept6
ADD(location2 VARCHAR2(10) DEFAULT 'MOKDONG');

ALTER TABLE dept6
RENAME COLUMN location2 TO loc;

SELECT * FROM dept6;

RENAME dept6
TO dept7;

SELECT * FROM dept7;

DESC dept7;
ALTER TABLE dept7
MODIFY loc VARCHAR2(20);

ALTER TABLE dept7
DROP COLUMN loc;

TRUNCATE TABLE dept7;
SELECT * FROM dept7;

CREATE TABLE vt1(
    col1 NUMBER,
    col2 NUMBER,
    col3 NUMBER GENERATED ALWAYS AS (col1 + col2)
);

DESC vt1;

INSERT INTO vt1(col1, col2)
    VALUES(1, 2);
SELECT * FROM vt1;

UPDATE vt1
SET col1 = 5;

SELECT *
FROM user_tab_columns
WHERE table_name = 'VT1';

CREATE TABLE sales10(
    no NUMBER,
    pcode CHAR(4),
    pdate CHAR(8),
    pqty NUMBER,
    pbungi NUMBER(1) GENERATED ALWAYS AS 
        (
            CASE
                WHEN SUBSTR(pdate, 5, 2) IN ('01', '02', '03') THEN 1
                WHEN SUBSTR(pdate, 5, 2) IN ('04', '05', '06') THEN 2
                WHEN SUBSTR(pdate, 5, 2) IN ('07', '08', '09') THEN 3
                ELSE 4
            END
        ) virtual
);

DESC sales10

INSERT INTO sales10(no, pcode, pdate, pqty)
    VALUES(1, '100', '20220331', 10);
INSERT INTO sales10(no, pcode, pdate, pqty)
    VALUES(2, '200', '20220401', 10);
SELECT * FROM sales10;

CREATE TABLE EMP_HW
(
    empno NUMBER(4),
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate DATE,
    sal NUMBER(7, 2),
    comm NUMBER(7, 2),
    deptno NUMBER(2)
);

DESC EMP_HW;

ALTER TABLE emp_hw
ADD bigo VARCHAR2(20);

DESC EMP_HW;

ALTER TABLE emp_hw
MODIFY bigo VARCHAR2(30);

ALTER TABLE emp_hw
RENAME COLUMN bigo TO remark;

INSERT INTO emp_hw
    (
        SELECT t1.*, null AS "REMARK"
        FROM emp t1
    )
;

SELECT * FROM emp_hw;

TRUNCATE TABLE emp_hw;

DROP TABLE emp_hw;

SELECT *
FROM recyclebin;

FLASHBACK TABLE "BIN$UmhkZ0ZqRhy3AsSN/8luCA==$0" TO BEFORE DROP;

COMMIT;

SELECT *
FROM dict;

SELECT t1.table_name
FROM user_tables t1;

SELECT t1.table_name,
    t1.owner,
    t1.tablespace_name,
    t1.num_rows
FROM all_tables t1
WHERE t1.owner = 'SCOTT'
;

SELECT *
FROM dba_tables;

SELECT *
FROM dba_users t1;

CREATE TABLE static_table2(
    no NUMBER
);

BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO static_table2
            VALUES(i);
    END LOOP;
    COMMIT;
END
;
/

SELECT COUNT(*) FROM static_table2;

SELECT t1.num_rows
FROM user_tables t1
WHERE table_name = 'STATIC_TABLE2'
;

SELECT *
FROM static_table2;

ANALYZE TABLE static_table2 COMPUTE STATISTICS;

DESC dept2;
SELECT * FROM dept2;

CREATE UNIQUE INDEX IDX_DEPT2_DNAME
ON DEPT2(dname);

INSERT INTO dept2
    VALUES(9100, 'temp01', '1006', 'Seoul Branch Office');
INSERT INTO dept2
    VALUES(9101, 'temp01', '1006', 'Seoul Branch Office');

CREATE INDEX IDX_DEPT2_AREA
ON DEPT2(area);

ALTER SESSION SET STATISTICS_LEVEL = ALL;

SELECT /*+INDEX_DESC(t1 IDX_DEPT2_AREA) */ *
FROM dept2 t1
WHERE area > '0'
;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY_CURSOR(NULL,NULL,'ALLSTATS LAST'));

CREATE INDEX idx_prof_pay_fbi
ON professor(pay+1000);

SELECT * FROM professor WHERE pay+1000 < 2000;

SELECT ename, sal
FROM emp
WHERE ename = 'SMITH' AND sex = 'M';

CREATE INDEX idx_emp_comp
ON emp(ename, job);

SELECT *
FROM emp t1
WHERE ename > '0' AND job > '0';

SELECT *
FROM USER_IND_COLUMNS;

SELECT *
FROM USER_INDEXES
WHERE TABLE_NAME = 'DEPT2';