
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
        
insert into member values('java','아이유','1234','19900818','광화문',0);
insert into member values('ajax','설현','1234','19880818','올림픽',0);
        
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

update picture set category = '장소';

alter table picture MODIFY(category varchar2(100) not null);
--***************3개 쿼리문 수행해 주세요***********--

insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.10','광화문','저기','어느 광화문','서울 어딘가','java');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','광화문','저기','어느 광화문','서울 어딘가','java');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','올림픽','저기','어느 광화문','서울 어딘가','ajax');
-- 무결성 제약조건에 위배되는 삽입 문
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','광화문','저기','어느 광화문','서울 어딘가','ajax');


--******************다음의 사진DB는 꼭 추가해서 실행해주세요******************--
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-03','올림픽','올림픽_1988-03.JPG','88서울올림픽','대한민국 서울','java', '사건', 1);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-05','올림픽','올림픽_1988-05.JPG','88서울올림픽','대한민국 서울','java', '사건', 2);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-08','올림픽','올림픽_1988-08.JPG','88서울올림픽','대한민국 서울','java', '사건', 3);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-09','올림픽','올림픽_1988-09.JPG','88서울올림픽','대한민국 서울','java', '사건', 4);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-10','올림픽','올림픽_1988-10.JPG','88서울올림픽','대한민국 서울','java', '사건', 5);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-05','월드컵','월드컵_2002-05.JPG','2002한일월드컵','대한민국','ajax', '사건', 6);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-06','월드컵','월드컵_2002-06.JPG','2002한일월드컵','대한민국','ajax', '사건', 7);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-07','월드컵','월드컵_2002-07.JPG','2002한일월드컵','대한민국','ajax', '사건', 8);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-09','월드컵','월드컵_2002-09.JPG','2002한일월드컵','대한민국','ajax', '사건', 9);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-01','대구지하철화재','대구지하철화재_2003-01.JPG','대구지하철화재 참사','대한민국 대구','java', '사건', 10);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-02','대구지하철화재','대구지하철화재_2003-02.JPG','대구지하철화재 참사','대한민국 대구','java', '사건', 11);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-03','대구지하철화재','대구지하철화재_2003-03.JPG','대구지하철화재 참사','대한민국 대구','java', '사건', 12);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-04','대구지하철화재','대구지하철화재_2003-04.JPG','대구지하철화재 참사','대한민국 대구','java', '사건', 13);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2004-04','배용준','배용준_2004-04.JPG','욘사마','팬미팅 장소','ajax', '인물', 14);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2004-05','배용준','배용준_2004-05.JPG','욘사마','팬미팅 장소','ajax', '인물', 15);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2004-06','배용준','배용준_2004-06.JPG','욘사마','팬미팅 장소','ajax', '인물', 16);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2005-05','박지성','박지성_2005-05.JPG','박지성','네덜란드','java', '인물', 17);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-01','숭례문','숭례문_2008-01.JPG','숭례문 화재','대한민국 서울','ajax', '장소', 18);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-02','숭례문','숭례문_2008-02.JPG','숭례문 화재','대한민국 서울','ajax', '장소', 19);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-03','숭례문','숭례문_2008-03.JPG','숭례문 화재','대한민국 서울','ajax', '장소', 20);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-04','숭례문','숭례문_2008-04.JPG','숭례문 화재','대한민국 서울','ajax', '장소', 21);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-05','숭례문','숭례문_2008-05.JPG','숭례문 화재','대한민국 서울','ajax', '장소', 22);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-05','신종플루','신종플루_2009-05.JPG','신종플루 확산','대한민국','java', '사건', 23);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-06','신종플루','신종플루_2009-06.JPG','신종플루 확산','대한민국','java', '사건', 24);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-07','신종플루','신종플루_2009-07.JPG','신종플루 확산','대한민국','java', '사건', 25);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-08','신종플루','신종플루_2009-08.JPG','신종플루 확산','대한민국','java', '사건', 26);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-09','신종플루','신종플루_2009-09.JPG','신종플루 확산','대한민국','java', '사건', 27);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-10','신종플루','신종플루_2009-10.JPG','신종플루 확산','대한민국','java', '사건', 28);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-11','신종플루','신종플루_2009-11.JPG','신종플루 확산','대한민국','java', '사건', 29);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-12','신종플루','신종플루_2009-12.JPG','신종플루 확산','대한민국','java', '사건', 30);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-03','천안함','천안함_2010-03.JPG','천안함 격침','대한민국 서해','ajax', '사건', 31);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-04','천안함','천안함_2010-04.JPG','천안함 격침','대한민국 서해','ajax', '사건', 32);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-05','천안함','천안함_2010-05.JPG','천안함 격침','대한민국 서해','ajax', '사건', 33);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-01','세월호','세월호_2014-01.JPG','세월호 침몰','대한민국','java', '사건', 34);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-02','세월호','세월호_2014-02.JPG','세월호 침몰','대한민국','java', '사건', 35);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-03','세월호','세월호_2014-03.JPG','세월호 침몰','대한민국','java', '사건', 36);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-04','세월호','세월호_2014-04.JPG','세월호 침몰','대한민국','java', '사건', 37);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-05','세월호','세월호_2014-05.JPG','세월호 침몰','대한민국','java', '사건', 38);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-06','세월호','세월호_2014-06.JPG','세월호 침몰','대한민국','java', '사건', 39);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-07','세월호','세월호_2014-07.JPG','세월호 침몰','대한민국','java', '사건', 40);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-08','세월호','세월호_2014-08.JPG','세월호 침몰','대한민국','java', '사건', 41);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-09','세월호','세월호_2014-09.JPG','세월호 침몰','대한민국','java', '사건', 42);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-10','세월호','세월호_2014-10.JPG','세월호 침몰','대한민국','java', '사건', 43);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-11','세월호','세월호_2014-11.JPG','세월호 침몰','대한민국','java', '사건', 44);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-12','세월호','세월호_2014-12.JPG','세월호 침몰','대한민국','java', '사건', 45);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-01','세월호','세월호_2015-01.JPG','세월호 침몰','대한민국','java', '사건', 46);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-06','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-06.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 47);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-07','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-07.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 48);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-08','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-08.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 49);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-09','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-09.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 50);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-10','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-10.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 51);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-11','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-11.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 52);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-12','역사교과서 국정화 반대시위','역사교과서 국정화 반대시위_2015-12.JPG','역사교과서 국정화 반대시위','대한민국','ajax', '사건', 53);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-06','일본 역사 교과서','일본 역사 교과서_2015-06.JPG','일본의 역사 왜곡 교과서','일본','java', '사건', 54);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-07','일본 역사 교과서','일본 역사 교과서_2015-07.JPG','일본의 역사 왜곡 교과서','일본','java', '사건', 55);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-08','일본 역사 교과서','일본 역사 교과서_2015-08.png','일본의 역사 왜곡 교과서','일본','java', '사건', 56);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-09','일본 역사 교과서','일본 역사 교과서_2015-09.JPG','일본의 역사 왜곡 교과서','일본','java', '사건', 57);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-09','박근혜대통령 퇴진시위','박근혜대통령 퇴진시위_2016-09.JPG','박근혜대통령 퇴진시위','대한민국 서울시광장','ajax', '사건', 58);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','박근혜대통령 퇴진시위','박근혜대통령 퇴진시위_2016-10.JPG','박근혜대통령 퇴진시위','대한민국 서울시광장','ajax', '사건', 59);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','박근혜대통령 퇴진시위','박근혜대통령 퇴진시위_2016-11.JPG','박근혜대통령 퇴진시위','대한민국 서울시광장','ajax', '사건', 60);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-12','박근혜대통령 퇴진시위','박근혜대통령 퇴진시위_2016-12.JPG','박근혜대통령 퇴진시위','대한민국 서울시광장','ajax', '사건', 61);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','박근혜대통령','박근혜대통령_2016-10.JPG','박근혜대통령','대한민국 청와대','java', '인물', 62);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','박근혜대통령','박근혜대통령_2016-11.JPG','박근혜대통령','대한민국 청와대','java', '인물', 63);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','정유라','정유라_2016-11.JPG','정유라','대한민국','java', '인물', 64);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','정유라 기사내용','정유라 기사내용_2016-10.JPG','정유라 기사내용','대한민국','ajax', '사건', 65);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','정유라 기사내용','정유라 기사내용_2016-11.JPG','정유라 기사내용','대한민국','ajax', '사건', 66);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-12','정유라 기사내용','정유라 기사내용_2016-12.JPG','정유라 기사내용','대한민국','ajax', '사건', 67);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','최순실 방송기사','최순실 방송기사_2016-10.JPG','최순실 기사내용','대한민국','ajax', '사건', 68);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','최순실 방송기사','최순실 방송기사_2016-11.JPG','최순실 기사내용','대한민국','ajax', '사건', 69);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-12','최순실 방송기사','최순실 방송기사_2016-12.JPG','최순실 기사내용','대한민국','ajax', '사건', 70);

