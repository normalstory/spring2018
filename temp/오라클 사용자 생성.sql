--비밀번호 기간 제한 해제
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

--사용자 생성
create user 유저명
identified by 비밀번호
default tablespace 테이블 스페이스
temporary tablespace 템프테이블 스페이지
quota unlimited on 테이블스페이스
quota 0m on system;

--사용자 생성(pc03test)
create user pc03test
identified by java
default tablespace users
temporary tablespace temp
quota unlimited on users
quota 0m on system;


--권한 생성 : accept n_piputareavg
grant resource, connect to 유저명;
ekffur



