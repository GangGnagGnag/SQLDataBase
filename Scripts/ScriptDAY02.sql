SELECT * FROM emp;	--천체를 조회하고 싶으면 *
	
SELECT EMPNO , ENAME , SAL  FROM emp;	--일부만 조회하고 싶다면 * 대신 테이블 이름 적기(사원번호, 사원이름, 월급)

SELECT EMPNO, SAL FROM emp; --작성할때는  SELECT * FROM emp; 먼저 적어준 뒤에 *을 지우고 안에 적어야함

SELECT ENAME AS "이름", SAL AS "월급" FROM emp;	-- 이름 변경도 가능 (AS 생략가능) *큰따옴표는 식별자*

/*사원번호, 사원이름, 월급, 연봉을 구하고 컬람먕은 사원번호, 사원이름, 월급, 연봉으로 조회*/

SELECT EMPNO AS "사원번호" , ENAME AS "사원이름" , SAL AS "월급", SAL*12 AS "연봉" FROM emp;

SELECT DISTINCT job FROM emp;	-- job에 들어가는거 중 중복데이터를 제거
SELECT DISTINCT job, deptno  FROM emp;
SELECT ALL job, deptno FROM emp;

/*오라클에서는 사칙연산이 들어가면 숫자로 간주한다*/
SELECT 'ABC' FROM DUAL;
SELECT 2 + 3 FROM dual;
SELECT 'ABC', 2+3 FROM dual;
SELECT 2+3 AS RESULT FROM DUAL;
SELECT 1+ '5' FROM DUAL;
SELECT '1' + '5' FROM dual;
SELECT '1' || '5' FROM dual;

/*사원명과 업무로 연결(SMITH, CLERK) 표시하고 컬럼명은 EMPLOYEE AND JOB로 표시*/
SELECT '(' || ENAME ||',' || job || ')' AS "EMPLOYEE AND JOb" FROM emp;

/* 사원별 연간 총 수입을 조회하시오. 별칭은 연간총 수입으로 나타내기*/
SELECT ENAME, SAL * 12 + COMM  AS "연간 총 수입" FROM emp;

SELECT * FROM emp ORDER BY SAL;			-- 오름차순 정렬
SELECT * FROM emp ORDER BY EMPNO ;
SELECT * FROM emp ORDER BY SAL DESC;	-- 내림차순 정렬

/*-----------------------------------------------------------------------------*/

-- 건을 추가하는 WHERE 절
SELECT * FROM EMP WHERE EMPNO = 7839;	--사원번호가 7839 출력
-- 사번이 7689번인 사원명과 업무, 급여를출력
SELECT ENAME , JOB , SAL FROM EMP WHERE EMPNO = 7698;
-- SMITH 의 사원명 부서 월급
SELECT * FROM EMP WHERE ENAME = 'SMITH';	-- 문자에는 '' 붙이기

/* 월급이 **원이 아닌것 을 나타내는 절 */
SELECT * FROM EMP WHERE SAL = 3000;
SELECT * FROM EMP WHERE SAL != 3000;
SELECT * FROM EMP WHERE SAL ^= 4000;
SELECT * FROM EMP WHERE SAL <> 5000;
SELECT * FROM EMP WHERE NOT SAL = 6000;

/* 첫 문자가 'M'과 같거나 큰 문자열 출력 */
SELECT * FROM EMP WHERE ENAME >= 'M';

-- 월급이 2500이상 3000 미만인 사원과 입사일, 월급 출력
SELECT ENAME, HIREDATE ,SAL FROM EMP WHERE 2500 <= SAL AND SAL < 3000;	-- AND를 써줘야함

-- 월급이 2000이상 3000 이하에 포함되지 않는 사원명과, 월급, 입사일을 조회
SELECT ENAME, SAL, HIREDATE FROM EMP WHERE NOT SAL >=2000 AND SAL <=3000;
SELECT * FROM emp WHERE SAL BETWEEN 2500 AND 3000;	-- 2500이상 3000이하


