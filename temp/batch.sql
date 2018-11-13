
drop table batch;
drop table daily;
drop table cycle;
drop table product;
drop table customer;
/* �� */
CREATE TABLE CUSTOMER (
	CID NUMBER NOT NULL, /* ����ȣ */
	CNM VARCHAR2(50) NOT NULL /* ���� */
);

COMMENT ON TABLE CUSTOMER IS '��';

COMMENT ON COLUMN CUSTOMER.CID IS '����ȣ';

COMMENT ON COLUMN CUSTOMER.CNM IS '����';

CREATE UNIQUE INDEX PK_CUSTOMER
	ON CUSTOMER (
		CID ASC
	);

ALTER TABLE CUSTOMER
	ADD
		CONSTRAINT PK_CUSTOMER
		PRIMARY KEY (
			CID
		);

/* ��ǰ */
CREATE TABLE PRODUCT (
	PID NUMBER NOT NULL, /* ��ǰ��ȣ */
	PNM VARCHAR2(50) NOT NULL /* ��ǰ�� */
);

COMMENT ON TABLE PRODUCT IS '��ǰ';

COMMENT ON COLUMN PRODUCT.PID IS '��ǰ��ȣ';

COMMENT ON COLUMN PRODUCT.PNM IS '��ǰ��';

CREATE UNIQUE INDEX PK_PRODUCT
	ON PRODUCT (
		PID ASC
	);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT PK_PRODUCT
		PRIMARY KEY (
			PID
		);

/* �������ֱ� */
CREATE TABLE CYCLE (
	CID NUMBER NOT NULL, /* ����ȣ */
	PID NUMBER NOT NULL, /* ��ǰ��ȣ */
	DAY NUMBER NOT NULL, /* ���� */
	CNT NUMBER NOT NULL /* ���� */
);

COMMENT ON TABLE CYCLE IS '�������ֱ�';

COMMENT ON COLUMN CYCLE.CID IS '����ȣ';

COMMENT ON COLUMN CYCLE.PID IS '��ǰ��ȣ';

COMMENT ON COLUMN CYCLE.DAY IS '����';

COMMENT ON COLUMN CYCLE.CNT IS '����';

CREATE UNIQUE INDEX PK_CYCLE
	ON CYCLE (
		CID ASC,
		PID ASC,
		DAY ASC
	);

ALTER TABLE CYCLE
	ADD
		CONSTRAINT PK_CYCLE
		PRIMARY KEY (
			CID,
			PID,
			DAY
		);

/* �Ͻ��� */
CREATE TABLE DAILY (
	CID NUMBER NOT NULL, /* ����ȣ */
	PID NUMBER NOT NULL, /* ��ǰ��ȣ */
	DT VARCHAR2(8) NOT NULL, /* ���� */
	CNT NUMBER NOT NULL /* ���� */
);

COMMENT ON TABLE DAILY IS '�Ͻ���';

COMMENT ON COLUMN DAILY.CID IS '����ȣ';

COMMENT ON COLUMN DAILY.PID IS '��ǰ��ȣ';

COMMENT ON COLUMN DAILY.DT IS '����';

COMMENT ON COLUMN DAILY.CNT IS '����';

CREATE UNIQUE INDEX PK_DAILY
	ON DAILY (
		CID ASC,
		PID ASC,
		DT ASC
	);

ALTER TABLE DAILY
	ADD
		CONSTRAINT PK_DAILY
		PRIMARY KEY (
			CID,
			PID,
			DT
		);

ALTER TABLE CYCLE
	ADD
		CONSTRAINT FK_CUSTOMER_TO_CYCLE
		FOREIGN KEY (
			CID
		)
		REFERENCES CUSTOMER (
			CID
		);

ALTER TABLE CYCLE
	ADD
		CONSTRAINT FK_PRODUCT_TO_CYCLE
		FOREIGN KEY (
			PID
		)
		REFERENCES PRODUCT (
			PID
		);

ALTER TABLE DAILY
	ADD
		CONSTRAINT FK_CUSTOMER_TO_DAILY
		FOREIGN KEY (
			CID
		)
		REFERENCES CUSTOMER (
			CID
		);

