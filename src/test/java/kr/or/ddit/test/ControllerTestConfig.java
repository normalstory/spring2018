package kr.or.ddit.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= 
			{"classpath:kr/or/ddit/config/spring/root-context.xml", 
			 "classpath:kr/or/ddit/config/spring/servletContext.xml",
			 
		     "classpath:kr/or/ddit/config/spring/datasource-context.xml",
		     "classpath:kr/or/ddit/config/spring/transaction-context.xml"})
@WebAppConfiguration
public class ControllerTestConfig {

	@Autowired
	protected WebApplicationContext contex;
	protected MockMvc mockMvc;
	
	//테스트 시작전 준비해야하는 일들을 미리 실행
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(contex).build();
	}
	
	@Ignore
	@Test
	public void test() {
		assertFalse(!true);
	}
}
