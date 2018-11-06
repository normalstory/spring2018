package kr.or.ddit.prod.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.prod.model.ProdVo;
import kr.or.ddit.prod.service.ProdServiceInf;
import kr.or.ddit.util.model.PageVo;

@RequestMapping("/prod")
@Controller
public class ProdController {

	@Resource(name="prodService")
	private ProdServiceInf prodService;
	
	@RequestMapping("/prodList")
	public String prodList(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = prodService.prodPageList(pageVo);
		model.addAllAttributes(resultMap);
		
		return "prod/prodList";
	}
	
	@RequestMapping("/prodDetail")
	public String prodDetail(@RequestParam("prod_id") String prod_id, Model model) {
		
		ProdVo prodVo = prodService.prodDetail(prod_id);
		model.addAttribute("prodVo", prodVo);
		
		return "prod/prodDetail";
	}
	
}
