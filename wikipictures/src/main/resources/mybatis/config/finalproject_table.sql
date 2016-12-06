
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
	select rnum, id, nickname, password, birth, fav_space from
 	 (select row_number() over(order by id desc) as rnum,id,nickname, password,
 	to_char(birth, 'yyyy.mm.dd')as birth, fav_space
 	 from member)  where rnum between  1 and 5
 	select row_number() over(order by id desc) as no, id, nickname, to_char
 	(birth, 'yyyy.mm.dd')from member;
select * from member;
select id,nickname,password,to_char(birth,'yyyy.mm.dd'),fav_space from member
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
-- ***********picture table category column 추가***********--
alter table picture add(category varchar2(100) null);

<<<<<<< HEAD
update picture set category = '장소';

alter table picture MODIFY(category varchar2(100) null);
--***************3개 쿼리문 수행해 주세요***********--
select * from picture
=======
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('1999.06','종로','여기','광화문','서울 광화','java','장소');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('2000.06','판교','여기','광화문','서울 광화','java','장소');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('2001.06','숭례문','여기','광화문','서울 광화','java','장소');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('2002.06','금천교','여기','광화문','서울 광화','java','장소');

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('1990.07','판교','그곳','몰라','대전','ajax','아아');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('1992.05','숭례문','저곳','정말','부산','java','야야');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category) values('1993.03','독립문','저쪽','진짜로','광교','java','여여');



insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.10','종로','그곳','어느 종로','서울 종로','java','장소들');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.10','남산','저곳','어느 남산','서울 남산','java','장소들');



>>>>>>> branch 'master' of https://github.com/jaeyoung49/WikiPictures.git
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
select rnum, pic_date,report_type, report_content, keyword from
 	 (select report_no,row_number() over(order by report_no desc) as rnum,pic_date,report_type,report_content, keyword
 	 from report) where rnum between  1 and 5
 		select  report_no, pic_date, report_date, report_type, report_content, keyword from report;
 		
 	 select rnum, report_no, pic_date,report_type, report_content, keyword, report_date from
 	 (select report_no,row_number() over(order by report_no desc) as rnum,pic_date,
 	 report_type,report_content, keyword , report_date
 	 from report) where rnum between  1 and  5 order by rnum desc
 	 
 	select id,rnum from (select id,row_number() over(order by id desc) as rnum
 	 from member) where rnum between 1 and 5;
 	
select * from report;
select r.report_no, r.report_type, r.report_content, r.report_date,p.pic_date,
p.keyword 
insert into report values(1,'신고','선정성',sysdate,'1999.10','광화문');
insert into report values(2,'신고','선정성',sysdate,'1999.10','광화문');
insert into report values(3,'정정','내용과 맞지 않음',sysdate,'2000,10','광화문');
delete from picture where keyword='아이유'
delete from hashtag where keyword='아이유' 
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
	
	select id,pic_date,rnum,keyword,path,author_comment,hits,pic_space,category from 
	(select id,pic_date,row_number() over(order by keyword desc) as rnum,keyword,path,author_comment,hits,pic_space,category
	from picture) where rnum between 1 and 5 order by keyword desc
insert into mypage values('java','2002-05','월드컵',sysdate,'좋아요',sysdate);
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
  

------------------------------------------------------연습들--------------------------------------------------------------
	select rnum, id, nickname, password, birth, fav_space from
 	 (select row_number() over(order by id desc) as rnum,id,nickname, password,
 	to_char(birth, 'yyyy.mm.dd')as birth, fav_space
 	 from member)

 	 select rnum,keyword,path,author_comment,hits,pic_space from (select row_number() over(order by keyword desc) as rnum,keyword,path,author_comment,hits,pic_space
	from picture) where rnum between 1 and 5
	
	select m.id,p.rnum,p.keyword,p.path,p.author_comment,p.hits,p.pic_space,p.category from (select row_number() over(order by keyword desc) as rnum,
		keyword,path,author_comment,hits,pic_space,category from picture p=member m) picture p,member m where m.id=p.id and rnum between 1 and 5 
		
		select rnum,keyword,path,author_comment,hits,pic_space,category from (select row_number() over(order by keyword desc) as rnum,keyword,path,author_comment,hits,pic_space,category
	from picture) where rnum between 1 and 5		
