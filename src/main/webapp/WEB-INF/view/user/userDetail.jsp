<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<form class="form-horizontal" role="form">
	<!-- form method="post" action="/userFormUpdate" class="form-horizontal" role="form">
				<input type="hidden" > </input-->
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 사진</label>
		<div class="col-sm-10">

			<c:choose>
				<c:when test="${userVo.profile!=null}">
					<c:set var="profile" value="${userVo.profile}" />
				</c:when>
				<c:otherwise>
					<c:set var="profile" value="/profile/noimage.png" />
				</c:otherwise>
			</c:choose>

			<div id="imgFrame">
				<img id="img" src="${profile}"><br />
				<p id="pP">${profile}<br />
				</p>
			</div>
		</div>
	</div>

	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.userId}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">이름</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.name}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 패스워드</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.pass}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">주소</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.addr1}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">주소 상세 </label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.addr2}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">우편번호</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.zipcd}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">생일</label>
		<div class="col-sm-10">
			<label class="control-label"> <fmt:formatDate
					value="${userVo.birth }" pattern="yyyy-MM-dd" /></label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">이메일</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.email}</label>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">전화번호</label>
		<div class="col-sm-10">
			<label class="control-label">${userVo.tel}</label>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-default"
				onclick="location.href='/user/userFormUpdate?userId=${userVo.userId}'">회원정보
				수정</button>
		</div>
	</div>
</form>