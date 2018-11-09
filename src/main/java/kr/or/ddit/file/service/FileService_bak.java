package kr.or.ddit.file.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.or.ddit.file.dao.FileDao;
import kr.or.ddit.file.model.FileVo;

//@Repository   // <-- dao용
@Service			 // <--service용 
public class FileService_bak implements FileServiceInf{

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
		return fileDao.insertFile(fileVo);		
		//트랜젝션 고려안해서 바로 커밋됨..  사실 dao가 아닌, 여기서 세션 객체를 만들어야 한다 
		// int를 카운트해서 에러면 여기서 롤백
		// 실무 : 선언적 트랜젝션처리 특정환경에서 트랜잭션이 이루어지도록 함 : EJB없이도 관련 기능 구현 : 스프링의 장점 
					//*service 이름을 갖는 객체의 모든 메서드에서 이뤄지도록 
					//예외가 발생하지않으면 자동커밋, runtime exception이 발생하면 자동 롤백 
		//vs (명시적 트랜젝션:커밋롤백을 개발자가 직접 명령)
	}

}
