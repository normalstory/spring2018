<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/common/basicLib.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	var userVo = {userId:"brown", alias:"곰", name:"brown", pass:"brownpass"};
	
	//stringfy : 자바스크립트 객체를 문자열로 반환하는 메서드 
	$("#sendData").html(JSON.stringify(userVo));
	
	$("#send").on("click",function(){
		$.ajax({
	        contentType:"application/json; charset=utf-8",
			url:"/ajax/getRangers",
			data:JSON.stringify(userVo), //json
			type:"post",	//리퀘스트 바디라서 get은 바디가 없다
			//data:{userId:"brown"},	//json으로 보낼 예정 
			success:function(dt){	//결과로 리턴되는값
				//console.log(dt);
				$("#result").html(JSON.stringify(dt));
			}
		});
	});

});
</script>
</head>
<body>

	<h2>ajax</h2>
	<button id="send">전송</button><br>
	전송 데이터 : <span id="sendData"></span><br>
	응답 결과 : <span id="result"></span>
	
</body>
</html>