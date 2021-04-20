<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		if($("#email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
	});
})
</script>
<body>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3>
								</div>
								<div class="card-body">
									<form action="/member/findPw" method="post" id="regForm">
										<div class="form-group"> 
											<label class="small mb-1"  for="email">이메일</label>
											<input  class="form-control py-4"  type="text" id="email" name="email" placeholder="이메일"/>
										</div>
										<div class="form-group mt-4 mb-0">
											<button class="btn btn-primary btn-block" type="submit" id="submit" >임시비밀번호 발송</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="/member/login">로그인</a>
									</div>
								</div>
								<c:if test="${msg == false}">
									<script type="text/javascript">
									alert("등록되지 않은 이메일 입니다.");
									</script>
								</c:if>
								<c:if test="${msg2 == false}">
									<script type="text/javascript">
									alert("이미 탈퇴한 회원입니다");
									</script>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>

		<%@ include file="../include_user/user_footer.jsp"%>
	</div>
	<%@ include file="../include_user/user_plugin_js.jsp"%>
</body>
</html>