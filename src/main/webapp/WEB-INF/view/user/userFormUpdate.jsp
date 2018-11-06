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

<!-- jquery-ui api -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
$(document).ready(function(){
	
	//생일 input datepicker 적용 
	$("#birth").datepicker(
		{
			dateFormat: "yy-mm-dd",
			yearRange:"1970:2012",
		 	changeMonth: true,
		 	changeYear: true
		}
	);
	
	//클릭 이벤트 조건 추가 
	$("#addrSearchBtn").click(function(){
		
		//다음 api
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            //주소 : roadAddress
	            //상세 : ""
	            //우편번호 : zonecode

	            //test
	            console.log(data);
	            
	            //주소 input에 value 설정 
            	//-> 주소 : data.roadAddress
	            $("#addr1").val(data.roadAddress);
            	//-> 우편번호 : data.zonecode
	            $("#zipcd").val(data.zonecode);
	        }
	    }).open();
	});
	
	$("#del_PicBtn").click(function(){
		$("#img").css('display','none');
		$("#profile").css('display','block');
		$("#del_PicBtn").css('display','none');
		$("#pP").css('display','none');
		
		//여기까지 (안나옮)
		//$("img").attr('src','/Users/bhuanchanwoo/git/201805jsp/src/main/webapp/profile/noimage.png');
		$("img").attr('src','D:\A_TeachingMaterial\6.JspSrpgin\workspace\jsp\src\main\webapp\profile\noimage.png');
		
		//-> 디데일.jsp ->(버튼)파라미터 보내기 -> form 다시 입력한 후 저장(업데이트)하기 -> 리스트 페이지로 
		
		
	});
});
    
</script>

<style type="text/css">
#profile{
	display: none;
}
</style>

</head>

<body>

	<!-- header -->
	<%@ include file="../common/header.jsp"%>

	<div class="container-fluid">
		<div class="row">

			<!-- left -->
			<%@ include file="../common/left.jsp"%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<form method="post" action="/user/userFormUpdate" class="form-horizontal" role="form" enctype="multipart/form-data">

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
						
							<c:choose>
							<c:when test="${userVo.profile!=null }"><c:set var="profilePic" value="${userVo.profile}"/></c:when>
							<c:otherwise><c:set var="profilePic" value="/profile/noimage.png"/></c:otherwise>
							</c:choose>
							
							<div id="imgFrame">
								<img id="img" src="${profilePic }"><br/>
								<p id="pP">${profilePic }<br/></p>
							</div>
							<input id="del_PicBtn" type="button" name="del_PicBtn" value="사진교체">
							<input id="profile" type="file" name="profilePic" >
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userId" name="userId" readonly="readonly" value="${userVo.userId }"
								placeholder="사용자 아이디">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name" value="${userVo.name }"
								placeholder="이름">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">패스워드</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="pass" value="${userVo.pass }"
								name="pass" placeholder="사용자 패스워드">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr1" name="addr1" value="${userVo.addr1 }"
								placeholder="주소" readonly="readonly">
							<!-- 주소검색 버튼 -->
							<button id="addrSearchBtn" type="button" class="btn btn-default">주소검색</button>
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">주소 상세</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr2" name="addr2" value="${userVo.addr2 }"
								placeholder="주소 상세">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="zipcd" name="zipcd" value="${userVo.zipcd }"
								placeholder="우편번호">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">생년월일</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="birth" name="birth" 
							value="<fmt:formatDate value='${userVo.birth }' pattern='yyyy-MM-dd'/>" placeholder="생년월일">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">이메일</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="email" name="email" value="${userVo.email }"
								placeholder="이메일">
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">전화번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="tel" name="tel" value="${userVo.tel }"
								placeholder="전화번호">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" >수정내용 저장</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
