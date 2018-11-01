package kr.or.ddit.ioc;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:kr/or/ddit/ioc/application-context-collection.xml"})
public class CollectionInjectionTest {

	//new 연산자가 아닌, !!! 스프링에 설명서를 주고 생성(=주입)
	@Resource(name="collectionBean")
	private CollectionBean collectionBean;
	
	/**
	* Method : collectionBeanTest
	* 작성자 : pc03
	* 변경이력 :
	* Method 설명 : 스프링 설정파일을 통해 콜렉션 객체 주입이 정상적으로 이뤄지는지 테스트 
	* 등록한 스프링 빈에 대한 속성 테스트
	*/
	@Test
	public void collectionBeanTest() {
		/***Given***/
		

		/***When***/
		List<String> list =collectionBean.getList();
		Set<String> set = collectionBean.getSet();
		Map<String,String> map = collectionBean.getMap();
		Properties property = collectionBean.getProperty();
		
		/***Then***/
		assertNotNull(collectionBean);	//셀렉션 빈은 주입을 받았음으로 정상적이라면 null일 수 없다 
		
		//list 검증
		assertEquals(3, list.size());
		assertEquals("brown", list.get(0));
		
		//set 검증
		assertEquals(3,set.size());
		
		//map 검증
		assertEquals("brown", map.get("name"));
		assertEquals("15", map.get("age"));
		
		//property 검증
		assertEquals("pc03",property.get("db.userId"));
		assertEquals("java",property.get("db.password"));
		
		
	
	}
}
