<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- basicLib -->
<%@ include file="../common/basicLib.jsp"%>

<!-- jquery-ui api -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
$(document).ready(function(){
	            $("#userId").val();
	            $("#name").val("testUserId");
	            $("#pass").val("Pass1234");
	            $("#addr1").val("대전 중구 중앙로76");
	            $("#addr2").val("영민빌딩 2층 대덕인재개발원");
	            $("#zipcd").val("34940");
	            $("#birth").val("2018-08-08");
	            $("#email").val("newUser@gmail.com");
	            $("#tel").val("0422228202");
	
	$("#birth").datepicker(
		{
			dateFormat: "yy-mm-dd",
			yearRange:"1970:2012",
		 	changeMonth: true,
		 	changeYear: true
		}
	);
	
	$("#addrSearchBtn").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            console.log(data);
	            $("#addr1").val(data.roadAddress);
	            $("#zipcd").val(data.zonecode);
	        }
	    }).open();
	});
});
</script>

<form method="post" action="/user/userForm" class="form-horizontal"
	role="form" enctype="multipart/form-data">

	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 사진</label>
		<div class="col-sm-10">
			<input type="file" name="profilePic">
		</div>
	</div>

	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="userId" name="userId"
				placeholder="사용자 아이디">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="name" name="name"
				placeholder="이름">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 패스워드</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="pass" name="pass"
				placeholder="사용자 패스워드">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">주소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="addr1" name="addr1"
				placeholder="주소" readonly="readonly">
			<!-- 주소검색 버튼 -->
			<button id="addrSearchBtn" type="button" class="btn btn-default">주소검색</button>
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">주소 상세 </label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="addr2" name="addr2"
				placeholder="주소 상세">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">우편번호</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="zipcd" name="zipcd"
				placeholder="우편번호">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">생년월일</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="birth" name="birth"
				placeholder="생년월일">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">이메일</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="email" name="email"
				placeholder="이메일">
		</div>
	</div>
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">전화번호</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="tel" name="tel"
				placeholder="전화번호">
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default">사용자 등록</button>
		</div>
	</div>
</form>