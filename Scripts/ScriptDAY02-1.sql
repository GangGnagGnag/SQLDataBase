/*오라클에서 사용하는 내장함수*/
SELECT ENAME, UPPER(ENAME)		-- 대문자로 변경하는 함수
FROM EMP ;

SELECT ENAME, LOWER(ENAME)		-- 소문자로 변경
FROM EMP;

SELECT ENAME, INITCAP(ENAME)	-- 첫 글자를 대문자로 변경
FROM EMP;
/* 대소문자 변경을 사용하는 이유는 비교할때 많이 사용함, 소문자 대문자로 나눠져 있는경우에 가능 */

/*----------------------------------------------------------*/
SELECT EMPNO, ENAME, SAL, DEPTNO  
FROM EMP 
WHERE DEPTNO =10
UNION -- UNION은 집합연산자 라고 하고 두개의 결과값을 같이 보여줌(나타내고자 하는 열의 갯수가 같아야함)
SELECT EMPNO, ENAME, SAL, DEPTNO  
FROM EMP 
WHERE DEPTNO =20;

/* 열의 갯수와 데이터 유형이 같아야한다 */
SELECT EMPNO, ENAME, SAL, DEPTNO  
FROM EMP 
WHERE DEPTNO =10
UNION 	-- 합집합
SELECT SAL, JOB, DEPTNO, SAL 
FROM EMP 
WHERE DEPTNO =20;

/*----------------------------------------------------------*/
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS	-- 차집합	(첫번쨰에서 두번째를 뺀나머지를 결과출력)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

/*----------------------------------------------------------*/
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
INTERSECT	-- 교집합	(공통적인 셀 결과를 출력)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

/*----------------------------------------------------------*/
SELECT ENAME, LENGTH(ENAME) -- 문자길이를 구하는 함수
FROM EMP ;

/*----------------------------------------------------------*/
/* 이름 글자가 5개 이상인 사원 출력 */
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME) >= 5;

/*----------------------------------------------------------*/
SELECT LENGTH ('오라클'), LENGTHB ('오라클') FROM DUAL;		-- LENGTH : 문자길이, LENGTHB : 바이트 크기

/* 문자열 일부를 추출 substr 함수 */
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5) 
FROM EMP

/* substr 함수를 사용해서 모든 사원의 이름을 3번째 부터 출력 */
SELECT ENAME , SUBSTR(ENAME, 3) 
FROM EMP

/* 특정 문자 위치를 찾는 INSTR 함수 */
SELECT INSTR('HELLO, ORACLE', 'L') AS INSTR1,		-- 전체에서 찾기
       INSTR('HELLO, ORACLE', 'L', 5) AS INSTR2,	-- 5번째 문자부터 찾기
       INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR3	-- 2번째 문자부터 2번째로 나오는 문자 찾기
FROM DUAL ;
	
/* 사원이름중 S 가 들어가있는 사원 */
SELECT *  
FROM EMP 
WHERE INSTR(ENAME, 'S') > 0;	
/*INSTR함수가 찾으려는 글자가 없으면 0을 출력하기 때문에 0보다 크다 적어주기*/
/*특정 열에서 찾고자하는문자열을 포함하는 모든 행을 반환 하기 위해서 0보다 크다고 해야함*/
SELECT *
FROM EMP 
WHERE ENAME LIKE '%S%'

/*문자변환 REPLACE 함수*/
--	REPLACE(문자열, 찾는 문자 (필수), 대체문자(선택))
SELECT '010-1234-5678' AS REPLACE1,
	REPLACE ('010-1234-5678', '-', ' ' ) AS REPLACE2, 		
	REPLACE ('010-1234-5678', '-') AS REPLACE3
FROM DUAL;

/*빈공간 메우는 LPAD, RPAD 함수*/
-- 주민등록번호 같은거 사용할때 많이 사용함
SELECT 'Oracle',
		LPAD('Oracle', 10, '#') AS LPAD1,	-- LPAD(문자열 전체자리수, 반자리채울문자)
		RPAD('Oracle', 10, '*') AS RPAD1,
		LPAD('Oracle', 10) AS LPAD2,
		RPAD('Oracle', 10) AS RPAD2
FROM DUAL;

/* 주민번호, 전화번호의 끝에 7자리, 4자리를 처리를 '*'로 처리*/
SELECT RPAD('201225-', 14, '*') AS JB, RPAD('010-1234-', 13 ,'#') AS PB FROM DUAL;

/* 특정문자를 지우는 TRIM, LTRIM, RTRIM 함수 */
SELECT '[' || TRIM('__Oracle__') || ']' AS TRIM, -- 앞 뒤의 공백 삭제
		'[' || TRIM(LEADING FROM' __Oracle__ ') || ']' AS TRIM_LEADING,		-- 왼쪽 공백을 없앨때 사용
		'[' || TRIM(TRAILING FROM' __Oracle__ ') || ']' AS TRIM_LEADING,	-- 오른쪽 공백 없애기
		'[' || TRIM(BOTH FROM' __Oracle__ ') || ']' AS TRIM_BOTH			-- 양쪽 공백 없앨때 사용
FROM DUAL;

