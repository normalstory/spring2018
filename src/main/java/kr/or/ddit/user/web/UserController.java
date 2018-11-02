package kr.or.ddit.user.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/user")	//큰 모듈
@Controller
public class UserController {

	public static final String ID = "brown";
	public static final String PASS = "brownPass";
	
	@RequestMapping("/loginView")	//작은 모듈
	public String loginView() {
		
		return "login/login";
	}
	
	
	@RequestMapping(value="/loginProcess",method= {RequestMethod.POST, RequestMethod.GET})	//작은 모듈
	public String loginProcess(HttpServletRequest request, Model model) {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		//String aaa;
		String sendUri;
		
		if(userId.equals(ID) && password.equals(PASS)) {
			model.addAttribute("userId", userId);
			sendUri = "main";
		}else {
			sendUri = "login/login";
		}
	
		return sendUri;
	}
}
