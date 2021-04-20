<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<%@ include file="../include/head.jsp" %>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "/board/replyWrite");
				  formObj.submit();
			});

			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?review_id=${read.review_id}"
								+ "&comment_id="+$(this).attr("data-comment_id");
			});
					
		//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?review_id=${read.review_id}"
					+ "&comment_id="+$(this).attr("data-comment_id");
			});
			
			// 목록
			$(".list_btn").on("click", function(){

			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})

			$(".btnRecommend").on("click", function(){
			    if(confirm("해당 글을 추천하시겠습니까?")){
			        formObj.attr("action", "/board/recommend");
					formObj.attr("method", "post");
					formObj.submit();
					
			        alert("해당 글을 추천하였습니다.")
			        
			        }
			    });

		})
		
			
	//스크랩
	function scrapIn(){
		var scrapUrl = '/board/readView?review_id=${read.review_id}';
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
	
<body class="sb-nav-fixed">
<%@ include file="../include/main_header.jsp" %>
<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화리뷰 읽기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/board/list">영화리뷰</a></li>
					<li class="breadcrumb-item active">영화리뷰 읽기</li>
				</ol>
			
		<div class="card shadow-lg border-0 rounded-lg">
						
			<div class="card-body">
					<form name="readForm" role="form" method="post">
					<input type="hidden" id="review_id" name="review_id" value="${read.review_id}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				
						<form name="scrapForm" role="form" method="post" >
							<input id="review_id" name="review_id" type="hidden" value="${read.review_id}"/>
							<input type="hidden" id="scrapTitle" name="scrapTitle" value="${read.review_title}"/>
							<input type="hidden" id="scrapAd" name="scrapAd" value=""/>
							<input type="hidden" id="userId" name="userId" value="${login.userId}">
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
				
				
								<div class="btn-group btn-group-sm" role="group" style="float:right;">
										<c:if test="${login.userId == read.user_id}">
											<button type="submit" class="update_btn">수정</button>
											&nbsp;
											<button type="submit" class="delete_btn">삭제</button>
										</c:if>
											<br/>
									</div>
					<table>
						<tbody>
							<tr>
								<td>
									
									<label for="review_title" style="font-size:30px;">${read.review_title}</label>
									<br/><label for="user_id"> ● </label> ${read.user_id} <label for="review_date"></label>
									<fmt:formatDate value="${read.review_date}" pattern="yy.MM.dd hh:mm"/>			
								</td>
							</tr>	
							<tr>
								<td>
									<div class="greview_content">${read.review_content}</div>
									
								</td>
							</tr>
						
							
							<!-- <div class="inputArea">
							 <label for="review_img">이미지</label>
							 <p>원본 이미지</p>
							 <img src="${read.review_img}" class="oriImg"/>
							 
							 <p>썸네일</p>
							 <img src="${read.thumbimg}" class="thumbImg"/>
							</div>-->
											
							
						</tbody>			
					</table>
					<br/>
			<div class="btn-group btn-group-sm" role="group" style="float:right;">
					<button type = "submit" class = "btnRecommend">추천하기</button>
					&nbsp;&nbsp;
					<button type="submit" class="list_btn">목록</button>
					&nbsp;&nbsp;	
			<c:if test="${not empty login}">
				<button class="btn btn-primary " type="submit" onclick="scrapIn()">스크랩</button>
			</c:if>
				</div>
			</div>
				
				<!-- 댓글 -->
					<div id="reply">
					  <ol class="replyList">
					    <c:forEach items="${replyList}" var="replyList">
					      
					        <p>
					        ● ${replyList.user_id}  <fmt:formatDate value="${replyList.comment_date}" pattern="yy-MM-dd hh:mm" />
					        </p>
					
					        <p>${replyList.comment_content}</p>
					        <div class="btn-group btn-group-sm" role="group" style="float:right;">
					        <c:if test="${login.userId == replyList.user_id}">
							  <button type="button" class="replyUpdateBtn" data-comment_id="${replyList.comment_id}">수정</button>
							  &nbsp;
							  <button type="button" class="replyDeleteBtn" data-comment_id="${replyList.comment_id}">삭제</button>
							</c:if>
							</div>
					     
					    </c:forEach>   
					  </ol>
					</div>
					<form name="replyForm" method="post">
					  <input type="hidden" id="review_id" name="review_id" value="${read.review_id}" />
					
					  <div>
					    <!--<label for="user_id">댓글 작성자</label><input type="text" id="user_id" name="user_id" value="${login.userId}" readonly/>
					    <br/>-->
					    <label for="comment_content">&nbsp;&nbsp;</label><textarea id="comment_content" name="comment_content" style="width:1000px; height:50px;"placeholder="무플 멈춰!" ></textarea>
					  </div>
					  <div>
					  <br/>
					 	 &nbsp;&nbsp;<button type="button" class="replyWriteBtn">작성</button>
					  </div>
				</form>
			
			<hr />
			
			</div>
			</div>
			</main>
			<%@ include file="../include/main_footer.jsp" %>
			</div>
		</div>
		<%@ include file="../include/plugin_js.jsp" %>
	</body>
</html>
	