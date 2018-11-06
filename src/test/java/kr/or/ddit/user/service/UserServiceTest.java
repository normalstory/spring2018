package kr.or.ddit.user.service;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.test.ServiceDaoTestConfig;
import kr.or.ddit.user.dao.UserDao;
import kr.or.ddit.user.dao.UserDaoInf;
import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.util.model.PageVo;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class UserServiceTest extends ServiceDaoTestConfig {

	@Resource(name="userService")
	private UserServiceInf userService;
	
	private final String TEST_USERID= "testUserId";
	
	@BeforeClass
	public static void beforeClass(){
		//test="2345";	//static에러 반드시 이어야한다
		System.out.println("[ BeforeClass]");
	}
	
	@AfterClass 
	public static void afterClass(){
		System.out.println("[ AfterClass]");
	}
	
	@Before
	public void before(){
		//test="2345";	//static에러 반드시 이어야한다
		System.out.println("[ Before]");
		userService.deleteUser(TEST_USERID);
	}
	
	@After 
	public void after(){
		System.out.println("[ After]");
	}
	
	
	
	@Test
	public void selectUserAllTest() {
		/***Given 주어진 상황 : new 연산자를 사용하여 테스트할 객체 생성 ***/

		/***When 어떤 동작(메소드 호출) ***/
		List<UserVo> list=userService.selectUserAll();
		System.out.println("list.size() : "+ list.size());
		
		/***Then 결과가 어떠해야하는지 정의 : (기대값,결과값) ***/
		assertEquals(117,list.size());
	}
	
	@Test
	public void selectUserTest() {
		/***Given 주어진 상황 : new 연산자를 사용하여 테스트할 객체 생성 ***/
		
		/***When 어떤 동작(메소드 호출) ***/
		//담지를 안았는데 UserVo
		//대상만 불러오고 
		UserVo userVo=userService.selectUser("brown");
		System.out.println("1 userVo.getUserId() : "+ userVo.getUserId());
		System.out.println("1 userVo.getName() : "+ userVo.getName());
		
		/***Then 결과가 어떠해야하는지 정의 : (기대값,결과값) ***/
		//지정한 대상이 들고있는 정보를 비교 
		assertNotNull(userVo);
		assertEquals("brown",userVo.getUserId());
		assertEquals("브라운z",userVo.getName());
	}
	
	@Test
	public void selectUserByVoTest() {
		/***Given 주어진 상황 : new 연산자를 사용하여 테스트할 객체 생성 ***/
		
		/***When 어떤 동작(메소드 호출) ***/
//		UserVo userVo = new UserVo();
//		userVo.setUserId("brown");
//		userVo=userDao.selectUser(userVo);
		//같은 코드
		UserVo userVo = userService.selectUser("brown");
		
		System.out.println("2 userVo.getUserId() : "+ userVo.getUserId());
		System.out.println("2 userVo.getName() : "+ userVo.getName());
		
		/***Then 결과가 어떠해야하는지 정의 : (기대값,결과값) ***/
		//지정한 대상이 들고있는 정보를 비교 
		assertNotNull(userVo);
		assertEquals("brown",userVo.getUserId());
		assertEquals("브라운z",userVo.getName());
	}

	@Test
	public void selectUserPageListTest() {
		
		PageVo pageVo = new PageVo();
		pageVo.setPage(11);
		pageVo.setPageSize(10);
		
		//List<UserVo> pageList = (List<UserVo>)userService.selectUserPageList(pageVo);
		Map<String,Object> resultMap = userService.selectUserPageList(pageVo);
		List<UserVo> userList = (List<UserVo>)resultMap.get("userList");
		
		int pageCnt = (Integer)resultMap.get("pageCnt");		
		System.out.println("3 pageList.size() : "+userList.size());
		
		assertEquals(10,userList.size());
		assertEquals(12,pageCnt);
	}
	

	/**
	* Method : insertUserTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 사용자 등록 
	*/
	@Test 
	public void insertUserTest(){
		/***Given***/
		//UserVo 준비
		UserVo userVo = new UserVo();
		userVo.setUserId(TEST_USERID);
		userVo.setName("nameee13");
		userVo.setPass("passee13");
		userVo.setAddr1("addr1ee");
		userVo.setAddr2("addr2ee");
		userVo.setZipcd("zipcd");
		GregorianCalendar gc = new GregorianCalendar(2018,7,8);
		userVo.setBirth(new Date(gc.getTimeInMillis()));
		userVo.setEmail("email@gmail.com");
		userVo.setTel("12312341234");
		
		/***When***/
		//userDao.insertUser()
		int cnt = userService.insertUser(userVo);
		System.out.println("cnt : "+cnt);
		
		/***Then***/
		//입력건수 비교
		assertEquals(1, cnt);
	}
}
