<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Title</title>
		
	</head>

	<body>
		<p>Read Scraps</p>
		

		<ol>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="item">
						<li>
						[scrap_Id] ${item.scrap_Id}, [scrap_Title] ${item.scrap_Title}, [user_Id] ${item.user_Id}, [scrap_Address] ${item.scrap_Address} 
						<a href="/scrap/mod/?scrap_Title=${item.scrap_Title}">수정</a> <a href="/scrap/del/?scrap_Title=${item.scrap_Title}">삭제</a>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					scrap: 0
				</c:otherwise>
			</c:choose>
			
		<ol>
		
		</br>
		<a href="/scrap/reg">신규등록</a>
	</body>
	
</html>
	