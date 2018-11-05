package kr.or.ddit.util;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUtilTest {
	
			//FileUtil.getFileExt(String fileName);   확장자가 있으면, .을포함한 값 리턴, 없으면 whitespace리턴
			//테스트값 sally.png  -> .png
			//테스트값 sally       ->    
	
	Logger logger = LoggerFactory.getLogger(FileUtil.class);
	
	/**
	* Method : fileUtilStringTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 파일확장자 추출(확장자 있는 경우)
	*/
	@Test
	public void fileUtilStringTest() {
		/***Given***/
		FileUtil fileUtil = new FileUtil();		
		
		/***When***/
		String ext = fileUtil.getFileExt("sally.png");
		logger.debug("ext : {}", ext);
		
		/***Then***/
		assertEquals(".png", ext);
	}
	
	/**
	* Method : fileUtilNullTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 파일확장자 추출(확장자 없는 경우)
	*/
	@Test
	public void fileUtilNullTest() {
		/***Given***/
		FileUtil fileUtil = new FileUtil();
		
		/***When***/
		String ext = fileUtil.getFileExt("sally");
		logger.debug("ext : {}", ext);

		/***Then***/
		assertEquals("", ext);
	}

	@Test
	public void fileUtilMutiDotTest() {
		/***Given***/
		FileUtil fileUtil = new FileUtil();
		
		/***When***/
		String ext = fileUtil.getFileExt("sally.sally.png");
		logger.debug("ext : {}", ext);

		/***Then***/
		assertEquals(".png", ext);
	}
}
