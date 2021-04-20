<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.name{
  width        : 300px;     /* 너비는 변경될수 있습니다. */
  text-overflow: ellipsis;  /* 위에 설정한 300px 보다 길면 말줄임표처럼 표시합니다. */
  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
  overflow     : hidden;    /* 내용이 길면 감춤니다 */
  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
}
</style>
<body>
<%@ include file="../include/head.jsp" %>

<body class="sb-nav-fixed sb-sidenav-toggled">

<%@ include file="../include/main_header.jsp" %>

<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	<div id="layoutSidenav_content">
		<main>
		<div class="container-fluid">
			<!-- 타이틀 -->
			<h1 class="mt-4">영화소개</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/movie_info/movielist">영화소개</a></li>
				<li class="breadcrumb-item active">영화소개</li>
			</ol>
			<!-- 타이틀 끝 -->
			<!-- 버튼 & 페이지 -->
			<div class="form-row">
				<div class="col-md-6">
					<div class="form-group">
						페이지: ${pageMaker.cri.page} / ${pageMaker.endPage}&nbsp;&nbsp;
						총 게시물: ${pageMaker.totalCount}
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group float-right">
				<c:if test="${login != null}">
						<a class="btn btn-primary"  href="/movie_info/writeView">글 작성</a>
				</c:if>
				
					</div>
				</div>
			</div>
			<!-- 버튼 & 페이지 끝-->
			<!-- 리스트 폼 -->
			<form role="form" method="get">
				<table class='table table-striped'>
					<thead>
						<tr>
							<th>썸네일</th>
							<th>장르</th>
							<th>작성자</th>
							<th>영화제목</th>
							<th>영화 내용</th>
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${movielist}" var="movielist">
						<tr>
							<td><img src="${movielist.img}"/> </td>
							<td><c:out value="${movielist.category_id}" /></td>
							<td><c:out value="${movielist.user_id}" /></td>
							<td>
								<a href="/movie_info/readView?movie_id=${movielist.movie_id}">
									<c:out value="${movielist.movie_title}" />
								</a>
							</td>
							<td><div class="name"><c:out value="${movielist.movie_content}" /></div></td>
							<td><fmt:formatDate value="${movielist.movie_date}" pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${movielist.movie_views}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			<!-- 리스트 폼 끝 -->
			<!-- 검색 & 페이징 -->
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<!-- 검색 시작 -->
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="search">
							<select class="custom-select float-left mr-1" name="searchType" style="display:inline-block; width:30%;">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
							<div class="input-group float-left" style="width:50%;">
									<input class="form-control form-control-sm"  type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2" />
									<div class="input-group-append">
										<button class="btn btn-primary" id="searchBtn"  type="button">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
	
							<script>
							$(function(){
								$('#searchBtn').click(function() {
									self.location = "movielist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								});
							}); 
							</script>
						</div>
					</div>
					<!-- 검색 끝 -->
					<!-- 페이징 시작 -->
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button page-item previous" id="dataTable_previous">
										<a href="movielist${pageMaker.makeQuery(pageMaker.startPage - 1)}" aria-controls="dataTable" data-dt-idx="${pageMaker.startPage}" tabindex="0" class="page-link">
											<i class="fas fa-angle-double-left"></i>
										</a>
									</li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<c:choose>
										<c:when test="${pageMaker.cri.page == idx}">
											<li class="paginate_button page-item active">
												<a href="movielist${pageMaker.makeQuery(idx)}" aria-controls="dataTable" tabindex="0" data-dt-idx="${idx}" class="page-link">${idx}</a>
											</li>
										</c:when>
										<c:when test="${pageMaker.cri.page != idx}">
											<li class="paginate_button page-item">
												<a href="movielist${pageMaker.makeQuery(idx)}" aria-controls="dataTable" tabindex="0" data-dt-idx="${idx}" class="page-link">${idx}</a>
											</li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="paginate_button page-item next" id="dataTable_next">
										<a href="movielist${pageMaker.makeQuery(pageMaker.endPage + 1)}" aria-controls="dataTable" data-dt-idx="${pageMaker.endPage}" tabindex="0"  class="page-link" onclick="addClassName()">
											<i class="fas fa-angle-double-right"></i>
										</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- 페이징 끝 -->
				</div>
			<!-- 검색 & 페이징 끝 -->
			</div>
		</div>
		</main>
	<%@ include file="../include/main_footer.jsp" %>
	</div>
</div>
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>
