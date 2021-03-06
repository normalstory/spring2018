package kr.or.ddit.file.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.config.db.SqlFactoryBuilder;
import kr.or.ddit.file.model.FileVo;

//1. spring bean등록 : @repository 선언 후! 
//                          @repository 이름을 안붙이면 클래스명에서 첫 글자만 소문자로 바꿔서 자동지정
@Repository
public class FileDao implements FileDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	
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
		return template.insert("file.insertFile",fileVo);
	}
	
}
