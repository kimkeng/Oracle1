--dual 테이블
24 * 60; --계산불가
--테이블을 사용
select 24*60
from emp; --중복이 너무 많음
--dual 테이블 사용
select 24*60
from dual;--얘가 맞음

--현재 날짜 출력
select sysdate
from dual;

--절대값을 구하는 abs 함수
select -10, abs(-10) from dual;
--소수점 아래를 버리는 floor 함수
select 34.5678, floor(34.5678)
from dual;
--소수점 이하 반올림
select 34.5678, round(34.5678)
from dual;
--소수점 이하 두 번째 자리까지 반올림
select 34.5678, round(34.5678,2)
from dual;
--일의 자리까지 반올림 하기 round
select 34.5678, round(34.5678,-1)
from dual;
--특정 자릿수에서 잘라내기
select trunc(34.5678,2), trunc(34.5678,-1), trunc(34.5678)
from dual;
--나눈 나머지 구하기
select mod(27,2), mod(27,5), mod(27,7)
from dual;

--문자 처리 함수
--대소문자 변환함수 사용하기
select 'Welcome to Oracle',
    upper('Welcome to Oracle'),
    lower('Welcome to Oracle'),
    initcap('WELCOME TO ORACLE')
from dual;
--영문자와 한자의 길이를 구하기
select length('Oracle'), length('오라클')
from dual;
--영문자와 한글의 바이트 수 구하기
select lengthb('Oracle'), lengthb('오라클')
from dual;
--4부터 시작해서 문자 3개를 출력하기 sub string
select substr('Welcome to Oracle',4,3)
from dual;
--문자열의 뒤쪽 4번째부터 3글자 추출하기
select substr('Welcome to Oracle',-4,3)
from dual;
--영문자의 문자 수와 바이트 수 구하기
select substr('Welcome to Oracle',3,4),
    substrb('Welcome to Oracle',3,4)
from dual;
--한글의 문자 수와 바이트 수 구하기
select substr('웰컴투오라클',3,4),
    substrb('웰컴투오라클',1,6)
from dual;
--문자열 'WELCOMT TO ORACLE'에 'O'의 위치 구하기
select instr('WELCOMT TO ORACLE','O')
from dual;
select instr('WELCOMT TO ORACLE','O',6,2)
from dual;
select instr('데이터베이스데이터베이스','이',7,1), 
instrb('데이터베이스데이터베이스','이',4,2) --시작바이트 1이 추가되서 13
from dual;
--특정 기호로 채우는 lpad/rpad 함수
select lpad('Oracle',20,'◐')
from dual;
select rpad('Oracle',20,'◐◑')
from dual;
--현재 날짜를 기본 형식과 다른 형태로 출력하기
select sysdate, to_char (sysdate, 'yyyy-mm-dd')
from dual;
--사원들의 입사일을 출력하되 요일까지 함께 출력하기
select hiredate, to_char (hiredate, 'yyyy-mm-dd day')
from emp;
--현재 날짜와 시간을 출력하기
select to_char(sysdate, 'yyyy/mm/dd, am hh:mi:ss')
from emp;
--통화 기호를 붙여 출력하기
select sysdate, to_char(1230000), to_char(1230000, 'L999,999,999')
from dual;
--빈 여백을 0 으로 채우기
select sysdate, to_char(123456,'00000000000')
from dual;

--2007년4월2일에 입사한 사원을 검색하기 위해서, 수치 데이터를 제시
select ename, hiredate
from emp;
where hiredate = to_date(20070402, 'yyyymmdd')
--올해 며칠이 지났는지 알아보기 위해 문자 데이터를 제시
select sysdate - '2019/01/01'
from dual;
select trunc (sysdate - to_date('2019/01/01','yyyy/mm/dd'))
from dual;
--'20,000'과 '10,000'의 차이 값을 알아보기 위해서 문자를 숫자로 형 변환한 후 연산하기
select to_number('20,000', '99,999') - to_number('10,000', '99,999')
from dual;

--날짜 함수
--현재 날짜 알아보기
select to_char(sysdate,'yyyy/mm/dd')
from dual;

--현재 날짜를 기준으로 어제와 내일의 날짜 계산하기
select to_char(sysdate-1, 'yyyy/mm/dd') 어제,
    to_char(sysdate, 'yyyy/mm/dd') 오늘,
    to_char(sysdate+1, 'yyyy/mm/dd') 내일
from dual;

--특정 날짜(date)를 달(month)을 기준으로 버리기
select to_char(hiredate, 'yyyy/mm/dd')입사일 ,
    to_char(trunc(hiredate,'month'), 'yyyy/mm/dd') 입사일
from emp;

--날짜 사이의 개월 수 구하기
select ename, sysdate 오늘, to_char(hiredate, 'yyyy/mm/dd') 입사일,
    trunc(months_between (sysdate, hiredate)) 근무달수
from emp;
--입사 날짜에 6개월을 추가하기
select ename, to_char(hiredate, 'yyyy/mm/dd') 입사일,
    to_char(add_months(hiredate,6),'yyyy/mm/dd')"입사 6개월 후"
from emp;
--오늘을 기준으로 최초로 도래하는 수요일은 언제인지 알아보기
select to_char(sysdate, 'yyyy/mm/dd') 오늘,
    to_char(next_day(sysdate,'수요일'),'yyyy/mm/dd') 수요일
from dual;
--입사한 달의 마지막 날을 구하기
select ename, to_char(hiredate,'yyyy/mm/dd') 입사일,
    to_char(last_day(hiredate), 'yyyy/mm/dd') "마지막 날짜"
from emp;



--null값을 다른 값으로 변환하는 nal 함수
--연봉을 올바르게 계산하여 부서별로 출력하기
select ename, sal, comm, sal*12+cmmm, deptno, nvl(comm,0) ,sal*12+nvl(comm,0)
from emp
order by deptno;
select ename, sal, comm, nvl2(comm, sal * 12 + comm, sal*12)
from emp
order by deptno;
--nullif 함수는 두 표현식을 비교하여 동일한 경우에는 null을 반환하고, 동일하지 않으면 첫 번째 표현식을 반환함
select nullif('A','A'),nullif('A','B')
from dual;
--coalesce 함수는 인수 중에서 null이 아닌 첫 번째 인수를 반환하는 함수
select ename, sal, comm,
    coalesce(comm, sal, 0)
from emp
order by deptno;
--선택을 위한 decode 함수
select ename,deptno, decode(deptno, 10,'경리부', 20,'인사과', 30,'영업부', 40,'전산부') as dname
from emp;
--조건에 따라 서로 다른 처리가 가능한 case 함수
select ename, deptno,
    case when deptno=10 then '경리부'
         when deptno=20 then '인사과'
         when deptno=30 then '영업부'
         when deptno=40 then '전산부'
    end as dname
from emp;


