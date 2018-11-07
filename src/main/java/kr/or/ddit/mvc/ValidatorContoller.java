package kr.or.ddit.mvc;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.model.UserVoJsr303;
import kr.or.ddit.user.model.UserVoValidator;

@RequestMapping("/validator")
@Controller
public class ValidatorContoller {
	
	//validator 처리 view
	@RequestMapping(value="/view", method= {RequestMethod.GET})
	public String view() {

		return "validator/view";
	}
	
	//view에서 입력한 값 처리를 위한 method
	//검증절차에서 문제가 있을 경우 다시 view로 보내고 , 문제가 없으면 result page로 이동 
	@RequestMapping(value="/validate", method=RequestMethod.POST)
	public String validator(UserVo userVo, BindingResult bildingResult, Model model) {
		
		new UserVoValidator().validate(userVo, bildingResult);
		
		if(bildingResult.hasErrors()) {
			return "validator/view";			
		}
		
		model.addAttribute("userVo",userVo);
		return "validator/result";			
	}
	
	@RequestMapping(value="validateJsr", method=RequestMethod.POST)
	public String validateJsr(@Valid UserVoJsr303 userVoJsr303, BindingResult bildingResult, Model model) {
		
		if(bildingResult.hasErrors()) {
			return "validator/view";			
		}
		
		model.addAttribute("userVoJsr303",userVoJsr303);
		return "validator/result";		
	}
}
