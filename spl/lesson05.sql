--테이블 구조 조작어
--ddl : Data Definition Language : 생셩, 변경, 삭제 명령어 (create, alter, drop, rename)
--데이터 정의어(DDL : Data Definition Language) - 테이블 생성, 수정, 삭제, 변경 할때 생성


-- 데이터 조작어
-- DML : Data Manipulation Language
-- insert, select, Update, Delete (CRUD : C: 생성, R: 읽기, U: 수정, D: 삭제)


--7단원에서 배울 내용 (DB 권한 조작어)
--데이터 제어어(DCL : Data Control Language)
--데이터베이스 관리자가 데이터 관리를 목적으로 권한 부여, 권한 취소 등 관리를 목적으로 사용
--commit, rollback, grant, revoke

---------------------------------------------------------------------------------------------

--사원 정보를 저장 하기 위한 테이블 생성하기
--테이블 삭제
drop table emp01; 
--테이블 생성
create table emp01(
    empno number(4),
    ename varchar2(14),
    sal number(7,3)
);
--테이블 생성 확인
desc emp01;
--사원 테이블에 날짜 타입을 가지는 birth 컬럼 추가하기
alter table emp01
add(birth date);
--사원 이름 컬럼 크기 변경하기
alter table emp01
modify ename varchar2(30);
--사원 테이블에서 이름 컬럼 제거하기
alter table emp01
drop column ename;
--사원 테이블에서 사원번호 제거하기
alter table emp01
set unused(empno); --드랍과 같은건데 알아만 두고 드랍으로 사용할것.


--테이블명 변경하기
rename emp01 To emp02;
desc emp01; --이름변경해서 얘는 없음
desc emp02;


--테이블 제거
drop table emp02;


--user_tables로 사용자가 소유한 테이블에 대한 정보 조회
select table_name from user_tables; --시험문제
--all_tables로 테이블에 대한 정보 조회하기
select owner, table_name from all_tables;


--emp 테이블을 복제하여 emp02 테이블 만들기
create table emp02
as
select * from emp;
--emp02 테이블의 데이터 확인
select * from emp02;
--emp02 내용을 모두 삭제하기
truncate table emp02;
--구조는 섹제되지 않음을 확인
select * from tab;




