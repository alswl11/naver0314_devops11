SELECT *
FROM ANGELMINJI_EMP

select *
from ANGELMINJI_DEPT;

desc ANGELMINJI_EMP;

select * from ANGELMINJI_EMP;

select ename, job from SCOTT.ANGELMINJI_EMP;

select ename, job from SCOTT.ANGELMINJI_EMP order by ENAME asc;

select ename, job from SCOTT.ANGELMINJI_EMP order by ENAME desc;

select distinct job from ANGELMINJI_EMP order by job asc;

select distinct job from ANGELMINJI_EMP order by 1;

select * from ANGELMINJI_EMP where ENAME = 'SMITH';
select * from ANGELMINJI_EMP where ENAME = 'SMITH' or ENAME = 'WARD';

select ename, sal from ANGELMINJI_EMP;

select ename 사원명, sal 급여 from ANGELMINJI_EMP;

select '내 이름은 ' || ENAME || '이고 직업은 ' ||job|| '입니다.' from ANGELMINJI_EMP;
select '내 이름은 ' || ENAME || '이고 직업은 ' ||job|| '입니다.' "사원" from ANGELMINJI_EMP;

select ename || '님의 연봉은 ' || sal || '만원 입니다' 연봉 from ANGELMINJI_EMP;

select ENAME, sal from ANGELMINJI_EMP where sal > =2000 and sal<=3000;
select ename, sal from ANGELMINJI_EMP where sal between 1000 and 2000;

select ename, job from ANGELMINJI_EMP where job = 'SALESMAN' or job = 'MANAGER' or job = 'CLERK';
select ENAME, job from ANGELMINJI_EMP where job in('SALESMAN', 'MANAGER', 'CLERK');

select ename, job, mgr from ANGELMINJI_EMP where MGR in(7902, 7839, 7788);

select  * from SCOTT.ANGELMINJI_EMP where COMM is null;
select  * from SCOTT.ANGELMINJI_EMP where COMM is not null;

select ENAME, SAL from ANGELMINJI_EMP where ENAME like '%N';

select ename, sal from ANGELMINJI_EMP where ename like '__A%';

select ENAME, sal from ANGELMINJI_EMP where ENAME like 'S%' or ENAME like 'M%';

select ENAME, sal from ANGELMINJI_EMP where ENAMe like  'S%'and sal >=2000;

select ENAME, job, mgr from ANGELMINJI_EMP where mgr not in (7902, 7788,7566);

select comm, comm+1000 from ANGELMINJI_EMP where comm is not null;

select nvl(COMM, 0) comm, nvl(COMM, 0)+1000 comm2 from ANGELMINJI_EMP;

select ENAME, sal from ANGELMINJI_EMP where sal<2000 or sal>3000;

select ENAME, sal from ANGELMINJI_EMP where sal not between 2000 and 3000;

select count(*) from ANGELMINJI_EMP;
select max(SAL) from ANGELMINJI_EMP;
select min(sal) from ANGELMINJI_EMP;
select sum(SAL) from ANGELMINJI_EMP;
select avg(sal) from ANGELMINJI_EMP;
select round(avg(sal),2) from ANGELMINJI_EMP;
select ceil(avg(sal)) from ANGELMINJI_EMP;
select floor(avg(sal)) from ANGELMINJI_EMP;

select job 직업, count(*) 인원수 from ANGELMINJI_EMP group by job;
select job 직업, count(*) 인원수 from ANGELMINJI_EMP group by job order by 1;

select job 직업, count(*) 인원수 from ANGELMINJI_EMP group by job order by 인원수;
select job 직업, count(*) 인원수 from ANGELMINJI_EMP group by job order by 2;

select job 직업, count(*) 인원수, max(sal) 최고연봉, min(sal) 최저연봉, ceil(avg(sal)) 평균연봉 from ANGELMINJI_EMP group by job;

select job, count(*), max(sal) from ANGELMINJI_EMP group by job having count(job) >=3;

select SYSDATE+3 from dual;

select to_char(sysdate, 'YYYY') from DUAL;
select to_char(sysdate, 'MM') from DUAL;

select to_char(sysdate, 'YYYY-DD-MM') from DUAL;
select to_char(sysdate, 'YYYY-DD-MM HH24:MI') from DUAL;

select ENAME, to_char(HIREDATE, 'YYYY-MM-DD') HIREDATE from ANGELMINJI_EMP;
select ENAME, to_char(HIREDATE, 'YYYY-MM-DD') HIREDATE from ANGELMINJI_EMP where to_char(HIREDATE, 'YYYY') = 1987;
select * from ANGELMINJI_EMP where to_char(HIREDATE, 'YYYY') =  1987;
select ENAME, to_char(HIREDATE, 'YYYY-MM-DD') HIREDATE from ANGELMINJI_EMP where to_char(HIREDATE, 'MM') = 5;

select * from ANGELMINJI_EMP where sal = (select sal from ANGELMINJI_EMP where ENAME = 'SCOTT');

select * from ANGELMINJI_EMP where sal>(select avg(sal) from ANGELMINJI_EMP);

