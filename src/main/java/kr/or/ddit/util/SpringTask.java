package kr.or.ddit.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.util.dao.UtilDaoInf;

public class SpringTask {
	
	@Resource(name="utilDao")
	private UtilDaoInf utilDao;
	
	private Logger logger = LoggerFactory.getLogger(SpringTask.class);
	
	public void logging() {
		logger.debug("LogTask.logging()");
	}
	
	/**
	* Method : makeMonthlyCalendar
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 :매달 마지막날 월 단위 달력 생성
	* - 다음달  년월 파라미터를 생성하여 실행
	* - 18년11월30일 실행 -> 12월 달력 생성
	*/
	public void makeMonthlyCalendar() {
		//내일날짜
		GregorianCalendar gc = new GregorianCalendar(Locale.KOREA);
		gc.add(GregorianCalendar.DAY_OF_MONTH, 1);
		//gc.add(GregorianCalendar.MONTH, 1); //다음달 
		
		
		//date type -> string(yyyyMM)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String ym=sdf.format(gc.getTime());
		
		logger.debug("ym :{}",ym);
		
		utilDao.makeMonthlyCalendar(ym);
	}
	
}
