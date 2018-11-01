<%--사용자 아이디랑, 비밀번호 입력 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- basicLib -->
<%@ include file="../common/basicLib.jsp"%>

<link href="/css/signin.css" rel="stylesheet">
<script type="text/javascript">

	$(document).ready(function(){
		console.log("test");
		
		//쿠키값이 y이면 remember
		if(getCookie("rememberMe")=="Y"){
			
			//remember-me 체크 
			$("#checkbox").attr("checked",checked);		// html 속성	(값)
			//$("#checkbox").prop("checked",true);		// js 프로퍼티 (주소+값)
			//$("#checkbox").is(":checked");
			
			//userId input value를 usserId를 쿠키값으로 설정
			$("#inputId").val(getCookie("userId"));
		}
	});
	
	//쿠키값 가져오기 위한 메소드 생성 
	function getCookie(cookieName){
	//cookieName <- document.cookie
	//var split = cookies.split("; ");
	var cookies = document.cookie.split("; ");
	var cookieValue="";
	
	for(var i=0 ; i< cookies.length; i++){
		var str = cookies[i];
		if(str.startsWith(cookieName+"=")){
			cookieValue = str.substring((cookieName+"=").length);
		}
	}
	return cookieValue;
}
//getCookie("rememberMe");
//getCookie("userId");
</script>

</head>
<body>

	<%--
	브라우저 주소줄에 입력한 경우 : get 
    <form>의 메서드 속성 : get, post 
--%>
	<div class="container">
		<form class="form-signin" method="post" action="/user/loginProcess">
			<h2 class="form-signin-heading">Please sign in</h2>
			
			<label for="inputId" class="sr-only">UserId</label>
			<input id="inputId"  type="text" name="userId" value="brown"
				class="form-control" placeholder="아이디를 입력하세요"> <br />
			
			<input type="password" name="password" value="brownPass"
				class="form-control" placeholder="비밀번호를 입력하세요"> <br />
				
			<label for="inputPassword" class="sr-only">Password</label>	
			<div class="checkbox">
				<label> 
					<input id="checkbox" type="checkbox" name="remember-me" >
					Remember me
				</label>
			</div>
			<button type="submit" value="로그인"
				class="btn btn-lg btn-primary btn-block">Sign in</button>
		</form>
	</div>
</body>
</html>