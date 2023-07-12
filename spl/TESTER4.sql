-- 그룹 함수
select deptno, round(sal, 3)
from emp;
select sum(sal)
from emp;
--사원들의 급여 총액, 급여 평균, 최대 급여, 최소 급여 출력하기
select sum(sal) as "급여 총액",
    round(avg(sal)) as "급여 평균",
    max(sal) as "최대 급여",
    min(sal) as "최소 급여"
from emp;

--최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일을 출력하기
--(서브쿼리를 배우기 전까지는 그룹함수와 여러행 함수는 같이 출력 못함)
select to_date(max(hiredate),'yyyy/mm/dd'),
    to_date(min(hiredate),'yyyy/mm/dd')
from emp;
--사원들의 커미션 총액 구하기
select sum(comm) as"커미션 총액"
from emp;
--사원들 중에 최대 급여 구하기
select max(sal)
from emp;
--실행 불가 예
select ename, max(sal)
from emp;
--커미션을 받는 사원의 수
select count(comm)as "커미션 받는 사원의 수"
from emp;
--count(*)를 적용하면 테이블 전체의 로우 개수를 카운트
select count(*) as "전체 사원의 수",
    count(comm) as "커미션 받는 사원 수"
from emp;
-- 직위의 종류 출력하기
select job from emp
order by job;
--중복되지 않는 직위
select count(distinct job) as "업무수"
from emp;


--group by 절
--사원 테이블을 부서번호로 그룹 짓기
select deptno
from emp
group by deptno;
--소속 부서별 급여 평균 구하기
select avg(sal) as "급여 평균"
from emp
group by deptno;
--소속 부서별 급여 평균을 부서번호와 함께 출력하기
select deptno as "부서 번호", avg(sal) as "급여 평균"
from emp
group by deptno;

select deptno, ename, avg(sal)
from emp
group by deptno; -- 실행불가
--소속 부서별 급여 총액과 급여 평균 구하기
select deptno, sum(sal), avg(sal)
from emp
group by deptno;
--소속 부서별 최대 급여와 최소 급여 구하기
select deptno, max(sal) as "최대 급여", min(sal) as"최소 급여"
from emp
group by deptno;
--부서별로 사원수와 커미션을 받는 사원수 구하기
select deptno, count(*) as "사원수", count(comm)"커미션을 받는 사원수"
from emp
group by deptno;



--그룹 결과 제한 : having 절
--부서별 급여 평균이 500이상인 부서번호와 급여 평균 구하기
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >=500;
--최대 급여가 500을 초과하는 부서에 대해서 최대 급여와 최소 급여 구하기
select deptno, Max(sal) as "최대", min(sal) as "최소"
from emp
group by deptno
having max(sal)>=500;
--사원을 제외하고 급여 총액이 1000 이상인 직급별 급여 총액을 오름차순으로...
select job, count(*), sum(sal)
from emp
where job not like '%사원%'
group by job
having sum(sal)>=1000
order by sum(sal) ;
--평균 급여가 최고인 금액 출력
select max(avg(sal))
from emp
group by deptno;
--group기준으로 묶어서 계산하기위해 group by를 씀

--소속부서별 최고 평균 급여 (이중 그룹 함수여서 한계가 있음)
--select deptno, max(sal)
--from emp
--group by deptno
--having deptno(max(sal)) 
--order by avg(sal);