
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

alter table picture MODIFY(category varchar2(100) null);
--***************3개 쿼리문 수행해 주세요***********--

insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.10','광화문','저기','어느 광화문','서울 어딘가','java');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','광화문','저기','어느 광화문','서울 어딘가','java');
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','올림픽','저기','어느 광화문','서울 어딘가','ajax');
-- 무결성 제약조건에 위배되는 삽입 문
insert into picture(pic_date,keyword,path,author_comment,pic_space,id) values('1999.11','광화문','저기','어느 광화문','서울 어딘가','ajax');


--******************다음의 사진DB는 꼭 추가해서 실행해주세요******************--
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-03','올림픽','올림픽_1988-03.JPG','일동 선서!','대한민국 서울','java', '사건', 1);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-05','올림픽','올림픽_1988-05.JPG','씩씩한 행진','대한민국 서울','java', '사건', 2);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-08','올림픽','올림픽_1988-08.JPG','젖 먹던 힘 까지','대한민국 서울','java', '사건', 3);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-09','올림픽','올림픽_1988-09.JPG','한치의 오차없이 정확하게','대한민국 서울','java', '사건', 4);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('1988-10','올림픽','올림픽_1988-10.JPG','동해물과 백두산이~','대한민국 서울','java', '사건', 5);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-05','월드컵','월드컵_2002-05.JPG','2002한일월드컵','대한민국','ajax', '사건', 6);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-06','월드컵','월드컵_2002-06.JPG','가자! 결승으로','대한민국','ajax', '사건', 7);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-07','월드컵','월드컵_2002-07.JPG','오~필승코리아','대한민국','ajax', '사건', 8);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2002-09','월드컵','월드컵_2002-09.JPG','반지의 제왕 반지 키스','대한민국','ajax', '사건', 9);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-01','대구지하철화재','대구지하철화재_2003-01.JPG','대구지하철 참사 그후','대한민국 대구','java', '사건', 10);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-02','대구지하철화재','대구지하철화재_2003-02.JPG','대구지하철 현장사진','대한민국 대구','java', '사건', 11);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-03','대구지하철화재','대구지하철화재_2003-03.JPG','삼가 고인의 명복을 빕니다','대한민국 대구','java', '사건', 12);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2003-04','대구지하철화재','대구지하철화재_2003-04.JPG','참혹했던 사건 현장','대한민국 대구','java', '사건', 13);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2004-04','배용준','배용준_2004-04.JPG','행복하게 살겠습니다','팬미팅 장소','ajax', '인물', 14);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2004-05','배용준','배용준_2004-05.JPG','영화 스캔들 속으로','팬미팅 장소 ','ajax', '인물', 15);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2004-06','배용준','배용준_2004-06.JPG','한류스타 욘사마','팬미팅 장소','ajax', '인물', 16);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2005-03','박지성','박지성_2005-03.JPG','퍼거슨 감독님과','네덜란드','java', '인물', 17);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2005-04','박지성','박지성_2005-04.JPG','캡틴 지성팍','네덜란드','java', '인물', 18);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2005-05','박지성','박지성_2005-05.JPG','지송빠레~~','네덜란드','java', '인물', 19);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2006-04','백남준','백남준_2006-04.JPG','백남준 작가','한국','java', '인물', 20);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2006-05','백남준','백남준_2006-05.JPG','백남준 비디오아트','한국','java', '인물', 21);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2006-06','백남준','백남준_2006-06.JPG','수레바퀴','한국','java', '인물', 22);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2007-03','원더걸스','원더걸스_2007-03.JPG','원더걸스 데뷔','대한민국','java', '인물', 23);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2007-04','원더걸스','원더걸스_2007-04.JPG','Tell me Tell me','대한민국','java', '인물', 24);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2007-05','원더걸스','원더걸스_2007-05.JPG','원더우먼 원더걸스','대한민국','java', '인물', 25);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-01','숭례문','숭례문_2008-01.JPG','진화현장','대한민국 서울','ajax', '장소', 26);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-02','숭례문','숭례문_2008-02.JPG','숭례문 화재','대한민국 서울','ajax', '장소', 27);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-03','숭례문','숭례문_2008-03.JPG','숭례문 화재 그 후','대한민국 서울','ajax', '장소', 28);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-04','숭례문','숭례문_2008-04.JPG','화재 그 후 참혹한 현장','대한민국 서울','ajax', '장소', 29);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2008-05','숭례문','숭례문_2008-05.JPG','화재진화 현장','대한민국 서울','ajax', '장소', 30);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-05','신종플루','신종플루_2009-05.JPG','예방접종 현장','대한민국','java', '사건', 31);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-06','신종플루','신종플루_2009-06.JPG','손을 깨끗히','대한민국','java', '사건', 32);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-07','신종플루','신종플루_2009-07.JPG','확산방지연구','대한민국','java', '사건', 33);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-08','신종플루','신종플루_2009-08.JPG','긴급대책 마련 기자회견','대한민국','java', '사건', 34);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-09','신종플루','신종플루_2009-09.JPG','예방대책','대한민국','java', '사건', 35);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-10','신종플루','신종플루_2009-10.JPG','예방접종 복지관','대한민국','java', '사건', 36);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-11','신종플루','신종플루_2009-11.JPG','예방합시다 신종플루','대한민국','java', '사건', 37);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2009-12','신종플루','신종플루_2009-12.JPG','현수막','대한민국','java', '사건', 38);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-03','천안함','천안함_2010-03.JPG','천안함 뉴스','대한민국 서해','ajax', '사건', 39);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-04','천안함','천안함_2010-04.JPG','천안함 격침','대한민국 서해','ajax', '사건', 40);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-05','천안함','천안함_2010-05.JPG','천안함호 인양현장','대한민국 서해','ajax', '사건', 41);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-03','연평도','연평도_2010-03.JPG','연평도 포격사건','대한민국 서해','ajax', '사건', 42);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-04','연평도','연평도_2010-04.JPG','연평 포격','대한민국 서해','ajax', '사건', 43);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2010-05','연평도','연평도_2010-05.JPG','연평도포격속 나','대한민국 서해','ajax', '사건', 44);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2011-03','스티브잡스','스티브잡스_2011-03.JPG','혁신적인 창조자','미국','java', '인물', 45);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2011-04','스티브잡스','스티브잡스_2011-04.JPG','맥북의 초기버전','미국','java', '인물', 46);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2011-05','스티브잡스','스티브잡스_2011-05.JPG','스티브잡스 발표','미국','java', '인물', 47);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2012-04','싸이','싸이_2012-04.JPG','강남스타일','대한민국','java', '인물', 48);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2012-05','싸이','싸이_2012-05.JPG','싸이 콘서트','대한민국','java', '인물', 49);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2012-06','싸이','싸이_2012-06.JPG','유튜브 스타 싸이','대한민국','java', '인물', 50);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2013-03','별그대','별그대_2013-03.JPG','별에서온그대','대한민국','java', '인물', 51);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2013-04','별그대','별그대_2013-04.JPG','김수현과 전지현','대한민국','java', '인물', 52);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2013-05','별그대','별그대_2013-05.JPG','두근두근','대한민국','java', '인물', 53);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-01','세월호','세월호_2014-01.JPG','구조현장','대한민국','java', '사건', 54);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-02','세월호','세월호_2014-02.JPG','구조의 모습','대한민국','java', '사건', 55);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-03','세월호','세월호_2014-03.JPG','기울어진 세월호','대한민국','java', '사건', 56);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-04','세월호','세월호_2014-04.JPG','한명의 생존자라도 더','대한민국','java', '사건', 57);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-05','세월호','세월호_2014-05.JPG','고개만 든 세월호','대한민국','java', '사건', 58);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-06','세월호','세월호_2014-06.JPG','집회현장','대한민국','java', '사건', 59);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-07','세월호','세월호_2014-07.JPG','삼가 고인의 명복을 빕니다','대한민국','java', '사건', 60);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-08','세월호','세월호_2014-08.JPG','한명의 생존자라도','대한민국','java', '사건', 61);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-09','세월호','세월호_2014-09.JPG','안타까운 현장','대한민국','java', '사건', 62);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-10','세월호','세월호_2014-10.JPG','뒤집혀진 세월호','대한민국','java', '사건', 63);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-11','세월호','세월호_2014-11.JPG','기울어진 세월호','대한민국','java', '사건', 64);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2014-12','세월호','세월호_2014-12.JPG','한명의 생존자를 위하여','대한민국','java', '사건', 65);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-01','세월호','세월호_2015-01.JPG','삼가고인의 명복을 빕니다','대한민국','java', '사건', 66);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-06','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-06.JPG','역사를 바로잡자 시위현장 ','대한민국','ajax', '사건', 67);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-07','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-07.JPG','역사를 바로잡자','대한민국','ajax', '사건', 68);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-08','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-08.JPG','국정화 반대','대한민국','ajax', '사건', 69);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-09','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-09.JPG','올바른 역사교육을','대한민국','ajax', '사건', 70);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-10','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-10.JPG','밤 늦게까지','대한민국','ajax', '사건', 71);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-11','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-11.JPG','국정화 철회','대한민국','ajax', '사건', 72);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-12','역사교과서국정화반대시위','역사교과서국정화반대시위_2015-12.JPG','국정 역사교과서 반대','대한민국','ajax', '사건', 73);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-06','일본역사교과서','일본역사교과서_2015-06.JPG','역사 왜곡현장','일본','java', '사건', 74);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-07','일본역사교과서','일본역사교과서_2015-07.JPG','역사 왜곡','일본','java', '사건', 75);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-08','일본역사교과서','일본역사교과서_2015-08.JPG','일본 역사왜곡 반대','일본','java', '사건', 76);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2015-09','일본역사교과서','일본역사교과서_2015-09.JPG','후손들에게 바른 역사를','일본','java', '사건', 77);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-09','박근혜대통령퇴진시위','박근혜대통령퇴진시위_2016-09.JPG','촛불집회현장','대한민국 서울시광장','ajax', '사건', 78);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','박근혜대통령퇴진시위','박근혜대통령퇴진시위_2016-10.JPG','퇴진 시위현장 속으로','대한민국 서울시광장','ajax', '사건', 79);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','박근혜대통령퇴진시위','박근혜대통령퇴진시위_2016-11.JPG','퇴진,하야','대한민국 서울시광장','ajax', '사건', 80);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-12','박근혜대통령퇴진시위','박근혜대통령퇴진시위_2016-12.JPG','국정농단','대한민국 서울시광장','ajax', '사건', 81);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','박근혜대통령','박근혜대통령_2016-10.JPG','새로운 대한민국을 만들겠습니다','대한민국 청와대','java', '인물', 82);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','박근혜대통령','박근혜대통령_2016-11.JPG','감사합니다','대한민국 청와대','java', '인물', 83);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','정유라','정유라_2016-11.JPG','승마선수 정유라','대한민국','java', '인물', 84);

insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','정유라기사내용','정유라기사내용_2016-10.JPG','돈도 실력이다','대한민국','ajax', '사건', 85);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','정유라기사내용','정유라기사내용_2016-11.JPG','승마선수 시절','대한민국','ajax', '사건', 86);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-12','정유라기사내용','정유라기사내용_2016-12.JPG','대학교 성적표','대한민국','ajax', '사건', 87);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-10','최순실방송기사','최순실방송기사_2016-10.JPG','성형 순방의혹','대한민국','ajax', '사건', 88);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-11','최순실방송기사','최순실방송기사_2016-11.JPG','비선실세 최순실','대한민국','ajax', '사건', 89);
insert into picture(pic_date,keyword,path,author_comment,pic_space,id,category,hits) 
values('2016-12','최순실방송기사','최순실방송기사_2016-12.JPG','국정농단','대한민국','ajax', '사건', 90);

delete from PICTURE;

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


select * from report;

delete from report;
insert into report(report_no, report_type,report_content,report_date,pic_date,keyword) values(2,'신고','실험',sysdate,'1988-03','올림픽');
insert into report values(1,'신고','선정성',sysdate,'1988-05','올림픽');
insert into report values(2,'신고','선정성',sysdate,'1999.10','광화문');
insert into report values(3,'정정','내용과 맞지 않음',sysdate,'2008-03','숭례문');

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
	select * from mypage;
	
	delete from mypage;
 	 
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


insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '역사교과서국정화반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '역사교과서국정화반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '역사교과서국정화반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '역사교과서국정화반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-10', '역사교과서국정화반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-11', '역사교과서국정화반대시위', '반대시위', '41');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서국정화반대시위', '역사교과서', '38');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서국정화반대시위', '대한민국', '39');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서국정화반대시위', '국정화', '40');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-12', '역사교과서국정화반대시위', '반대시위', '41');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '일본역사교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '일본역사교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-06', '일본역사교과서', '역사교과서', '44');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '일본역사교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '일본역사교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-07', '일본역사교과서', '역사교과서', '44');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '일본역사교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '일본역사교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-08', '일본역사교과서', '역사교과서', '44');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '일본역사교과서', '일본', '42');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '일본역사교과서', '역사왜곡', '43');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2015-09', '일본역사교과서', '역사교과서', '44');

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-09', '박근혜대통령퇴진시위', '광장', '51');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '박근혜대통령퇴진시위', '광장', '51');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '박근혜대통령퇴진시위', '광장', '51');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '박근혜', '45');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '대통령', '46');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '퇴진', '47');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '시위', '48');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '대한민국', '49');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '서울', '50');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '박근혜대통령퇴진시위', '광장', '51');

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

insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라기사내용', '정유라', '58');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라기사내용', '최순실', '59');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라기사내용', '기사', '60');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라기사내용', '부정입학', '61');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-10', '정유라기사내용', '이화여대', '62');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라기사내용', '정유라', '58');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라기사내용', '최순실', '59');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라기사내용', '경오', '60');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라기사내용', '부정입학', '61');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-11', '정유라기사내용', '이화여대', '62');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라기사내용', '정유라', '58');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라기사내용', '최순실', '59');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라기사내용', '신미', '60');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라기사내용', '부정입학', '61');
insert into hashtag(pic_date,keyword,hashtag_name,hashtag_count) values ('2016-12', '정유라기사내용', '이화여대', '62');

