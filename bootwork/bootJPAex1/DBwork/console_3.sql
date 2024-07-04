-- 시퀀스 생성
-- 기본 1부터 1씩 증가하는 시퀀스는 생략하고 기본 명령어만 주면 됨
create sequence sq1;
-- 전체 시퀀스 조회
select * from ALL_SEQUENCES;
-- 다음 시퀀스 값 발생 : nextval : 1씩 증가된 값 발생
select sq1.nextval from DUAL;
-- 10부터 5씩 증가하는 시퀀스 생성, 기본 캐시 20인 것도 없애고 시작
create sequence seq2 start with 10 increment by 5 nocache;
-- seq2 값으로 발생
select seq2.nextval from DUAL;
-- 1부터 3씩 증가, 캐쉬 0, 맥스 100
create sequence seq3 start with 1 increment by 3 nocache maxvalue 100;
select seq3.nextval from dual;
-- 시퀀스 제거
drop sequence sq1;
drop sequence seq2;
drop sequence seq3;


-- 최종 테이블에서 사용한 시퀀스 생성 (1부터 1씩 증가, 캐시 0)
create sequence seq_test nocache;

-- 연습용 테이블
create table hello (
idx number(3) primary key,
irum varchar2(20),
age number(3)
);

-- 테이블 구조 수정 : alter table
-- irum의 길이를 20 -> 30으로 수정
alter  table  hello modify irum varchar2(30);

-- addr이라는 칼럼 추가 (문자열 길이 :100)
alter table hello add addr varchar2(100);

-- age라는 컬럼을 제거
alter table hello drop column age;

-- 컬럼명 변경 (addr -> address)
alter table hello rename column addr to address;

-- 칼럼 하나 추가
alter table hello add blood varchar2(3);
alter table hello add age number(3);

-- 데이터 추가
insert into hello (irum) values ('lee'); -- error
insert into hello (idx, irum) values (seq_test.nextval, 'lee');

select * from hello;
insert into hello (idx, blood, address) values (seq_test.nextval, 'ab', '서울 역삼');
-- 컬럼명 생략시 테이블의 컬럼 순서대로 모든값을 줘야함
insert into hello values (seq_test.nextval, '이진', '제주도 애월읍', 'O', 23);

-- 수정
-- 이름이 '이진'인 사람의 혈액형을 b형으로 바꾸기
update hello set blood = 'b' where irum = '이진';

-- idx가 2인 사람의 irum, age를 수정
update hello set irum = '강호동', age = 35 where idx = 2;

-- idx가 1인 사람의 address, blood, age의 값을 수정
update hello set address = '수원', blood = 'a', age = 22 where idx = 1;

-- 삭제
insert into hello values (seq_test.nextval, '희도', '제주도 애월읍', 'b', 14);
delete from hello where idx = 4;

-- 테이블 제거
drop table hello;

-- 새로운 테이블 생성 (제약조건 추가)
create table student (
num number(3) constraint pk_num primary key,    --pk로 주는데 제약조건명이 pk_num
stuname varchar2(20) constraint nn_name not null,
score number(3) constraint ck_score check(score>=1 and score<=100),
birthday date
);

select * from student;

-- insert로 데이터 추가하는데 에러 발생 연습

insert into student (num, stuname) values (1, '김미리'); -- 정상 작동

insert into student (num, score) values (1, '김미리'); -- 에러발생
insert into student (stuname, score) values ('이미자', 45); -- 에러발생
-- num은 pk (pk는 not null + unique)
insert into student (num, stuname) values (1, '홍진주'); -- 에러발생
-- score 범위 넘어가는 입력
insert into  student (num, stuname, score) values (2, '강동호', 110); -- error

insert into student values (3, '이미자', 89, sysdate); -- 현재 날짜로
insert into student values (4, '김민종', 100, '2010-12-20');
commit; -- commit하면 rollback 안됨
insert into student values (5, '곤미나', 56, '2019-05-10');
insert into student values (6, '강수지', 98, sysdate);
insert into student values (7, '김진우', 67, '2015-09-12');
insert into student values (8, '강호동', 66, '2013-05-12');

commit;

rollback; -- 마지막 커밋 한 이후의 dml 작업

-- num = 5인 데이터 이름을 '손미라'라고 바꾸고 score 을 80으로 수정
update student set stuname = '손미라' , score = '80' where num = 5;
-- birthday의 월이 5인 사람의 점수를 일괄적으로 85으로 수정
update  student set score = 85 where TO_CHAR(birthday, 'MM') = 5;

-- num = 7인 데이터 삭제
delete from student where num = 7;
-- rollback + 데이터 확인
rollback ;

-- 불필요한 제약조건 제거
alter table STUDENT drop constraint ck_score;
alter table student drop constraint  nn_name;

-- 새로운 제약조건 추가
alter table student add constraint uq_name unique (stuname); -- 같은 이름 더이상 넣지 못함

-- 같은 이름의 데이터를 추가해보자
insert into student (num, stuname) values (10, '강호동'); -- 에러남
-- 연습이 끝난 후 시퀀스랑 테이블 삭제
 drop sequence  seq_test;
drop table student;
