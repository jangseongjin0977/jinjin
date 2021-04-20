<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
	});
})
</script>

<body class="bg-primary">
<div id="layoutAuthentication">
	<div id="layoutAuthentication_content">
	<main>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">회원 탈퇴</h3>
						</div>
						<div class="card-body">
							<form action="/member/userBlock" method="post">
								<input type="hidden" id="userId" name="userId" placeholder="아이디" value="${login.userId}"/>
								<div class="form-group">
									<label class="small mb-1"  for="pw">패스워드를 입력해주세요</label>
									<input class="form-control py-4"  type="password" id="pw" name="pw" placeholder="패스워드" />
								</div>
								<div class="form-group mt-4 mb-0">
									<button class="btn btn-primary btn-block" type="submit" id="submit" >회원탈퇴</button>
								</div>
							</form>
						</div>
						<div class="card-footer text-center">
							<div class="small">
								<a href="/">메인으로</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${msg == false}">
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다");
			</script>
		</c:if>

	</main>
	</div>
	<%@ include file="../include_user/user_footer.jsp" %>
</div>
<%@ include file="../include_user/user_plugin_js.jsp" %>
</body>
</html>