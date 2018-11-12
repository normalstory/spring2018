select 'X' result from dual;
--회원 테이블 
--아이디,이름,전화번호,이메일,도로주소,도로주소상세,우편번호
--생년월일(6 2006,2106 ->8자리(varchar2,8byte) vs date(long,7byte)
--비밀번호(암호화 : 해쉬함수-암호화알고리즘과 그 사이즈는?,256byte)

DROP TABLE "user";

/* 회원 */
CREATE TABLE jspuser (
	userId VARCHAR2(50) NOT NULL, /* 회원아이디 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	pass VARCHAR2(256) NOT NULL, /* 비밀번호 */
	addr1 VARCHAR2(255), /* 도로주소 */
	addr2 VARCHAR2(255), /* 도로주소상세 */
	zipcd VARCHAR2(5), /* 우편번호 */
	birth DATE, /* 생년월일 */
	email VARCHAR2(40), /* 이메일 */
	tel VARCHAR2(30), /* 전화번호 */
	profile VARCHAR2(500) /* 프로필경로 */
);

COMMENT ON TABLE jspuser IS '회원';

COMMENT ON COLUMN jspuser.userId IS '회원아이디';

COMMENT ON COLUMN jspuser.name IS '이름';

COMMENT ON COLUMN jspuser.pass IS '비밀번호';

COMMENT ON COLUMN jspuser.addr1 IS '도로주소';

COMMENT ON COLUMN jspuser.addr2 IS '도로주소상세';

COMMENT ON COLUMN jspuser.zipcd IS '우편번호';

COMMENT ON COLUMN jspuser.birth IS '생년월일';

COMMENT ON COLUMN jspuser.email IS '이메일';

COMMENT ON COLUMN jspuser.tel IS '전화번호';

COMMENT ON COLUMN jspuser.profile IS '프로필경로';

CREATE UNIQUE INDEX PK_jspuser
	ON jspuser (
		userId ASC
	);

ALTER TABLE jspuser
	ADD
		CONSTRAINT PK_jspuser
		PRIMARY KEY (
			userId
		);
        
select * from jspuser;

--http://www.juso.go.kr/openIndexPage.do
insert into jspuser values
('brown', '브라운', 'brownpass', 
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20180808', 'yyyymmdd'), 'brown@gmail.con',
'123123123', '');

insert into jspuser values
('sally', '샐리', 'sallypass', 
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20180427', 'yyyymmdd'), 'sally@gmail.con',
'123123123', '');

insert into jspuser values
('cony', '코니', 'conypass', 
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20180808', 'yyyymmdd'), 'cony@gmail.con',
'123123123', '');

insert into jspuser values
('moon', '문', 'moonpass', 
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20181006', 'yyyymmdd'), 'moon@gmail.con',
'123123123', '');

insert into jspuser values
('james', '제임스', 'jamespass', 
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20180214', 'yyyymmdd'), 'james@gmail.con',
'123123123', '');
 
commit;


--번호, userId, name, birth
--rownum :가상컬럼
select * from jspuser;
select rownum from jspuser;
select rownum as rnum, jspuser.* from jspuser;


select 'x' from dual;   --가상테이블에서 조회
select 'x',level
from dual 
connect by level <=5;   --5번 


select 'xxxx'||level,'xxxx','xxxxpass',
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20180214', 'yyyymmdd'), 'xxxx@gmail.con',
'123123123', ''
from dual 
connect by level <=100;   --100번 



insert into jspuser
select 'xxxx'||level,'xxxx','xxxxpass',
'대전시 중구 대흥동 76', '2층 대덕인재개발원', '34940', 
to_date('20180214', 'yyyymmdd'), 'xxxx@gmail.con',
'123123123', ''
from dual 
connect by level <=100;   --100번 

commit;





--받는 인자 값 : '201810'
select to_char(sysdate -10 + rownum,'yyyymmdd')
from jspuser --dual
where rownum<=31; --connect by level

select to_date('201810'||'01','yyyymmdd') ,
    last_day(to_date('201810'||'01','yyyymmdd')) ,
    last_day(to_date('201810'||'01','yyyymmdd'))-
    to_date('201810'||'01','yyyymmdd')+1 days
from dual;



select to_date('201810'||'01','yyyymmdd') ,
    last_day(to_date('201810'||'01','yyyymmdd')) ,
    last_day(to_date('201810'||'01','yyyymmdd'))-
    to_date('201810'||'01','yyyymmdd')+1 days
from dual;

select to_char((to_date('201809'||'01','yyyymmdd')+level-1),'yyyymmdd')
from dual
connect by level <= last_day(to_date('201810'||'01','yyyymmdd'))-
    to_date('201810'||'01','yyyymmdd');
    
    
--page 당 10건씩 조회되도록  쿼리작성
--쿼리 인자 : 페이지 번호 
-- 1페이지 : 1~10번 사용자 목록   <- n번 = 정렬기준이 있음이 생략 
-- 2페이지 : 11~20번 사용자 목록
-- 3페이지 : 21~30번 사용자 목록
-- 정렬기준: userId
    select * from jspuser
    ORDER BY userId;        --정렬추가 
    
    select rownum, jspuser.* from jspuser
    ORDER BY userId;        --rownum(가상 번호)추가 
    
    select rownum, jspuser.* from jspuser
    where rownum between 1 and 10
    ORDER BY userId;        --rownum(가상 번호)추가 
    
    
    select rownum, jspuser.* from jspuser
    where rownum between 11 and 20  -- <-불가능 
    ORDER BY userId;        --rownum(가상 번호)추가 
    
    
    select rownum, jspuser.* from jspuser
    where rownum < 20  -- <-가능 
    ORDER BY userId;        --rownum(가상 번호)추가 
    
    
    select * 
    from (select rownum rnum, jspuser.* 
    from jspuser
    ORDER BY userId)
    where rnum between 11 and 20;  --rownum 을 alias로 테이블처럼 where절 이용 <-가능
    
    
    
    --페이지당 10건 (변동 가능) : 쿼리인자 + 페이지 사이즈 
    -- 1 -> 1 and 10
    -- 2 -> 11 and 20
    -- 3 -> 21 and 30
    
    --쿼리ID : selectUserPageList  메소드이름    <-- userDao
    --정렬 : userId
    --메소드 인자 : kr.or.ddit.util.model.PageVo(page, pageSize)
    select * 
    from 
    (select rownum rnum, a.*
    from
    (select jspuser.* 
    from jspuser
    ORDER BY userId) a)
    where rnum between #{page}*#{pageSize}-(#{pageSize}-1)
                   and #{page}*#{pageSize};
                   
   where rnum between 2*15-(15-1)
               and 2*15;               
    --1 --> 1 and 10
    --2 --> 11 and 20
    --3 --> 21 and 30     
    
    
    
    --order by가 나중에 적용되어 순서가 뒤죽
    select rownum rnum, jspuser.* 
    from jspuser
    ORDER BY name;
    
    select rownum rnum, a.*
    from
    (select jspuser.* 
    from jspuser
    ORDER BY userId) a;
    
    
    
    -------------------------------------------------------
    -- '/profile'||userid||'.png'
    select userid, profile
    from jspuser
    where userid in('brown','sally','cony','moon','james');
    --------------------------------------------------------
    
    update jspuser set profile='/profile/'||userid||'.png'
    where userid in('brown','sally','cony','moon','james');
    
    select userid, profile
    from jspuser;
    
    commit;
    
    
    
    -------------------------------------------------------
    select * from jspuser;
    
insert into jspuser 
  (userId, name, pass, addr1, addr2, zipcd, birth, email, tel)
  values
  (#{userId},#{name},#{pass},#{addr1},#{addr2},#{zipcd},#{birth},#{email},#{tel});
    
    
DROP TABLE jsptstudent;
    
    /* 학생 */
CREATE TABLE jspstudent (
	no NUMBER, /* 학생번호 */
	name VARCHAR2(50) /* 학생이름 */
);

COMMENT ON TABLE jspstudent IS '학생';

COMMENT ON COLUMN jspstudent.no IS '학생번호';

COMMENT ON COLUMN jspstudent.name IS '학생이름';



insert into jspstudent values(1, '강석균');
insert into jspstudent values(2, '구인수');
insert into jspstudent values(3, '김정현');
insert into jspstudent values(4, '김종훈');
insert into jspstudent values(5, '김지선');
insert into jspstudent values(6, '김지태');
insert into jspstudent values(7, '나진실');
insert into jspstudent values(8, '박동주');
insert into jspstudent values(9, '박진');
insert into jspstudent values(10, '박찬배');
insert into jspstudent values(11, '방민성');
insert into jspstudent values(12, '변찬우');
insert into jspstudent values(13, '서준영');
insert into jspstudent values(14, '송연진');
insert into jspstudent values(15, '유다영');
insert into jspstudent values(16, '유민지');
insert into jspstudent values(17, '이소형');
insert into jspstudent values(18, '임규승');
insert into jspstudent values(19, '최재현');

commit;

select * from jspstudent;

select round(dbms_random.value(1,19)) val
from dual;

select * from jspstudent
where no =round(dbms_random.value(1,19));

select * from jspstudent where no =15;

commit;




ALTER TABLE jspstudent ADD(pic VARCHAR2(500) /* 프로필경로 */);
update jspstudent set pic='pic/1.jpg'  where no=1;
update jspstudent set pic='pic/2.jpg'  where no=2;
update jspstudent set pic='pic/3.jpg'  where no=3;
update jspstudent set pic='pic/4.jpg'  where no=4;
update jspstudent set pic='pic/5.jpg'  where no=5;
update jspstudent set pic='pic/6.jpg'  where no=6;
update jspstudent set pic='pic/7.jpg'  where no=7;
update jspstudent set pic='pic/8.jpg'  where no=8;
update jspstudent set pic='pic/9.jpg'  where no=9;
update jspstudent set pic='pic/10.jpg' where no=10;
update jspstudent set pic='pic/11.jpg' where no=11;
update jspstudent set pic='pic/12.jpg' where no=12;
update jspstudent set pic='pic/13.jpg' where no=13;
update jspstudent set pic='pic/14.jpg' where no=14;
update jspstudent set pic='pic/15.jpg' where no=15;
update jspstudent set pic='pic/16.jpg' where no=16;
update jspstudent set pic='pic/17.jpg' where no=17;
update jspstudent set pic='pic/18.jpg' where no=18;
update jspstudent set pic='pic/19.jpg' where no=19;


---------------------- 암호화 적용
select * from jspuser;

update jspuser set pass='f01471c38113db263f9a532d8b6c054af31bf653aeea92d1c284cdd022b9'
where userId='brown';

update jspuser set pass='65c8b7874e6e1d2bc0978232e2274f7764ac156926db381f74f7b46fc5dc'
where userId='sally';

commit;


--------------------------------------
--------------------------------------
/* 게시글 */
CREATE TABLE board (
	id NUMBER NOT NULL, /* 게시글번호 */
	title varchar2(500), /* 제목 */
	pid NUMBER /* 부모게시글번호 */
);

COMMENT ON TABLE board IS '게시글';

COMMENT ON COLUMN board.id IS '게시글번호';

COMMENT ON COLUMN board.title IS '제목';

COMMENT ON COLUMN board.pid IS '부모게시글번호';

CREATE UNIQUE INDEX PK_board
	ON board (
		id ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			id
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_board_TO_board
		FOREIGN KEY (
			pid
		)
		REFERENCES board (
			id
		);
        

insert into board values (1, '첫번째 글', '');        
insert into board values (2, '두번째 글', '');        
insert into board values (3, '세번째 글-2번글 답글', 2);        
insert into board values (4, '네번째 글-3번글 답글', 3);        
insert into board values (5, '다섯번째 글', '');        
insert into board values (6, '여섯번째 글', '');        
insert into board values (7, '일곱번째 글-5번글  답글', 5);    
insert into board values (8, '여덟번째 글-2번글 답글', 2);        

commit;

select * from board;

--계층쿼리
select * from board
start with pid is null      --시작조건(root글)
connect by prior id = pid;  -- 사전(이전)에 읽은 데이터 

--가상화 
select board.*, level 
from board
start with pid is null 
connect by prior id = pid; 

--시각화
select lpad(' ',(level-1)*4,' ')||title line, board.*, level 
from board
start with pid is null 
connect by prior id = pid
order siblings by seq_no asc, id desc; 

select lpad('▶ ',(level-1)*3, ' ')|| title, board.*, level 
    from board
    start with pid is null 
    connect by prior id = pid
    order siblings by id desc;
    
    
ALTER TABLE board ADD(groupId number); 

select * from board;

update board set seq_no = rownum
where pid is not null;
