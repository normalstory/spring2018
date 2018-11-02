package kr.or.ddit.mvc;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MvcController {
	
	private Logger logger = LoggerFactory.getLogger(MvcController.class);
	
	//@RequestMapping이 붙은 메소드가 "실행되기 전에 먼저 실행"됨 
	//해당 컨트롤러에서 공통적으로 사용될 속성이 있을 경우, 중복을 막기 위해 @ModelAttribute 사용 
	@ModelAttribute
	public void setup(Model model) {

		List<String> rangers = new ArrayList<String>();
		rangers.add("brown");
		rangers.add("sally");
		rangers.add("cony");
		model.addAttribute("rangers", rangers);
	}
	
	@RequestMapping("/mvc/view")
	public String mvcView(@ModelAttribute("rangers")List<String> rangers) {
		for(String ranger : rangers)
			logger.debug("ranger : {}",ranger);
		
		rangers.add("james");
		return "mvc/view";
	}
	
	@RequestMapping("/mvc/view2")
	public String mvcView2() {
		
		return "mvc/view";
	}
}
