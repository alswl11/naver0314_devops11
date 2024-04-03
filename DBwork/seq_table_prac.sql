
/*
join 연습용 테이블 2개 생성
 테이블 # 1 :
    food - foodnum num(3) / foodname varchar2(20) / foodprice num(7) / foodsize varchar2(20)

테이블 # 2 :
    booking - bnum pk num(3) / bname varchar2(20) nn / bhp varchar2(20) uq / foodnum num(3) fk (food의 foodnum)

*/

create table food (
                      foodnum number(3) constraint pk_foodnum primary key ,
                      foodname varchar2(20),
                      foodprice number(7),
                      foodsize varchar2(20)
);

insert into food values (100, '짜장면', 9000, '보통');
insert into food values (101, '짜장면', 11000, '곱배기');
insert into food values (200, '탕수육', 15000, '보통');
insert into food values (201, '탕수육', 20000, '곱배기');
insert into food values (300, '칠리새우', 15000, '소');
insert into food values (301, '칠리새우', 30000, '대');
insert into food values (400, '해물짬뽕', 11000, '보통');
commit;

select  * from food;

-- 시퀀스 추가
create sequence seq_food nocache;

create table booking (
bnum number(3)  constraint pk_bnum primary key ,
bname varchar2(20) constraint nn_bname not null ,
bhp varchar2(20) constraint uq_bhp unique,
foodnum number(3),
bookingday date,
constraint fk_foodnum foreign key (foodnum) references food(foodnum)
);

select * from booking;

insert into booking values (seq_food.nextval, '홍범자', '010-2222-3333', 101, sysdate);
insert into booking values (seq_food.nextval, '강호동', '010-2222-3333', 101, sysdate); -- 오류 발생
insert into booking values (seq_food.nextval, '이영자', '010-3434-8899', 301, sysdate+7);
insert into booking values (seq_food.nextval, '박지민', '010-3333-4444', 201, sysdate);
insert into booking values (seq_food.nextval, '손미나', '010-4444-5555', 100, sysdate+10);
insert into booking values (seq_food.nextval, '이효리', '010-5555-6666', 400, sysdate+1);

-- join으로 두 데이블을 조인해서 출력
-- bnum, bname, bhp, foodnum, foodname, foodprice, foodsize, bookingday(yyyy-mm-dd)
select bnum, bname, booking.foodnum, foodname, foodprice, foodsize,
       to_char(bookingday, 'yyyy-mm-dd') bookingday
from booking, food
where booking.foodnum = food.foodnum;

-- 아무도 예약하지 않은 food 음식은 무엇이 잇으까?
select bnum, f.foodnum, foodname, foodprice, foodsize
from food f, booking b
where f.foodnum = b.foodnum(+) and bname is null;

-- food의 200번 메뉴는 삭제가 될까? -> ㅇㅇ, 아무도 주문한 사람이 없어서 삭제 가능
delete from food where foodnum = 200;
-- food의 100번 메뉴는 삭제가 될까? -> ㄴㄴ, 100번 메뉴를 주문한 고객이 잇어서 삭제할 수 없음

-- 부모 테이블인 food를 삭제하자
drop table food; -- error : 자식 테이블 먼저 삭제 후 부모 삭제 가능


--- 연습 종료 -> 스카마, 테이블 2개 제거 ---- 자식 테이블 제거 후 부모 제거

drop table booking;
drop table food;
drop sequence seq_food;












