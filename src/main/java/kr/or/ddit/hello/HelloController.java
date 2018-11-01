package kr.or.ddit.hello;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.user.model.UserVo;



//서블릿에서는 HttpServlet 상속
//  @WebServlet 혹은 web.xml에 uri mapping 적용 
//  doGet, doPost를 통해 서비스 개발
//   VS.
//spring bean으로 컨트롤러 등록
//  1. @Controller 적용 
//  2. @RequestMapping 어노테이션 적용 (클래스나 매소드)

@RequestMapping("/hello")	//큰 모듈
@Controller
public class HelloController {
	

	private Logger logger = LoggerFactory.getLogger(HelloController.class);
	
	//사용자 요청이 locallhost:8081/hello/hello.do  uri를 요청하게되면 아래 매소드 요청 처리 
	// 만약 클래스에 적용한  @RequestMapping("/hello") 부분이 삭제되면 
	// locallhost:8081/hello/hello.do 요청에 대해 hello() 메소드에서 요청을 처리하게됨
	//@RequestMapping("/hello.do")	//작은 모듈 	= ("/hello") + ("/hello.do") 가 된다 
	public String hello() {
		
		//viewName 리턴 
		return "hello"; 	
		// 서블릿과 달리.. req, resp 없이도 
		// 포워드 방식(기본)   vs  return "redirect : hello";
		//  internalResourceViewResolver 설정에 의해 
		//  prefix + viewName + suffix  -> /WEB-INF/view/  hello  .jsp	
		//  리소스로 응답을 위함한다 
	}

	//참고
	//@RequestMapping("/user")	//큰 모듈
	//@Controller
	//public class UserController{
	//	
//		@RequestMapping("/view")	//작은 모듈
//		public String view() {
//			//-> /user/view
//		}
//		@RequestMapping("/insert")
//		public String insert() {
//			//-> /user/insert
//			
//		}
//		@RequestMapping("/update")
//		public String update() {
//			//-> /user/update
//			
//		}
//		@RequestMapping("/delete")
//		public String delete() {
//			//-> /user/delete
//			
//		}
	//	
	//}

	
	
	/**
	* Method : model
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 
	* 
	* 서블릿 doGet doPost 메소드 인자가 httpServletRequest httpServletRespense 두개. 빼거난 넣을 수 없음 
	* 
	* 반면, 스프링 컨트롤러 메소드 비교적 자유롭게 구성이 가능하다. 위 2 + http세션, 벨류오브젝트, 모델 
	*/
	@RequestMapping("/model")
	public String model(Model model) {
		
		List<String> rangers = new ArrayList<String>();
		rangers.add("brown");
		rangers.add("sally");
		rangers.add("cony");
		
		//servlet : request.serAttribute("rangers",rangers);
		model.addAttribute("rangers", rangers);
		
		return "hello";
	}

	
	@RequestMapping("/request")
	public String request(HttpServletRequest request) {
		
		String userId = request.getParameter("userId");
		String pass = request.getParameter("pass");
		
		logger.debug("userId : {}",userId);
		logger.debug("pass : {}",pass);
		
		return "hello";
	}
	
	
	//value object의 속성이름과 동일한 이름의 파라미터를 자동으로 설정해준다
	@RequestMapping("/vo")
	public String vo(UserVo userVo) {
		
		logger.debug("userVo : {}",userVo);
		
		return "hello";
	}
	
}





