package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.model.BoardVo;

/**
* BoardDao.java
*
* @author pc03
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
* ------ ------------------------
* pc03 최초 생성
*
* </pre>
//어노테이션을 통한 등록을 통한 확장 
//bean 어노테이션 @Controller, @Service, @Repository-dao, @Component-일반적인객체 
//단 어노테이션 자체가 특별한 의미는 아미. 개발 시 자주 사용되는 모듈을 분리하여 명명한 것에 불과
*/

@Repository("boardDao")	//이름을 생략하면 클래스 첫글자를 소문자로 한 이름이 자동으로 spring bean에 등록됨
public class BoardDao implements BoardDaoInf{

	@Override
	public List<BoardVo> selectBoardList() {
		
		//db에서 조회해온 데이터라고 가정하자
		BoardVo boardVo = new BoardVo(1,"자유게시판","brown");
		BoardVo boardVo2 = new BoardVo(2,"공지사항","cony");
		BoardVo boardVo3 = new BoardVo(3,"FAQ","sally");
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		boardList.add(boardVo);
		boardList.add(boardVo2);
		boardList.add(boardVo3);
		
		return boardList;
	}

}
