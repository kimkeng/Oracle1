-- 테이블 구조 조작어
-- DDL : Data Definition Language
-- Create, Alter, Drop, Rename
-- 테이블 생성, 수정, 삭제, 변경 할때 사용


-- 데이터 조작어
-- DML : Data Manipulation Language
-- insert, select, Update, Delete (CRUD : C: 생성, R: 읽기, U: 수정, D: 삭제)
-- 데이터를 생성, 수정, 삭제, 변경할때 사용


-- 권한 조작어
-- DCL : Data Control Language
-- Commit, Rollback, Grant, Revoke
-- 데이터베이스 관리자가 데이터 관리를 목적으로 권한 부여, 권한 취소 등 관리를 목적으로 사용


------------------------------------------------------------------------------







select * from dept;
--중복된 값은 허용 안함
insert into dept
values (10,'test','test'); --오류
--null값도 허용하지 않음
insert into dept
values (null,'test','test'); --오류
select * from dept; 


--unique : 중복된 값을 허용하지 않는다. 항상 유일한 값을 갖도록 한다.
--primary key : not null 조건과 unique 조건을 결합한 형태
--foreing key : 참조되는 테이블에서 컬럼의 값을 존재하면 허용한다. (foreing : 외국인)
--check(not null) : 저장 가능한 데이터 값의 조건을 지정하여 설정한 값만을 허용한다.

--P : Primary Key
--R : Foreing Key (Reference : 참조)
--U : Unique
--C : Check = Not Null
--사용자 제약 조건
desc USER_CONSTRAINTS;

--제약조건이 보임
select CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE
from USER_CONSTRAINTS;
--Colum Name이 보임
SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_CONS_COLUMNS;

--혹시 테이블이 만들어져 있을까봐
drop table emp01;
--제약조건 없이 emp01 테이블 생성하기
create table emp01(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(2)
);
select * from emp01;
insert into emp01
values(null, null, '사원',30);
select * from emp01;
desc emp01;
select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP01';



--제약조건을 걸어본다.
DROP TABLE EMP02;
create table emp02(
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
);
select * from emp02;
insert into emp02
values(null,null,'사원',30);
desc emp02;
insert into emp02
values(1000,'세균맨','악당',30);
select * from emp02;



--유일한 값만 허용하는 UNIQUE 제약조건
insert into emp02
values(1000,'호빵맨','영웅',20);
select * from emp02;
--혹시 만들어져 있을까봐
drop table emp03;
--제약 조건 설정하여 emp03 테이블 생성하기
create table emp03(
    empno number(4) unique,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
);
desc emp03;
select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP03'; -- where에서 ''안에는 꼭 대문자로 써야함.
insert into emp03
values(1000,'세균맨','악당',30);
select * from emp03;
insert into emp03
values(1000,'호빵맨','영웅',20);
insert into emp03
values(null,'식빵맨','친구',20);
select * from emp03;



drop table emp03;
--빠르게 확인하기 위해 (unique + notnull)
--제약 조건 설정하여 emp03 테이블 생성하기
create table emp03(
    empno number(4) unique not null, --유니크 + 낱널을 같이 넣을 수 있음
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2)
);
desc emp03;
select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP03'; -- where에서 ''안에는 꼭 대문자로 써야함.
insert into emp03
values(1000,'세균맨','악당',30);
select * from emp03;
insert into emp03
values(1000,'호빵맨','영웅',20);
insert into emp03
values(null,'식빵맨','친구',20);
select * from emp03;



--레이블(라벨)로 제약조건 이름을 명시해서 제약조건 설정
drop table emp04;
create table emp04(
    empno number(4) constraint emp04_empno_uk unique,
    ename varchar2(10) constraint emp04_ename_nn not null,
    job varchar2(9),
    deptno number(2)
);
drop table emp04;
desc emp04;

--제약조건이 보임
select CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE
from USER_CONSTRAINTS
where table_name in ('EMP04');

insert into emp04
values(1000,'세균맨','악당',30);

insert into emp04
values(1000,'콩콩이','빌런',30);



--데이터 구분을 위한 primary key 제약조건
--이름은 : emp05_empno_pk
--primary key 이렇게
drop table emp05;
create table emp05(
    empno number(4) constraint emp05_empno_pk primary key,
    ename varchar2(10) constraint emp05_ename_nn not null,
    job varchar2(9),
    deptno number(2)
);
insert into emp5
values(1000,'세균맨','악당',30);
-- 오류 : 중복이여서
insert into emp05
values(1000,'콩콩이','빌런',20);
-- 오류 : primary는 not null이 포함되어 있어서
insert into emp05
values(null,'식빵맨','따까리',10);