delete from hashtag;

--*************여기까지 추가해주세요*****************

-- hashtag_name 값이있으면 update 없으면 insert
MERGE INTO hashtag
USING DUAL
ON(hashtag_name='촛불시위')
WHEN MATCHED THEN  
   update set hashtag_count=hashtag_count+1
WHEN NOT MATCHED THEN
  insert(pic_date,keyword,hashtag_name) values('1999.10','광화문','촛불시위')
  
-- 시퀀스 추가--
create sequence seq_report_no; 
drop sequence seq_report_no;
select p.pic_date as pictureDate, p.keyword, p.path, p.author_comment as authorComment, p.hits, p.pic_space as pictureSpace,
p.id, p.category, h.hashtag_name from picture p, HASHTAG h
where p.keyword like '%트래비%'
and p.pic_date = h.pic_date
and p.keyword = h.keyword

select p.pic_date as pictureDate, p.keyword, p.path, p.author_comment as authorComment, p.hits,
		 p.pic_space as pictureSpace, p.id, p.category, h.hashtag_name as hashtagName from picture p, hashtag h
		where p.keyword = '트래비분수'
		and p.pic_date='2016-06'
		and p.pic_date=h.pic_date
		and p.keyword=h.keyword
		
		select pic_date as pictureDate, keyword, path, author_comment as authorComment, hits,
		 pic_space as pictureSpace, id, category from picture
		where pic_date='2016-06'
		and keyword='트래비분수'
	
