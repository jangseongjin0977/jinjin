<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>
<script type="text/javascript">
//스크랩 삭제 
function deleteClick(scrapId){
	var scrapDel = 'scrapForm' + scrapId;
	var formObj = $("form[name="+scrapDel+"]");
	formObj.attr("action", "/board/scrapDelete");
	formObj.attr("method", "post");
	formObj.submit();
}
</script>

<body class="sb-nav-fixed">

<%@ include file="../include/main_header.jsp" %>

<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">내 스크랩</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">내 스크랩</li>
				</ol>
				<div class="form-row">
				</div>
				<div class="mb-4">
					<div class="table-responsive">
						<table class="table table-bordered" id="" width="100%" cellspacing="0">
								<colgroup>
									<col width="5%">
									<col width="*">
									<col width="10%">
								</colgroup>
								<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${scrap}" var = "scrap" varStatus="status">
								<form name="scrapForm${scrap.scrapId}" role="form" method="post" >
									<input type="hidden" id="scrapId" name="scrapId" value="${scrap.scrapId}"> 
									<input type="hidden" id="userId" name="userId" value="${scrap.userId}"> 
								</form>
								<tr>
									<td>${status.count}</td>
									<td><a href="${scrap.scrapAd}"><c:out value="${scrap.scrapTitle}" /></a></td>
									<td><button class="btn btn-primary" type="submit" onclick="deleteClick(${scrap.scrapId})">삭제</button></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		<%@ include file="../include/main_footer.jsp" %>
	</div>
</div>

<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>