<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>게시판</title>
</head>
<style>

.select_img img {margin:20px 0;}
</style>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='write']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/movie_info/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})

		
	</script>
<%@ include file="../include/head.jsp" %>

<body class="sb-nav-fixed">

<%@ include file="../include/main_header.jsp" %>

<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화 글쓰기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/movie_info/movielist">영화소개</a></li>
					<li class="breadcrumb-item active">영화 글쓰기</li>
				</ol>

		<div class="card shadow-lg border-0 rounded-lg">
					<div class="card-body">
					<form role="form" method="post" autocomplete="off">
					</form>
			<form action="write" method="post" action="/movie_info/write" enctype="multipart/form-data">
						<c:if test="${login.userId != null}">
						
						<div class="form-group">
							<div class="col-md-2">
							<label class="small mb-2" for="category_id">영화 카테고리</label>
							<input type="select" id="category_id" class="form-control py-3" name="category_id" />
							</div>
						</div>
	
					<div class="form-group">
						<div class="col-md-2">
						<label for="movie_title">영화 제목</label>
						<input type="text" id="movie_title" name="movie_title" class="form-control py-3"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-2">
							<div class="form-group">
							<label class="small mb-2" for="user_id">작성자</label>
							<input type="text"id="user_id" name="user_id" class="form-control py-2" value="${login.userId}"/>
							</div>
						</div>
					</div>
					

				
						
						<div class="form-group">
							<label class="small mb-2">영화 소개</label> 
							<textarea id="movie_content" name="movie_content"  class="form-control py-4"></textarea>
						</div>

					<div class="form-group">
						<div class="inputArea">
							 <label for="movie_img">이미지</label>
							 <input type="file" id="movie_img" name="file" />
						<div class="select_img"><img src="" /></div>
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
								<button class="write_btn" type="submit">작성</button>
						</div>
						</c:if>
						</form>
						<div class="card-footer text-center">
						<c:if test="${login.userId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
						</c:if>
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
