package kr.or.ddit.mvc;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.file.model.FileVo;
import kr.or.ddit.file.service.FileServiceInf;
import kr.or.ddit.util.FileUtil;

@SessionAttributes("rangers")
@Controller
public class MvcController {

	@Resource(name="fileService")
	FileServiceInf fileService;
	private Logger logger = LoggerFactory.getLogger(MvcController.class);
	
	//@RequestMapping이 붙은 메소드가 "실행되기 전에 먼저 실행"됨 
	//해당 컨트롤러에서 공통적으로 사용될 속성이 있을 경우, 중복을 막기 위해 @ModelAttribute 사용 
	//페이지가 로딩될때마다 실행... -> 모델에 값이 있으면 실행을 안시키도록 할 필요가 있음 : 매번 실행시키기 부담스러울때 
	//		->클래스에 적용 @SessionAttribute("rangers")   <-- @ModelAttributed의 value
	// 세션에 저장하여 값을 재활용 
	@ModelAttribute(value="rangers")
	public List<String> setup() {
		logger.debug("setup");

		List<String> rangers = new ArrayList<String>();
		rangers.add("brown");
		rangers.add("sally");
		rangers.add("cony");
		//model.addAttribute("rangers",rangers );
		
		return rangers;
	}
	
	@RequestMapping("/mvc/view")
	public String mvcView(@ModelAttribute("rangers")List<String> rangers) {
//		for(String ranger : rangers)
//			logger.debug("ranger : {}",ranger);
		
		rangers.add("james");
		return "mvc/view";
	}
	
	@RequestMapping("/mvc/view2")
	public String mvcView2() {
		
		return "mvc/view";
	}
	

	//브라우저 로컬호스트... /mvc/central : logger -> central
	@RequestMapping("/mvc/{libcd}")
	public String pathvariable(@PathVariable("libcd") String libcd) {
		
		logger.debug("libcd : {}", libcd);
		return "mvc/view";
	}
	
	
	//fileupload 를 위한 view(get)
	@RequestMapping(value="/mvc/fileupload", method= {RequestMethod.GET})
	public String fileuploadView() {
		
		return "mvc/fileuploadView";
	}
	
	//fileupload 처리를 위한 controller method(post)
	@RequestMapping(value="/mvc/fileupload", method= {RequestMethod.POST})
	public String fileupload(@RequestPart("uploadFile") MultipartFile part, 
								  @RequestParam("userId") String userId) {	//벨류 객체가 없을때 임시로 파라미터 생성해서 수렴도 가능

		logger.debug("@RequestParam --- userId : {}", userId);
		
		logger.debug("part.getSize() : {}", part.getSize());
		logger.debug("part.getOriginalFilename() : {}", part.getOriginalFilename());
		
		String path = "D:\\A_TeachingMaterial\\6.JspSrpgin\\upload";
		String orginalFileName = part.getOriginalFilename();	//사용자가 업로드한 실제 파일이름
		String fileExt = FileUtil.getFileExt(orginalFileName);
		//일단 파일객체 (받기위해) <- 경로 + 파일명(충돌방지를 위해 강제로 랜덤처리를 거쳐 UUID로 재명명)
		String fileName = UUID.randomUUID().toString()+fileExt; 			//충돌방지를 위한 임의의 파일이름 
		
		File file = new File(path+File.separator+fileName);
		
		FileVo fileVo = new FileVo();
		fileVo.setFile_name(fileName);
		fileVo.setFile_path(path);
		fileVo.setOrg_file_name(orginalFileName);
		fileVo.setFile_ext(fileExt);
		
		logger.debug("fileVo :{}",fileVo);
		
		try {
			if(part.getSize()>0) { 		//SQL에서 N.N에 대한 예외처리 
				//정해진 경로에 파일 저장
				part.transferTo(file);
				
				//데이터베이스에 파일 저장
				//1. fileService //@Resource(name="fileService")  &  FileServiceInf fileService;
				//2. 로직호출			
				fileService.insertFile(fileVo);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "mvc/fileuploadView";
	}

}


