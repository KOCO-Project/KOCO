<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: left; margin-left: 350px;">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${user.userId }</td>
				</tr>				
				<tr>
					<td>닉네임</td>
					<td><input type="text" value="${user.userNickname }" name="userNickname"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" value="${user.userEmail }" name="userEmail"></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${user.userRegDate }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>