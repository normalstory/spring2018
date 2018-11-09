package kr.or.ddit.file.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.or.ddit.file.dao.FileDao;
import kr.or.ddit.file.model.FileVo;

//@Repository   // <-- dao용
@Service			 // <--service용 
public class FileService implements FileServiceInf{

	//이번 class의 핵심
	@Resource(name="fileDao")
	private FileDao fileDao;
	
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
		
		int insertCnt = fileDao.insertFile(fileVo);
		
		//강제 예외 발생
//		if(1==1)
//			throw new RuntimeException();
		
		return 	insertCnt;
	}

}
