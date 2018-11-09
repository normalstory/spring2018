<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- basicLib -->
<%@ include file="../common/basicLib.jsp"%>

<!-- 사용자 클릭해서 상세화면으로 이동 -->
<style type="text/css">
.userClick {
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function userName(a){
		alert(a);
	}

	$(document).ready(function(){
		console.log("document.ready");
		var ec="click";
		$("tbody").on(ec,".userClick",function(){
			console.log("userClick");
			var userId = $(this).children()[1].innerHTML;
			$("#userId").val(userId);
			$("#frm").submit();
		});

		//getUserList(1);
		getUserListHtml(1);
		//getUserPagenationHtml(1);
	});
	
	
	function getUserListHtml(page){
		var pageSize=10;
		$.ajax({
			type:"GET",
			url:"/user/userPageListAjaxHtml",
			data:"page="+page+"&pageSize="+pageSize, //보낼때
	        dataType : "html",			//받을때 
			success:function(dt){
				$("#userList").html(dt);
				getUserPagenationHtml(1);
			}
		});
	}
	
	function getUserPagenationHtml(page){
		var pageSize=10;
		$.ajax({
			type:"GET",
			url:"/user/userPagenationHtml",
			data:"page="+page+"&pageSize="+pageSize, 
	        dataType : "html",
			success:function(dt){
				$(".pagination").html(dt);
			}
		});
	}
	
	//page 인자를 받아서 해당 페이지에 속하는 사용자 리스트정보를 가져온다
	function getUserList(page) {
		var pageSize = 10;
		console.log("page : " + page);
		
		//ajax call 사용자 리스트 데이터만 가져온다
		//html(기존방식)이 아닌 json(to-be) data를 받는 형태로 변경
		$.ajax({
			type:"GET",
			url :"/user/userPageListAjax",
			data:"page="+page+"&pageSize="+pageSize,  //ex page=1&pageSize=10
	        dataType : "json",
			success:function(dt){//url 응답
				//data(사용자 json데이터)를 바탕으로 사용자 리스트를 갱신
				//1. 기존 리스트 삭제
				//2. data를 이용하여 테이블 tr를 작성
				//3. 기존 리스트 위치에 붙여넣기
				
				console.log(dt);
				var html="";
				//배열-향상된 for문 
				//<--배열 : userService에서 Map<String,Object>의 변수값
				$.each(dt.userList, function(idx, user){	 //java로 부터받은 제이슨객체 userList
					console.log(user);
					html += "<tr class='userClick'>";
					html += "<td>"+idx+" | "+user.rnum+"</td>";
					html += "<td>"+idx+" | "+user.userId+"</td>";
					html += "<td>"+idx+" | "+user.name+"</td>";
					html += "<td>"+idx+" | "+user.birthFomat+"</td>";
				});
				
				$("#userList").html("");
				$("#userList").html(html);
				
				/* var ec="click";
				$(".userClick").on(ec,function(){
					console.log("userClick");
					var userId = $(this).children()[1].innerHTML;
					$("#userId").val(userId);
					$("#frm").submit();
				}); */
				
	   <%-- <c:forEach begin="1" end="${pageCnt}" var="p">
				<li><a href="/user/userPageList?page=${p}&pageSize=10">${p}</a></li>
				<li><a href="javascript:getUserList(${p});">${p}</a></li>
			</c:forEach> --%>
			
				/* var cntHtml="";
				$.each(dt.pageCnt, function(idx, pageCnt){
					cntHtml += "<a href='javascript:getUserList("+pageSize+");'>"+pageSize+"</a>";
				});*/
				
				var cntHtml="";
				cntHtml += "<li><a href='javascript:getUserList(1);' aria-label='Previous'> <span aria-hidden='true'>&laquo;</span></a></li>";
				for(var i =1; i<=dt.pageCnt; i++){
					cntHtml += "<li><a href='javascript:getUserList("+i+");'>"+i+"</a></li>";
				}
				cntHtml += "<li><a href='javascript:getUserList("+dt.pageCnt+");' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				$(".pagination").html(cntHtml); 
				
			}
		});
	}
</script>

<form id="frm" action="/user/userDetail" method="get">
	<input type="hidden" id="userId" name="userId">
</form>

<div class="row">
	<div class="col-sm-8 blog-main">
		<h2 class="sub-header">사용자</h2>

		<div class="table-responsive">

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>사용자 아이디</th>
						<th>사용자 이름</th>
						<th>생일</th>
					</tr>
				</thead>
				<tbody id="userList"><!-- userList loop 출력 **이 부분 <-- aja를 위해 삭제하고 다시 넣는 부분-->
					<%-- <c:forEach items="${userList}" var="user">
							<tr class="userClick">
								<td>${user.rnum }</td>
								<td>${user.userId }</td>
								<td>${user.name }</td>
								<td><fmt:formatDate value="${user.birth }" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach> 
					--%>
				</tbody>
			</table>

		</div>

		<a class="btn btn-default pull-right" href="/user/userForm">사용자 등록</a>

		<div class="text-center">
			<ul class="pagination">
			<%-- 	
				<!-- <li><a href="/user/userPageList?page=1&pageSize=10" -->
				<!-- javascript:getUserList(1,10) -->
				<li>
					<a href="javascript:getUserList(1);" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a> 
				</li>
				
				<c:forEach begin="1" end="${pageCnt}" var="p">
					<li><a href="/user/userPageList?page=${p}&pageSize=10">${p}</a></li>
					<li><a href="javascript:getUserList(${p});">${p}</a></li>
				</c:forEach>
				
				<li id="cnt"></li>
				
				<li>
					<!-- <a href="/user/userPageList?page=${pageCnt }&pageSize=10" aria-label="Next">-->
					<a href="javascript:getUserList(${pageCnt});" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
				</li> 
			--%>
			</ul>
		</div>
	</div>
</div>