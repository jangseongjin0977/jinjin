<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<style>
	.inputArea {margin:10px 0;}
	.select_img img {width:500px; margin:20px 0;}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/movie_info/movielist";
			})
		})
			$(".cancel_btn").on("click", function(){
					event.preventDefault();
					location.href = "/movie_info/readView?movie_id=${update.movie_id}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}";
		})
					$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/movie_info/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
		 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
	
	</script>
<%@ include file="../include/head.jsp" %>

<body class="sb-nav-fixed">
<%@ include file="../include/main_header.jsp" %>
<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화 읽기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/board/list">영화소개</a></li>
					<li class="breadcrumb-item active">영화소개 읽기</li>
				</ol>

			
				<div class="card shadow-lg border-0 rounded-lg">
					<div class="card-body">
				<form name="updateForm" role="form" method="post" action="/movie_info/update" enctype="multipart/form-data">
					<input type="hidden" name="movie_id" value="${update.movie_id}" readonly="readonly"/>
									<div class="form-group">
									<label class="small mb-2" for="category_id">장르</label><input type="text" id="category_id" name="category_id" class="form-control py-2" value="${update.category_id}"/>
									</div>
									<div class="form-group">
									<label class="small mb-2" for="movie_title">제목</label><input type="text" id="movie_title" name="movie_title" class="form-control py-2" value="${update.movie_title}"/>
									</div>
									<div class="form-group">
									<label class="small mb-1" for="movie_content">내용 </label><textarea id="movie_content" name="movie_content" class="hidden form-control py-4"><c:out value="${update.movie_content}" /></textarea>
									</div>
									<div class="form-group">
									<label class="small mb-1" for="user_id">작성자 </label><input class="form-control py-4" type="text" id="user_id" type="hidden" name="user_id" value="${update.user_id}" readonly="readonly"/>
									</div>
									<div class="form-group">
									<label for="movie_date">작성날짜 </label>
									<fmt:formatDate value="${update.movie_date}" pattern="yyyy-MM-dd"/>					
									</div>
									
							
							<div class="inputArea">
							 <label for="movie_img">이미지</label>
							 <input type="file" id="movie_img" name="file" />
							 <div class="select_img">
							  <img src="${update.movie_img}" />
							  <input type="hidden" name="movie_img" value="${update.movie_img}" />
							  <input type="hidden" name="img" value="${update.img}" /> 
							 </div>
							 
							 <script>
							  $("#movie_img").change(function(){
							   if(this.files && this.files[0]) {
							    var reader = new FileReader;
							    reader.onload = function(data) {
							     $(".select_img img").attr("src", data.target.result).width(500);        
							    }
							    reader.readAsDataURL(this.files[0]);
							   }
							  });
							 </script>
							 <%=request.getRealPath("/") %>
							</div>	
					<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
					</div>
					<div class="card-footer text-center">
						<div class="small">
							<a href="#">계정이 있으면 로그인 해주세요</a>
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