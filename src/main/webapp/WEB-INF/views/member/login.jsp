<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>
<body class="bg-primary">
<div id="layoutAuthentication">
	<div id="layoutAuthentication_content">
	<main>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">로그인</h3>
						</div>
						<div class="card-body">
							<form action="/member/loginPost" method="post">
								<div class="form-group">
									<label class="small mb-1" for="inputEmailAddress">아이디</label>
									<input class="form-control py-4" id="userId" name="userId"  type="text" placeholder="아이디를 입력해주세요" />
								</div>
								<div class="form-group">
									<label class="small mb-1" for="inputPassword">패스워드</label>
									<input class="form-control py-4" id="pw" name="pw" type="password" placeholder="패스워드를 입력해주세요" />
								</div>
								<div
									class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<a  class="small"  href="/member/findIdView">아이디찾기</a>
									<a  class="small"  href="/member/findPwView">비밀번호 찾기</a>
									<button type="submit" class="btn btn-primary" >로그인</button>
								</div>
							</form>
						</div>
						<div class="card-footer text-center">
							<div class="small">
								<a href="/member/register">회원가입</a>
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
<script type="text/javascript">
	//registerPOST에서 날린 값으로 문구를 출력할 수 있다
	var msg = "${msg}";
	if (msg === "REGISTERED") {
		alert ("회원가입이 완료되었습니다. 로그인해주세요~")
	}else if (msg ==="FAILURE") {
		alert ("아이디와 비밀번호를 확인해주세요")
	}
</script>
<%@ include file="../include_user/user_plugin_js.jsp" %>
</body>
</html>