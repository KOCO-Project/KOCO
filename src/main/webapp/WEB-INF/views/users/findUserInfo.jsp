<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID & Password 찾기</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	$(function() {
		var code = "";
		
		$('#findUserEmail').on('click', function findUserEmail() {
			var userEmail = $('#userEmail').val();

			$.ajax({
				url : 'userEmailExist',
				type : 'post',
				data : {
					'userEmail' : userEmail
				},
				dataType : 'text',
				success : function(data) {
					if (data == 1) {
						alert('등록되지 않은 E-mail입니다.');
						return false;
					} else {
						sendAuthMail();
					}
				},
				error : function(data) {
					console.log('error');
				},
				failure : function(data) {
					console.log('fail');
				}
			});
		});		
		
		function sendAuthMail() {
			var userEmail = $('#userEmail').val();
			
			$.ajax({
				type : 'post',
				url : 'sendAuthMail',
				data : {
					'userEmail' : userEmail
				},
				dataType : 'text',
				success : function(data) {
					alert('인증번호를 발송하였습니다.');
					code = data;
				},
				error : function(data) {
					alert('발송이 실패하였습니다.');
				},
				failure : function(data) {
					alert('발송이 실패하였습니다.');
				}
			});
		}
		
		$('#checkAuthKey').on('click', function checkAuthKey() {
			//var userEmail = $('#userEmail').val();
			var inputCode = $('#inputCode').val();
			//console.log(code);
			//console.log(inputCode);
			if(code.trim() == inputCode.trim()){
				$('#form1').submit();
			} else {
				alert('인증번호가 일치하지 않습니다.');
			}
		});
		
	});
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<form id="form1" action="findIdPwd">
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-top: 150px;">
					<div class="row">
						<div class="col-md-12" style="height: 60px;">							
							<h3>가입시 등록한 Email을 입력해주세요</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" style="height: 60px;">
							<input type="email" name="userEmail" id="userEmail"	placeholder="E-Mail" required="required" style="width: 65%; height: 50px;">&emsp;
							<input type="button" value="인증번호 발송" id="findUserEmail" style="width: 130px; height: 45px;" class="btn btn-success">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12" style="height: 60px;">	
							<input type="text" name="inputCode" id="inputCode" placeholder="인증번호 입력" style="width: 80%; height: 50px;">
						</div>
					</div>
					<div class="row">
						<div class="col-md-5">
							<input type="button" value="Continue" class="btn btn-success" id="checkAuthKey" style="float: right; width:100px;">
						</div>
						<div class="col-md-5">
							<input type="button" value="Cancel" onclick="history.back()" class="btn btn-success" style="width:100px;">
						</div>
					</div>			
				</div>
		</div>
	</div>
	</form>
</body>
</html>