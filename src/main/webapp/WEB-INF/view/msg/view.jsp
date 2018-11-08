<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	hello : <spring:message code="hello"></spring:message><br>
	visitor : <spring:message code="visitor" arguments="brown,sally"></spring:message><br>
<form action="/messageView" method="post">
	<select name="lang">
		<option value="ko" <c:if test="${param.lang=='ko' }">selected</c:if>>한국어</option>
		<option value="ja" <c:if test="${param.lang=='ja' }">selected</c:if>>日本語</option>
		<option value="en" <c:if test="${param.lang=='en' }">selected</c:if>>ENGLISH</option>
	</select>
  <input type="submit" value="전송">
 </form>
</body>
</html>