<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: center;">
			<h2>${user.userNickname }</h2><br>
			<input type="button" value="개인정보수정" class="btn btn-primary"><br><br>
			<strong>팔로워</strong>&emsp;&emsp;&emsp;&emsp;&emsp;<strong>팔로우</strong>
<!-- 			<table border="1"> -->
<!-- 				<tr> -->
<!-- 					<td>아이디</td> -->
<%-- 					<td>${user.userId }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>비밀번호</td> -->
<%-- 					<td>${user.userPw }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>닉네임</td> -->
<%-- 					<td>${user.userNickname }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>이메일</td> -->
<%-- 					<td>${user.userEmail }</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>가입일</td> -->
<%-- 					<td>${user.userRegDate }</td> --%>
<!-- 				</tr> -->
<!-- 			</table> -->
		</div>
	</div>
</body>
</html>