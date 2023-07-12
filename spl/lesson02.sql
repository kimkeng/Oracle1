--얘는 주석

--문장과 절
select * from dept;
--사원 테이블의 모든 정보 출력
select * from emp;
--사원들 급여
select * from salgrade;
--emp 테이블에서 empno, ename 컬럼 내용만 출력
select empno, ename from emp;

--산술 연산자
--연봉
select ename,sal,sal*12 from emp;
--null 값을 가진 데이터와 산술 연산하기
select ename, sal, job, sal*12, sal*12+comm, comm, deptno from emp;
--null 값을 가진 데이터를 NVL 함수로 찐 계산 //nvl 널 값을 뭐로 대신해라 하는 기능
--(NVL : Null Value)
select ename, comm, sal*12+comm, NVL(comm, 0), sal*12+NVL(comm,0) from emp;
--쿼리 결과 화면에서 컬럼 헤딩 보기
select ename, sal*12+NVL(comm, 0) from emp;
--AS로 컬럼에 별칭 부여하기
select ename, sal*12+NVL(comm, 0) as annsal from emp;
--AS 없어도 결과는 같음
select ename, sal*12+NVL(comm, 0) 연봉 from emp;
--큰따옴표 "" 로 별칭 부여하기
select ename, sal*12+NVL(comm, 0) "Annsal" from emp;
--Concatenation 연산자의 정의와 사용
select ename || '의 직급은 ' || job || '입니다.'as 직급 from emp;
--사원 테이블에서 부서 번호 출력하기
select deptno from emp;
--중복 걸러내기
select distinct deptno from emp;