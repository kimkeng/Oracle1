--테이블 구조 조작어
--DDL : Data Definition Language : 생셩, 변경, 삭제 명령어 (create, alter, drop, rename)
--데이터 정의어(DDL : Data Definition Language) - 테이블 생성, 수정, 삭제, 변경 할때 생성


-- 데이터 조작어
-- DML : Data Manipulation Language
-- insert, select, Update, Delete (CRUD : C: 생성, R: 읽기, U: 수정, D: 삭제)


--7단원에서 배울 내용 (DB 권한 조작어)
--데이터 제어어
--DCL : Data Control Language
--데이터베이스 관리자가 데이터 관리를 목적으로 권한 부여, 권한 취소 등 관리를 목적으로 사용
--commit, rollback, grant, revoke (웬만하면 쓰지말아라)

---------------------------------------------------------------------------------------------

--테이블 생성
create table dept01 (
    deptno number(2),
    dname varchar2(14), --더 큰걸 넣으면 그만치 늘어남
    loc varchar2(13)
);

desc dept01;
--경리부 입력하기
insert into dept01 values (10,'경리부','서울');
--추가되었는지 확인하기
select * from dept01;
--아직 결정되지 않는 부서의 장소는 어떻게 입력?
insert into dept01 values (30,'인사부','');
truncate table dept01;
--묵시적인 UNLL값으로 넣는 방법
insert into dept01
(deptno, dname)
values(30,'인사부');
--NULL 값을 넣어서 입력하는 방법
insert into dept01
values(30,'전산부',NULL);
--테이블 삭제
drop table emp02;
create table emp02(
    empno number(4),
    enmae varchar2(10),
    job varchar2(9),
    hiredate date,
    deptno number(2)
);
--테이블이 생성되었는지 확인
desc emp02;
--날짜 데이터 입력하기
insert into emp02
values(1001,'세균맨','악당','2015/03/01',20);
--확인하기
select * from emp02;
insert into emp02
values(1003,'오지호','과장',sysdate,30);
select * from emp02;
insert into emp02
values(1002,'한예슬','대리',to_date('2014,05,01','yyyy/mm/dd'),40);
select * from emp02;

--테이블의 내용을 수정하는 UPDATE(수정)
--where 절로 특정 로우만 수정
update dept01
set dname='생산부', loc='제주'
where deptno=10;
select * from dept01;
--컬럼 값 여러개를 한 번에 수정하기
update dept01
set dname='생산부2', loc='부산'
where deptno=30;

select * from dept01;

--where deptno를 지정안해주면 다 바뀜
update dept01
set dname='생산부2', loc='부산';


--Delete 활용
--where 절로 특정 로우만 삭제하기
delete dept01
where deptno=30;
select * from dept01;

--emp02
drop table emp02;
create table emp02
as
select * from emp;
select * from emp02;
--삭제했다가 되살리기
delete emp02;
select * from emp02;
rollback;
--삭제했다가 못 되살리기
delete emp02;
commit; --데이터베이스의 용량을 줄이기 위해 사용(완전 삭제),(확정 짓다)
select * from emp02;
rollback;


