package kr.or.ddit.user.dao;
//UserDao 생성 -> UserDaoTest 생성 
//mapper : user.xml	(alais x -> full package)
//assert 구문에서 데이터 전체 건수를 5와 비교 

import java.util.List;

import javax.annotation.Resource;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//jspuser테이블 전체 조회 쿼리 
@Repository
public class UserDao implements UserDaoInf{
//select query id : selectUserAll  -> method : selectUserAll
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	public List<UserVo> selectUserAll(){
		return template.selectList("user.selectUserAll");
	}
	
	//아이디로 사용자 셀렉
	public UserVo selectUser(String param){
		return template.selectOne("user.selectUser", param);
	}
	
	//객체로 사용자 셀렉
	public UserVo selectUser(UserVo user){
		return template.selectOne("user.selectUserByVo", user);
	}
	
	//페이징 처리 
	public List<UserVo> selectUserPageList(PageVo pageVo){
		return template.selectList("user.selectUserPageList", pageVo);
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
		return template.selectOne("user.getUsetCnt");
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
		return template.insert("user.insertUser",userVo);
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
		return template.delete("user.deleteUser",userId);
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
		return template.update("user.updateUser",userVo);
	}
	
	
}
