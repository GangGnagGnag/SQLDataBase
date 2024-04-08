/* DDL */
-- 테이블 생성
create table emp_ddl(
                        empno number(4),
                        ename varchar2(10),
                        job varchar2(9),
                        mgr number(4),
                        hiredate date,
                        sal number(7,2),
                        comm number(7,2),
                        deptno number(2)
);

create table
    emp_ddl1 as select *
                from emp
                where DEPTNO = 30;

select *
from emp_ddl1;

create table
    emp_ddl2 as select *
                from emp
                where 1 != 1;

select *
from emp_ddl2;

-- 테이블 수정
alter table emp_ddl1
    add hp varchar2(20);    -- 열추가

select *
from emp_ddl1;

alter table emp_ddl1
    rename column hp to tel;    -- 컬럼명 변경

commit;

alter table emp_ddl1
    modify empno number(10);

alter table emp_ddl1
    drop column tel;

truncate table emp_ddl1; -- 전체 테이블 값 삭제

drop table emp_ddl1;    -- 테이블 삭제
drop table emp_ddl2;

/* 제약조건 */
create table tbl_ex (
                        login_id    varchar2(20) not null ,
                        login_pw    varchar2(20) not null,
                        tel         varchar2(20)
);

select *
from tbl_ex;

insert into tbl_ex te (login_id, login_pw, tel)
values('AAAA', '1234', null);
-- insert into tbl_ex te (login_id, login_pw, tel)
-- values('AAAA', null , null); -- login_pw 무조건 값을 넣어야하 기때문에 오류가뜸
insert into tbl_ex te (login_id, login_pw, tel)
values('AAAA', 'null', null);   -- 문자열로 값이 들어가기 때문에 오류는 드지 않음

--ALTER TABLE tbl_ex
--    MODIFY tel NOT null;	-- 기존에 데이터가 변경할 제약조건에 부합되면 안된다

update tbl_ex
set tel = '010-1111-1111' where login_id = 'AAAA';

-- UNIQUE
CREATE TABLE TEL_UNIQ
(
    login_id varchar2(20) primary key ,     -- 중복과 null 을 허용하지 않는다
    login_pw varchar2(20) not null,
    tel      varchar2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('EMP', 'DEPT');

/* CHECK */
-- 010-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9];   // 0-9까지의 범위를 지정해주는 방법도 있고
-- 010-\d\d\d\d-\d\d\d\d;                           // \d로 한자리수만 입력하게도 사용가능
-- 010-\d{4}-\d{4}

CREATE TABLE TBL_CHK (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
    LOGIN_PW    VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_CK CHECK ( LENGTH(LOGIN_PW) > 3 ),
    TEL         VARCHAR(20)
);


-- 1. EMP 테이블에서 사원번호가 7521인 사원의 직업과 같고, 사원번고 7934인 사원의 급여보다 많은 사원의 사번, 이름, 직업 ,급여출력
SELECT EMPNO, ENAME, JOB, SAL
    FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE EMPNO = 7521 ) -- 서브쿼리
    AND SAL > (SELECT SAL FROM EMP WHERE EMPNO = 7934); -- ()안에 앞에 비교해해야하는 값이랑 같은지 확인하기 위함

-- 2. 직업별(GROUP BY)로 최소 급여를 받는 사원의 정보를 사원번호, 이름 ,업무, 부서명으로 출력 (직업별 내림차순)
SELECT e.EMPNO, e.ENAME, e.JOB, d.DNAME --테이블이 다른경우에 JOIN 사용
    FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO               -- EMP, DEPT 에대한 약칭
    WHERE e.SAL in (SELECT MIN(SAL) FROM EMP GROUP BY JOB )  -- 서브쿼리 절에는 min 셀 다중행이 출력 ( = 이랑 in 이랑 차이가 있으므로 확인)
    order by job desc;

-- 3. 각 사원별 커미션이 0 또는 NULL이고 부서 위치가 'GO'로 끝나는 사원의 정보를 사원번호, 사원이름, 커미션, 부서번호, 부서명, 부서위치를 출력하시오. (보너스가 NULL이면 0으로 출력)
SELECT e.EMPNO, e.ENAME, NVL(e.COMM, 0), d.DEPTNO, d.DNAME, d.LOC   --  NVL(e.COMM, 0) 함수 COMM이 NULL 일때 0 으로 바꿔준다.
    FROM EMP e JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE COMM = 0 OR COMM IS NULL AND d.LOC LIKE '%GO'        --NULL을 쓸때는 IS 를 사용