-- **********마이페이지 buy_date 컬럼 not null 에서 null로 수정***********--
alter table mypage MODIFY(buy_date date null);
		

-- **********TimeMachine Table 추가*********** --
create table TIMEMACHINE(
	TIMEMACHINE_YEAR number(4) primary key,
	TIMEMACHINE_TILE varchar2(100) not null,
	TIMEMACHINE_CONTENT varchar2(300) not null,
	TiMEMACHINE_KEYWORD varchar2(100) not null
);

insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('1988', '아, 대한민국', '서울올림픽, 굴렁쇠 소년 그리고 호돌이', '올림픽');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2002', '기억하시나요 붉은 함성', 'Be the Reds', '월드컵');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2003', '안이한 대책이 만든 인재(人災)', '대구 지하철 화재', '대구지하철화재');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2004', '아이시떼루 욘사마', '배용준', '배용준');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2005', '달려라, 산소탱크', '박지성', '박지성');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2006', '비디오 아트의 거장', '백남준', '백남준');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2007', 'TELL ME~ TELL ME~', '원더걸스', '원더걸스');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2008', '문화재 관리가 이렇게 허술했던가', '숭례문 화재', '숭례문');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2009', '의학이 발전했듯 바이러스도 진화했다', '신종플루', '신종플루');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2010', '순국선열의 명복을 빕니다', '천안함 격침', '천안함');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2011', '창조적 혁신가 스티브잡스', '스티브잡스', '스티브잡스');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2012', '강남 스타일', '싸이', '싸이');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2013', '김수현과 전지현', '별에서온그대', '별에서온그대');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2014', '언제쯤이면 안전불감증에서 벗어날까', '세월호 침몰', '세월호');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2015', '누구를 위한 역사인가', '역사교과서 국정화 반대시위', '역사교과서국정화반대시위');
insert into timemachine(TIMEMACHINE_YEAR, TIMEMACHINE_TILE, TIMEMACHINE_CONTENT, TiMEMACHINE_KEYWORD) values ('2016', '우리는 꼭두각시를 대통령으로 하지 않았다', '박근혜 대통령 퇴진시위', '박근혜대통령퇴진시위');

delete from timemachine;

-- ************연습들************* --

select * from hashtag
where hashtag_name='ㅁㅁㅁ';

select * from HASHTAg
where pic_date='1988-08'
and keyword='올림픽'
and hashtag_name='올림픽'

MERGE INTO hashtag
		USING DUAL
		ON(pic_date='1988-08' and keyword='올림픽' and hashtag_name='올림픽')
		WHEN MATCHED THEN  
		   update set hashtag_count=hashtag_count+1
		WHEN NOT MATCHED THEN
		  insert(pic_date,keyword,hashtag_name) values('1988-08', '올림픽', '올림픽');
		  
		  MERGE INTO hashtag
USING DUAL
ON(hashtag_name='촛불시위')
WHEN MATCHED THEN  
   update set hashtag_count=hashtag_count+1
WHEN NOT MATCHED THEN
  insert(pic_date,keyword,hashtag_name) values('1999.10','광화문','촛불시위')
  
select id,pic_date,rnum,keyword,path,author_comment,hits,pic_space,category from 
	(select id, pic_date,row_number() over(order by keyword desc) as rnum,keyword,path,author_comment,hits,pic_space,category
	from picture) where rnum between #{startRowNumber} and #{endRowNumber} order by keyword desc
	
	
select rowNumber, id, pic_date, keyword, path, author_comment, hits, pic_space, category
from (
	select row_number() over(order by p.hits desc) as rowNumber, p.id, p.pic_date, p.keyword, p.path, p.author_comment, p.hits, p.pic_space, p.category
	from picture p, (select keyword, pic_date, substr(pic_date, 1, 4) as year from picture) d
	where p.pic_date=d.pic_date and p.keyword=d.keyword and d.year = 2016 and category='인물' or category='장소'
)
where rowNumber between 1 and 3 order by rowNumber asc




