<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="/scrap/write" method="post">
			<c:if test="${login.userId != null}">
		
			<tr>
				<td >스크랩제목 </td>
				<td> <input type="text" name="scrap_Title" size = "50" > </td>
			</tr>
			<tr>
				<td> 스크랩주소 </td>
				<td> <input type="text" name="scrap_Address" size = "50"> </td>
			</tr>
			<tr>
				<td> 아이디 </td>
				<td> <input type="text" name="user_Id" size = "50" value="${login.userId}"> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="스크랩하기"> &nbsp;&nbsp; <a href="list">스크랩 목록</a></td>
			</tr>
			</c:if>
		</form>
</table>
</body>
</html>