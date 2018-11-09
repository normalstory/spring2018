package kr.or.ddit.file.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.file.model.FileVo;
import kr.or.ddit.test.ServiceDaoTestConfig;

public class FileDaoTest extends ServiceDaoTestConfig{

	//이번 class의 핵심
	@Resource(name="fileDao")
	private FileDao fileDao;
	
	/**
	* Method : insertFileTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 파일정보 입력 테스트
	*/
	@Test(timeout=5000)
	public void insertFileTest() {
		/***Given***/
		FileVo fileVo = new FileVo();
		fileVo.setFile_name("fd395a18-9b04-4ae7-82c4-6121211b53d.png");
		fileVo.setOrg_file_name("sally.png");
		fileVo.setFile_ext(".png");
		fileVo.setFile_path("D:\\A_TeachingMaterial\\6.JspSrpgin\\upload");
		
		/***When***/
		int insertFile = fileDao.insertFile(fileVo);
		
		/***Then***/
		assertEquals(1, insertFile);
	}

}
