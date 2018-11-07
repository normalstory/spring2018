package kr.or.ddit.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PerformanceCheckIntercepter extends HandlerInterceptorAdapter {
 
	private Logger logger = LoggerFactory.getLogger(PerformanceCheckIntercepter.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setAttribute("startTime",System.currentTimeMillis());
		
		//다음 인터셉터로 연결 
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		//controller메소드 로직이 종료되고 실행
		long end_time = System.currentTimeMillis();
		long start_time = (long) request.getAttribute("startTime");
		
		logger.debug("duration {} : {}", request.getRequestURI(), (end_time-start_time));
	}
}