ALTER TABLE DAILY
	ADD
		CONSTRAINT FK_PRODUCT_TO_DAILY
		FOREIGN KEY (
			PID
		)
		REFERENCES PRODUCT (
			PID
		);


/* ��ġ */
CREATE TABLE BATCH (
	BID NUMBER NOT NULL, /* ��ġ��ȣ */
	BCD VARCHAR2(20) NOT NULL, /* ��ġ�۾� */
	ST VARCHAR2(20) NOT NULL, /* ��ġ���� */
	ST_DT DATE, /* ��ġ�������� */
	ED_DT DATE /* ��ġ�������� */
);

COMMENT ON TABLE BATCH IS '��ġ';

COMMENT ON COLUMN BATCH.BID IS '��ġ��ȣ';

COMMENT ON COLUMN BATCH.BCD IS '��ġ�۾�';

COMMENT ON COLUMN BATCH.ST IS '��ġ����';

COMMENT ON COLUMN BATCH.ST_DT IS '��ġ��������';

COMMENT ON COLUMN BATCH.ED_DT IS '��ġ��������';

CREATE UNIQUE INDEX PK_BATCH
	ON BATCH (
		BID ASC
	);

ALTER TABLE BATCH
	ADD
		CONSTRAINT PK_BATCH
		PRIMARY KEY (
			BID
		);        

--�ڷ�        
insert into customer values (1, 'brown');
insert into customer values (2, 'sally');
insert into customer values (3, 'cony');


insert into product values (100, '����Ʈ');
insert into product values (200, '��');
insert into product values (300, '���۽�');
insert into product values (400, '����Ʈ400');

insert into cycle values (1, 100, 2, 1);
insert into cycle values (1, 400, 3, 1);
insert into cycle values (1, 100, 4, 1);
insert into cycle values (1, 400, 5, 1);
insert into cycle values (1, 100, 6, 1);

insert into cycle values (2, 200, 2, 2);
insert into cycle values (2, 100, 3, 1);
insert into cycle values (2, 200, 4, 2);
insert into cycle values (2, 100, 5, 1);
insert into cycle values (2, 200, 6, 2);

insert into cycle values (3, 300, 2, 1);
insert into cycle values (3, 100, 3, 2);
insert into cycle values (3, 300, 4, 1);
insert into cycle values (3, 100, 5, 2);
insert into cycle values (3, 300, 6, 1);



insert into daily
select cycle.cid, cycle.pid, cal.dt, cycle.cnt
 from cycle, 
    (select *
     from
    (select to_char(to_date('201806', 'yyyymm') + (level-1), 'yyyymmdd') dt,
           to_char(to_date('201806', 'yyyymm') + (level-1), 'd') day
     from dual
     connect by level <= last_day(to_date('201806', 'yyyymm')) - (to_date('201806', 'yyyymm')-1))) cal
where cycle.day = cal.day;


--===========================================
select * from cycle;

select * from cycle
where cid=1
and pid=100
and day=2;

select * from calendar;

select * from calendar
where ymd between '201811'||'01' and '201811'||'31' ;


select ymd
from calendar
where ymd between '201811'||'01' and '201811'||'31' ;


select * 
from cycle
where cycle.cid=1
    and cycle.pid=100
    and cycle.day=2;


select ymd, to_char(to_date(ymd,'yyyyMMdd'),'d') d
from calendar
where ymd between '201811'||'01' and '201811'||'31' ;



select *
from
    (select ymd, to_char(to_date(ymd,'yyyyMMdd'),'d') d
     from calendar
     where ymd between '201811'||'01' and '201811'||'31')a, cycle 
where cycle.cid=1
    and cycle.pid=100
    and cycle.day=2
    and a.d=cycle.day;


select *
from
    (select ymd, to_char(to_date(ymd,'yyyyMMdd'),'d') d
     from calendar
     where ymd between '201811'||'01' and '201811'||'31')a, cycle 
where cycle.cid=1
    and cycle.pid=100
    and cycle.day=2
    and a.d=cycle.day;
    
    
select cycle.cid, cycle.pid, a.ymd, cycle.cnt
from
    (select ymd, to_char(to_date(ymd,'yyyyMMdd'),'d') d
     from calendar
     where ymd between '201811'||'01' and '201811'||'31')a, cycle 
where a.d=cycle.day;


