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
				<h1 class="mt-4">영화리뷰 글쓰기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/board/list">영화리뷰</a></li>
					<li class="breadcrumb-item active">영화리뷰 글쓰기</li>
				</ol>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='write']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	
			
			<section id="container">
				<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="review_title"></label><input type="text" id="review_title" name="review_title" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요." style="width:1000px; height:35px;"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="review_content"></label>
									<textarea rows="5" cols="50" id="review_content" name="review_content" ></textarea>
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
								<!-- <td>
									<label for="user_id">작성자</label><input type="text" id="user_id" name="user_id" value="${login.userId}" readonly />
								</td>--> 
							<tr>
								<td>						
								<br/><button class="write_btn" type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
					<br/>
							<div class="inputArea">
								 <label for="review_img">이미지</label>
								 <input type="file" id="review_img" name="file" />
								 <div class="select_img"><img src="" /></div>
								 
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
				</form>
			</section>
			<hr />
			</div>
			</main>
					<%@ include file="../include/main_footer.jsp" %>
			</div>
			</div>
		<%@ include file="../include/plugin_js.jsp" %>
	</body>
</html>