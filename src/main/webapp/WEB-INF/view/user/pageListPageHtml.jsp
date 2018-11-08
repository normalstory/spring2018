<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 네비게이션 버튼 리스트 반환 -->
<li><a href="javascript:getUserList(1);" aria-label="Previous">
		<span aria-hidden="true">&laquo;</span> </a></li>

<c:forEach begin="1" end="${pageCnt}" var="p">
	<li><a href="javascript:getUserList(${p});">${p}</a></li>
</c:forEach>

<li><a href="javascript:getUserList(${pageCnt});" aria-label="Next"> 
	<span aria-hidden="true">&raquo;</span> </a> </li> 
