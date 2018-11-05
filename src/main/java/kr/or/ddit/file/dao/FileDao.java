package kr.or.ddit.file.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.config.db.SqlFactoryBuilder;
import kr.or.ddit.file.model.FileVo;

//1. spring bean등록 : @repository 선언 후! 
//                          @repository 이름을 안붙이면 클래스명에서 첫 글자만 소문자로 바꿔서 자동지정
@Repository
public class FileDao implements FileDaoInf{
	
	private SqlSessionFactory sessionfactory;
	public FileDao() {
		sessionfactory = SqlFactoryBuilder.getSqlSessionFactory();
	}
	
	/**
	* Method : insertFile
	* 작성자 : pc03
	* 변경이력 :
	* @param fileVo
	* @return
	* Method 설명 : 파일정보저장 
	*/
	@Override
	public int insertFile(FileVo fileVo) {
		SqlSession session= sessionfactory.openSession();
		
		//sql 호출
		int insertCnt = session.insert("file.insertFile",fileVo);
		
		//트랜잭션 commit, session close
		session.commit();
		session.close();
		
		return insertCnt;
	}
	
}
