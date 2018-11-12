package kr.or.ddit.util;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.ServiceDaoTestConfig;

public class SpringTaskTest extends ServiceDaoTestConfig{

	@Resource(name="springTask")
	private SpringTask SpringTask;
	
	@Test
	public void makeMonthlyCalendarTest() {
		/***Given***/
		
		/***When***/
		SpringTask.makeMonthlyCalendar();
		
		/***Then***/
	}

}
