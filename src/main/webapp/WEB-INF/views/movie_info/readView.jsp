<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<style>
.inputArea { margin:10px 0;}
select {width:100px;}
label {display:inline-block; width:70px; padding:5px;}
.oriImg {width:500px; height:auto;}
.thumbImg{}
</style>
<script type="text/javascript"></script>
<script>
$(document).ready(function(){
	var formObj = $("form[name='readForm']");
			
	// 수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "/movie_info/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	})
	
	// 삭제
	$(".delete_btn").on("click", function(){
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			
		formObj.attr("action", "/movie_info/delete");
		formObj.attr("method", "post");
		formObj.submit();
			
		}
	})
	
	// 목록
	$(".list_btn").on("click", function(){
		
		location.href = "/movie_info/movielist?page=${scri.page}"
				      +"&perPageNum=${scri.perPageNum}"
				      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	})
	
	
})
	//추천하기
	function pushClick(){
		alert("확인");
		var formObj = $("form[name='pushForm']");
		formObj.attr("action", "/movie_info/pushIn");
		formObj.attr("method", "post");
		formObj.submit();
	}
	//추천회수
	function pushOutClick(){
		var formObj = $("form[name='pushForm']");
		formObj.attr("action", "/movie_info/pushOut");
		formObj.attr("method", "post");
		formObj.submit();
	}
	

	
	//스크랩
	function scrapIn(){
		var scrapUrl = '/movie_info/readView?movie_id=${read.movie_id}';
		$('input[name=scrapAd]').attr('value',scrapUrl);
		var formObj = $("form[name='scrapForm']");
		formObj.attr("action", "/movie_info/scrapIn");
		formObj.attr("method", "post");
		formObj.submit();
	}

	//스크랩 확인 문구
	var msg = "${msg}";
	if (msg === "scrapOk") {
	alert ("스크랩되었습니다");
	}

	
</script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<body class="sb-nav-fixed">
<%@ include file="../include/main_header.jsp" %>
<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화소개</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/movie_info/movielist">영화소개</a></li>
					<li class="breadcrumb-item active">영화소개글</li>
				</ol>
			
				<div class="card shadow-lg border-0 rounded-lg">
					<div class="card-body">
				<div class="form-group">
				<form name="readForm" role="form" method="post">
				  <input type="hidden" id="movie_id" name="movie_id" value="${read.movie_id}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
				</form>
				</div>
				
				<!-- 자료 넘어가는 폼 -->
					<form name="pushForm" role="form" method="post" >
					  <input type="hidden" id="movie_id" name="movie_id" value="${read.movie_id}" />
						<input type="hidden" id="userId" name="userId" value="${login.userId}">
						<input type="hidden" id="page" name="page" value="${scri.page}"> 
						<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
						<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
						<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
					</form>
					
						<form name="scrapForm" role="form" method="post" >
							<input id="movie_id" name="movie_id" type="hidden" value="${read.movie_id}"/>
							<input type="hidden" id="scrapTitle" name="scrapTitle" value="${read.movie_title}"/>
							<input type="hidden" id="scrapAd" name="scrapAd" value=""/>
							<input type="hidden" id="userId" name="userId" value="${login.userId}">
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
			
				
				
				<!-- 추천버튼 -->
					<c:if test="${not empty login}">
						<c:if test="${pushCheck == 0}">
						<button class="btn btn-primary float-right" type="submit" onclick="pushClick()">추천하기</button>
						</c:if>
						<c:if test="${pushCheck == 1}">
						<button class="btn btn-primary float-right" type="submit" onclick="pushOutClick()">추천회수</button>
						</c:if>
					</c:if> 
					
						<div class="form-group">
							<i class="fa fa-heart" style="font-size:16px;color:red"></i> ${push}
						</div>
							
						<div class="form-group">
							<label class="small mb-1" for="movie_title">영화 제목</label><input type="text" id="movie_title" name="movie_title" value="${read.movie_title}" />
						</div>
						<div class="form-group">
							<label class="small mb-1" for="category_id">장르</label><input type="text" id="category_id" name="category_id" value="${read.category_id}" />
						</div>
						<div class="inputArea">
							<img src="${read.movie_img}" class="oriImg"/>
						</div>
						<div class="form-group">
							<label class="small mb-2" for="movie_content"></label> <textarea id="movie_content" name="movie_content" class="hidden form-control py-5"><c:out value="${read.movie_content}" /></textarea>
						</div>

						<div class="form-group">
							<label class="small mb-1" for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${read.user_id}" />
						</div>
						<div class="form-group">
							<label class="small mb-1" for="movie_date">작성날짜</label> <fmt:formatDate value="${read.movie_date}" pattern="yyyy-MM-dd" />
						</div>
			
			
			<div class="form-group align-items-center justify-content-between mt-4 mb-0">
			
			<c:if test="${not empty login}">
			    <c:if test="${login.userId == read.user_id}">
				<button type="submit" class="update_btn">수정</button>
				<button type="submit" class="delete_btn">삭제</button>
			</c:if>
			
			<c:if test="${not empty login}">
				<button class="btn btn-primary " type="submit" onclick="scrapIn()">스크랩</button>
			</c:if>
			</c:if>
				<button type="submit" class="list_btn" style="float: right;" >목록으로</button>
			</div>
			
						 
			</div>
				</div>
			</div>
				
		</main>
		<%@ include file="../include/main_footer.jsp" %>
	</div>
</div>
	<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>