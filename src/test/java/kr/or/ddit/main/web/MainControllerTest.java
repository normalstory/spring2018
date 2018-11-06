package kr.or.ddit.main.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.test.ControllerTestConfig;

public class MainControllerTest extends ControllerTestConfig {

	@Test
	public void mainControllerTest() throws Exception {
		/***Given***/
		MvcResult mr = mockMvc.perform(get("/main")).andReturn();
		ModelAndView mav = mr.getModelAndView();
		
		/***When***/

		/***Then***/
		assertEquals("main", mav.getViewName());;
	}
}