--***************************여기까지 추가해주세요************************

create table report(
	report_no number primary key,
	report_type varchar2(30) not null,
	report_content clob not null,
	report_date date not null,
	pic_date varchar2(7) not null,
	keyword varchar2(50) not null,
	constraint fk_report_picture foreign key(pic_date, keyword) references picture(pic_date,keyword)
)

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

--*************다음 해시태그 DB는 꼭 실행해주세요************

insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-03','올림픽','올림픽',1);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-03','올림픽','서울',2);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-03','올림픽','1988',3);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-03','올림픽','대한민국',4);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-05','올림픽','올림픽',1);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-05','올림픽','서울',2);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-05','올림픽','1988',3);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-05','올림픽','대한민국',4);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-08','올림픽','올림픽',1);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-08','올림픽','서울',2);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-08','올림픽','1988',3);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-08','올림픽','대한민국',4);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-09','올림픽','올림픽',1);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-09','올림픽','서울',2);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-09','올림픽','1988',3);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-09','올림픽','대한민국',4);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-10','올림픽','올림픽',1);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-10','올림픽','서울',2);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-10','올림픽','1988',3);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('1988-10','올림픽','대한민국',4);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-05','월드컵','대한민국',5);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-05','월드컵','월드컵',6);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-05','월드컵','2002',7);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-05','월드컵','한일',8);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-06','월드컵','대한민국',5);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-06','월드컵','월드컵',6);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-06','월드컵','2002',7);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-06','월드컵','한일',8);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-07','월드컵','대한민국',5);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-07','월드컵','월드컵',6);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-07','월드컵','2002',7);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-07','월드컵','한일',8);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-09','월드컵','대한민국',5);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-09','월드컵','월드컵',6);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-09','월드컵','2002',7);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2002-09','월드컵','한일',8);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-01','대구지하철화재','대구',9);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-01','대구지하철화재','지하철',10);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-01','대구지하철화재','화재',11);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-01','대구지하철화재','참사',12);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-01','대구지하철화재','대한민국',13);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-02','대구지하철화재','대구',9);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-02','대구지하철화재','지하철',10);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-02','대구지하철화재','화재',11);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-02','대구지하철화재','참사',12);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-02','대구지하철화재','대한민국',13);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-03','대구지하철화재','대구',9);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-03','대구지하철화재','지하철',10);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-03','대구지하철화재','화재',11);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-03','대구지하철화재','참사',12);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-03','대구지하철화재','대한민국',13);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-04','대구지하철화재','대구',9);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-04','대구지하철화재','지하철',10);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-04','대구지하철화재','화재',11);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-04','대구지하철화재','참사',12);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2003-04','대구지하철화재','대한민국',13);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-04','배용준','배용준',14);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-04','배용준','욘사마',15);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-04','배용준','팬미팅',16);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-05','배용준','배용준',14);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-05','배용준','욘사마',15);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-05','배용준','팬미팅',16);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-06','배용준','배용준',14);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-06','배용준','욘사마',15);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2004-06','배용준','팬미팅',16);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2005-05','박지성','박지성',17);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2005-05','박지성','산소탱크',18);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2005-05','박지성','PSV',19);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2005-05','박지성','네덜란드',20);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-01','숭례문','숭례문',21);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-01','숭례문','대한민국',22);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-01','숭례문','서울',23);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-01','숭례문','화재',24);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-01','숭례문','국보',25);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-02','숭례문','숭례문',21);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-02','숭례문','대한민국',22);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-02','숭례문','서울',23);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-02','숭례문','화재',24);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-02','숭례문','국보',25);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-03','숭례문','숭례문',21);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-03','숭례문','대한민국',22);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-03','숭례문','서울',23);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-03','숭례문','화재',24);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-03','숭례문','국보',25);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-04','숭례문','숭례문',21);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-04','숭례문','대한민국',22);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-04','숭례문','서울',23);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-04','숭례문','화재',24);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-04','숭례문','국보',25);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-05','숭례문','숭례문',21);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-05','숭례문','대한민국',22);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-05','숭례문','서울',23);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-05','숭례문','화재',24);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2008-05','숭례문','국보',25);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-05','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-05','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-05','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-06','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-06','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-06','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-07','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-07','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-07','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-08','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-08','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-08','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-09','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-09','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-09','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-10','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-10','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-10','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-11','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-11','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-11','신종플루','대한민국',28);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-12','신종플루','신종플루',26);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-12','신종플루','확산',27);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2009-12','신종플루','대한민국',28);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-03','천안함','대한민국',29);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-03','천안함','서해',30);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-03','천안함','천안함',31);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-03','천안함','격침',32);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-03','천안함','북한',33);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-04','천안함','대한민국',29);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-04','천안함','서해',30);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-04','천안함','천안함',31);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-04','천안함','격침',32);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-04','천안함','북한',33);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-05','천안함','대한민국',29);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-05','천안함','서해',30);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-05','천안함','천안함',31);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-05','천안함','격침',32);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2010-05','천안함','북한',33);


insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-01','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-01','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-01','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-01','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-02','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-02','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-02','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-02','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-03','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-03','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-03','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-03','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-04','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-04','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-04','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-04','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-05','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-05','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-05','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-05','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-06','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-06','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-06','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-06','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-07','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-07','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-07','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-07','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-08','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-08','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-08','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-08','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-09','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-09','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-09','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-09','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-10','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-10','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-10','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-10','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-11','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-11','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-11','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-11','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-12','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-12','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-12','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2014-12','세월호','대한민국',37);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2015-01','세월호','세월호',34);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2015-01','세월호','침몰',35);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2015-01','세월호','서해',36);
insert into HASHTAG(pic_date,keyword,hashtag_name,hashtag_count) values('2015-01','세월호','대한민국',37);


insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서 국정화 반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서 국정화 반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서 국정화 반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서 국정화 반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서 국정화 반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서 국정화 반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서 국정화 반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서 국정화 반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서 국정화 반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서 국정화 반대시위', '반대시위', '41');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '일본 역사 교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '일본 역사 교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '일본 역사 교과서', '역사교과서', '44');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '일본 역사 교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '일본 역사 교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '일본 역사 교과서', '역사교과서', '44');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '일본 역사 교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '일본 역사 교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '일본 역사 교과서', '역사교과서', '44');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '일본 역사 교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '일본 역사 교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '일본 역사 교과서', '역사교과서', '44');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령 퇴진시위', '광장', '51');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령 퇴진시위', '광장', '51');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령 퇴진시위', '광장', '51');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령 퇴진시위', '광장', '51');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령', '박근혜', '52');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령', '대통령', '53');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령', '대한민국', '54');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령', '최순실', '55');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령', '박근혜', '52');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령', '대통령', '53');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령', '대한민국', '54');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령', '최순실', '55');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라', '정유라', '55');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라', '최순실', '56');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라', '부정입학', '57');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라 기사내용', '정유라', '58');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라 기사내용', '최순실', '59');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라 기사내용', '기사', '60');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라 기사내용', '부정입학', '61');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라 기사내용', '이화여대', '62');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라 기사내용', '정유라', '58');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라 기사내용', '최순실', '59');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라 기사내용', '경오', '60');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라 기사내용', '부정입학', '61');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라 기사내용', '이화여대', '62');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라 기사내용', '정유라', '58');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라 기사내용', '최순실', '59');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라 기사내용', '신미', '60');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라 기사내용', '부정입학', '61');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라 기사내용', '이화여대', '62');


--*************여기까지 추가해주세요*****************

-- hashtag_name 값이있으면 update 없으면 insert
MERGE INTO hashtag
USING DUAL
ON(hashtag_name='촛불시위')
WHEN MATCHED THEN  
   update set hashtag_count=hashtag_count+1
WHEN NOT MATCHED THEN
  insert(pic_date,keyword,hashtag_name) values('1999.10','광화문','촛불시위')
  


select * from member
