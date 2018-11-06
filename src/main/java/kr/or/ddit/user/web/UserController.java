package kr.or.ddit.user.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserServiceInf;
import kr.or.ddit.util.model.PageVo;

@RequestMapping("/user")	//큰 모듈
@Controller
public class UserController {

	@Resource(name="userService")
	private UserServiceInf userService;
	
	public static final String ID = "brown";
	public static final String PASS = "brownPass";
	
	@RequestMapping("/loginView")	//작은 모듈
	public String loginView() {
		
		return "login/login";
	}
	
	
	@RequestMapping(value="/loginProcess",method= {RequestMethod.POST, RequestMethod.GET})	//작은 모듈
	public String loginProcess(HttpServletRequest request, Model model) {
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		//String aaa;
		String sendUri;
		
		if(userId.equals(ID) && password.equals(PASS)) {
			model.addAttribute("userId", userId);
			sendUri = "main";
		}else {
			sendUri = "login/login";
		}
	
		return sendUri;
	}
	
	
	@RequestMapping("/userAllList")
	public String userAllList(Model model) {
		
		List<UserVo> userList= userService.selectUserAll();
		model.addAttribute("userList", userList);
		
		return "user/userAllList";
	}
	
	@RequestMapping("/userPageList")
	public String userPageList(Model model, PageVo pageVo) {
		//스프링컨테이너로부터 빈을 주입받기때문에 new연산자를 통해 별도로 생성할 필요없다
		
		//		PageVo pageVo = new PageVo();
		//		pageVo.setPage(Integer.parseInt(request.getParameter("page")));
		//		pageVo.setPageSize(Integer.parseInt(request.getParameter("pageSize")));
				// -> 컨트롤러 메서드 매개변수로 선언
		
		
		Map<String,Object> resultMap = userService.selectUserPageList(pageVo);
		//		//페이지 리스트
		//		List<UserVo> userList = (List<UserVo>)resultMap.get("userList");
		//		//페이지 건 수
		//		int pageCnt = (int)resultMap.get("pageCnt");
		//		request.setAttribute("pagelist", userList);
		//		request.setAttribute("pageCnt", pageCnt);
		model.addAllAttributes(resultMap);
		
		//request.getRequestDispatcher("/user/userPageList.jsp").forward(request, response);
		return "user/userPageList";
	}
	
	@RequestMapping("/userDetail")
	public String userDetail(@RequestParam("userId") String userId, Model model) {
		
//		String id = request.getParameter("userId");     <-- @RequestParam("userId")
		UserVo userVo = userService.selectUser(userId);
		
//		request.setAttribute("userVo", userVo);
		model.addAttribute("userVo", userVo);

//		request.getRequestDispatcher("/user/userDetail.jsp").forward(request, response);
		return "user/userDetail";
	}
	
	@RequestMapping(value="/userForm", method= {RequestMethod.GET})
	public String userFormView() {
		return "user/userForm";
	}
	
	@RequestMapping(value="/userForm", method=RequestMethod.POST)
	public String userForm(@RequestPart("profilePic") MultipartFile part,
								 HttpServletRequest request, UserVo userVo) {		
		try {
			if(part.getSize()>0) {
				
				String path = request.getServletContext().getRealPath("/profile");
				String fileName = part.getOriginalFilename();
				part.transferTo(new File(path + File.separator+fileName));		//파일작성 
				 
				userVo.setProfile("/profile/"+fileName);
			}else {
				userVo.setProfile("");
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		int insertCnt = userService.insertUser(userVo);
		
		//response.sendRedirect("/userPageList?page=1&pageSize=10");
		return "redirect:/user/userPageList?page=1&pageSize=10";
	}	

	@RequestMapping(value="/userFormUpdate", method= {RequestMethod.GET})
	public String userFormUpdateView(@RequestParam("userId") String userId, Model model) {
		UserVo userVo = userService.selectUser(userId);
		model.addAttribute("userVo", userVo);
		
		return "user/userFormUpdate";
	}
	
	@RequestMapping(value="/userFormUpdate", method= {RequestMethod.POST})
	public String userFormUpdate(@RequestPart("profilePic") MultipartFile part,
			 HttpServletRequest request, UserVo userVo) {	

		String fileName = part.getOriginalFilename();
	
		try {
			if(fileName.equals("")) {
				UserVo userVoOnDetail = userService.selectUser(userVo.getUserId());
				String path = userVoOnDetail.getProfile();
			}else {
				String path = request.getServletContext().getRealPath("/profile");
				part.transferTo(new File(path + File.separator+fileName));		//파일작성 
				userVo.setProfile("/profile/"+fileName);
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		int updateUser = userService.updateUser(userVo);

		return "redirect:/user/userPageList?page=1&pageSize=10";
	}
	
}
