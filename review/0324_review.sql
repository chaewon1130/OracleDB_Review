-- QUIZ
-- Student 테이블의 birthday 컬럼을 참조해서 아래와 같이 월별로 생일자수를		
-- 출력하세요
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
--Student 테이블의 tel 컬럼을 참고하여 아래와 같이 지역별 
--인원수를 출력하세요.단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 																						
--052-ULSAN, 053-DAEGU, 055-GYEONGNAM으로 출력하세요.

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
-- Emp 테이블을 사용하여 아래의 화면과 같이 부서별로 직급별로 
-- 급여 합계 결과를 출력하세요.

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
--emp 테이블을 사용하여 직원들의 급여와 전체 급여의 누적 
--급여금액이 아래와 같도록 출력하세요. 
-- 단 급여를 오름차순으로 정렬해서 출력하세요.

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER(ORDER BY sal, ename) AS "TOTAL"
FROM emp
;

--8) emp 테이블을 사용하여 아래와 같이 부서별로 급여 누적 
--합계가 나오도록 출력하세요.(단 부서번호로 오름차순 출력하세요)	

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER(PARTITION BY deptno ORDER BY sal) AS "TOTAL"
FROM emp
;

--7) student 테이블의 Tel 컬럼을 사용하여 아래와 같이 지역별 인원수와
--전체대비 차지하는 비율을 출력하세요
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
--emp 테이블을 사용하여 아래와 같이 각 사원의 급여액이 
--전체 직원 급여총액에서 몇 %의 비율을 차지하는지 출력하세요. 
--단 급여 비중이 높은 사람이 먼저 출력되도록 하세요

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
--emp 테이블을 조회하여 아래와 같이 각 직원들의 급여가 
--해당 부서 합계금액에서 몇 %의 비중을 차지하는지를 출력하세요. 
--단 부서번호를 기준으로 오름차순으로 출력하세요.

SELECT
    deptno,
    ename,
    sal,
    SUM(sal) OVER(ORDER BY deptno) AS "SUM_DEPT",
    ROUND(RATIO_TO_REPORT(sal) OVER(PARTITION BY deptno) * 100, 2) AS "%"
FROM emp
;

-- QUIZ
--loan 테이블을 사용하여 1000번 지점의 대출 내역을 출력하되 
--대출일자, 대출종목코드, 대출건수, 																					
--대출총액, 누적대출금액을 아래와 같이 출력하세요.

SELECT 
    l_date AS "대출일자",
    l_code AS "대출종목코드",
    l_qty AS "대출건수",
    l_total AS "대출총액",
    SUM(l_total) OVER(ORDER BY l_date, l_code) AS "누적대출금액"
FROM loan
WHERE l_store = '1000'
;

-- QUIZ
--loan 테이블을 조회하여 1000번 지점의 대출 내역을 대출 코드별로 
--합쳐서 대출일자, 대출구분코드, 대출건수, 대출총액, 코드별 
--누적대출금액을 아래와 같이 출력하세요.

SELECT
    l_date,
    l_code,
    l_qty,
    l_total,
    SUM(l_total) OVER(PARTITION BY l_code ORDER BY l_total) AS "누적대출금액"
FROM loan
WHERE l_store = '1000'
;

-- QUIZ
--professor 테이블을 조회하여 학과번호 , 교수명 , 급여 , 학과별 
--급여 합계를 구하고 각 교수의 급여가 해당 학과별 급여 합계에서 
--차지하는 비율을 출력하세요.

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
--professor 테이블에서 각 교수들의 급여를 구하고 각 교수의 
--급여액이 전체 교수의 급여 합계에서 차지하는 비율을 출력하세요
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