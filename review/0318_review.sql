SELECT
    RPAD(ename, 9, SUBSTR('123456789', LENGTH(ename)+1))
FROM
    emp
WHERE
    deptno = 10;
    
SELECT
    CONCAT(empno, ename),
    CONCAT(empno, CONCAT(' : ', ename))
FROM
    emp;
    
SELECT
    '[' || TRIM(' __ORACLE__ ') || ']' AS TRIM,
    '[' || TRIM(LEADING FROM ' __ORACLE__ ') || ']'
FROM
    dual;
    
SELECT
    ROUND(1234.5678),
    ROUND(1234.5678, 1),
    ROUND(1234.5678, 2),
    ROUND(1234.5678, -2),
    ROUND(8765.4321, -2)
FROM
    dual;
    
SELECT
    TRUNC(1234.5678),
    TRUNC(1234.5678, 1),
    TRUNC(1234.5678, 3),
    TRUNC(1234.5678, -1),
    TRUNC(8765.4321, -2)
FROM
    dual;
    
SELECT
    MOD(15,6),
    MOD(10, -3),
    MOD(10, 0),
    MOD(-4, 3),
    MOD(13.2, 2)
FROM
    dual;

SELECT
    ROWNUM,
    ename,
    CEIL(ROWNUM/4)
FROM
    emp;

SELECT
    POWER(3.14,2),
    FLOOR(12.345),
    FLOOR(-0.1),
    CEIL(-0.1)
FROM
    dual;

SELECT
    SYSDATE,
    SYSDATE+1
FROM
    dual;
    
SELECT
    SYSDATE,
    ADD_MONTHS(SYSDATE, -1)+2
FROM
    dual;

SELECT
    SYSDATE,
    SYSDATE-31,
    MONTHS_BETWEEN(SYSDATE, SYSDATE-28)
FROM
    dual;
    
SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE, 'ȭ'),
    LAST_DAY(SYSDATE)
FROM
    dual;
    
SELECT
    SYSDATE,
--    ROUND(SYSDATE, 'CC'),
--    ROUND(SYSDATE, 'YYYY'),
--    ROUND(SYSDATE, 'Q')
--    ROUND(SYSDATE, 'DDD')
--    ROUND(SYSDATE, 'HH')
--    TRUNC(SYSDATE)
--    TRUNC(SYSDATE, 'CC')
--    TRUNC(SYSDATE, 'YYYY')
--    TRUNC(SYSDATE, 'Q')
--    TRUNC(SYSDATE, 'DDD')
    TRUNC(SYSDATE, 'HH')
FROM
    dual;
    
SELECT
    2 + TO_NUMBER('2'),
    '2' + TO_NUMBER('2')
FROM
    dual;
    
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'DDD')
FROM
    dual;
    
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=ENGLISH'),
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE=JAPANESE')
FROM
    dual;