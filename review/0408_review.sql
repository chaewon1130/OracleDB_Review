SET SERVEROUTPUT ON;

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    
    dept_rec REC_DEPT;
    
BEGIN
    dept_rec.deptno := 20;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || dept_rec.loc);
END;
/

CREATE TABLE DEPT_RECORD
AS (
    SELECT *
    FROM DEPT
);

SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT_RECORD.DNAME%TYPE,
        LOC DEPT_RECORD.LOC%TYPE
    );
    
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 70;
    DEPT_REC.DNAME := 'DEVELOPER';
    DEPT_REC.LOC := 'SINCHON';
    
    INSERT INTO DEPT_RECORD
        VALUES DEPT_REC;
    COMMIT;
END;
/

SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT_RECORD.DNAME%TYPE,
        LOC DEPT_RECORD.LOC%TYPE
    );
    
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 50;
    DEPT_REC.DNAME := 'WEB DEV';
    DEPT_REC.LOC := 'HONGDAE';
    
    UPDATE DEPT_RECORD
    SET ROW = DEPT_REC
    WHERE DEPTNO = 70;
    COMMIT;
END;
/
SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    
    TYPE REC_EMP IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DINFO REC_DEPT
    );
    
    EMP_REC REC_EMP;
BEGIN
    SELECT t1.empno,
        t1.ename,
        t2.deptno,
        t2.dname,
        t2.loc
    INTO
        EMP_REC.EMPNO,
        EMP_REC.ENAME,
        EMP_REC.DINFO.DEPTNO,
        EMP_REC.DINFO.DNAME,
        EMP_REC.DINFO.LOC
    FROM emp t1, dept t2
    WHERE t1.deptno = t2.deptno
        AND t1.empno = 7788;
        
    DBMS_OUTPUT.PUT_LINE(EMP_REC.EMPNO);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.ENAME);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.DINFO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.DINFO.DNAME);
    DBMS_OUTPUT.PUT_LINE(EMP_REC.DINFO.LOC);
END;
/

DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(1) := '1ST DATA';
    TEXT_ARR(2) := '2ST DATA';
    TEXT_ARR(3) := '3ST DATA';
    TEXT_ARR(4) := '4ST DATA';
    
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR(1));
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR(2));
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR(3));
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR(4));
END;
/

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE
    );
    
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
    INDEX BY PLS_INTEGER;
    
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT * FROM DEPT) LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ' : ' || dept_arr(idx).dname);
    END LOOP;
END;
/

DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    DEPT_ARR ITAB_DEPT;
    IDX PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT * FROM DEPT) LOOP
        idx := idx + 1;
        dept_arr(idx).deptno := i.deptno;
        dept_arr(idx).dname := i.dname;
        dept_arr(idx).loc := i.loc;
        
        DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || dept_arr(idx).dname || dept_arr(idx).loc);
    END LOOP;
END;
/

DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
    INDEX BY PLS_INTEGER;
    
    TEXT_ARR ITAB_EX;
BEGIN
    TEXT_ARR(2) := '1ST';
    TEXT_ARR(4) := '2ST';
    TEXT_ARR(6) := '3ST';
    TEXT_ARR(8) := '4ST';
    TEXT_ARR(10) := '5ST';
    
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR.COUNT);
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR.FIRST);
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR.LAST);
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR.PRIOR(8));
    DBMS_OUTPUT.PUT_LINE(TEXT_ARR.NEXT(8));
END;
/

CREATE TABLE EMP_RECORD
AS (
    SELECT *
    FROM EMP
    WHERE 1=2
);

DECLARE
    TYPE REC_EMP IS RECORD(
        EMPNO EMP_RECORD.EMPNO%TYPE,
        ENAME EMP_RECORD.ENAME%TYPE,
        JOB EMP_RECORD.JOB%TYPE,
        MGR EMP_RECORD.MGR%TYPE,
        HIREDATE EMP_RECORD.HIREDATE%TYPE,
        SAL EMP_RECORD.SAL%TYPE,
        COMM EMP_RECORD.COMM%TYPE,
        DEPTNO EMP_RECORD.DEPTNO%TYPE
    );
    
    EMP_REC REC_EMP;
BEGIN
    EMP_REC.EMPNO := 1111;
    EMP_REC.ENAME := 'TEST_USER';
    EMP_REC.JOB := 'TEST_JOB';
    EMP_REC.MGR := NULL;
    EMP_REC.HIREDATE := '18/03/01';
    EMP_REC.SAL := 3000;
    EMP_REC.COMM := NULL;
    EMP_REC.DEPTNO := 40;
    
    INSERT INTO EMP_RECORD
        VALUES EMP_REC;
END;
/

SELECT * FROM EMP_RECORD;

DECLARE
    TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    EMP_ARR ITAB_EMP;
    IDX PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT * FROM EMP) LOOP
        idx := idx + 1;
        EMP_ARR(idx).EMPNO := i.empno;
        EMP_ARR(idx).ENAME := i.ename;
        EMP_ARR(idx).JOB := i.job;
        EMP_ARR(idx).MGR := i.mgr;
        EMP_ARR(idx).HIREDATE := i.hiredate;
        EMP_ARR(idx).SAL := i.sal;
        EMP_ARR(idx).COMM := i.comm;
        EMP_ARR(idx).DEPTNO := i.deptno;
        
        DBMS_OUTPUT.PUT_LINE(EMP_ARR(idx).EMPNO || ' : '
            || EMP_ARR(idx).ENAME || ' : '
            || EMP_ARR(idx).JOB || ' : '
            || EMP_ARR(idx).MGR || ' : '
            || EMP_ARR(idx).HIREDATE || ' : '
            || EMP_ARR(idx).SAL || ' : '
            || EMP_ARR(idx).COMM || ' : '
            || EMP_ARR(idx).DEPTNO);
    END LOOP;
END;
/

DECLARE
    V_DEPT DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO,
        DNAME,
        LOC INTO V_DEPT
    FROM DEPT;
--    WHERE DEPTNO = 40;
    
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DNAME);
    DBMS_OUTPUT.PUT_LINE(V_DEPT.LOC);
END;
/

DECLARE
    V_DEPT DEPT%ROWTYPE;
    
    CURSOR C1 IS (
        SELECT *
        FROM DEPT
        WHERE DEPTNO = 40
    );
BEGIN
    OPEN C1;
    FETCH C1 INTO V_DEPT;
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(V_DEPT.DNAME);
    DBMS_OUTPUT.PUT_LINE(V_DEPT.LOC);
    CLOSE C1;
END;
/

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    
    CURSOR C1 IS (
        SELECT DEPTNO,
            DNAME,
            LOC
        FROM DEPT
    );
BEGIN
    OPEN C1;
    LOOP
        FETCH C1 INTO V_DEPT_ROW;
        EXIT WHEN C1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE(V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE(V_DEPT_ROW.LOC);
    END LOOP;
    CLOSE C1;
END;
/

DECLARE
    CURSOR C1 IS (
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
    );
BEGIN
    FOR C1_REC IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE(C1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE(C1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE(C1_REC.LOC);
    END LOOP;
END;
/