package kr.or.ddit.ioc;

import static org.junit.Assert.*;

import java.util.Properties;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:kr/or/ddit/ioc/application-context-placeholder.xml"})
public class PlaceHolderTest {

	@Resource(name="placeholder")
	//private CollectionBean collectionBean; 
	private PlaceHolder placeholder; 
	
	@Test
	public void test() {
		/***Given***/
		
		/***When***/
		String user = placeholder.getUser();
		String password = placeholder.getPassword();
		String driver = placeholder.getDriver();
		String url = placeholder.getUrl();

		/***Then***/
		assertEquals("pc03test", user);
		assertEquals("java", password);
		assertEquals("oracle.jdbc.driver.OracleDriver", driver);
		assertEquals("jdbc:oracle:thin:@localhost:1521:xe", url);
	}

}