/*반올림 함수 ROUND*/
SELECT ROUND(1234.5678),
		ROUND(1234.5678,0),		-- 소수점 없음
		ROUND(1234.5678,1),		-- 소수점 첫번째 자리
		ROUND(1234.5678,-1),	-- 자연수 첫째자리 반올림
		ROUND(1234.5678,-2)		-- 자연수 두번째자리 반올림
FROM DUAL;

/* 버림하는 함수 TRUNC */
SELECT TRUNC(1234.5678),
		TRUNC(1234.5678, 0),
		TRUNC(1234.5678, 1),
		TRUNC(1234.5678, -1)
FROM DUAL;

/* 나머지를 구하는 함수 MOD */
SELECT MOD(15, 2),	-- 15/2 의나머지
		MOD(10,2),	-- 10/2 의나머지
		MOD(11,2)	-- 11/2 의나머지
FROM DUAL;

/* 각 사원별 시급을 계산하여 부서번호, 사원이름, 시급을 출력 */
-- 1. 한달근무일 20일, 하루 근무시간 8시간
-- 2. 부서별로 오름차순 정렬
-- 3. 시급은 소수 2자리에서 반올림(소수점 한자리)
-- 4. 시급이 높은순으로 출력

/*출력하고자 하는거는 SELECT 옆에 적고 WHERE 조건있는 경우에 사용 */
SELECT DEPTNO , ENAME , ROUND((SAL/20/8), 1) AS "시급"
FROM EMP 
ORDER BY DEPTNO , SAL DESC;
/*ORDER BY DEPTNO + SAL DESC ;*/	
/*ORDER BY DEPTNO , SAL DESC ;*/ -- 두개 의 차이는 쳇 지피티 참고

/* 날짜 함수 */ 
SELECT SYSDATE AS NOW,						
		SYSDATE -1 AS YESTERDAY,
		SYSDATE +1 AS TOMORROW
FROM DUAL;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) -- 현재 날짜에서 3개의 달을 더해서 출력해줌
FROM DUAL;

/* 입사 10주년이 되는 사원들 출력 (사원번호, 사원이름, 입사일, 10주년 )*/
SELECT EMPNO ,ENAME , HIREDATE , ADD_MONTHS (HIREDATE, 120) AS WORK10
FROM EMP;

/* 두 날짜간의 개월 차 */
SELECT EMPNO ,ENAME, HIREDATE ,SYSDATE,
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
	MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
	TRUNC (MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3 -- 현재 시간에서 입사일을뺌
FROM EMP;

/* 요일, 마지막 날짜 */
SELECT SYSDATE,
	NEXT_DAY(SYSDATE,'월요일'),	-- 현재시간에서 다음에 돌아오는 월요일 출력
	LAST_DAY(SYSDATE)			-- 특정날짜가 속한 마지막 날
FROM DUAL;

SELECT SYSDATE ,
	ROUND(SYSDATE, 'CC') AS FORMAT_CC, 		
	ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY
FROM DUAL;

/* 형 변환 함수 */
/* 암묵적 형변환(컴파일러가 자동 변환해줌), 명시적 형변환(사용자가 변환)
 * TO_CHAR : 숫자 또는 날짜 데이터를 문자 데이터로 변환
 * TO_NUMBER : 문자 (또는 날짜 데이터를) 숫자데이터로 변환
 * TO_DATE : 문자 (또는 숫자 데이터를) 날짜데이터 변환
 */
SELECT EMPNO ,ENAME ,EMPNO + '500' -- 숫자의 형태를 띄기 때문에 형변환이 가능하지만
FROM EMP
WHERE ENAME = 'SCOTT';

/*SELECT 'ABCD' + EMPNO , EMPNO 	-- 이부분은 형변환이 되지 않음
FROM EMP
WHERE ENAME = 'SCOTT'*/ 

SELECT to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간 FROM dual;
-- CC:세기, YYYY: 연, YY:연(2) MM: 월, MON;월(약어), MONTH:월(전체), DD: 일, DDD:365일, DY:요일(약어),DAY(풀어), W:주
-- HH24: 24시간, HH/HH12: 12시간, MI: 분, SS: 초, AM/PM/A.M/P.M: 오전,오후

SELECT SYSDATE, 
	TO_CHAR(SYSDATE, 'MM') AS MM,
	TO_CHAR(SYSDATE, 'MON') AS MON,
	TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
	TO_CHAR(SYSDATE, 'DD') AS DD,
	TO_CHAR(SYSDATE, 'DY') AS DY,
	TO_CHAR(SYSDATE, 'DAY') AS DAY
FROM DUAL;

SELECT SYSDATE, 
	TO_CHAR(SYSDATE, 'MM') AS MM,
	TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_K,
	TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_J,
	TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_E,
	TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_K,
	TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_E
FROM DUAL;

SELECT SYSDATE,
	TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
	TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HH24MISS_AM,
	TO_CHAR(SYSDATE, 'HH:MI,SS P.M.') AS HH24MISS_PM
FROM DUAL;

SELECT TO_DATE('2019-04-04', 'YYYY-MM-DD') AS TODATE,
	TO_DATE('20100301', 'YYYY-MM-DD') AS TODATE2	
FROM DUAL;

/* 1981년 12월 1일 이후에 입사한 사원정보 출력 */
SELECT *
FROM EMP 
WHERE HIREDATE > TO_DATE('1981-12-01','YYYY-MM-DD') ;










