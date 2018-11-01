package kr.or.ddit.ioc;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.board.dao.BoardDaoInf;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:kr/or/ddit/ioc/application-context.xml"}) //<--IocMain에서의 ApplicationContext
public class SpringScopeTest {

	//DI
	@Resource(name="boardDao") //스피링 빈의 아이디를 통해 바로 사용가능 
	private BoardDaoInf boardDao;

	@Resource(name="boardDaoSingleton") //스피링 빈의 아이디를 통해 바로 사용가능 
	private BoardDaoInf boardDaoSingleton;
	@Resource(name="boardDaoSingleton") //스피링 빈의 아이디를 통해 바로 사용가능 
	private BoardDaoInf boardDaoSingleton2;
	
	
	
	
	/**
	* Method : springBeanScopeSingletonTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 스프링 싱글톤 테스트 
	*/
	@Test
	public void springBeanScopeSingletonTest() {
		/***Given***/

		/***When***/

		/***Then***/
		assertNotEquals(boardDao, boardDaoSingleton);
		assertEquals(boardDaoSingleton, boardDaoSingleton2);
	}

}
