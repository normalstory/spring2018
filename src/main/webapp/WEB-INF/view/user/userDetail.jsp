<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title>userAllList</title>

<!-- basicLib -->
<%@ include file="../common/basicLib.jsp"%>
</head>

<body>

	<!-- header -->
	<%@ include file="../common/header.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<!-- left -->
			<%@ include file="../common/left.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

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
						<label for="userNm" class="col-sm-2 control-label">사용자
							패스워드</label>
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
							<label class="control-label">
							<fmt:formatDate value="${userVo.birth }" pattern="yyyy-MM-dd" /></label>
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
								onclick="location.href='/user/userFormUpdate?userId=${userVo.userId}'">회원정보 수정</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>
