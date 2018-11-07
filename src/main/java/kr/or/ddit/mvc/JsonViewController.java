package kr.or.ddit.mvc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
public class JsonViewController {
	
	@ModelAttribute()
	public void modelAttr(Model model) {
		//컬렉션 및 오브젝트(vo 등) 정보를 json문자열로 생성해준다 
		List<String> rangers = new ArrayList<String>();
		rangers.add("brown");
		rangers.add("cony");
		rangers.add("sally");
		model.addAttribute("rangers",rangers);
	}
	
	//json응답을 생성하는 url요청 : rangers정보를 json으로 응답생성
	@RequestMapping("/rangersJsonView")
	public String rangersJsonView() {
		return "jsonView"; //json을 생성하는 view 를 리턴  <- html이 아닌, 문자열 
	}
	
	//뷰객체(object)를 직접 리턴
	@RequestMapping("/rangersJsonViewObj")
	public View rangersJsonViewObj() {
		return new MappingJackson2JsonView(); //json 생성을 담당하는 뷰 <- 커스텀뷰를 만들 수 있다 
	}
	
	
	
}
