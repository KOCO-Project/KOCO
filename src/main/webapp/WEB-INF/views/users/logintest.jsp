<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${user.userId}님 안녕하세요.</h1>
	<input type="button" value="마이페이지"
		onclick="location.href='mypage'">
	<a href="userLogout">로그아웃</a>
</body>
</html>