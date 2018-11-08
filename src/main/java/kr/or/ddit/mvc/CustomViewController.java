package kr.or.ddit.mvc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import com.sun.net.httpserver.HttpsParameters;

import kr.or.ddit.mvc.view.TimesTablesView;

@Controller
public class CustomViewController {
	
	@RequestMapping("/customView")
	public View customView() {
		return new TimesTablesView();			//매번 생성
	}
	
	@RequestMapping("/customViewBeanName")
	public String customViewBeanName(Model model,
			@RequestParam(value="tables",defaultValue="3") int tables ) {
		model.addAttribute("tables");
		return "timesTablesView";				//싱글톤 : 빈 선언시 한번만 생성 
	}
	
//	@RequestMapping("/customViewBeanName")
//	public String customViewBeanName(HttpServletRequest request, Model model) {
//		model.addAttribute("tables",request);
//		return "timesTablesView";				//싱글톤 : 빈 선언시 한번만 생성 
//	}
}
