
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
-- food의 100번 메뉴는 삭제가 될까? -> ㄴㄴ,  100번 메뉴를 주문한 고객이 잇어서 삭제할 수 없음

-- 부모 테이블인 food를 삭제하자
drop table food; -- error : 자식 테이블 먼저 삭제 후 부모 삭제 가능


--- 연습 종료 -> 스카마, 테이블 2개 제거 ---- 자식 테이블 제거 후 부모 제거

drop table booking;
drop table food;
drop sequence seq_food;


------------ new --------------
-- 이번에는 부모 테이블의 테이터 삭제 시 서브 테이블의 데이타도 자동으로 삭제되도록 외부키 설정
-- 시퀀스 생성
create sequence seq_shop;
-- shop, cart
create table shop
(
    sang_no    number(3)
        constraint shop_pk_no primary key,
    sang_name  varchar2(30),
    sang_price number(10)
);

select * from shop;

-- 외부키 설정 시 on delete cascade을 붙이면 부모테이블 삭제 시 자식테이블에 추가된 데이터도 같이 삭제 됨
create table cart (
cart_no number(3) constraint cart_pk_no primary key,
sang_no number(3),
cnt number(3),
cartday date,
constraint cart_fk_no foreign key (sang_no) references shop(sang_no) on delete cascade
);

select * from cart;

insert into shop values (seq_shop.nextval, '블라우스', 12000);
insert into shop values (seq_shop.nextval, '조끼', 19000);
insert into shop values (seq_shop.nextval, '청바자', 25000);
insert into shop values (seq_shop.nextval, '채크코트', 99000);
insert into shop values (seq_shop.nextval, '티셔츠', 11000);
commit;

-- cart에 원하는 상품을 담아보자
insert into cart values (seq_shop.nextval, 2, 3,sysdate);
insert into cart values (seq_shop.nextval, 1, 2,sysdate);
insert into cart values (seq_shop.nextval, 5, 1,sysdate);
commit;

-- join 으로 조회
-- cart_no, sang_no, sang_name, sang_prie, cnt, cartday(yyyy-mm-dd) 출력
select cart_no, cnt, s.sang_no, sang_name, sang_price,
       to_char (cartday, 'yyyy-mm-dd') cartday
from shop s, cart c
where s.sang_no = c.sang_no;

-- 아무도 cart에 담지 않은 상품은 ?
select cart_no, cnt, s.sang_no, sang_name, sang_price,
       to_char (cartday, 'yyyy-mm-dd') cartday
from shop s, cart c
where s.sang_no = c.sang_no(+) and cart_no is null;

-- on delete cascade 를 한 경우 cart에 추가된 상품도 삭제가 가능함
-- 2번 조끼 상품을 삭제해보자
delete from shop where sang_no = 2;

-- cart를 확인해보면 cart에 잇던 2번 상품도 사라짐
select cart_no, cnt, s.sang_no, sang_name, sang_price,
       to_char (cartday, 'yyyy-mm-dd') cartday
from shop s, cart c
where s.sang_no = c.sang_no;

-- 테이블, 스키마 제거 (자식 -> 부모)
drop table cart;
drop table shop;
drop sequence seq_shop;











