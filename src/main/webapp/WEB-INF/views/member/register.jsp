<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<%@ include file="../include/head.jsp" %>
<script type="text/javascript">
//이메일전송 인증번호 저장위한 코드
var code = "";

$(document).ready(function(){
	//회원가입 버튼 클릭시 이벤트 발생
	$("#submit").on("click", function(){
		//비밀번호 정규식
		var pwExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
		if( !pwExp.test( $("input[name=pw]").val() ) ) {
			 alert("비밀번호는 8 ~ 10자 이상 영문, 숫자를 조합해야 합니다");
			return false;
		}
		//비밀번호 확인
		var p1 = document.getElementById('pw').value;
		var p2 = document.getElementById('pw2').value;
		if (p1 != p2) {
			alert("비밀번호가 일치 하지 않습니다");
			return false;
		}
		//공백문자 방지
		if($("#userId").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		if($("#email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
	});
})

//아이디 중복체크
function fn_idChk(){
	//아이디 정규식
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	if( !idReg.test( $("input[name=userId]").val() ) ) {
		 alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		return false;
	}
	//아이디 중복체크
	$.ajax({
		url : "/member/idChk",
		type : "post",
		dataType : "json",
		data : {"userId" : $("#userId").val()},
		success : function(data){
			if(data == 1){
				$(".result .msg").text("중복된 아이디입니다.");
				$(".result .msg").attr("style", "color:#f00");
				$("#submit").attr("disabled", "disabled");
			}else if(data == 0){
				$(".result .msg").text("사용가능한 아이디입니다.");
				$(".result .msg").attr("style", "color:#00f");
				$("#submit").removeAttr("disabled");
			}
		}
	})
}

//이메일 중복체크
function fn_EChk(){
	//이메일 정규식
	var emailExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if( !emailExp.test( $("input[name=email]").val() ) ) {
		 alert("이메일 형식이 맞지 않습니다");
		return false;
	}
	//이메일 중복체크
	$.ajax({
		url : "/member/findEmail",
		type : "post",
		dataType : "json",
		data : {"email" : $("#email").val()},
		success : function(data){
			if(data == 1){
				$(".result .msg_email").text("이미 등록된 이메일 입니다");
				$(".result .msg_email").attr("style", "color:#f00");
				$("#mc_btn").attr("disabled", "disabled");
			}else if(data == 0){
				$(".result .msg_email").text("사용가능한 이메일 입니다");
				$(".result .msg").attr("style", "color:#00f");
				$("#mc_btn").removeAttr("disabled");
			}
		}
	})
	
}

//중복확인 없이 아이디 변경시 회원가입 비활성화
function keyebent(){
	const target = document.getElementById('submit');
	target.disabled = true;
	$(".result .msg").text("아이디 중복확인을 해주세요");
	$(".result .msg").attr("style", "color:#f00");
}


/* 인증번호 이메일 전송 */
function mailClick(){
	//공백방지
	if($("#email").val()==""){
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return false;
	}

	var email = $("#email").val(); //입력한 이메일
	var cehckBox = $(".mail_check_input"); // 인증번호 입력란

	$.ajax({
		type:"GET",
		url:"mailCheck?email=" + email,
		success:function(data){
			cehckBox.attr("disabled",false);
			code = data;
		}
	});
}
/* 인증번호 비교 */
function onblur_event(){
	var inputCode = $(".mail_check_input").val(); // 입력코드
	var checkResult = $("#mail_check_input_box_warn"); // 비교 결과
	
	if(inputCode == code){
		checkResult.html("인증번호가 일치합니다.");
		checkResult.attr("class", "correct");
		const target = document.getElementById('submit');
		target.disabled = false;
	} else {
		checkResult.html("인증번호를 다시 확인해주세요");
		checkResult.attr("class", "incorrect");
		const target = document.getElementById('submit');
		target.disabled = true;
	}
};
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
							<form action="/member/register" method="post" id="regForm">
								<div class="form-row">
									<div class="col-md-8">
										<div class="form-group"> 
											<input class="form-control py-4" id="userId"  name="userId" type="text" onchange="keyebent()" placeholder="아이디" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<button class="idChk btn btn-primary btn-block py-2" type="button" id="idChk" onclick="fn_idChk()" >중복확인</button>
										</div>
									</div>
								</div>
								<div class="form-group result">
									<span class="msg">아이디를 확인해주세요</span>
								</div>
								<div class="form-row">
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control py-4" id="pw" name="pw" type="password" placeholder="패스워드" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control py-4"  id="pw2" name="pw2" type="password" placeholder="패스워드 확인" />
										</div>
									</div>
								</div>
								<div class="form-row">
									<div class="col-md-8">
										<div class="form-group"> 
											<input class="form-control py-4" id="email" name="email"  type="text" placeholder="이메일" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<button class="idChk btn btn-primary btn-block py-2" type="button" id="fn_emailChk" onclick="fn_EChk()">이메일 사용확인</button>
										</div>
									</div>
								</div>
								<div class="form-group result">
									<span class="msg_email">이메일 인증을 해주세요</span>
								</div>
								<div class="form-row">
									<div class="col-md-8">
										<div class="form-group"> 
											<input type="text" class="mail_check_input form-control py-4" disabled="disabled" onblur="onblur_event()" placeholder="인증번호 입력" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<button class="mail_check_button btn btn-primary btn-block py-2" id="mc_btn" type="button" onclick="mailClick()" disabled="disabled">인증번호 전송</button>
										</div>
									</div>
								</div>
								<div class="form-group">
									<span id="mail_check_input_box_warn">인증번호를 확인해주세요</span>
								</div>
								<div class="form-group mt-4 mb-0">
									<button class="btn btn-primary btn-block"  type="submit" id="submit" disabled="disabled">회원가입</button>
								</div>
							</form>
						</div>
						<div class="card-footer text-center">
							<div class="small">
								<a href="/member/login">로그인</a>
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