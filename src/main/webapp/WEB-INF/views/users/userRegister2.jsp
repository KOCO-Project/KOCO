<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.reg{	
	background-image: url('images/reg.png');
	background-size: 100%;
	background-repeat: no-repeat;
	height: 15rem;
	}
.reg h1{
    background: #fff;
    opacity: 90%;
    padding-bottom: 4rem;
    }
.reg h2{
text-align: center;
color: #fff;
}
.form-group ul.mail {
padding-left:inherit;
list-style:none;
display: flex;
justify-content: space-between;
}
.form-group ul.mail li {width: 100%;}
ul.btn {
padding:inherit;
list-style:none;
display: flex;
justify-content: space-evenly;
}
footer {
	text-align: center;
	padding: 3rem;
	color: #8e8c84 !important;
	background-color: #3e3f3a;
}
footer ul{
	list-style: none;
    padding-left:0px;
    display: flex;
    justify-content: space-evenly;
    width: 40%;
    margin: 1rem auto;
}

footer ul li a>img{
width: 30px; height: 30px;
}

</style>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
$(function(){
	var code = "";
	var idCheck = "";
	var pwCheck = "";
	var pwCheck2 = "";
	var nickCheck = "";
	
	$('#userId').on('blur', function userIdExist(){
		var userId = $('#userId').val();
		
		if(userId == ""){
			$('#idCheck').text('ID를 입력해주세요.');
			$('#idCheck').css('color', '#55B836');
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
				console.log(data);
				if(data == 1){					
					$('#idCheck').text('사용 가능한 ID 입니다.');
					$('#idCheck').css('color', '#55B836');
					idCheck = "true";
				} else {
					$('#idCheck').text('이미 존재하는 ID 입니다.');
					$('#idCheck').css('color', 'red');
					idCheck = "false";
				}
			},
			error: function(data){
				console.log('error');
			},
			failure: function(data){
				console.log('fail');
			}
		});
	});

	$('#userNickname').on('blur', function userNicknameExist(){
		var userNickname = $('#userNickname').val();
		
		if(userNickname == ""){
			$('#nickCheck').text('NickName을 입력해주세요.');
			$('#nickCheck').css('color', '#55B836');
			return false;
		}

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
					nickCheck = "true";
				} else {
					$('#nickCheck').text('이미 존재하는 NickName 입니다.');
					$('#nickCheck').css('color', 'red');
					nickCheck = "false";
				}
			},
			error: function(data){
				console.log('error');
			},
			failure: function(data){
				console.log('fail');
			}
		});
	});
	
	$('#userPw2').on('blur', function pwCheck(){
		var userPw = $('#userPw').val();
		var userPw2 = $('#userPw2').val();
		
		if(userPw2 == ""){
			$('#pw2Check').text('Password Check를 입력해주세요.');
			$('#pw2Check').css('color', '#55B836');
			return false;
		}
		
		if(userPw != userPw2){
			$('#pw2Check').text('Password가 일치하지 않습니다.');
			$('#pw2Check').css('color', 'red');
			pwCheck2 = "false";
		}
		
		if(userPw == userPw2){
			$('#pw2Check').text('Password가 일치합니다.');
			$('#pw2Check').css('color', '#55B836');
			pwCheck2 = "true";
		}
	});

	$('#userPw').on('blur', function pwValidator(){
		var userPw = $('#userPw').val();

		var reg1 = /[0-9]/;
    	var reg2 = /[a-zA-Z]/;
    	var reg3 = /[~!@#$%^&*]/;
    	
    	if(userPw == ""){
    		$('#pwCheck').text('비밀번호를 입력해주세요.');
    		$('#pwCheck').css('color', '#55B836');
    		return false;
    	}

		if (!reg1.test(userPw) || !reg2.test(userPw) || !reg3.test(userPw) || userPw.length < 7 || userPw.length > 50){
			$('#pwCheck').text('대문자,소문자,특수문자,숫자를 조합하여 작성해주세요.');
			$('#pwCheck').css('color', 'red');
			pwCheck = "false";						
		} else {
			$('#pwCheck').text('올바른 비밀번호 형식입니다.');
			$('#pwCheck').css('color', '#55B836');
			pwCheck = "true";
		}
	});
	
	$('#findUserEmail').on('click', function findUserEmail() {
		var userEmail = $('#userEmail').val();
		
		if(userEmail == ""){
			alert('E-mail을 입력해주세요.');
			return false;
		}

		$.ajax({
			url : 'userEmailExist',
			type : 'post',
			data : {
				'userEmail' : userEmail
			},
			dataType : 'text',
			success : function(data) {
				if (data == 0) {
					alert('이미 존재하는 E-mail입니다.');
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
		if(idCheck == "true" && pwCheck == "true" && pwCheck2 == "true" && nickCheck == "true" && code.trim() == inputCode.trim()){
			$('#form1').submit();
		} else {
			alert('회원가입 조건 또는 인증번호를 확인해주세요.');
		}
	});
});
	
</script>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />





<div class="reg"><h1></h1><br><br><br><h2>Create Your KOCO ID</h2></div>
<div class="container">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<br>
			<p>KOCO ID를 가지고 계십니까? <a class="btn cc_pointer" href="#" style="color: #29abe0">찾아보기 »</a></p>
		<br>
			<form action="userRegister" method="post" id="form1">
				<div class="form-group">
				<label for="userId" style="display: none;">Id</label>
					<input type="text" name="userId" id="userId" placeholder="ID" required="required" class="form-control">
					<span id="idCheck"></span>
				</div>
				<div class="form-group">
					<label for="userPw" style="display: none;">Password</label>
						<input type="password" name="userPw" id="userPw" placeholder="Password" required="required" class="form-control">
						<span id="pwCheck"></span>
				</div>
				<div class="form-group">
					 
					<label for="userPw2" style="display: none;">Password Check</label>
					<input type="password" name="userPw2" id="userPw2" placeholder="Password Check" required="required" class="form-control">
					<span id="pw2Check"></span>
				</div>
				<div class="form-group"> 
					<label for="userNickname" style="display: none;">Nickname</label>
					<input type="text" name="userNickname" id="userNickname" placeholder="NickName" required="required" class="form-control">
					<span id="nickCheck"></span>
				</div>
				<div class="form-group"> 
					<label for="userEmail" style="display: none;">Email</label>
					<ul class="mail">
						<li><input type="email" name="userEmail" id="userEmail" placeholder="E-Mail" class="form-control"></li>
						<li style="width: auto; margin-left: 1rem;"><input type="button" value="인증번호 발송" id="findUserEmail" class="btn btn-success"></li>	
					</ul>
				</div>
				
				<div class="form-group"> 
					<label for="inputCode" style="display: none;">Verification Code</label>
				<input type="text" name="inputCode" id="inputCode" placeholder="인증번호 입력" class="form-control">
				</div>
				<br>
				<div class="checkbox">
					<label>
						<input type="checkbox"style="margin-right: .5rem;"/>
						<a href="#" style="color: #29abe0">KOCO의 개인정보 처리방침</a>에 따라 개인 정보를 수집, 사용, 타사에 대한 제공 및 처리하는 데 동의합니다.
					</label>
				</div> 
				<br><hr><br>
				<p>KOCO ID 정보를 사용해 안전하게 계정에 로그인하고 데이터에 액세스합니다. KOCO은 보안, 지원 및 보고의 목적으로 특정 사용 데이터를 기록합니다.
				<a class="btn" href="#" style="color: #29abe0">데이터가 어떻게 관리되는지 알아보기 »</a></p><br><hr><br>
				<ul class="btn">
					<li><button type="submit" class="btn btn-primary" id="checkAuthKey" style="width:100px;">Submit</button></li>
					<li><input type="button" value="Cancel" onclick="history.back()" class="btn btn-danger" style="width:100px;"></li>
				</ul><br><br>
				</form>
			</div>	
	
		</div>
		<div class="col-md-2">
		</div>
	</div>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</body>
</html>