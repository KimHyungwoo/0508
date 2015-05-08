create user jspuserc identified by jsp1234;

-- SQL
-- 1) 데이터 정의 언어(DDL) : create, alter, drop - 스키마
-- 2) 데이터 조작 언어(DML) : insert, update, delete, select  - 인스턴스(행)
-- 3) 데이터 제어 언어(DCL) : grant, revoke

-- 테이블 생성
create table member
(
	id 			varchar2(15) primary key, -- varchar2 : 가변길이
	password 	varchar2(10),
	name 		varchar2(20),
	age 		number,
	gender 		char(1),    			  -- char : 고정길이
	addr 		varchar2(100),
	regdate 	date default sysdate      -- default sysdate : 오늘 날짜 자동 입력
)

select * from member
where id = 'test'

insert into member
values('test11','1234','홍길동',20,'1','서울시','2015-04-17')

alter table member 

update member
set addr = '경기도'
where id = 'test'

delete member
where id = 'test'

drop table member


