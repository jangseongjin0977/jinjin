<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Title</title>
		
	</head>

	<body>
		<p>Register Scrap</p>
		
		<form action="/scrap/regCon" method="get">
			scrap_Id : <input type="text" name="scrap_Id"></br>
			scrap_Title : <input type="text" name="scrap_Title"></br>
			Address : ${b.scrap_Address}</br>
			user_Id : <input type="text" name="user_Id"></br>
			<input type="submit" value="Register">
		</form>
	</body>
	
</html>
	