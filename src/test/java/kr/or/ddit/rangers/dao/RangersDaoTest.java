package kr.or.ddit.rangers.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import kr.or.ddit.rangers.model.RangerVo;
import kr.or.ddit.test.ServiceDaoTestConfig;

public class RangersDaoTest extends ServiceDaoTestConfig{

	
	@Resource(name="rangersDao")
	private RangersDaoInf rangersDao;
	
	/**
	* Method : selectAllRangersTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 레인저스 정보 전체조회
	*/
	@Test
	public void selectAllRangersTest() {
		/***Given***/

		/***When***/
		List<RangerVo> rangersList = rangersDao.selectAllrangers();
		
		/***Then***/
		assertEquals(3, rangersList.size());
	}

	
	@Test
	public void insertRangersTest() {
		/***Given***/
		RangerVo ranger = new RangerVo();
		ranger.setRangersId("moon");
		ranger.setName("문");

		/***When***/
		int resultCnt = rangersDao.insertRangers(ranger);
		
		/***Then***/
		assertEquals(1, resultCnt);
	}
	
	
	
}
