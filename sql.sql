create table shopMem(
	id varchar2(50) not null primary KEY
  ,	password varchar2(50) not null
  ,	name varchar2(50)
  ,	phone varchar2(50)
  ,	address varchar2(200)
  ,	reg date default sysdate
	,nAd varchar2 (50)
	,dAd varchar2 (50)
	)
drop table shopMem

select * from shopMem

insert into SHOPMEM values('abc123','abc123','홍길동','010-1234-1111','경기도 수원시','2011-11-11')

select * from zipcode where dong like '%망포%'

SELECT * 

FROM ALL_TAB_COMMENTS

WHERE TABLE_NAME = 'zipcode'

alter table shopMem add adN varchar2(50);

alter table shopMem add adD varchar2(50);




insert into shopMem (id,password,name,phone,address,nAd,dAd) values('zz','zz','zz','zz','zz','zz','zz')

select * from shopMem

update shopMem set grade = 'manager' where id = 'abcd' 

create table tbl_product(
	p_id number(20),
	p_name varchar2(50),
	p_price number(20),
	p_categori varchar2(50),
	p_desc varchar2(50),
	p_url varchar2(500),
	p_color varchar2(10),
	p_gender varchar2(10),
	primary key(p_id)
) 
drop table tbl_product



insert into tbl_product values(1,'컨버짭',30000,'shoes','sneakers','http://localhost:8081/ShoppingMall/img/product1.png','emerald','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'헬창화',20000,'shoes','running','http://localhost:8081/ShoppingMall/img/product2.jpg','emerald','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'헬창화',20000,'shoes','running','http://localhost:8081/ShoppingMall/img/product2.jpg','emerald','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'나이키',50000,'shoes','running','http://localhost:8081/ShoppingMall/img/product3.jpg','white','man')

delete from tbl_product where p_id =16

insert into tbl_product values((select max(p_id) from tbl_product)+1,'가죽 가방',70000,'etc.','bag','http://localhost:8081/ShoppingMall/img/product4.png','brown','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'검은 티',7000,'top','t-shirt','http://localhost:8081/ShoppingMall/img/product5.png','black','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'청 반바지',40000,'bottom','jean','http://localhost:8081/ShoppingMall/img/product6.jpg','blue','man')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'검정 미니스커트',30000,'bottom','skirt','http://localhost:8081/ShoppingMall/img/product7.jpg','black','woman')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'레드 미니스커트',40000,'bottom','skirt','http://localhost:8081/ShoppingMall/img/product8.jpg','red','woman')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'검정 블레이저',120000,'outer','blazer','http://localhost:8081/ShoppingMall/img/product9.jpg','black','man')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'검정 코트',200000,'outer','coat','http://localhost:8081/ShoppingMall/img/product10.jpg','black','man')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'시계 팬던트',70000,'etc','necklace','http://localhost:8081/ShoppingMall/img/product11.jpg','brown','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'손목 시계',50000,'etc','watch','http://localhost:8081/ShoppingMall/img/product12.jpg','brown','public')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'후드집업',60000,'top','hood','http://localhost:8081/ShoppingMall/img/product13.jpg','black','man')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'후드티',50000,'top','hood','http://localhost:8081/ShoppingMall/img/product14.jpg','black','man')

insert into tbl_product values((select max(p_id) from tbl_product)+1,'다크진',80000,'bottom','jean','http://localhost:8081/ShoppingMall/img/product15.jpg','black','public')

select * from tbl_product

update tbl_product set p_name = '시계 펜던트' where  p_id = 11;

select * from tbl_product where p_gender in ('man','public')

select * from (select * from TBL_PRODUCT order by p_id desc) where ROWNUM <=10 order by p_id desc

select * from (select * from TBL_PRODUCT where p_categori = 'bottom' order by p_id desc) where ROWNUM <=10 order by p_id desc


select * from TBL_PRODUCT p, tbl_saleP s where p.p_id = s.p_id

select p.p_id,p.p_name,p.p_price,p.p_categori,p.p_desc,p.p_url,p.p_color,p.p_gender,s.p_sale from TBL_PRODUCT p, tbl_saleP s where p.p_id = s.p_id order by p.p_id desc

select * from shopMem

update TBL_PRODUCT set sale = 20 where p_id = 6;


select * from (select rownum as rnum,B.* from (select * from tbl_product where event = 'yes' and p_categori = 'bottom' order by p_id desc) B) where rnum between 1 and 12

select * from (select rownum as rnum,B.* from (select * from tbl_product where p_name like '%검%' order by p_id desc) B) where rnum between 1 and 12

select * from tbl_product where p_name like '%%'

select count(p_id) from tbl_product where p_name like '%%'
select count(p_id) from tbl_product where p_gender in ('man', 'public')

alter table shopMem add grade varchar2(10) default 'member';

create table tbl_reivews(
 r_id number(20),
 p_id number(20),
 writer varchar2(30),
 crdate date default sysdate,
 r_content varchar2(1000),
 r_url varchar2(300),
 r_grade float(20),
 primary key(r_id)
)
drop table tbl_reivews

select r_url from tbl_reivews order by r_url desc;

insert into tbl_reivews(r_id,p_id,writer,r_content,r_url,r_grade) values((select max(r_id) from tbl_reivews)+1,14,'고객','두번째 작성하는 리뷰','http://localhost:8081/ShoppingMall/img/reviews/1.jpg',4.5)

insert into tbl_reivews(r_id,p_id,writer,r_content,r_url,r_grade) values((select max(r_id) from tbl_reivews)+1,14,'고객','세번째 작성하는 리뷰','http://localhost:8081/ShoppingMall/img/reviews/1.jpg',3.8)

insert into tbl_reivews(r_id,p_id,writer,r_content,r_url,r_grade) values(0,14,'고객','네번째 작성하는 리뷰','http://localhost:8081/ShoppingMall/img/reviews/1.jpg',5.0)

select r_url from tbl_reivews order by r_id desc

select count(r_id) from tbl_reivews where p_id = 14

select avg(r_grade) from tbl_reivews where p_id = 14

create table tbl_order(
	o_id number(10),
	p_id number(20),
	id varchar2(20),
	o_name varchar2(200),
	name varchar2(20),
	phone varchar2(30),
	nad varchar2(30),
	address varchar2(100),
	dad varchar2(30),
	pay varchar2(20),
	price number(30),
	state varchar2(30) default '주문 요청',
	review varchar2(10) default 'no' ,
	pdate date default sysdate,
	primary key(o_id)
)

ALTER TABLE tbl_order MODIFY state varchar2(30) DEFAULT '주문 요청';

drop table tbl_order

update tbl_order set pay = 'toss'

select * from tbl_order order by o_id desc

select nvl(max(o_id),0)+1 from tbl_order

DELETE FROM tbl_img WHERE p_id = 17

create table tbl_pick(
	id varchar2(20),
	ip varchar2(30) not null,
	pick varchar2(20),
	p_id number(20),
	p_name varchar2(20)
)

drop table tbl_pick

select * from tbl_pick where id = 'abcd'

insert into tbl_pick values('1','1','1','1')

update tbl_pick set pick = 'no'

update tbl_order set state = '배송 완료' where o_id = 1

insert into tbl_reivews(r_id,p_id,writer,r_content,r_url,r_grade) values((select nvl(max(r_id),0)+1 from tbl_reivews),14,'고객','네번째 작성하는 리뷰','http://localhost:8081/ShoppingMall/img/reviews/1.jpg',5.0)

select nvl(max(r_id),0)+1 from tbl_reivews


update tbl_order set review = 'no'

select sum(price) from tbl_order where pdate>= TO_DATE('2022/03','YYYY/MM') and pdate<=TO_DATE('2022/04','YYYY/MM')

select * from shopMem order by id

update shopMem set id = '96' where id = '95' 

select * from tbl_product order by p_id desc

update tbl_product set sale = 10, event = 'yes' where p_id = 10

create table tbl_img(
	id number(20),
	url varchar2 (1000),
	p_id number(20),
	primary key(id)
)

drop table tbl_img

select * from tbl_img

alter table tbl_product add p_info varchar2(1000)

update tbl_product set p_info = '더 휴먼 상품';

select nvl(max(id),0)+1 from tbl_img

select nvl(max(p_id),0)+1 from tbl_product

insert into tbl_product (p_id,p_name,p_price,p_categori,p_desc,p_url,p_color,p_gender,p_info) values((select nvl(max(p_id),0)+1 from tbl_product),'zz',1000,'z','z','z','z','z','zz')

select * from tbl_product where p_id = 15

update tbl_product set p_name = 'zz', p_price = 16, p_categori = 'zz', p_gender = 'zz', p_color = 'zz', p_info = 'zz' where  p_id = 16

create table tbl_counsel(
	c_id number(20),
	c_categori varchar2(50),
	o_id number(20),
	id varchar2(50),
	phone varchar2(50),
	title varchar2(50),
	content varchar2(500),
	c_url varchar2(500),
	c_state varchar2(50) default '답변 대기',
	reg date default sysdate,
	primary key(c_id)
) 

drop table tbl_counsel

select c_id from tbl_counsel

create table tbl_answer(
	content varchar2(200),
	c_id number(30),
	reg date default sysdate,
	id varchar2(50)
) 

drop table tbl_answer

select * from tbl_answer;

create table tbl_manager(
	id varchar2(20),
	password varchar2(30),
	primary key(id)
)


select * from tbl_manager
insert into tbl_manager values('abcd','1234')