--오류안나는 경우
insert into emp05
values(5555,'호빵맨','영웅',10);
select * from emp05;



--foreing key 제약조건
drop table emp06;
create table emp06(
    empno number(4) constraint emp06_empno_pk primary key,
    ename varchar2(10) constraint emp06_ename_nn not null,
    job varchar2(9),
    deptno number(2)
    constraint emp06_deptno_fk references dept(deptno)
);
insert into emp06
values(1010,'세균맨','악당',30);
drop table emp06;
select * from emp06;
--오류
insert into emp06
values(1010,'세균맨','악당',50);
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP06');



--check 제약조건
create table emp07(
    empno number(4) constraint emp07_empno_pk primary key,
    ename varchar2(10) constraint emp07_ename_nn not null,
    sal number(7, 2) constraint emp07_sal_ck check(sal between 500 and 5000),
    gender varchar2(1) constraint emp07_gender_ck check(gender in ('M','F'))
);
 
insert into emp07
values(1000,'세균맨',500,'M');

insert into emp07
values(1001,'콩콩이',500,'F');

select * from emp07;
select constraint_name, constraint_type, r_constraint_name, table_name, search_condition
from user_constraints
where table_name in ('EMP07');

--Default 제약조건
drop table dept01;
create table dept01(
    drptno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) default '서울'
);
insert into dept01
(deptno, dname)
values(10,'경리부');
select * from dept01;

--제약조건 지정하는 2가지 방법
--alter table로 제약조건을 추가할 때
drop table emp01;
create table emp01(
    empno number(4) primary key,
    ename varchar(10) not null,
    job varchar2 (2) unique,
    deptno number(2) references dept(deptno)
);
drop table emp02;
create table emp02(
    empno number(4),
    ename varchar(10) not null,
    job varchar2 (9),
    deptno number(2),
    primary key(empno),
    unique(job),
    foreign key(deptno) references dept(deptno)
);
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP02');
select constraint_name, table_name, column_name
from user_cons_columns
where table_name in('EMP02');


--제약조건 추가하기 (시험)
drop table emp01;
create table emp01(
    empno number(4),
    ename varchar(10),
    job varchar2 (2),
    deptno number(2)
);
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP01');
desc emp01;
alter table emp01
add constraint emp01_empno_pk primary key(empno);
--MODIFY로 not null 제약조건 추가하기
alter table emp01
modify ename constraint emp01_ename_nn not null;
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP01');
desc emp01;

--제약조건 제거하기
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in ('EMP05');
select * from emp05;
insert into emp05
values(1000,'세균맨','악당',20);
alter table emp05
drop constraint emp05_empno_pk;
select * from emp05;
insert into emp05
values(null,'식빵맨','셔틀',10);
insert into emp05
values(null,null,'제빵사',10);--(name에 check제약을 걸어서 이름에 null값을 넣으면 오류가뜸.)
alter table emp05
drop constraint emp05_ename_nn;
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in ('EMP05');--(아무것도 없는거 확인하기)



--제약조건을 비활성화 시키기
drop table emp01;
create table emp01(
    deptno number(2) constraint dept01_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13)
);
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('DEPT01');
insert into dapt01
values(30,'전산부','서울');
select * from dept01;

--다죽여
drop table emp01;
drop table dept01;
create table dept01(
    deptno number(2) constraint dept01_deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13)
);
insert into dept01 select * from dept;
select * from dept01;

create table emp01(
    empno number(4),
    ename varchar(10) constraint emp01_ename_nn not null,
    job varchar2(9),
    deptno number(2),
    constraint emp01_empno_pk primary key(empno),
    constraint emp01_job_uk unique(job),
    constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno)
);
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP01');

 
insert into emp01
values(1000,'허준','사원',10);

--사원번호가 50번은 없어서 오류
insert into emp01
values(1010,'홍길동','사원',50);
delete from dept01
where deptno=10;
alter table emp01
disable constraint emp01_deptno_fk; --disable은 잠시 중지 라는뜻.
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP01');
delete from dept01 where deptno=10;
select * from dept01;



--외래 키 제약조건을 활성화 하기
--중요한 오류
alter table emp01
enable constraint emp01_deptno_fk;
insert into dept01
values(10,'경리부','서울');
select * from dept01;
alter table emp01
enable constraint emp01_deptno_fk;
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in('EMP01');


--CASCADE
alter table dept01
disable primary key cascade;
select constraint_name, constraint_type, r_constraint_name, table_name, status
from user_constraints
where table_name in('dept01','EMP01');

--오류 기본키 조건을 삭제
alter table dept01
drop primary key;
alter table dept01
disable primary key cascade;
select constraint_name, constraint_type, r_constraint_name, table_name, status
from user_constraints
where table_name in('dept01','EMP01');

