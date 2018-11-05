package kr.or.ddit.file.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.file.model.FileVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/ddit/config/spring/root-context.xml")
public class FileServiceTest {

	//@Service("fileService")
	@Resource(name="fileService")
	private FileService fileservice;
	
	@Test
	public void fileInsertTest() {
		/***Given***/
		FileVo fileVo = new FileVo();
		fileVo.setFile_name("fd395a18-9b04-4ae7-82c4-6121211b53d.png");
		fileVo.setOrg_file_name("sally.png");
		fileVo.setFile_ext(".png");
		fileVo.setFile_path("D:\\A_TeachingMaterial\\6.JspSrpgin\\upload");
		
		/***When***/
		int insertFile = fileservice.insertFile(fileVo);
		
		/***Then***/
		assertEquals(1, insertFile);
	}

}
