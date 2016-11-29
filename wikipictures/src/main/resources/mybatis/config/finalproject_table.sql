
select * from member;
select * from authorities;
select * from picture;
select * from report;
select * from mypage;
select * from hashtag;

drop table authorities;
drop table member;
drop table picture;
drop table mypage;
drop table report;
drop table hashtag;

 create table member(
	id varchar2(20) primary key,
	nickname varchar2(20) not null,
	password varchar2(20) not null,
	birth date not null,
	fav_space varchar2(100) not null,
	enabled number not null
)
select * from member;
        select id, nickname, to_char(birth,'YYYY.MM.DD'), fav_space from member;
  select p.pic_date, p.keyword, m.id from picture p, member m
       where p.id=m.id;
insert into member values('admin','관리자','rhksflwk','19910916','하늘',1);
insert into member values('java','아이유','1234','19900818','광화문',0);
insert into member values('ajax','설현','1234','19880818','올림픽',0);
        insert into member values('ajax1','설현','1234','19880818','올림픽',0);
create table authorities(
	authority varchar2(100) not null,
	id varchar2(20) not null,
	primary key(authority, id),
	constraint fk_authorities_member foreign key(id) references member(id)
)

insert into authorities values('관리자권한','java');
insert into authorities values('관리자권한,사용자권한','ajax');




create table picture(
	pic_date varchar2(7) not null,
	keyword varchar2(50) not null,
	path varchar2(500) not null,
	author_comment clob not null,
	hits number default 0 ,
	pic_space varchar2(100) not null,
	id varchar2(20) not null,
	primary key(pic_date, keyword),
	constraint fk_picture_member foreign key(id) references member(id)	
)

insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.10','광화문','저기','어느 광화문','서울 어딘가','java');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','광화문','저기','어느 광화문','서울 어딘가','java');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','올림픽','저기','어느 광화문','서울 어딘가','ajax');
-- 무결성 제약조건에 위배되는 삽입 문
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','광화문','저기','어느 광화문','서울 어딘가','ajax');

create table report(
	report_no number primary key,
	report_type varchar2(30) not null,
	report_content clob not null,
	report_date date not null,
	pic_date varchar2(7) not null,
	keyword varchar2(50) not null,
	constraint fk_report_picture foreign key(pic_date, keyword) references picture(pic_date,keyword)
)
select * from report;
select r.report_no, r.report_type, r.report_content, r.report_date,p.pic_date,
p.keyword 
insert into report values(1,'신고','선정성',sysdate,'1999.10','광화문');
insert into report values(2,'신고','선정성',sysdate,'1999.10','광화문');
insert into report values(3,'정정','내용과 맞지 않음',sysdate,'2000,10','광화문');

create table mypage(
	id varchar2(20) not null,
	pic_date varchar2(7) not null,
	keyword varchar2(50) not null,
	reply_date date not null,
	reply_content clob not null,
	buy_date date not null,
	primary key(id,pic_date, keyword),
	CONSTRAINT FK_mypage_picture foreign key(pic_date, keyword) references picture(pic_date,keyword),
	CONSTRAINT fk_mypage_member foreign key(id) references member(id)
	)
	
insert into mypage values('java','1999.10','광화문',sysdate,'좋아요',sysdate);
-- 무결성 제약조건에 위배되는 삽입 문(멤버아이디 존재하지 않음)
insert into mypage values('java1','1999.10','광화문',sysdate,'좋아요',sysdate);
	
create table hashtag(
	pic_date varchar2(7) not null,
	keyword varchar2(50) not null,
	hashtag_name varchar2(50) not null,
	hashtag_count number default 1,
	constraint fk_hashtag_picture foreign key(pic_date,keyword) references picture(pic_date,keyword)
)

select * from hashtag

insert into hashtag(pic_date,keyword,hashtag_name) values('1999.10','광화문','박근혜하야')
-- hashtag_name 값이있으면 update 없으면 insert
MERGE INTO hashtag
USING DUAL
ON(hashtag_name='촛불시위')
WHEN MATCHED THEN  
   update set hashtag_count=hashtag_count+1
WHEN NOT MATCHED THEN
  insert(pic_date,keyword,hashtag_name) values('1999.10','광화문','촛불시위')
  



