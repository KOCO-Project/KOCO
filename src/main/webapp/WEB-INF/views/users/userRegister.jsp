<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
ul {
	list-style: none;
}
input[type="text"], input[type="password"], input[type="email"] {
	border: 1px solid gray;
	border-radius: 10px;
	width: 300px;
	margin-bottom: 10px;
}
input[type="submit"], input[type="button"] {
/* 	border: 1px solid gray; */
/* 	border-radius: 10px; */
	width: 140px;
	margin-right: 20px; 
}
</style>
<script>
	function userIdExist(){
		var userId = $('#userId').val();
		
		$.ajax({
			url: 'userIdExist',
			type: 'post',
			data: {
				'userId': userId
			},
			dataType: 'text',
			success: function(data){
				console.log(data);
				if(data == 1){					
					$('#idCheck').text('사용 가능한 ID 입니다.');
					$('#idCheck').css('color', '#55B836');
				} else {
					$('#idCheck').text('이미 존재하는 ID 입니다.');
					$('#idCheck').css('color', 'red');
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

	function userNicknameExist(){
		var userNickname = $('#userNickname').val();
		console.log(userNickname);

		$.ajax({
			url: 'userNicknameExist',
			type: 'post',
			data: {
				'userNickname': userNickname
			},
			dataType: 'text',
			success: function(data){
				console.log(data);
				if(data == 1){
					$('#nickCheck').text('사용 가능한 NickName 입니다.');
					$('#nickCheck').css('color', '#55B836');
				} else {
					$('#nickCheck').text('이미 존재하는 NickName 입니다.');
					$('#nickCheck').css('color', 'red');
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

	function userEmailExist(){
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
					$('#emailCheck').text('사용 가능한 E-Mail 입니다.');
					$('#emailCheck').css('color', '#55B836');
				} else {
					$('#emailCheck').text('이미 존재하는 E-Mail 입니다.');
					$('#emailCheck').css('color', 'red');
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
	
	function pwCheck(){
		var userPw = $('#userPw').val();
		var userPw2 = $('#userPw2').val();		
		
		if(userPw != userPw2){
			$('#pw2Check').text('Password가 일치하지 않습니다.');
			$('#pw2Check').css('color', 'red');
		}
		
		if(userPw == userPw2){
			$('#pw2Check').text('Password가 일치합니다.');
			$('#pw2Check').css('color', '#55B836');
		}
	}

	function pwValidator(){
		var userPw = $('#userPw').val();

		var reg1 = /[0-9]/;
    	var reg2 = /[a-zA-Z]/;
    	var reg3 = /[~!@#$%^&*]/;

		if (!reg1.test(userPw) || !reg2.test(userPw) || !reg3.test(userPw) || userPw.length < 7 || userPw.length > 50){
			$('#pwCheck').text('대문자,소문자,특수문자,숫자를 조합하여 작성해주세요.');
			$('#pwCheck').css('color', 'red');
			$('#userPw').focus();							
		} else {
			$('#pwCheck').text('올바른 비밀번호 형식입니다.');
			$('#pwCheck').css('color', '#55B836');
		}
	}
</script>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: left; margin-left: 350px;">
		<h5 style="margin-left: 40px">Create Your KOCO ID.</h5>
			<form action="userRegister" method="post">
				<ul>
					<li><input type="text" name="userId" id="userId" onblur="userIdExist()" placeholder="ID">
					<span id="idCheck"></span></li>
					<li><input type="password" name="userPw" id="userPw" placeholder="Password" onblur="pwValidator()">
					<span id="pwCheck"></span></li>
					<li><input type="password" name="userPw2" id="userPw2" placeholder="Password Check" onblur="pwCheck()">
					<span id="pw2Check"></span></li>
					<li><input type="email" name="userEmail" id="userEmail" onblur="userEmailExist()" placeholder="E-Mail">
					<span id="emailCheck"></span></li>
					<li><input type="text" name="userNickname" id="userNickname" onblur="userNicknameExist()" placeholder="NickName">
					<span id="nickCheck"></span></li>					
					<li><input type="submit" value="회원가입" class="btn btn-primary"><input type="button" value="Cancel" onclick="history.back()" class="btn btn-primary"></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>