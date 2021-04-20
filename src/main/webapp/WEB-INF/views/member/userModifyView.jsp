<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	//유효성체크 (공백입력 방지)
	$("#submit").on("click", function(){
		//비밀번호 정규식
		var pwExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
		if( !pwExp.test( $("input[name=pw]").val() ) ) {
			 alert("비밀번호는 8 ~ 10자 이상 영문, 숫자를 조합해야 합니다");
			return false;
		}
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
							<h3 class="text-center font-weight-light my-4">회원가입</h3>
						</div>
						<div class="card-body">
							<form action="/member/userModify" method="post" id="regForm">
								<div class="form-group"> 
									<label class="small mb-1"  for="userId">아이디</label>
									<input type="hidden" id="userId" name="userId" placeholder="아이디" value="${login.userId}"/>
									${login.userId}
								</div>
								<div class="form-group">
									<label class="small mb-1"  for="pw">패스워드</label>
									<input class="form-control py-4" type="password" id="pw" name="pw" placeholder="패스워드" />
								</div>
								<div class="form-group"> 
									<label class="small mb-1"  for="email">이메일</label>
									<input type="hidden" id="email" name="email" placeholder="이메일" value="${login.email}"/>
									${login.email}
								</div>
								<div class="form-group mt-4 mb-0">
									<button class="btn btn-primary btn-block" type="submit" id="submit" >회원정보 수정</button>
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
	</main>
	</div>
	<%@ include file="../include_user/user_footer.jsp" %>
</div>
<%@ include file="../include_user/user_plugin_js.jsp" %>
</body>
</html>