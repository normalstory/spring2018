-- 운영db에 없는 테이블을 만들어서 필터 검증역할 수행 : rangerSetup(){ ... populater.setContinueOnError(false); }
-- (2번째 안전장치 마련용: dbTest.properties에 사용자 아이디를 운영DB로 잘못 바꾸는 경우 대비 )
select * from notexistsinprd;


--테스트 시, 데이터 초기화 용 
--테스트 코드가 실행되기 전 rangers 데이터 삭제 
delete from rangers;

--rangers 초기 데이터 3건  
insert into rangers values('brown','브라운');
insert into rangers values('cony','코니');
insert into rangers values('sally','샐리');

--commit; <--자동으로 오토커밋 해준다.


--테스트 코드가 실행되기 전 rangers 데이터 삭제 
delete from jspuser;

--jspuser 데이터 초기화
insert into jspuser values ('brown','브라운z','f01471c38113db263f9a532d8b6c054af31bf653aeea92d1c284cdd022b9','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/10/24','brown@gmail.con','123123123','/profile/brown.png');
insert into jspuser values ('sally','샐리','65c8b7874e6e1d2bc0978232e2274f7764ac156926db381f74f7b46fc5dc','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/04/27','sally@gmail.con','123123123','/profile/호냥이4.png');
insert into jspuser values ('cony','코니','conypass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/08/08','cony@gmail.con','123123123','/profile/cony.png');
insert into jspuser values ('moon','문','moonpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/10/06','moon@gmail.con','123123123','/profile/moon.png');
insert into jspuser values ('james','제임스','jamespass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','james@gmail.con','123123123','/profile/james.png');
insert into jspuser values ('xxxx1','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx2','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx3','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx4','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx5','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx6','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx7','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx8','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx9','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx10','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx11','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx12','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx13','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx14','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx15','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx16','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx17','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx18','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx19','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx20','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx21','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx22','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx23','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx24','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx25','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx26','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx27','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx28','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx29','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx30','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx31','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx32','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx33','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx34','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx35','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx36','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx37','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx38','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx39','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx40','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx41','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx42','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx43','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx44','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx45','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx46','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx47','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx48','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx49','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx50','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx51','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx52','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx53','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx54','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx55','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx56','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx57','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx58','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx59','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx60','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx61','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx62','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx63','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx64','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx65','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx66','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx67','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx68','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx69','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx70','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx71','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx72','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx73','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx74','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx75','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx76','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx77','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx78','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx79','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx80','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx81','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx82','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx83','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx84','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx85','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx86','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx87','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx88','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx89','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx90','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx91','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx92','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx93','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx94','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx95','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx96','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx97','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx98','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx99','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('xxxx100','xxxx','xxxxpass','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/02/14','xxxx@gmail.con','123123123','');
insert into jspuser values ('userId','name','pass','addr1','addr2','zipcd','18/10/12','email','tel','');
insert into jspuser values ('userIdee','nameee','passee','addr1ee','addr2ee','zipcd','18/10/12','email','tel','');
insert into jspuser values ('userIdee1','nameee1','passee1','addr1ee','addr2ee','zipcd','18/10/12','email','tel','');
insert into jspuser values ('rrrr','testUserIdr','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('sesss','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('rrrrrrrrrr','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('sssssss','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','D:\A_TeachingMaterial\6.JspSrpgin\upload\cony.png');
insert into jspuser values ('aaaaaaaaaaaa','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','/profile/brown.png');
insert into jspuser values ('111111','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/10/16','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('sally111','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','/profile/샐리.png');
insert into jspuser values ('ssall','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/01/08','newUser@gmail.com','0422228202','/profile/샐리.png');
insert into jspuser values ('brownc','브라운z','f01471c38113db263f9a532d8b6c054af31bf653aeea92d1c284cdd022b9','대전시 중구 대흥동 76','2층 대덕인재개발원','34940','18/10/24','brown@gmail.con','123123123','D:\\A_TeachingMaterial\\6.JspSrpgin\\upload\\샐리.png');
insert into jspuser values ('1','105','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/20','newUser@gmail.com','0422228202','/profile/20181109_152625.png');
insert into jspuser values ('weqw','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('1111111111111111111','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','');
insert into jspuser values ('qqqqqq','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('1q','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('11a','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('1aaaaa','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('1aaa','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('11aa','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('111aaaa','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('1q1q1q','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');
insert into jspuser values ('100','testUserId','Pass1234','대전 중구 중앙로76','영민빌딩 2층 대덕인재개발원','34940','18/08/08','newUser@gmail.com','0422228202','/profile/호냥이5.png');


--월단위 달력생성 초기화
delete from calendar where ymd like '201811%';


