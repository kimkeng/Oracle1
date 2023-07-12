--그룹 함수
select deptno, round(sal, 3)
from emp;
select sum(sal)
from emp;
--사원들의 급여 총액, 금여 평균, 최대 급여, 최소 급여 출력
select sum(sal) as "급여총액",
        round(avg(sal)) as"급여평균",
        max(sal) as "최대급여",
        min(sal) as "최소급여"
from emp;
--최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일을 출력하기
select to_date(max(hiredate),'yy/mm/dd'),
       to_date(min(hiredate),'yy/mm/dd')
from emp;
--그룹 함수와 null값
--사원들의 커미션 총액 구하기
select sum(comm) as "커미션 총액"
from emp;
--사원들 중에서 최대 급여 구하기
select max(sal)
from emp;
--최대 급여를 받는 사원의 이름을 출력
--출력 안되는 이유는 결과값이 한개가 아닐수 있음(서브 쿼리 문을 배워야 함)
select ename, max(sal)
from emp;
--커미션을 받는 사원의 수
select count(comm) as "커미션 받는 사원의 수"
from emp;
--전체 사원의 수와 커미션을 받는 사원의 수를 구하기
select count(*) as "전체 사원의 수",
count(comm) as "커미션 받는 사원의 수"
from emp;
--직위의 종류 출력하기
select job from emp
order by job;
select count (distinct job) as "업무수"
from emp;



--group by 절
--사원 테이블을 부서번호로 그룹 짓기
--주의할 점은 group by 절 다음에는 컬럼의 별칭을 사용할 수 없고 반드시 컬럼 이름을 기술해야 한다는 점
select deptno
from emp
group by deptno;
--소속 부서별 급여 평균 구하기
--우선 전체 사원을 소속 부서별로 그룹화해야 함.
select avg(sal) as "급여 평균"
from emp
group by deptno;
--소속 부서별 급여 평균을 부서번호와 함께 출력하기
select deptno as "부서 번호", avg(sal) as "급여 평균" --ename못집어넣음
from emp
group by deptno;
--소속 부서별 급여 총액과 급여 평균 구하기
select deptno, sum(sal) as "급여 총액", avg(sal) as "급여 평균"
from emp
group by deptno;
--소속 부서별 최대 급여와 최소 급여 구하기
select deptno,  max(sal) as "최대 급여", min(sal) as "최소 급여"
from emp
group by deptno;
--부서별로 사원수와 커미션을 받는 사원수 구하기
select deptno, count(*) "부서별 사원수", count(comm) "커미션을 받는 사원수"
from emp
group by deptno;




--그룹 결과 제한 : having 절
--부서별 급여 평균이 500 이상인 부서번호와 급여 평균 구하기
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 500;
--최대 급여가 500을 초과하는 부서에 대해서 최대 급여와 최소 급여 구하기
select deptno, max(sal)"최대 급여", min(sal)"최소 급여"
from emp
group by deptno
having max(sal) > 500;
--사원을 제외하고 급여 총액이 1000 이상인 직급별 급여 총액 구하기
select job, count(*), sum(sal)
from emp
where job not like '%사원%'
group by job
having sum(sal) >= 1000
order by sum (sal);
--최고 급여 출력하기
select max(avg(sal))
from emp
group by deptno;
--여기 까지가 시험범위

--테이블끼리 더하고 빼기
--group_star 테이블에서 싱글 활동만 하는 가수 이름을 출력
select * from single_star minus select * from group_star; --싱글 minus
select * from single_star union select * from group_star; --그룹 union 