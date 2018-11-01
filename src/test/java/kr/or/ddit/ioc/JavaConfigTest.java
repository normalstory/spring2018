package kr.or.ddit.ioc;

import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.board.dao.BoardDaoInf;
import kr.or.ddit.board.service.BoardServiceInf;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={JavaConfig.class})
public class JavaConfigTest {

	@Resource(name="boardDao")
	private BoardDaoInf boardDao;

	@Resource(name="boardService")
	private BoardServiceInf boardService;
	
	
	/**
	* Method : javaConfigTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : javaConfig를 통래 스프링 빈에 정상적으로 생성되었는지 테스트 
	*/
	@Test
	public void javaConfigTest() {
		/***Given***/
		
		/***When***/

		/***Then***/
		assertNotNull(boardDao);
		assertNotNull(boardService);
	}

}