/*81년 5월1일 과 동년 12월 3일 사이의 입사사원, 급여, 입사일 조회*/
SELECT ENAME, SAL, HIREDATE 
FROM EMP 
WHERE HIREDATE BETWEEN TO_DATE('19810501','YYYYMMDD') AND TO_DATE('19811203','YYYYMMDD')

/*1987년도 입사한 사원명, 월급, 입사일*/
SELECT ENAME, SAL, HIREDATE
FROM EMP e 
WHERE HIREDATE BETWEEN TO_DATE('19870101', 'YYYYMMDD') AND TO_DATE('19871231', 'YYYYMMDD');

/*직업이 MANAGER, CLERK, SALESMAN*/
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'CLERK' OR JOB = 'SALESMAN' ;
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'SALESMAN'); -- 위의 코드와 동일한 결과를 나타낼 수 있음

/*사원번호 7506, 7782, 7934인 사원을 제외한 사번, 이름, 월급 출력*/
SELECT EMPNO , ENAME , SAL 
FROM EMP 
WHERE NOT EMPNO IN(7566, 7782, 7932);
SELECT EMPNO , ENAME , SAL FROM EMP WHERE EMPNO NOT IN(7566, 7782, 7932);	-- 둘중 뭘 써도 상관없음

/*부서번호 30에서 근무하고 월 2000달러 이하를 받는 81.5.1 이전에 입사한 사원이름, 급여, 부서번호, 입사일 조회*/
SELECT ENAME, SAL, deptno, HIREDATE 
FROM EMP 
WHERE DEPTNO = 30 AND SAL <= 2000 AND HIREDATE < TO_DATE('19810501','YYYYMMDD')

/*부서가 10 또는 30 인 부서에서 2000~ 5000 사이의 사원명, 급여, 부서번호 조회*/
SELECT ENAME, SAL , deptno
FROM EMP 
WHERE DEPTNO IN(10, 30) AND SAL BETWEEN 2000 AND 5000;

/*잡이 MANAGER , SALEMAN 급여 1600, 2975, 2850이 아닌 사원명, 입사일, 급여, 부서번호 출력*/
SELECT ENAME, HIREDATE, SAL 
FROM EMP 
WHERE JOB NOT IN('MANAGER', 'SALEMAN') AND SAL NOT IN(1600,2975,2850);

/*==========================================================================*/
SELECT * FROM emp WHERE ENAME LIKE 'S%';		-- 첫번째 글자가 'S'인 문자열 출력
SELECT * FROM emp WHERE ENAME LIKE '_L%';		-- 두번쨰 글자가 'L'인 문자열 출력

/*사원 이름중에 'S' 가 포함되지 않는 부서번호 20인 사원의 이름, 부서번호 조회*/
SELECT ENAME, DEPTNO 
FROM EMP 
WHERE ENAME NOT LIKE '%S%' AND DEPTNO = 20; 

/*1921.06.01 ~ 1981.12.31 입사자중 30인 부서의 부서번호, 사원명, 직업, 입사일 출력 (입사일 오름차순 정렬*/
SELECT DEPTNO , ENAME, JOB,  HIREDATE 
FROM EMP 
WHERE hiredate BETWEEN TO_DATE('19210601','YYYYMMDD') AND TO_DATE('19811231','YYYYMMDD') AND DEPTNO = 30 ORDER BY HIREDATE ;

/*사원 이름중에  a 와 e 가 있는 사원을 조회하시오*/
SELECT * 
FROM EMP 
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';	-- 따옴표 사용할때는 대소문자를 구분하기때문에 잘 확인해서 대소문자 구분 잘하기

SELECT *
FROM EMP 
WHERE COMM = NULL;			-- NULL은 비교연산을 사용할 수 없다

SELECT ENAME, SAL, SAL * 12 + COMM, COMM
FROM EMP;

SELECT * 
FROM EMP 
WHERE COMM IS NULL; 		--NULL인 열을 찾는다

/*사수가 있는 사원 출력*/
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

/*특별수당에서 0을 제외한 사원 조회*/ -- 0이 아니거나 NULL인 경우
SELECT * 
FROM EMP 
WHERE COMM != 0 OR COMM IS NULL;















