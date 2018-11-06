package kr.or.ddit.user.dao;
//UserDao 생성 -> UserDaoTest 생성 
//mapper : user.xml	(alais x -> full package)
//assert 구문에서 데이터 전체 건수를 5와 비교 

import java.util.List;

import kr.or.ddit.config.db.SqlFactoryBuilder;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

//jspuser테이블 전체 조회 쿼리 
@Repository
public class UserDao implements UserDaoInf{
//select query id : selectUserAll  -> method : selectUserAll
	
	
	public List<UserVo> selectUserAll(){
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		//selectOne : 조회 데이터가 한 건일때 
		//selectList : 여러건의 데이터 조회 
		//메소드 인자: 문자열 - 메퍼(xml) 네임스페이스(모듈명).쿼리아이디 
		
		List<UserVo> userList = session.selectList("user.selectUserAll");
	/*	session.rollback();
		session.commit();*/
		session.close();
		
		return userList;
	}
	
	//아이디로 사용자 셀렉
	public UserVo selectUser(String param){
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		//파라미터 추가
		UserVo userVo = session.selectOne("user.selectUser", param);
		session.close();
		
		return userVo;
	}
	
	//객체로 사용자 셀렉
	public UserVo selectUser(UserVo user){
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		UserVo userVo = session.selectOne("user.selectUserByVo", user);
		session.close();
		
		return userVo;
	}
	
	//페이징 처리 
	public List<UserVo> selectUserPageList(PageVo pageVo){
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		List<UserVo> userList = session.selectList("user.selectUserPageList", pageVo);
		session.close();
		
		return userList;
	}
	
	/**
	* Method : getUsetCnt
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 사용자 전체 건수조회
	*/
	@Override
	public int getUsetCnt() {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		int totaluserCount = session.selectOne("user.getUsetCnt");
		session.close();
		
		return totaluserCount;
	}

	/**
	* Method : insertUser
	* 작성자 : pc03
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 등록
	*/
	@Override
	public int insertUser(UserVo userVo) {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		int insertCnt = session.insert("user.insertUser",userVo);
		//커밋
		session.commit();
		session.close();
		
		return insertCnt;
	}

	/**
	* Method : deleteUser
	* 작성자 : pc03
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사용자 삭제 
	*/
	@Override
	public int deleteUser(String userId) {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		int deleteUser = session.delete("user.deleteUser",userId);
		//커밋
		session.commit();
		session.close();
		
		return deleteUser;
	}

	/**
	* Method : updateUser
	* 작성자 : pc03
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 정보 수정
	*/
	@Override
	public int updateUser(UserVo userVo) {
		SqlSessionFactory factory = SqlFactoryBuilder.getSqlSessionFactory();
		SqlSession session= factory.openSession();
		
		int updateUser = session.update("user.updateUser",userVo);
		session.commit();
		session.close();
		
		return updateUser;
	}
	
	
}
