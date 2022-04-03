CREATE TABLE new_emp4(
    no NUMBER,
    name VARCHAR2(10),
    sal NUMBER
);

INSERT INTO new_emp4
    VALUES(1000, 'SMITH', 300);
INSERT INTO new_emp4
    VALUES(1001, 'ALLEN', 250);
INSERT INTO new_emp4
    VALUES(1002, 'KING', 430);
INSERT INTO new_emp4
    VALUES(1003, 'BLACK', 220);
INSERT INTO new_emp4
    VALUES(1004, 'JAMES', 620);
INSERT INTO new_emp4
    VALUES(1005, 'MILLER', 2000);
    
SELECT * FROM new_emp4;
COMMIT;

CREATE INDEX idx_new_emp4_name
ON new_emp4(name, ASC);

CREATE INDEX idx_new_emp4_name
ON new_emp4(name, 'ASC');

SELECT no,
    name,
    sal
FROM new_emp4
WHERE name > '0';

SELECT MIN(name)
FROM new_emp4;

SELECT name
FROM new_emp4
WHERE name > '0'
    AND rownum = 1;

SELECT MAX(name)
FROM new_emp4;

SELECT /*+INDEX_DESC(t1 idx_new_emp4_name) */ name
FROM new_emp4 t1
WHERE name > '0'
    AND rownum = 1;
    
SELECT rowid, empno, ename
FROM emp
WHERE rowid = 'AAAR9oAAHAAAADEAAF';

CREATE OR REPLACE VIEW vw_emp20
AS(
    SELECT empno,
        ename,
        job,
        deptno
    FROM emp
    WHERE deptno = 20
);

SELECT *
FROM user_views;

CREATE TABLE o_table(
    a NUMBER,
    b NUMBER
);

CREATE OR REPLACE VIEW view01
AS(
    SELECT *
    FROM o_table
);

SELECT * FROM view01;

INSERT INTO view01
    VALUES(1,2);

SELECT * FROM o_table;

CREATE OR REPLACE VIEW view02
AS(
    SELECT *
    FROM o_table
)
WITH READ ONLY;

INSERT INTO view02
    VALUES(3,4);
    
DROP VIEW view01;

SELECT *
FROM user_views;

SELECT rownum,
    t1.empno,
    t1.ename,
    t1.sal
FROM emp t1
ORDER BY t1.sal;

SELECT rownum, tt1.*
FROM (
    SELECT t1.empno,
        t1.ename,
        t1.sal
    FROM emp t1
    ORDER BY t1.sal
)tt1
WHERE rownum <= 10;

SELECT A.*
FROM(
    SELECT rownum as rnum, tt1.*
    FROM(
        SELECT t1.empno,
            t1.ename,
            t1.sal
        FROM emp t1
        ORDER BY t1.sal
    )tt1
)A
WHERE rnum BETWEEN (:PAGE_SIZE * (:PAGE_NUM - 1) + 1) AND (:PAGE_SIZE * :PAGE_NUM)
--WHERE rnum = 10
;

SELECT A.*
FROM(
    SELECT rownum as rnum, tt1.*
    FROM(
        SELECT t1.empno,
            t1.ename,
            t1.sal
        FROM emp t1
        ORDER BY t1.sal
    )tt1
    WHERE rownum <= (:PAGE_SIZE * :PAGE_NUM)
)A
WHERE rnum >= (:PAGE_SIZE * (:PAGE_NUM - 1) + 1)
;

TRUNCATE TABLE sawon;

BEGIN
    FOR i IN 1..9000 LOOP
        INSERT INTO sawon
            VALUES(i,
                DBMS_RANDOM.STRING('A', 9),
                SYSDATE - i,
                DECODE(MOD(i, 2), 0, 10, 20));
    END LOOP;
    COMMIT;
END
;
/

SELECT * FROM sawon;

SELECT tt1.rnum as num,
    tt1.empno,
    tt1.ename,
    TO_CHAR(tt1.hiredate, 'YYYY/MM/DD') AS hiredate,
    tt1.deptno
FROM(
    SELECT rownum as rnum, t1.*
    FROM(
        SELECT *
        FROM sawon
        ORDER BY hiredate DESC
    )t1
    WHERE rownum <= 20
)tt1
WHERE tt1.rnum >= 11
;

SELECT tt1.rnum as num,
    tt1.empno,
    tt1.ename,
    TO_CHAR(tt1.hiredate, 'YYYY/MM/DD') AS hiredate,
    tt1.deptno
FROM(
    SELECT rownum as rnum, t1.*
    FROM(
        SELECT *
        FROM sawon
        ORDER BY hiredate DESC
    )t1
    WHERE rownum <= (:PAGE_SIZE * :PAGE_NUM)
)tt1
WHERE tt1.rnum >= (:PAGE_SIZE * (:PAGE_NUM - 1) + 1)
;

CREATE OR REPLACE VIEW v_prof_dept2
AS (
    SELECT t1.profno,
        t1.name,
        t2.dname
    FROM professor t1, department t2
    WHERE t1.deptno = t2.deptno
)
;

SELECT * FROM v_prof_dept2;

SELECT t2.dname,
    t1.MAX_HEIGHT,
    t1.MAX_WEIGHT
FROM(
    SELECT deptno1,
        MAX(height) AS MAX_HEIGHT,
        MAX(weight) AS MAX_WEIGHT
    FROM student
    GROUP BY deptno1
)t1, department t2
WHERE t1.deptno1 = t2.deptno
;

SELECT a.dname,
    a.MAX_HEIGHT,
    b.name,
    b.height
FROM(
    SELECT t1.deptno1,
        t2.dname,
        MAX(t1.height) AS MAX_HEIGHT
    FROM student t1, department t2
    WHERE t1.deptno1 = t2.deptno
    GROUP BY t1.deptno1, t2.dname
)A, student B
WHERE A.max_height = b.height
    AND A.deptno1 = b.deptno1
;