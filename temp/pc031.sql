select 'X' result from dual;
--ȸ�� ���̺� 
--���̵�,�̸�,��ȭ��ȣ,�̸���,�����ּ�,�����ּһ�,�����ȣ
--�������(6 2006,2106 ->8�ڸ�(varchar2,8byte) vs date(long,7byte)
--��й�ȣ(��ȣȭ : �ؽ��Լ�-��ȣȭ�˰���� �� �������?,256byte)

DROP TABLE "user";

/* ȸ�� */
CREATE TABLE jspuser (
	userId VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	name VARCHAR2(50) NOT NULL, /* �̸� */
	pass VARCHAR2(256) NOT NULL, /* ��й�ȣ */
	addr1 VARCHAR2(255), /* �����ּ� */
	addr2 VARCHAR2(255), /* �����ּһ� */
	zipcd VARCHAR2(5), /* �����ȣ */
	birth DATE, /* ������� */
	email VARCHAR2(40), /* �̸��� */
	tel VARCHAR2(30), /* ��ȭ��ȣ */
	profile VARCHAR2(500) /* �����ʰ�� */
);

COMMENT ON TABLE jspuser IS 'ȸ��';

COMMENT ON COLUMN jspuser.userId IS 'ȸ�����̵�';

COMMENT ON COLUMN jspuser.name IS '�̸�';

COMMENT ON COLUMN jspuser.pass IS '��й�ȣ';

COMMENT ON COLUMN jspuser.addr1 IS '�����ּ�';

COMMENT ON COLUMN jspuser.addr2 IS '�����ּһ�';

COMMENT ON COLUMN jspuser.zipcd IS '�����ȣ';

COMMENT ON COLUMN jspuser.birth IS '�������';

COMMENT ON COLUMN jspuser.email IS '�̸���';

COMMENT ON COLUMN jspuser.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN jspuser.profile IS '�����ʰ��';

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
('brown', '����', 'brownpass', 
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20180808', 'yyyymmdd'), 'brown@gmail.con',
'123123123', '');

insert into jspuser values
('sally', '����', 'sallypass', 
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20180427', 'yyyymmdd'), 'sally@gmail.con',
'123123123', '');

insert into jspuser values
('cony', '�ڴ�', 'conypass', 
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20180808', 'yyyymmdd'), 'cony@gmail.con',
'123123123', '');

insert into jspuser values
('moon', '��', 'moonpass', 
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20181006', 'yyyymmdd'), 'moon@gmail.con',
'123123123', '');

insert into jspuser values
('james', '���ӽ�', 'jamespass', 
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20180214', 'yyyymmdd'), 'james@gmail.con',
'123123123', '');
 
commit;


--��ȣ, userId, name, birth
--rownum :�����÷�
select * from jspuser;
select rownum from jspuser;
select rownum as rnum, jspuser.* from jspuser;


select 'x' from dual;   --�������̺��� ��ȸ
select 'x',level
from dual 
connect by level <=5;   --5�� 


select 'xxxx'||level,'xxxx','xxxxpass',
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20180214', 'yyyymmdd'), 'xxxx@gmail.con',
'123123123', ''
from dual 
connect by level <=100;   --100�� 



insert into jspuser
select 'xxxx'||level,'xxxx','xxxxpass',
'������ �߱� ���ﵿ 76', '2�� ������簳�߿�', '34940', 
to_date('20180214', 'yyyymmdd'), 'xxxx@gmail.con',
'123123123', ''
from dual 
connect by level <=100;   --100�� 

commit;





--�޴� ���� �� : '201810'
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
    
    
--page �� 10�Ǿ� ��ȸ�ǵ���  �����ۼ�
--���� ���� : ������ ��ȣ 
-- 1������ : 1~10�� ����� ���   <- n�� = ���ı����� ������ ���� 
-- 2������ : 11~20�� ����� ���
-- 3������ : 21~30�� ����� ���
-- ���ı���: userId
    select * from jspuser
    ORDER BY userId;        --�����߰� 
    
    select rownum, jspuser.* from jspuser
    ORDER BY userId;        --rownum(���� ��ȣ)�߰� 
    
    select rownum, jspuser.* from jspuser
    where rownum between 1 and 10
    ORDER BY userId;        --rownum(���� ��ȣ)�߰� 
    
    
    select rownum, jspuser.* from jspuser
    where rownum between 11 and 20  -- <-�Ұ��� 
    ORDER BY userId;        --rownum(���� ��ȣ)�߰� 
    
    
    select rownum, jspuser.* from jspuser
    where rownum < 20  -- <-���� 
    ORDER BY userId;        --rownum(���� ��ȣ)�߰� 
    
    
    select * 
    from (select rownum rnum, jspuser.* 
    from jspuser
    ORDER BY userId)
    where rnum between 11 and 20;  --rownum �� alias�� ���̺�ó�� where�� �̿� <-����
    
    
    
    --�������� 10�� (���� ����) : �������� + ������ ������ 
    -- 1 -> 1 and 10
    -- 2 -> 11 and 20
    -- 3 -> 21 and 30
    
    --����ID : selectUserPageList  �޼ҵ��̸�    <-- userDao
    --���� : userId
    --�޼ҵ� ���� : kr.or.ddit.util.model.PageVo(page, pageSize)
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
    
    
    
    --order by�� ���߿� ����Ǿ� ������ ����
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
    
    /* �л� */
CREATE TABLE jspstudent (
	no NUMBER, /* �л���ȣ */
	name VARCHAR2(50) /* �л��̸� */
);

COMMENT ON TABLE jspstudent IS '�л�';

COMMENT ON COLUMN jspstudent.no IS '�л���ȣ';

COMMENT ON COLUMN jspstudent.name IS '�л��̸�';



insert into jspstudent values(1, '������');
insert into jspstudent values(2, '���μ�');
insert into jspstudent values(3, '������');
insert into jspstudent values(4, '������');
insert into jspstudent values(5, '������');
insert into jspstudent values(6, '������');
insert into jspstudent values(7, '������');
insert into jspstudent values(8, '�ڵ���');
insert into jspstudent values(9, '����');
insert into jspstudent values(10, '������');
insert into jspstudent values(11, '��μ�');
insert into jspstudent values(12, '������');
insert into jspstudent values(13, '���ؿ�');
insert into jspstudent values(14, '�ۿ���');
insert into jspstudent values(15, '���ٿ�');
insert into jspstudent values(16, '������');
insert into jspstudent values(17, '�̼���');
insert into jspstudent values(18, '�ӱԽ�');
insert into jspstudent values(19, '������');

commit;

select * from jspstudent;

select round(dbms_random.value(1,19)) val
from dual;

select * from jspstudent
where no =round(dbms_random.value(1,19));

select * from jspstudent where no =15;

commit;




ALTER TABLE jspstudent ADD(pic VARCHAR2(500) /* �����ʰ�� */);
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


---------------------- ��ȣȭ ����
select * from jspuser;

update jspuser set pass='f01471c38113db263f9a532d8b6c054af31bf653aeea92d1c284cdd022b9'
where userId='brown';

update jspuser set pass='65c8b7874e6e1d2bc0978232e2274f7764ac156926db381f74f7b46fc5dc'
where userId='sally';

commit;


--------------------------------------
--------------------------------------
/* �Խñ� */
CREATE TABLE board (
	id NUMBER NOT NULL, /* �Խñ۹�ȣ */
	title varchar2(500), /* ���� */
	pid NUMBER /* �θ�Խñ۹�ȣ */
);

COMMENT ON TABLE board IS '�Խñ�';

COMMENT ON COLUMN board.id IS '�Խñ۹�ȣ';

COMMENT ON COLUMN board.title IS '����';

COMMENT ON COLUMN board.pid IS '�θ�Խñ۹�ȣ';

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
        

insert into board values (1, 'ù��° ��', '');        
insert into board values (2, '�ι�° ��', '');        
insert into board values (3, '����° ��-2���� ���', 2);        
insert into board values (4, '�׹�° ��-3���� ���', 3);        
insert into board values (5, '�ټ���° ��', '');        
insert into board values (6, '������° ��', '');        
insert into board values (7, '�ϰ���° ��-5����  ���', 5);    
insert into board values (8, '������° ��-2���� ���', 2);        

commit;

select * from board;

--��������
select * from board
start with pid is null      --��������(root��)
connect by prior id = pid;  -- ����(����)�� ���� ������ 

--����ȭ 
select board.*, level 
from board
start with pid is null 
connect by prior id = pid; 

--�ð�ȭ
select lpad(' ',(level-1)*4,' ')||title line, board.*, level 
from board
start with pid is null 
connect by prior id = pid
order siblings by seq_no asc, id desc; 

select lpad('�� ',(level-1)*3, ' ')|| title, board.*, level 
    from board
    start with pid is null 
    connect by prior id = pid
    order siblings by id desc;
    
    
ALTER TABLE board ADD(groupId number); 

select * from board;

update board set seq_no = rownum
where pid is not null;
