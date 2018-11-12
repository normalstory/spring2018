m62-312-627


--비밀번호 기간 제한 해제
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

pc01 --> pc01test
--사용자 생성
create user 유저명
identified by 비밀번호
default tablespace 테이블 스페이스
temporary tablespace 템프테이블 스페이지
quota unlimited on 테이블스페이스
quota 0m on system;

--권한 생성
grant resource, connect to 유저명;





--테스트 계정 생성후 운영데이터 이관
  CREATE TABLE "LPROD" 
   (	"LPROD_ID" NUMBER(7,0) NOT NULL ENABLE, 
	"LPROD_GU" CHAR(4 BYTE) NOT NULL ENABLE, 
	"LPROD_NM" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "PK_LPROD" PRIMARY KEY ("LPROD_GU")
  ) ;
  
  
  CREATE TABLE "BUYER" 
   (	"BUYER_ID" CHAR(6 BYTE) NOT NULL ENABLE, 
	"BUYER_NAME" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	"BUYER_LGU" CHAR(4 BYTE) NOT NULL ENABLE, 
	"BUYER_BANK" VARCHAR2(40 BYTE), 
	"BUYER_BANKNO" VARCHAR2(40 BYTE), 
	"BUYER_BANKNAME" VARCHAR2(15 BYTE), 
	"BUYER_ZIP" CHAR(7 BYTE), 
	"BUYER_ADD1" VARCHAR2(100 BYTE), 
	"BUYER_ADD2" VARCHAR2(80 BYTE), 
	"BUYER_COMTEL" VARCHAR2(14 BYTE) NOT NULL ENABLE, 
	"BUYER_FAX" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"BUYER_MAIL" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	"BUYER_CHARGER" VARCHAR2(10 BYTE), 
	"BUYER_TELEXT" VARCHAR2(2 BYTE), 
	 CONSTRAINT "PK_BUYER" PRIMARY KEY ("BUYER_ID"),
	 CONSTRAINT "FR_BUYER_LGU" FOREIGN KEY ("BUYER_LGU")
	  REFERENCES "LPROD" ("LPROD_GU") ENABLE
   ) ;

  
  
  
  CREATE TABLE "PROD" 
   (	"PROD_ID" VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	"PROD_NAME" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	"PROD_LGU" CHAR(4 BYTE) NOT NULL ENABLE, 
	"PROD_BUYER" CHAR(6 BYTE) NOT NULL ENABLE, 
	"PROD_COST" NUMBER(10,0) NOT NULL ENABLE, 
	"PROD_PRICE" NUMBER(10,0) NOT NULL ENABLE, 
	"PROD_SALE" NUMBER(10,0) NOT NULL ENABLE, 
	"PROD_OUTLINE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"PROD_DETAIL" CLOB, 
	"PROD_IMG" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	"PROD_TOTALSTOCK" NUMBER(10,0) NOT NULL ENABLE, 
	"PROD_INSDATE" DATE, 
	"PROD_PROPERSTOCK" NUMBER(10,0) NOT NULL ENABLE, 
	"PROD_SIZE" VARCHAR2(20 BYTE), 
	"PROD_COLOR" VARCHAR2(20 BYTE), 
	"PROD_DELIVERY" VARCHAR2(255 BYTE), 
	"PROD_UNIT" VARCHAR2(6 BYTE), 
	"PROD_QTYIN" NUMBER(10,0), 
	"PROD_QTYSALE" NUMBER(10,0), 
	"PROD_MILEAGE" NUMBER(10,0), 
	 CONSTRAINT "PK_PROD_ID" PRIMARY KEY ("PROD_ID"),
   
	 CONSTRAINT "FR_PROD_LGU" FOREIGN KEY ("PROD_LGU")
	  REFERENCES "LPROD" ("LPROD_GU") ENABLE, 
	 CONSTRAINT "FR_PROD_BUYER" FOREIGN KEY ("PROD_BUYER")
	  REFERENCES "BUYER" ("BUYER_ID") ENABLE
   ) ;


CREATE SEQUENCE  "SEQ_FILEID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;     
  
  
  
-- junit 테스트 작업으로 생성된 결과를 원복하는 sql 작성하여
-- 반복적으로 테스트 코드를 실행하여도 테스트 데이터는 
-- 항상 일정하게 유지 되도록 한다.  
  
  
create table rangers(
 rangersId varchar2(50),
 name varchar2(50),
 constraint pk_rangers primary key (rangersId)
 );
  
insert into rangers values ('brwon', '브라운');
insert into rangers values ('cony', '코니');
insert into rangers values ('sally', '샐리');  
  
  
  
--jsp user insert 스크립트 생성  
select 'insert into jspuser values (''' || userid || ''',''' || name
|| ''',''' || pass|| ''',''' || addr1|| ''',''' || addr2|| ''',''' || zipcd
|| ''',''' || birth|| ''',''' || email|| ''',''' || tel|| ''',''' || profile|| ''');'
 from jspuser;
  
  
  
  
  
  
  
  
  