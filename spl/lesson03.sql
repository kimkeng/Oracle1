--DUAL(듀얼 : 이중의) 테이블
--하루가 몇분인지 계산
--select 24*60 from emp; --mp테이블의 갯수 만큼 행이 쓸모없이 출력

--오라클에서 제공해주는 가상 테이블 (dual)로 계산
select 24*60 from dual;

--현재 날짜(sysdate) 가상 테이블(dual) 로 조회
select sysdate from dual;

--숫자 함수
--절대값을 구하는ABS 함수
select -10, abs(-10) from dual;

--소수점 아래 버리기(floor)
select 34.5678, floor(34.5678) from dual;

--소수점 반올림(round) 하기
select 34.5678, round(34.5678) from dual;

--소수점 두번째 자리 반올림(round)
select 34.5678, round(34.5678,2) from dual;

--일의 자리까지 반올림(round) 하기
select 34.5678, round(34.5678, -1) from dual;

--특정 자릿수에서 내림(trunc) 하기
select trunc(34.5678), trunc(34.5678, -1), trunc(34.5678) from dual;

--나머지(mod) 구하기
select mod(27, 2), mod(27, 5), mod(27, 7) from dual;

--문자 처리 함수
--대소문자 변환함수 사용하기
select 'Welcome to Oracle',
    upper('Welcome to Oracle'),
    lower('Welcome to Oracle'),
    initcap('WELCOM TO ORACLE') from dual;
--문자 길이를 구하는 함수
--영문자와 한글의 길이를 구하기
select length('oracle'), length('오라클') from dual;
--영문자와 한글의 바이트 수 구하기 (한글 한 자는 3바이트를 차지)
select lengthb('oracle'), lengthb('오라클') from dual;
--문자 조작 함수
--문자열 일부만 추출하는 substr 함수
--4부터 시작해서 문자 3개를 추출하기(4번째 부터 3글자)
select substr('Welcome to Oracle',4,3) from dual;
--문자열의 뒤쪽 4번쨰부터 3글자 추출하기
select substr('Welcome to Oracle',-4,3) from dual;

--바이트 수를 기준으로 문자열 일부만 추출하는 sunbstrb 함수
--영문자의 문자 수와 바이트 수 구하기(영문 1글자는 메모리에 1바이트로 저장 결과 동일)
select substr('Weelcome to Oracle',3,4),
    substr('Weelcome to Oracle',3,4) 
from dual;
--한글의 문자 수와 바이트 수 구하기 substr(한글 1글자는 1바이트 : 오라클)
-- substrb(한글 1글자는 3바이크 : 컴)
select substr('월컴투오라클',3,4), -- substr 에서 3은 세번째부터 4글자 실행해라
    substrb('웰컴투오라클',1,15)  -- 1번부터 15바이트(5글자)
from dual;

--특정 문자의 위치를 구하기 (instr)
select instr('WELCOME_TO_ORACLE', 'E') from dual; --제일 먼저 보이는 스펠 E 찾기

--영문자에서 시작 위치와 발견 위치를 지정하여, 문자열에서 문자 한 개의 위치 찾기
select instr('WELCOME_TO_ORACLE', 'O', 6, 2)from dual; --6번째 글자부터 2번째에 있는 스펠 O 찾기
select instr('데이터베이스데이터베이스','이',7,1), --7번째부터 첫번째에 있는 '이' 찾기 (8)
    instrb('데이터베이스데이터베이스','이',4,2) FROM DUAL; --

--특정 기호로 채우는 LPAD/RPAD 함수
--왼쏙에 특정 기호로 채우기(20자리의 공간마련 왼쪽에 기호 채우기)
SELECT LPAD('Oracle',20,'#') from dual; --20자를 체우고 비는 공간에 # 넣기
--오른쪽에 특정 기호로 채우기 (20자리의 공간마련 오른쪽에 기호 채우기)
select rpad('Oracle',20,'#') from dual; --20자를 체우고 비는 공간에 # 넣기

