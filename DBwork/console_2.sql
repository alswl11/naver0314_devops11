-- 0402 수업 내용 복습
select ENAME, sal, comm from ANGELMINJI_EMP where ENAME like 'A%' or ENAME like  'S%';

select * from ANGELMINJI_EMP where COMM is not null;

select * from ANGELMINJI_EMP where MGR in (7698, 7566, 7782);

select * from ANGELMINJI_EMP where sal >= 2500 and sal <=3000;

select * from ANGELMINJI_EMP where sal between 2500 and 3000;

select distinct job from ANGELMINJI_EMP;

select  * from ANGELMINJI_EMP where job = (select JOB from ANGELMINJI_EMP where ENAME = 'ALLEN');

select * from ANGELMINJI_EMP where mgr = (select mgr from ANGELMINJI_EMP where ENAME = 'SCOTT');

-- 0403 수업
-- 숫자함수
select abs(-5), abs(5) from DUAL;
select ceil(3.1), ceil(3.9), ceil(3.0) from dual;
select floor(3.1), floor(3.9), floor(3.0) from dual;
select mod(7,3), mod(9,5) from DUAL;
select power(2,3), power(3,4) from dual;
select round(23.456, 2), round(8929, -1) from dual;

-- 문자함수
select concat('HAPPY', 'DAY') from dual;
select 'HAPPY' || 'DAY' from dual;
select  initcap('HAPPY'), initcap('hello') from dual;
select lower('heLLOdaY'), upper('heLLOdaY') from dual;
select lower(ENAME) 소문자이름, initcap(ENAME) 첫글자대문자이름 from ANGELMINJI_EMP;
select lpad(sal,10, '*') from ANGELMINJI_EMP;
select rpad(sal,10, '*') from ANGELMINJI_EMP;
select substr('happy day', 2, 3) from DUAL;
select substr('happy day', -5, 3) from DUAL;

select ENAME, length(ENAME) 글자수 from ANGELMINJI_EMP;
select replace('Good Day', 'o', '*') from DUAL;
select instr('happy', 'a') from DUAL;
select instr('happy', 'x') from dual;
select instr('have a nice day', 'nice') from dual;
select trim('       hello      ') from dual;

-- 기타함수
select nvl(COMM, 1000) from ANGELMINJI_EMP;
select ENAME 사원명, ANGELMINJI_DEPTNO 부서코드, decode(ANGELMINJI_DEPTNO, 10, '홍보부', 20, '교육부', 30, '인사부') 부서명 from ANGELMINJI_EMP;

select ANGELMINJI_EMP.ename , ANGELMINJI_EMP.job, ANGELMINJI_DEPT.dname, ANGELMINJI_DEPT.loc
from ANGELMINJI_EMP, ANGELMINJI_DEPT
where ANGELMINJI_EMP.ANGELMINJI_DEPTNO = ANGELMINJI_DEPT.ANGELMINJI_DEPTNO;

select ANGELMINJI_EMPNO, ENAME, job, DNAME, loc
from ANGELMINJI_EMP, ANGELMINJI_DEPT
where ANGELMINJI_EMP.ANGELMINJI_DEPTNO = ANGELMINJI_DEPT.ANGELMINJI_DEPTNO;

select e.ANGELMINJI_EMPNO, ENAME, job, DNAME, loc
from ANGELMINJI_EMP e, ANGELMINJI_DEPT d
where e.ANGELMINJI_DEPTNO = d.ANGELMINJI_DEPTNO;

