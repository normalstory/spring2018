package kr.or.ddit.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	/**
	* Method : main
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 메인화면요청 (for mvc1 to mvc2)
	*/
	@RequestMapping("/main")
	public String main() {
		return "main";
		
		//리턴 -> 
		// 서블릿 컨텍스트 -> 프로퍼티 order의 순으로 : bean id와 nameView를 스캔 -> 일치하면 해당 ViewResolver실행
									// 일치하는 bean id가 없으면 InternalResourceViewResolver 수행  
	}
}
