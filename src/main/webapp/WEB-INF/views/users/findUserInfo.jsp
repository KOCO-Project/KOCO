<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID & Password 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
ul {
	list-style: none;
}
input[type="email"], input[type="text"] {
	border: 1px solid gray;
	border-radius: 10px;
	width: 300px;
	margin-bottom: 10px;
}

.btn1 {
	border: 1px solid gray;
	border-radius: 10px;
	width: 140px;
	margin-right: 20px;
}
.btn2 {
	border: 1px solid gray;
	border-radius: 10px;
	margin-left: 10px;
	font-size: 13px;
}
</style>
<script>
	function findUserEmail(){
		var userEmail = $('#userEmail').val();

		$.ajax({
			url: 'userEmailExist',
			type: 'post',
			data: {
				'userEmail': userEmail
			},
			dataType: 'text',
			success: function(data){
				console.log(data);
				if(data == 1){
					alert('등록되지 않은 E-mail입니다.');
					return false;
				} else {
					//sendAuthMail();
				}
			},
			error: function(data){
				console.log('error');
			},
			failure: function(data){
				console.log('fail');
			}
		});
	}
	
	function sendAuthMail() {
		var userEmail = $('#userEmail').val();
		var code = "";
		$.ajax({
			type: 'get',
			url: 'sendAuthMail?email=' + userEmail,
			success: function(data){
				console.log(data);
			},
			error: function(data){
				console.log('error');
			},
			failure: function(data){
				console.log('fail');
				console.log(data);
			}
		});
		alert('인증번호를 발송하였습니다.');
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: left; margin-left: 100px;">
			<h6 style="margin-left: 40px">가입시 등록한 Email을 입력해주세요</h6>
			<form action="sendAuthMail" method="post">
				<ul>
					<li><input type="email" name="userEmail" id="userEmail" placeholder="E-Mail"><input type="button" value="인증번호 발송" onclick="findUserEmail()" class="btn2"></li>
					<li><input type="text" name="inputCode" id="inputCode" placeholder="인증번호 입력"></li>
					<li><input type="submit" value="Continue" class="btn1">
					<input type="button" value="Cancel" onclick="history.back()" class="btn1"></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>