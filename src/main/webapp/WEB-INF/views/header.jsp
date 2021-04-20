
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- 스타일 시트 추가 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
</style>
<div id="head">
	<div id="header">
		<div id="logo">
			<a href="/">로고(메인으로)</a>
		</div>
		<div class="top_menu">
			<ul>
				<c:if test="${not empty login}">
					<li><span class="f_point">${login.userId}님 로그인</span></li>
					<li><a href="/member/userModifyView">회원정보수정</a></li>
					<li><a href="/member/logout">로그아웃</a></li>
					<li><a href="/member/userBlockView">회원탈퇴</a></li>
				</c:if>
				<c:if test="${empty login}">
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/register">회원가입</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<div id="nav">
		<ul>
			<li><a href="/movie_info/movielist">영화 소개 게시판</a></li>
			<li><a href="/board/list">리뷰 게시판</a></li>
			<li><a href="#">마이페이지</a></li>
		</ul>
	</div>
</div>



