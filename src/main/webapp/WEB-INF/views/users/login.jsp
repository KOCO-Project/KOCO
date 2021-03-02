<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
ul {
	list-style: none;
}
input {
	border: 1px solid gray;
	border-radius: 10px;
	width: 300px;
	margin-bottom: 10px;
}
.user{
	margin-left: 40px;
	text-decoration: none;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: left; margin-left: 350px;">
			<h5 style="margin-left: 40px">KOCO sign in.</h5>
				<form action="userLogin" method="post">
					<ul>
						<li><input type="text" name="userId" placeholder="ID"></li>
						<li><input type="password" name="userPw" placeholder="Password"></li>
						<li><input type="submit" value="Sign In" class="btn btn-primary"></li>
					</ul>
				</form>
			<a href="findUserInfo" class="user">ID 혹은 Password가 기억이 안나십니까?</a><br>
			<a href="registerView" class="user">아직 KOCO회원이 아니십니까?</a>	
		</div>
	</div>
</body>
</html>