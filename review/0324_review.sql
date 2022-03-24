-- QUIZ
-- Student ���̺��� birthday �÷��� �����ؼ� �Ʒ��� ���� ������ �����ڼ���		
-- ����ϼ���
SELECT
    COUNT(*) || 'EA' AS "TOTAL",
    COUNT(DECODE(SUBSTR(birthday,4,2), '01', 0)) || 'EA' AS "JAN",
    COUNT(DECODE(SUBSTR(birthday,4,2), '02', 0)) || 'EA' AS "FEB",
    COUNT(DECODE(SUBSTR(birthday,4,2), '03', 0)) || 'EA' AS "MAR",
    COUNT(DECODE(SUBSTR(birthday,4,2), '04', 0)) || 'EA' AS "APR",
    COUNT(DECODE(SUBSTR(birthday,4,2), '05', 0)) || 'EA' AS "MAY",
    COUNT(DECODE(SUBSTR(birthday,4,2), '06', 0)) || 'EA' AS "JUN",
    COUNT(DECODE(SUBSTR(birthday,4,2), '07', 0)) || 'EA' AS "JUL",
    COUNT(DECODE(SUBSTR(birthday,4,2), '08', 0)) || 'EA' AS "AUG",
    COUNT(DECODE(SUBSTR(birthday,4,2), '09', 0)) || 'EA' AS "SEP",
    COUNT(DECODE(SUBSTR(birthday,4,2), '10', 0)) || 'EA' AS "OCT",
    COUNT(DECODE(SUBSTR(birthday,4,2), '11', 0)) || 'EA' AS "NOV",
    COUNT(DECODE(SUBSTR(birthday,4,2), '12', 0)) || 'EA' AS "DEC"
FROM student;

-- QUIZ
--Student ���̺��� tel �÷��� �����Ͽ� �Ʒ��� ���� ������ 
--�ο����� ����ϼ���.��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 																						
--052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.

SELECT 
    COUNT(*) AS "TOTAL",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '02', 0)) AS "SEOUL",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '031', 0)) AS "GYEONGGI",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '051', 0)) AS "BUSAN",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '052', 0)) AS "ULSAN",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '053', 0)) AS "DAEGU",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '055', 0)) AS "GYEONNAM"
FROM student
;

SELECT *
FROM(
    SELECT
        COUNT(*) OVER() AS "TOTAL",
        SUBSTR(tel, 1, INSTR(tel, ')') -1 ) AS "AREA"
    FROM student
)
PIVOT(
    COUNT(AREA)
    FOR AREA
    IN(
        '02' AS "SEOUL",
        '031' AS "GYEONGGI",
        '051' AS "BUSAN",
        '052' AS "ULSAN",
        '053' AS "DAEGU",
        '055' AS "GYEONNAM"
    )
);

-- QUIZ
-- Emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� 
-- �޿� �հ� ����� ����ϼ���.

SELECT 
    deptno,
    SUM(DECODE(job, 'CLERK', sal)) AS "CLERK",
    SUM(DECODE(job, 'MANAGER', sal)) AS "MANAGER",
    SUM(DECODE(job, 'PRESIDENT', sal)) AS "PRESIDENT",
    SUM(DECODE(job, 'ANALYST', sal)) AS "ANALYST",
    SUM(DECODE(job, 'SALESMAN', sal)) AS "SALESMAN",
    SUM(sal) AS "TOTAL"
FROM emp
GROUP BY ROLLUP(deptno)
ORDER BY deptno;

-- QUIZ
--emp ���̺��� ����Ͽ� �������� �޿��� ��ü �޿��� ���� 
--�޿��ݾ��� �Ʒ��� ������ ����ϼ���. 
-- �� �޿��� ������������ �����ؼ� ����ϼ���.

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER(ORDER BY sal, ename) AS "TOTAL"
FROM emp
;

--8) emp ���̺��� ����Ͽ� �Ʒ��� ���� �μ����� �޿� ���� 
--�հ谡 �������� ����ϼ���.(�� �μ���ȣ�� �������� ����ϼ���)	

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER(PARTITION BY deptno ORDER BY sal) AS "TOTAL"
FROM emp
;

