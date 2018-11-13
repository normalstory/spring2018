
drop table batch;
drop table daily;
drop table cycle;
drop table product;
drop table customer;
/* 고객 */
CREATE TABLE CUSTOMER (
	CID NUMBER NOT NULL, /* 고객번호 */
	CNM VARCHAR2(50) NOT NULL /* 고객명 */
);

COMMENT ON TABLE CUSTOMER IS '고객';

COMMENT ON COLUMN CUSTOMER.CID IS '고객번호';

COMMENT ON COLUMN CUSTOMER.CNM IS '고객명';

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

/* 제품 */
CREATE TABLE PRODUCT (
	PID NUMBER NOT NULL, /* 제품번호 */
	PNM VARCHAR2(50) NOT NULL /* 제품명 */
);

COMMENT ON TABLE PRODUCT IS '제품';

COMMENT ON COLUMN PRODUCT.PID IS '제품번호';

COMMENT ON COLUMN PRODUCT.PNM IS '제품명';

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

/* 고객애음주기 */
CREATE TABLE CYCLE (
	CID NUMBER NOT NULL, /* 고객번호 */
	PID NUMBER NOT NULL, /* 제품번호 */
	DAY NUMBER NOT NULL, /* 요일 */
	CNT NUMBER NOT NULL /* 수량 */
);

COMMENT ON TABLE CYCLE IS '고객애음주기';

COMMENT ON COLUMN CYCLE.CID IS '고객번호';

COMMENT ON COLUMN CYCLE.PID IS '제품번호';

COMMENT ON COLUMN CYCLE.DAY IS '요일';

COMMENT ON COLUMN CYCLE.CNT IS '수량';

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

/* 일실적 */
CREATE TABLE DAILY (
	CID NUMBER NOT NULL, /* 고객번호 */
	PID NUMBER NOT NULL, /* 제품번호 */
	DT VARCHAR2(8) NOT NULL, /* 일자 */
	CNT NUMBER NOT NULL /* 수량 */
);

COMMENT ON TABLE DAILY IS '일실적';

COMMENT ON COLUMN DAILY.CID IS '고객번호';

COMMENT ON COLUMN DAILY.PID IS '제품번호';

COMMENT ON COLUMN DAILY.DT IS '일자';

COMMENT ON COLUMN DAILY.CNT IS '수량';

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


/* 배치 */
CREATE TABLE BATCH (
	BID NUMBER NOT NULL, /* 배치번호 */
	BCD VARCHAR2(20) NOT NULL, /* 배치작업 */
	ST VARCHAR2(20) NOT NULL, /* 배치상태 */
	ST_DT DATE, /* 배치시작일자 */
	ED_DT DATE /* 배치종료일자 */
);

COMMENT ON TABLE BATCH IS '배치';

COMMENT ON COLUMN BATCH.BID IS '배치번호';

COMMENT ON COLUMN BATCH.BCD IS '배치작업';

COMMENT ON COLUMN BATCH.ST IS '배치상태';

COMMENT ON COLUMN BATCH.ST_DT IS '배치시작일자';

COMMENT ON COLUMN BATCH.ED_DT IS '배치종료일자';

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

--자료        
insert into customer values (1, 'brown');
insert into customer values (2, 'sally');
insert into customer values (3, 'cony');


insert into product values (100, '야쿠르트');
insert into product values (200, '윌');
insert into product values (300, '쿠퍼스');
insert into product values (400, '야쿠르트400');

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


