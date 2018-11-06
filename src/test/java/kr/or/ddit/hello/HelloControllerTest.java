package kr.or.ddit.hello;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.spi.LoggerFactoryBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.test.ControllerTestConfig;
import kr.or.ddit.user.model.UserVo;

public class HelloControllerTest extends ControllerTestConfig{
	private Logger logger = LoggerFactory.getLogger(HelloControllerTest.class);
	
	@Test
	public void HelloDoTest() throws Exception {
		/***Given***/
		
		/***When***/
		//dispatcher servlet으로 요청전송
		MvcResult mvcResult = mockMvc.perform(get("/hello/hello.do")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
				
		/***Then***/
		//viewName : hello를 확인 <- 수정하면 리로딩되서 웹브라우져가서 봐야한다 
		// <-원하는 요청을 보냈을때 컨트롤러까지는.. 정상적으로 가는지 
		// 서버가 없이도..적어도 컨트롤러 까지는 확인할 수 있다
		assertEquals("hello",mav.getViewName());
	}


	@Test
	public void modelTest() throws Exception{
		/***Given***/
		
		/***When***/
		MvcResult mvcResult = mockMvc.perform(get("/hello/model")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		//1
		String viewName = mav.getViewName();
		//2
		List<String> rangers =(List<String>) mav.getModel().get("rangers");
		for(String ranger:rangers)
			logger.debug("ranger : {}", ranger);
		
		/***Then***/
		//1. 뷰이름
		assertEquals("hello", viewName);
				
		//2. rangers속성(mdel 에 있는)
		assertEquals(3, rangers.size());
	}
	
	
	@Test
	public void requestTest() throws Exception {
		/***Given***/
		MvcResult mvcResult = mockMvc.perform(get("/hello/request").param("userId","brown").param("pass","brownpass")).andReturn();
		/***When***/
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		String userId=(String) mav.getModel().get("userId");
		String pass=(String) mav.getModel().get("pass");
		
		/***Then***/
		assertEquals("hello", viewName);
		assertEquals("brown_attr", userId);
		assertEquals("brownpass_attr", pass);
	}
	
	@Test
	public void voTest() throws Exception {
		/***Given***/
		//처음 받는 방식 <- mockMvc(프론트컨트롤러)에 아래 주소로 아래 파라미터를 던진것 
		MvcResult mvcResult = mockMvc.perform(get("/hello/vo").param("userId", "브라운").param("pass","brownpass")).andReturn();		 
		
		/***When***/
		ModelAndView mav = mvcResult.getModelAndView();
		String viewName = mav.getViewName();
		
		//전달 객체 이용방식 애매 //왜 반환타입이 list가 아닌 map이 올까..만약 맵이라면 어떻게 반환받아야하나 
		UserVo userVo =  (UserVo) mav.getModel().get("userVo");
		
		/***Then***/
		assertEquals("hello", viewName);
		assertEquals("브라운", userVo.getUserId());
		assertEquals("brownpass", userVo.getPass());
		
	}
}
