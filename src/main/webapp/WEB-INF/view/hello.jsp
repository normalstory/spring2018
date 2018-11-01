<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>rangers</h2>
	
	<c:forEach items="${rangers }" var="ranger">
	ranger : ${ranger }<br/>
	</c:forEach>
	
	
	<h3>hello/ request</h3>
	<form action="/hello/request" method="post">
		userId : <input type="text" name="userId" value="brown">
		password : <input type="text" name="pass" value="brownpass">
		<input type="submit" value="전송">
	</form>
	
	
	<h3>hello/ vo</h3>
	<form action="/hello/vo" method="post">
		userId : <input type="text" name="userId" value="브라운">
		password : <input type="text" name="pass" value="brownpass">
		<input type="submit" value="전송">
	</form>
</body>
</html>