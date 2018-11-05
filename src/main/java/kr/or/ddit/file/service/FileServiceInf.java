package kr.or.ddit.file.service;

import kr.or.ddit.file.model.FileVo;

public interface FileServiceInf {
	/**
	* Method : insertFile
	* 작성자 : pc03
	* 변경이력 :
	* @param fileVo
	* @return
	* Method 설명 : 파일정보저장 
	*/
	int insertFile(FileVo fileVo);
}
