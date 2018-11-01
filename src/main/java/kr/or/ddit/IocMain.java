package kr.or.ddit;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.board.dao.BoardDaoInf;
import kr.or.ddit.board.model.BoardVo;
import kr.or.ddit.board.service.BoardServiceInf;

public class IocMain {
	private static Logger logger = LoggerFactory.getLogger(IocMain.class);
	
	public static void main(String[] args) {
	
		//스프링 컨테이너 생성
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {
				"classpath:kr/or/ddit/ioc/application-context.xml"
		});
		
		//context를 통해 선언했던 빈 호출 
		//DL dependency Lookup: 스프링 컨테이너에서 dao스프링 빈을 요청(실무에서는 잘 안씀) 
		BoardDaoInf boardDao = (BoardDaoInf)context.getBean("boardDao");
		List<BoardVo> boardList = boardDao.selectBoardList();
		for(BoardVo boardVo : boardList) {
			logger.debug("boardDao - boardVo : {},{}", boardVo,"test");			
			//System.out.println("boardVo : "+boardVo); 
				//<-문자열 결합 이슈 vs StringBuffer ; 개발이후에도 Sys은 계속 남아있다 
		}
		
		//스프링 컨테이너에서 service스프링 빈을 요청 selectBoardList 결과를 logger를 통해 출력
		BoardServiceInf boardService = context.getBean("boardService", BoardServiceInf.class);	//Casting 대신 .class
		boardList = boardService.selectBoardList();
		for(BoardVo boardVo : boardList) {
			logger.debug("boardService - boardVo : {} ", boardVo);
		}
		
		//생성자 주입을 통해 생성된 boardService 스프링 빈을 요청
		BoardServiceInf boardServiceConst = context.getBean("boardServiceConst", BoardServiceInf.class);	//Casting 대신 .class
		boardList = boardServiceConst.selectBoardList();
		for(BoardVo boardVo : boardList) {
			logger.debug("boardServiceConst - boardVo : {} ", boardVo);
		}

		
		//spring scope singleton test
		BoardDaoInf boardDaoSingleton1 = context.getBean("boardDaoSingleton",BoardDaoInf.class);
		BoardDaoInf boardDaoSingleton2 = context.getBean("boardDaoSingleton",BoardDaoInf.class);
		logger.debug("spring scope singleton test : {} ", boardDaoSingleton1==boardDaoSingleton2);
		
		//spring scope prototype test <- 싱글톤과 정반대 : DL시 마다 매번 새로운 객체 생성
		BoardDaoInf boardDaoProtoTypeA = context.getBean("boardDaoProtoType",BoardDaoInf.class);
		BoardDaoInf boardDaoProtoTypeB = context.getBean("boardDaoProtoType",BoardDaoInf.class);
		logger.debug("spring scope prototype test : {} ", boardDaoProtoTypeA==boardDaoProtoTypeB);
		
		
	}
}