--7) student ���̺��� Tel �÷��� ����Ͽ� �Ʒ��� ���� ������ �ο�����
--��ü��� �����ϴ� ������ ����ϼ���
SELECT
    COUNT(*) || 'EA (' || COUNT(*) / COUNT(*) * 100 || '%)'AS "TOTAL",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '02', 0)) || 'EA (' || COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '02', 0)) / COUNT(*) * 100 || '%)'AS "SEOUL",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '031', 0)) || 'EA (' || COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '031', 0)) / COUNT(*) * 100 || '%)'AS "GYEONGGI",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '051', 0)) || 'EA (' || COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '051', 0)) / COUNT(*) * 100 || '%)'AS "BUSAN",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '052', 0)) || 'EA (' || COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '052', 0)) / COUNT(*) * 100 || '%)'AS "ULSAN",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '053', 0)) || 'EA (' || COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '053', 0)) / COUNT(*) * 100 || '%)'AS "DAEGU",
    COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '055', 0)) || 'EA (' || COUNT(DECODE(SUBSTR(tel, 1, INSTR(tel, ')')-1), '055', 0)) / COUNT(*) * 100 || '%)'AS "GYEONGNAM"
FROM student
;

-- QUIZ
--emp ���̺��� ����Ͽ� �Ʒ��� ���� �� ����� �޿����� 
--��ü ���� �޿��Ѿ׿��� �� %�� ������ �����ϴ��� ����ϼ���. 
--�� �޿� ������ ���� ����� ���� ��µǵ��� �ϼ���

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER() AS "TOTAL",
    ROUND(RATIO_TO_REPORT(sal) OVER() * 100, 2) AS "%"
FROM emp
ORDER BY sal DESC
;

-- QUIZ
--emp ���̺��� ��ȸ�Ͽ� �Ʒ��� ���� �� �������� �޿��� 
--�ش� �μ� �հ�ݾ׿��� �� %�� ������ �����ϴ����� ����ϼ���. 
--�� �μ���ȣ�� �������� ������������ ����ϼ���.

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER(ORDER BY deptno) AS "SUM_DEPT",
    ROUND(RATIO_TO_REPORT(sal) OVER(PARTITION BY deptno) * 100, 2) AS "%"
FROM emp
;

-- QUIZ
--loan ���̺��� ����Ͽ� 1000�� ������ ���� ������ ����ϵ� 
--��������, ���������ڵ�, ����Ǽ�, 																					
--�����Ѿ�, ��������ݾ��� �Ʒ��� ���� ����ϼ���.

SELECT 
    l_date AS "��������",
    l_code AS "���������ڵ�",
    l_qty AS "����Ǽ�",
    l_total AS "�����Ѿ�",
    SUM(l_total) OVER(ORDER BY l_date, l_code) AS "��������ݾ�"
FROM loan
WHERE l_store = '1000'
;

-- QUIZ
--loan ���̺��� ��ȸ�Ͽ� 1000�� ������ ���� ������ ���� �ڵ庰�� 
--���ļ� ��������, ���ⱸ���ڵ�, ����Ǽ�, �����Ѿ�, �ڵ庰 
--��������ݾ��� �Ʒ��� ���� ����ϼ���.

SELECT
    l_date,
    l_code,
    l_qty,
    l_total,
    SUM(l_total) OVER(PARTITION BY l_code ORDER BY l_total) AS "��������ݾ�"
FROM loan
WHERE l_store = '1000'
;

-- QUIZ
--professor ���̺��� ��ȸ�Ͽ� �а���ȣ , ������ , �޿� , �а��� 
--�޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� 
--�����ϴ� ������ ����ϼ���.

SELECT 
    deptno,
    name,
    pay,
    SUM(pay) OVER(PARTITION BY deptno) AS "TOTAL_PAY",
    ROUND(RATIO_TO_REPORT(pay) OVER(PARTITION BY deptno) * 100, 2) AS "RATIO_%"
FROM professor
ORDER BY deptno, name
;

-- QUIZ
--professor ���̺��� �� �������� �޿��� ���ϰ� �� ������ 
--�޿����� ��ü ������ �޿� �հ迡�� �����ϴ� ������ ����ϼ���
SELECT 
    deptno,
    name,
    pay,
    SUM(pay) OVER() AS "TOTAL_PAY",
    ROUND(RATIO_TO_REPORT(pay) OVER() * 100, 2) AS "RATIO_%"
FROM professor
ORDER BY pay DESC
;

SELECT t1.empno, 
    t1.deptno,
    t2.dname
FROM emp t1, dept t2
WHERE t1.deptno = t2.deptno
;