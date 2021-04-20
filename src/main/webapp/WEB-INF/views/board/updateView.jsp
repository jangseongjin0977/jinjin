<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

		<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
		
	<%@ include file="../include/head.jsp" %>

<body class="sb-nav-fixed">
<%@ include file="../include/main_header.jsp" %>
<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화리뷰 수정</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/board/list">영화리뷰</a></li>
					<li class="breadcrumb-item active">영화리뷰 수정</li>
				</ol>
				
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?review_id=${update.review_id}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data">
					<input type="hidden" name="review_id" value="${update.review_id}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title"></label><input type="text" id="review_title" name="review_title" value="${update.review_title}" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요." style="width:1000px; height:35px;"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content"></label><textarea id="review_content" name="review_content" ><c:out value="${update.review_content}" /></textarea>
									 <script>
									 var ckeditor_config = {
									   resize_enaleb : false,
									   width : 1000,
									   height : 450, 
									   enterMode : CKEDITOR.ENTER_BR,
									   shiftEnterMode : CKEDITOR.ENTER_P,
									   filebrowserUploadUrl : "/board/ckUpload",
									   uploadUrl: "/board/ckUpload",
									 };
									 
									 CKEDITOR.replace("review_content", ckeditor_config);
									</script>
								</td>
							</tr>
							<tr>
								<td>
									<label for="user_id"></label><input type="hidden" id="user_id" name="user_id" value="${update.user_id}" readonly="readonly"/>
								</td>
							</tr>
							<!-- <tr>
								<td>
									<label for="review_date">작성날짜</label>
									<fmt:formatDate value="${update.review_date}" pattern="yy.MM.dd"/>					
								</td>
							</tr>-->
						</tbody>			
					</table>
							<div class="inputArea">
								 <label for=review_img>이미지</label>
								 <input type="file" id="review_img" name="file" />
								 <div class="select_img">
								 <!-- <img src="${update.review_img}" /> -->
								  <input type="hidden" name="review_img" value="${update.review_img}" />
								  <input type="hidden" name="thumbimg" value="${update.thumbimg}" /> 
								 </div>
								 
								 <script>
								  $("#review_img").change(function(){
								   if(this.files && this.files[0]) {
								    var reader = new FileReader;
								    reader.onload = function(data) {
								     $(".select_img img").attr("src", data.target.result).width(500);        
								    }
								    reader.readAsDataURL(this.files[0]);
								   }
								  });
								 </script>
								</div>
		<br/>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
		</div>
		</main>
					<%@ include file="../include/main_footer.jsp" %>
		</div>
		</div>
		
		<%@ include file="../include/plugin_js.jsp" %>
	</body>

</html>