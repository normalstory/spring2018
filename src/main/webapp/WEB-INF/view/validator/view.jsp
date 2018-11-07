<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>view-spring validator</h3>

<form action="/validator/validate" method="post">
	<input type="text" name="userId" value="${param.userId }"><form:errors path="userVo.userId"/><br/>
	<input type="text" name="name" value="${param.name }"><form:errors path="userVo.name"/><br/>
	<input type="text" name="pass" value="${param.pass }"><form:errors path="userVo.pass"></form:errors><br/>
	<input type="submit" name="전송">
</form>

<h3>view-jsr303 validator</h3>
<form action="/validator/validateJsr" method="post">
	<input type="text" name="userId" value="${param.userId }"><form:errors path="userVoJsr303.userId"/><br/>
	<input type="text" name="name" value="${param.name }"><form:errors path="userVoJsr303.name"/><br/>
	<input type="text" name="pass" value="${param.pass }"><form:errors path="userVoJsr303.pass"></form:errors><br/>
	<input type="submit" name="전송">
</form>


</body>
</html>