--형 변환 함수
--문자형으로 변환하는 TO_CHAR 함수
--날짜를 문자형으로 변환하기
-- 현재 날짜를 기본형식과 다른 형태로 출력하기
select sysdate, TO_CHAR(sysdate, 'yyyy-mm-dd')from dual;
--사원들의 입사일을 출력하되 요일까지 함께 출력하기
    select ename, hiredate, to_char(hiredate, 'yyyy-mm-dd day')from emp;
--현재 날짜와 시간을 출력하기
select to_char(sysdate, 'yyyy/mm/dd, am hh:mi:ss')from dual;

--숫자를 문자열로 변환하기
--통화 기호를 붙여 출력
select sysdate, to_char(1230000), to_char(1230000, 'L999,999,999') from dual;
--빈 여백을 0으로 채우기
select sysdate, to_char(123456, '0000000000'), to_char(123456,'999,999,999') from dual;
--2007년 4월 2일에 입사한 사원을 검색하기 위해서, 수치 데이터를 제시
--select ename, hiredate from emp where hiredate = 20070402; (X) --형식 틀림
select ename, hiredate from emp where hiredate = to_date(20070402,'yyyymmdd'); --to_date는 파라메타 두개를 받음
--올해 며칠이 지났는지 알아보기
--select sysdate - '2023/04/21' from dual; (X) --형식 틀림
select trunc(sysdate - to_date('2023/04/21','yyyy/mm/dd')) from dual; --2023/04/21에서 오늘날짜를 빼줌

--숫자형으로 변환하는 to_number 함수
--'20,000'과 '10,000' 의 값을 알아보기 위해서 빼기
--select '20,000' - '10,000' from dual; (X) --형식 틀림
select to_number('40,000' , '99,999') - to_number('70,000' , '99,999') from dual;


--현재 날짜를 변환하는 sysdate 함수
select to_char(sysdate, 'yyyy/mm/dd') from dual;
--현재 날짜를 기준으로 어제와 내일의 날짜를 계산하기
select to_char(sysdate-1, 'yyyy/mm/dd') 어제,
    to_char(sysdate, 'yyyy/mm/dd') 오늘,
    to_char(sysdate+1, 'yyyy/mm/dd') 내일,
    to_char(sysdate+100, 'yyyy/mm/dd') as 백일후 --alias알리아스 네임은 생략가능
from dual;
--특정 날짜(date)를 달(month)을 기준으로 버리기(입사일을 달 기준으로 절삭)
select to_char(hiredate, 'yyyy/mm/dd') 입사일,
    to_char(trunc(hiredate, 'month'), 'yyyy/mm/dd') 입사일
from emp;
--날짜 사이의 개월 수 구하기
select ename, sysdate 오늘, to_char(hiredate, 'yyyy/mm/dd') 입사일,
    trunc(months_between (sysdate, hiredate)) 근무달수
from emp;
--입사 날짜에 6개월 추가하기
select ename, to_char(hiredate, 'yyyy/mm/dd') 입사일,
    to_char(add_months(hiredate, 6), 'yyyy/mm/dd') "입사 6개월 후"
from emp;

--오늘을 기준으로 다가오는 수요일 날짜 알아보기
select to_char(sysdate, 'yyyy/mm/dd') 오늘,
    to_char(next_day(sysdate,'수요일'),'yyyy/mm/dd') 수요일
from dual;
--입사한 달의 마지막 날을 구하기
select ename, to_char(hiredate, 'yyyy/mm/dd') 압사일,
    to_char(last_day(hiredate), 'yyyy/mm/dd') "마지막 날짜"
from emp;

--NULL을 다른값으로 변환하는 NVL 함수
--select ename, sal, comm, daptno
--from emp
--order by deptno;
--연봉을 올바르게 계산하여 부서별로 출력하기
select ename, sal, comm, sal*12+comm, deptno, NVL(comm, 0), sal*12+NVL(comm, 0)
from emp
order by deptno;
--NVL2로 NULL값 처리하기 (comm을 검사하여 그 결과가 NULL이 아니면
--sal*12+comm을 실행하고 NULL이면 sal*12 실행)
select ename, sal, comm, NVL2(comm, sal*12+comm, sal*12)
from emp
order by deptno;
