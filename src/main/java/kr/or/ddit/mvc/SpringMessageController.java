package kr.or.ddit.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SpringMessageController {

	@RequestMapping(value="/messageView", method=RequestMethod.GET)
	public String messageView() {
		return "msg/view";
	}
	
	@RequestMapping(value="/messageView", method=RequestMethod.POST)
	public String message(@RequestParam("lang")String lang, Model model) {
		model.addAttribute(lang);		
		return "jac";
	}	
}
