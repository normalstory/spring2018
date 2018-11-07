package kr.or.ddit.mvc.view;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.View;

//99dan 출력 커스텀 뷰 
//스프링 커스텀 뷰를 만들기 위해 뷰 인터페이스를 구현 
public class TimesTablesView implements View{
	Logger logger = LoggerFactory.getLogger(TimesTablesView.class);
	
	@Override
	public String getContentType() {
		return null;
	}

	//컨트롤러에서 값을 보내면 여기 모델이 받아서 처리. 그래서 여기를 수정하면 수정
	public void render(Map<String, ?> model, HttpServletRequest request, 
					HttpServletResponse response)  //, @RequestParam("tables") int tables
			throws Exception {
		
		
		//int tables = (int) request.getAttribute("tables");
		//logger.debug(" $$$$$$$$$$$ tables : ", tables);
		
		//logger.debug(" $$$$$$$$$$$ tables : ", request.getParameter("tables"));	
		//int tables = Integer.parseInt(request.getParameter("tables"));
		
		String param = request.getParameter("tables");
		if(isStringDouble(param)){
			int tables = Integer.parseInt(param);
		}else{
			int tables = 9;
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw  = response.getWriter();
		
		pw.println("<!DOCTYPE html>");
		pw.println("	<html>");
		pw.println("		<head>");
		pw.println("		<meta charset=\"UTF-8\">");
		pw.println("		<title>Insert title here</title>");
		
		pw.println("<style type=\"text/css\">");
		pw.println("	td{ border: 1px solid pink; }");
		pw.println("</style>");
		
		pw.println("	</head>");			
		pw.println("	<body>");		
		
		pw.println("<table>");

		for(int j=1; j<10; j++){
			pw.println("	<tr>");
			for(int i=2; i<tables; i++){
				String times= i+"X"+j+"="+i*j;	
				pw.println("		<td>"+times+"</td>");
			}
			pw.println("	</tr>");
		}
		pw.println("</table>");
		
		pw.println("	</body>");
		pw.println("</html>");		
				
		pw.flush();
		pw.close();
	}
}
