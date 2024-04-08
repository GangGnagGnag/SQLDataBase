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













