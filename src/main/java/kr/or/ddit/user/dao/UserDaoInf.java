package kr.or.ddit.user.dao;

import java.util.List;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

public interface UserDaoInf {
	List<UserVo> selectUserAll();
	UserVo selectUser(String param);
	UserVo selectUser(UserVo userVo);
	List<UserVo> selectUserPageList(PageVo pageVo);
	
	/**
	* Method : getUsetCnt
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 사용자 전체 건수조회
	* 
	* 
	*/
	int getUsetCnt();
	
	/**
	* Method : insertUser
	* 작성자 : pc03
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 등록
	*/
	int insertUser(UserVo userVo);
	
	
	/**
	* Method : deleteUser
	* 작성자 : pc03
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사용자 삭제 
	*/
	int deleteUser(String userId);
	
	/**
	* Method : updateUser
	* 작성자 : pc03
	* 변경이력 :
	* @param userVo
	* @return
	* Method 설명 : 사용자 정보 수정
	*/
	int updateUser(UserVo userVo);
}
