/*select라는 문법을 사용해야가능 from dual로 형식을 취해줘야함
 * sql 도 잘 하기 위해서는 클래스를 잘 만들어야함 - 데이터 베이스에스는 클래스가 table 이다
 * 자바에서는 int id 와 같이 타입이 앞에 오지만 데이터베이스는 타입이 id; int 와 같이 뒤에 붙는다
 * 행은 row 열은 column */

CREATE TABLE ex2_1(
   COLUMN1 CHAR(10),
   COLUMN2 VARCHAR2(10),
   COLUMN3 NVARCHAR2(10),
   COLUMN4 NUMBER
);

INSERT INTO ex2_1(column1, column2) VALUES ('abc', 'abc');

SELECT  column1, length(column1) AS len1,
      column2, length(column2) AS len2
   FROM ex2_1;
   
  CREATE TABLE ex2_2(
   COLUMN1 VARCHAR2(3),
   COLUMN2 VARCHAR2(3 byte),
   COLUMN3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES ('abc', 'abc', 'abc');

SELECT * FROM EX2_2;	/*select가 제일 많이 사용될 예정*/

SELECT column1, LENGTH(column1) AS len1,
column2, LENGTH(column2) AS len2,
column3, LENGTH(column3) AS len3 
FROM ex2_2;

/*INSERT INTO ex2_2 VALUES ('홍길동','홍길동','홍길동');  
 * 바이트 크기가 안맞기 때문에 오류남    */
	
INSERT INTO ex2_2 (column3) VALUES ('홍길동');

SELECT column3, LENGTH (column3) AS len3, LENGTHB(column3) AS bytelen
FROM ex2_2


CREATE TABLE EX2_3(
	col_int		integer,
	col_dec		decimal,
	col_num		number
);

SELECT column_id, column_name, data_type, data_length
	FROM user_tab_cols
WHERE table_name = 'EX2_3'/*따옴표로 사용하는경우에는 대소문자 구분을 해야함*/
ORDER BY column_id;
	

CREATE TABLE ex2_5(
col_date	DATE,
col_timestamp	timestamp
);

INSERT INTO ex2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT *
FROM ex2_5;


CREATE TABLE ex2_6(
	col_null	varchar2(10),
	col_not_null	varchar2(10) NOT NULL
);

/*INSERT INTO ex2_6 VALUES ('AA', ''); = 공백이 있어서 오류가 남*/

INSERT INTO ex2_6 VALUES ('AA', 'BB'); 

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_6';


CREATE TABLE ex2_7 ( 
col_unique_null		varchar2(10) UNIQUE,
col_unique_nnull		varchar2(10) UNIQUE NOT NULL,
col_unique		varchar2(10),
CONSTRAINTS unique_nm1 UNIQUE (col_unique)
);

SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'EX2_7';

SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_7'; 

INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');
/*INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA'); 무결성 제약조건에 걸림*/
INSERT INTO ex2_7 VALUES ('', 'BB', 'BB');
INSERT INTO ex2_7 VALUES ('', 'CC', 'CC');


SELECT * FROM EMPLOYEES e ;


CREATE TABLE EMP(			-- 사원테이블
	empno		NUMBER(4)NOT NULL,	--사원번호
	ename		VARCHAR(2),			--사원이름
	job			VARCHAR(9),			--업무
	mgr			NUMBER(4),			--사수번호
	hiredate	DATE,				--입사일
	sal			NUMBER(7,2),		--월급
	comm		number(7, 2),		--커미션
	deptno		number(2)			--부서번호
);

SELECT * FROM emp;								-- 조회

ALTER TABLE	emp MODIFY	ename varchar2(10);		-- 변경

INSERT INTO EMP VALUES (7369, 'SMITH', 'CLERK', 7902, TO_DATE('17-12-1980', 'DD-MM-YYYY'), 800, NULL, 20); --삽입
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600, 300, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250, 500, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('02-04-1981', 'DD-MM-YYYY'), 2975, NULL, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, TO_DATE('01-05-1981', 'DD-MM-YYYY'), 2850, NULL, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, TO_DATE('09-06-1981', 'DD-MM-YYYY'), 2450, NULL, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, TO_DATE('13-07-1987', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, TO_DATE('08-09-1981', 'DD-MM-YYYY'), 1500, 0, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, TO_DATE('13-07-1987', 'DD-MM-YYYY'), 1100, NULL, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, TO_DATE('03-12-1981', 'DD-MM-YYYY'), 950, NULL, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, TO_DATE('03-12-1981', 'DD-MM-YYYY'), 3000, NULL, 20);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, 10);

COMMIT;

SELECT * FROM emp;

CREATE TABLE DEPT (
	DEPTNO NUMBER (2) ,     -- 부서번호
	DNAME VARCHAR2 (4) ,    -- 부서명
	LOC VARCHAR2 (13)       -- 부서위치
) ;
SELECT * FROM dept;

INSERT INTO dept VALUES (10, 'accounting', 'new york')

ALTER TABLE	DEPT MODIFY	dname varchar2(14);


INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30,'SELES', 'CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS (
	ENAME VARCHAR2 (10) ,
	JOB VARCHAR2 (9) ,
	SAL NUMBER, 
	COMM NUMBER
) ;

CREATE TABLE SALGRADE (		-- 급여정보
	GRADE NUMBER, 
	LOSAL NUMBER, 
	HISAL NUMBER
);


INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400) ;
INSERT INTO SALGRADE VALUES (3, 1401, 2000) ;
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999) ;

SELECT * FROM SALGRADE;