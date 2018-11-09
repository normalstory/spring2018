package kr.or.ddit.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//공통의 관심사 - 로깅 : 메서드 호출 로그를 담당하는 어드바이스 
public class LoggingAdvice {

	private Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	
	//우리가 구현하는 비지니스 로직이 실행되기 전에 실행되는 공통 로직
	public void beforeAdvicer(JoinPoint joinPoint) {
		//JoinPoint 우리가 구현한 로직은 메소드 
		//beforeAdvicer가 먼저 호출되고 JoinPoint 호출
		String methodName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getName();
		
		logger.debug(" before_methodName : {}",methodName);
		logger.debug(" before_className : {}", className);
	}
	
	public void afterAdvicer(JoinPoint joinPoint) {
		String methodName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getName();
		
		logger.debug("after_methodName : {}",methodName);
		logger.debug("after_className : {}", className);
	}
	
	//비지니스로직 전후로 다른로직 삽입
	public Object aroundAdvicer(ProceedingJoinPoint joinPoint) throws Throwable {
		//실제 비지니스 메소드 실행전 
		long startTime = System.currentTimeMillis();
		
		//실제 비지니스 메소드 호출  
		Object[] arg = joinPoint.getArgs(); 	//비지니스 메소드의 매개변수  
		Object object = joinPoint.proceed(arg);	//비지니스 메소드 실행
		
		//실제 비지니스 메소드 실행후
		long endTime = System.currentTimeMillis();
		
		logger.debug("메소드 실행 소요시간 : {}",endTime - startTime);
		return object;
	}
}
