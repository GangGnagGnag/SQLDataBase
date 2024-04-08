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
modify empno  


