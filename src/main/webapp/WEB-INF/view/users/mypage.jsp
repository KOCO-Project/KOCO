<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<h2>마이페이지</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${user.USER_ID }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${user.USER_PW }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${user.USER_NICKNAME }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${user.USER_EMAIL }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${user.USER_REGDATE }</td>
		</tr>
	</table>
</body>
</html>