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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
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
					$('#idCheck').text('사용 가능한 아이디입니다.');
				} else {
					$('#idCheck').text('사용 중인 아이디입니다.');
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
					$('#nickCheck').text('사용 가능한 닉네임입니다.');
				} else {
					$('#nickCheck').text('사용 중인 닉네임입니다.');
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
					$('#emailCheck').text('사용 가능한 이메일입니다.');
				} else {
					$('#emailCheck').text('사용 중인 이메일입니다.');
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
</script>
<body>
	<form action="userRegister" method="post">
		<ul>
			<li><label for="userId">아이디</label><input type="text" name="userId" id="userId" onblur="userIdExist()">
			<span id="idCheck"></span></li>
			<li><label for="userPw">비밀번호</label><input type="password" name="userPw"></li>
			<li><label for="userPw2">비밀번호 확인</label><input type="password" name="userPw2"></li>
			<li><label for="userNickname">닉네임</label><input type="text" name="userNickname" id="userNickname" onblur="userNicknameExist()">
			<span id="nickCheck"></span></li>
			<li><label for="userEmail">이메일</label><input type="email" name="userEmail" id="userEmail" onblur="userEmailExist()">
			<span id="emailCheck"></span></li>
			<li><input type="submit" value="회원가입"></li>
		</ul>
	</form>
	<h3>
		<spring:hasBindErrors name="userVO">
			<c:if test="${errors.hasFieldErrors('userId') }">
				<strong>${erros.getFieldError('userId').defaultMessage }</strong>
			</c:if>
		</spring:hasBindErrors>
	</h3>
</body>
</html>