<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
.user{
	text-decoration: none;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	<form action="userLogin" method="post">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-top: 150px;">
					<div class="row">
						<div class="col-md-12" style="height: 60px;">
							<h3>KOCO sign in.</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" style="height: 60px;">
							<input type="text" name="userId" placeholder="ID" required="required" style="width: 80%; height: 50px;">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12" style="height: 60px;">
							<input type="password" name="userPw" placeholder="Password" required="required" style="width: 80%; height: 50px;">
						</div>
					</div>
					<div class="row">
						<div class="col-md-5">
							<input type="submit" value="Sign In" class="btn btn-success" style="width:100px;">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
							<a href="findUserInfo" class="user">ID 혹은 Password가 기억이 안나십니까?</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">					
							<a href="registerView" class="user">아직 KOCO회원이 아니십니까?</a>
						</div>
					</div>	
				</div>
		</div>
	</div>
	</form>
</body>
</html>