package kr.or.ddit.ioc;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.board.dao.BoardDaoInf;
import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.service.BoardServiceInf;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:kr/or/ddit/ioc/application-context-scan.xml"})
public class ComponentScanTest {

	private Logger logger = LoggerFactory.getLogger(ComponentScanTest.class);
	
	@Resource(name="boardDao")
	private BoardDaoInf boardDao;

	@Resource(name="boardService")
	private BoardServiceInf boardService;
	
	
	@Test
	public void compornentScanTest() {
		/***Given***/
		
		/***When***/
		List<BoardVo> boardList = boardDao.selectBoardList();
		for(BoardVo boardVo : boardList) {
			logger.debug("{}", boardVo);
		}
		
		/***Then***/
		assertNotNull(boardDao);
	}
	
	//[1]
	@Test
	public void compornentScanTest2() {
		/***Given***/
		
		/***When***/
		List<BoardVo> boardList = boardService.selectBoardList();
		for(BoardVo boardVo : boardList) {
			logger.debug("{}", boardVo);
		}
		
		/***Then***/
		assertNotNull(boardService);
	}

	//[2]
	@Test
	public void compornentScanTest3() {
		/***Given***/
		
		/***When***/
		//BoardDaoInf boardDaoB= boardService.getBoardDao(boardDao);
		
		/***Then***/
		//assertEquals(boardDao, boardDaoB);
		assertEquals(boardDao, boardService.getBoardDao());
	}
	

}
