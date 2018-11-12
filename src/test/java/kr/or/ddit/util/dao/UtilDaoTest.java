package kr.or.ddit.util.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.ServiceDaoTestConfig;

public class UtilDaoTest extends ServiceDaoTestConfig{

	@Resource(name="utilDao")
	private UtilDaoInf utilDao;
	
	/**
	* Method : makeMonthlyCalendarTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 월단위 달력생성 테스트 
	*/
	@Test
	public void makeMonthlyCalendarTest() {
		
		/***Given***/
		String ym = "201811";

		/***When***/
		int insertCnt = utilDao.makeMonthlyCalendar(ym);

		/***Then***/
		assertEquals(30, insertCnt);
	}

}
