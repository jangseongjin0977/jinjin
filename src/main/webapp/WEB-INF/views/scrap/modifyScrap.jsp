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
		<p>Modify Scrap</p>
		
		<form action="/scrap/modCon.do?no=${b.scrap_Id}" method="get">
			scrap_Id: ${b.scrap_Id}</br>
			scrap_Title: <input type="text" name="scrap_Title" value=${b.scrap_Title}></br>
			Address : ${b.scrap_Address}</br>
			user_Id : ${b.user_Id}</br>
			<input type="hidden" name="user_Id" value=${b.user_Id}></br>
			
			<input type="submit" value="Modify">
		</form>

	</body>
	
</html>