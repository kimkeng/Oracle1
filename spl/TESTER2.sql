--모든 컬럼 불러오기
select *
from emp;

--emp 테이블에서 empno, ename컬럼 내용만 출력
select empno,ename
from emp;

--연봉 구하기
select ename,sal, sal*12
from emp;

--널 값을 가진 데이터와 산술 연산하기
select ename, sal, job, sal*12, sal*12+comm, comm, deptno
from emp;

--널 값을 가진 데이터 NVL 함수로 제대로 계산 (NVL)
select ename,job, comm , sal*12+comm, NVL(comm, 0), sal*12+nvl(comm,0)
from emp;

--필드명 붙이기
select ename, sal*12+nvl(comm, 0) as Annsal
from emp;
select ename, sal*12+nvl(comm, 0) as 연봉
from emp;
select ename || '의 직급은 ' || job || '입니다.' as 직급
from emp;
--중복되는 데이터는 한번만 실행
select deptno
from emp;
select distinct deptno
from emp;
--급여(sal)가 500이상인 사원 출력
select *
from emp
where sal >= 500;
--10번 부서에 소속된 사원 출력
select *
from emp
where deptno = 10;
--문자 데이터 조회 (이름이'이문세'인 사원 출력)
select *
from emp
where ename = '이문세';
--입사일 hiredate 이 2005년 1월 1일 이전인 사원만 출력하기
select*
from emp
where hiredate<to_date('2005/01/01', 'yyyy/mm/dd');
--부서번호가 10이고 직급이 '과장'인 사원만 출력하기
select*
from emp
where deptno=10 and job='과장' ;
--부서번호가 10 이거나 직금이 '과장'인 사원만 출력하기
select*
from emp
where deptno=10 or job='과장' ;
--10번 부서에 소속된 사원만 제외하고 출력하기
select *
from emp
where not deptno = 10; --혹은 where deptno != 10;
--같지만 다른 활용 (산술연산)
select *
from emp
where deptno != 10;
--같지만 다른 표현2
select *
from emp
where deptno <> 10; --10보다 작거나 크다.(10만 아니면 된다.)
--급여가 400에서 500사이인 사원의 출력하기
select *
from emp
where sal>=400 and sal<=500;
--급여가 400미만이거나500초과인 사원 출력
select *
from emp
where sal<400 or sal>500;
--커미션이 80이거나, 100이거나, 200인 사원 출력
select *
from emp
where comm=80 or comm=100 or comm=200;
--비교 연산자와 논리 연산자를 결합하여, 400에서 500 사이의 급여를 받는 사원 출력
select *
from emp
where sal>=400 and sal<=500;
--급여기 400에서 500 사이인 사원 출력하기(비교 연산자와 논리 연산자를 결합) 비교연산자와(between) 논리 연산자(and) 의 조합
select *
from emp
where sal between 400 and 500;
--급여가 400 미만이거나 500초과
select *
from emp
where sal<400 or sal>500;
--산술 연산자없이 만듦
select *
from emp
where sal not between 400 and 500;
--2003년에 입사한 사원을 출력하기
select *
from emp
where hiredate between to_date('2003/01/01', 'yyyy/mm/dd') and to_date('2003/12/31', 'yyyy/mm/dd');
--비교 연산자와 논리 연산자를 결합하여, 커미션이 80이거나, 100이거나, 200인 사원 출려 하기
select *
from emp
where comm=80 or comm=100 or comm=200;
--IN 연산자를 사용하여, 커미션이 80이거나, 100이거나, 200인 사원 출력
select *
from emp
where comm IN (80,100,200);
--<> 연산자를 사용하여, 커미션이 80,100,200, 이 모두 아닌 사원 출력
select *
from emp
where comm<>80 and comm<>100 and comm<>200;
--in연산자를 앞에 기술
select *
from emp
where comm not in (80,100,200);
--'이' 성을 가진 사원 찾기
select *
from emp
where ename='이'; --실패
select *
from emp
where ename like '이%'; --성공
--이름에 '성' 이 포함되어 있는 사원을 출력
select *
from emp
where ename like '%성%';
--이름이 '성' 으로 끝나는 사람
select *
from emp
where ename like '%성';
--이름의 두번째 글자가 '성'이고 그 뒤는 무엇이 오든 관계없는 사원 출력
select *
from emp
where ename like '_성%';
--세번째
select *
from emp
where ename like '__성%';
--이름에 '성'을 포함하지 않은 사원 출력
select *
from emp
where ename not like '%성%';
--커미션이 null인 사원
select *
from emp
where comm is null;
--커미션이 null이 아닌 사원
select *
from emp
where comm is not null;




-- 오름차순 정렬을 위한 ASC
--급여를 적게 받는사원부터 많이 받는 사원의 수
select *
from emp
order by sal ASC;
select *
from emp
order by sal; --디폴트가 asc임
--반대
select *
from emp
order by sal DESC;
--사전에 먼저 실린 순서대로 출력
select *
from emp
order by ename asc;
--가장 최근에 입사한 사람
select *
from emp
order by ename DESC;
--급여를 많이 받는 순으로 출력하되, 급여가 같으면 이름의 철자가 빠른 순으로 출력하기
select *
from emp
order by sal desc, ename asc;
--테이블끼리 합집합
select *
from group_star
union
select *
from single_star;

--중복 출력
select *
from group_star
union all
select *
from single_star;
--교집합 출력
select *
from group_star
intersect
select *
from single_star;
--그룹활동만 하는 가수 이름을 출력 (차집합)
select *
from group_star
minus
select *
from single_star;
--싱글 활동만 하는 가수 이름
select *
from single_star
minus
select *
from group_star;

















