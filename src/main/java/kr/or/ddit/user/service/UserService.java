package kr.or.ddit.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.dao.UserDao;
import kr.or.ddit.user.dao.UserDaoInf;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

//@Repository
@Service
public class UserService implements UserServiceInf{

	@Resource(name="userDao")
	private UserDao userdao;
	
	@Override
	public List<UserVo> selectUserAll() {
		return userdao.selectUserAll();
	}

	@Override
	public UserVo selectUser(String param) {
		return userdao.selectUser(param);
	}

	@Override
	public UserVo selectUser(UserVo userVo) {
		return userdao.selectUser(userVo);
	}

	
	/**
	* Method : selectUserPageList
	* 작성자 : pc03
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 사용자 페이징 조회 
	*/
	@Override
	public 	Map<String,Object> selectUserPageList(PageVo pageVo) {
		
		//페이지에 해당하는 유저리스트(1~10건)
		List<UserVo> userList = userdao.selectUserPageList(pageVo);
		
		//전체 리스트 
		int totalUserCnt = userdao.getUsetCnt();
		
		//여러개의 결과를 담은 map객체 
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("userList",userList);
		resultMap.put("pageCnt",(int)Math.ceil((double)totalUserCnt/pageVo.getPageSize()));
		
		//(int)Math.ceil((double)total/pageSize)
		
		return resultMap;
	}

	@Override
	public int insertUser(UserVo userVo) {
		return userdao.insertUser(userVo);
	}

	@Override
	public int deleteUser(String userId) {
		return userdao.deleteUser(userId);
	}

	@Override
	public int updateUser(UserVo userVo) {
		return userdao.updateUser(userVo);
	}

}
