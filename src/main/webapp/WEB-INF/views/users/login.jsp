<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.help-block a{
color: #325d88;
}
.row {
	background-image: url('images/bg1.jpg');
	background-size: 100%;
	background-repeat: no-repeat;
}
</style>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
$(function(){
	$('#login').on('click', function login(){
		var userId = $('#userId').val();
		var userPw = $('#userPw').val();
		
		if(userId == ""){
			alert('ID를 입력해주세요.');
			return false;
		}
		
		if(userPw == ""){
			alert('Password를 입력해주세요.');
			return false;
		}
		
		$.ajax({
			url: 'userIdExist',
			type: 'post',
			data: {
				'userId': userId
			},
			dataType: 'text',
			success: function(data){
				if(data == 1){
					alert('ID 또는 Password가 일치하지 않습니다.');
					return false;
				} else {
					$('#form1').submit();
				}
			}
		});
	});
});
</script>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="row" style="height: 100%;">
		<div class="col-md-6" style="background-color: #fff;padding: 5rem 5rem 5rem 10rem;">
				<div class="row" style="background: #fff;">
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<h2>Sign In KOCO</h2><br><br>
				<form action="userLogin" method="post" id="form1">
				<div class="form-group">
					<label for="userId" style="display: none;">userId</label>
					<input type="text" name="userId" id="userId" placeholder="ID" required="required" class="form-control">
				</div>
				<div class="form-group">
					<label for="userPw"style="display: none;">Password</label>
					<input type="password" name="userPw" id="userPw" placeholder="Password"	required="required" class="form-control">
				</div><br><br>
					<p class="help-block">
						<a href="findUserInfo" class="user">ID 혹은 Password가 기억이 안나십니까?</a><br>
						<a href="registerView" class="user">아직 KOCO회원이 아니십니까?</a>
					</p><br><br>
					<input type="submit" value="Sign In" id="login" class="btn btn-success" style="width: 100%;">
			</form>
		</div>
		</div>
		</div>
		<div class="col-md-6">
		</div>
	</div>

<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</footer>
</body>
</html>