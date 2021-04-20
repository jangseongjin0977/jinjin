<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp"%>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">찾은 아이디 확인</h3>
								</div>
								<div class="card-body">
									찾은 아이디: ${findId}
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="/member/login">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp; 
										<a href="/member/findPwView">비밀번호 찾기</a>
									</div>
								</div>
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