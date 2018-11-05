package kr.or.ddit.user.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.hello.HelloControllerTest;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations= {"classpath:kr/or/ddit/config/spring/root-context.xml", 
"classpath:kr/or/ddit/config/spring/servletContext.xml"})
@WebAppConfiguration
public class UserControllerTest {
	private Logger logger = LoggerFactory.getLogger(HelloControllerTest.class);
	
	@Autowired
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	
	//테스트 시작전 준비해야하는 일들을 미리 실행
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void loginViewTest() throws Exception {
		/***Given***/
		MvcResult mvcResult = mockMvc.perform(get("/user/loginView")).andReturn(); //서블릿이라고 생각
		ModelAndView mav = mvcResult.getModelAndView();
		/***When***/
		logger.debug("mav.getViewName() : {}", mav.getViewName());
		/***Then***/
		//veiwName
		assertEquals("login/login", mav.getViewName());
	}
	
	@Test
	public void loginProcessATest() throws Exception {
		/***Given***/
		
		/***When***/
		//파라미터를 보내고 
		MvcResult mvcResult1 = mockMvc.perform(post("/user/loginProcess").param("userId", "brown").param("password", "brownPass")).andReturn(); //서블릿이라고 생각
		//MvcResult mvcResult2 = mockMvc.perform(get("/user/loginProcess").param("aaa", "bb")).andReturn(); //서블릿이라고 생각
		ModelAndView mav1 = mvcResult1.getModelAndView();
		//ModelAndView mav2 = mvcResult2.getModelAndView();
		String veiwName1 = mav1.getViewName();
		//String aaa = (String) mav2.getModel().get("aaa");
		logger.debug("viewName1 : {}", veiwName1);
		//logger.debug("aaa : {}", aaa);
		
		/***Then***/
		//값비교
		assertEquals("main", veiwName1);
		//assertEquals("bb", aaa);
	}
	
	@Test
	public void loginProcessBTest() throws Exception {
		/***Given***/
		
		/***When***/
		//파라미터를 보내고 
		MvcResult mvcResult = mockMvc.perform(get("/user/loginProcess").param("userId", "browns").param("password", "brownpassi")).andReturn(); //서블릿이라고 생각
		ModelAndView mav = mvcResult.getModelAndView();
		String veiwName = mav.getViewName();
		logger.debug("viewName : {}", veiwName);
		
		/***Then***/
		//값비교
		assertEquals("login/login", veiwName);
	}
}
