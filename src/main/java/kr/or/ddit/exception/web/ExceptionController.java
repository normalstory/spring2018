package kr.or.ddit.exception.web;

import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import kr.or.ddit.exception.NotFileException;

@Controller
public class ExceptionController {
	
	/**
	* Method : view
	* 작성자 : pc03
	* 변경이력 :
	* @return
	* Method 설명 : 예외를 강제로 발생시키는 url 
	*/
	@RequestMapping("/exception")
	public String view() {
		throw new ArithmeticException();
	}
	
	//@ResponseStatus를 위한 url
	@RequestMapping("/responseStatus")
	public String responseStatus() throws NotFileException{
		ClassPathResource resource = new ClassPathResource("kr/or/ddit/config/db/mybatis-config.xnl");
		
		
		try {
			resource.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new NotFileException();
		}
		//arthmatic
		return "error/arthmatic";
	}
}
