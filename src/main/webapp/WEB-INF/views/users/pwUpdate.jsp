<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
$(function(){
	var currentCheck = "";
	var newCheck = "";
	var newCheck2 = "";
	var userPw = $('#userPw').val();
	
	$('#currentPw').on('blur', function pwCheck(){
		var currentPw = $('#currentPw').val();
		
		console.log(userPw);
		
		if(currentPw != userPw){
			$('#pwCheck').text('현재 비밀번호가 일치하지 않습니다.');
			$('#pwCheck').css('color', 'red');
			currentCheck = "false";
		} else {
			$('#pwCheck').text('현재 비밀번호가 일치합니다.');
			$('#pwCheck').css('color', '#55B836');
			currentCheck = "true";
		}
	});
	
	$('#newPw').on('blur', function pwValidator(){
		var newPw = $('#newPw').val();

		var reg1 = /[0-9]/;
    	var reg2 = /[a-zA-Z]/;
    	var reg3 = /[~!@#$%^&*]/;
    	
    	if(newPw == ""){
    		$('#newPwCheck').text('비밀번호를 입력해주세요.');
    		$('#newPwCheck').css('color', '#55B836');
    		return false;
    	}

		if (!reg1.test(newPw) || !reg2.test(newPw) || !reg3.test(newPw) || newPw.length < 7 || newPw.length > 50){
			$('#newPwCheck').text('대문자,소문자,특수문자,숫자를 조합하여 작성해주세요.');
			$('#newPwCheck').css('color', 'red');
			newCheck = "false";						
		} else {
			$('#newPwCheck').text('올바른 비밀번호 형식입니다.');
			$('#newPwCheck').css('color', '#55B836');
			newCheck = "true";
		}
	});
	
	$('#newPw2').on('blur', function pwCheck(){
		var newPw = $('#newPw').val();
		var newPw2 = $('#newPw2').val();
		
		if(newPw2 == ""){
			$('#newPwCheck2').text('Password Check를 입력해주세요.');
			$('#newPwCheck2').css('color', '#55B836');
			return false;
		}
		
		if(newPw != newPw2){
			$('#newPwCheck2').text('Password가 일치하지 않습니다.');
			$('#newPwCheck2').css('color', 'red');
			newCheck2 = "false";
		}
		
		if(newPw == newPw2){
			$('#newPwCheck2').text('Password가 일치합니다.');
			$('#newPwCheck2').css('color', '#55B836');
			newCheck2 = "true";
		}
	});
	
	$('#pwUpdate').on('click', function pwUpdate(){
		if(currentCheck == "true" && newCheck == "true" && newCheck2 == "true"){
			$('#form1').submit();
			alert('수정되었습니다. 로그아웃 됩니다.');
		} else {
			alert('현재 비밀번호 또는 새 비밀번호를 확인해주세요.');
		}
	});
});
</script>
<body>
   <c:import url="/WEB-INF/views/include/top_menu.jsp" />
   <form action="pwUpdate" method="post" id="form1">
   <input type="hidden" value="${user.userId }" name="userId">
   <input type="hidden" value="${user.userPw }" id="userPw">
   <div class="container">
      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-8" style="margin-top: 150px;">
            <div class="row">
               <div class="col-md-6" style="height: 60px;">
                  <a href="userUpdateView" class="btn btn-success" style="float: right;">개인정보 변경</a>
               </div>
               <div class="col-md-6">
                  <a href="pwUpdateView" class="btn btn-success">비밀번호 변경</a>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <h3 style="text-align: center;">비밀번호 변경</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="password" name="currentPw" id="currentPw" placeholder="현재 비밀번호" required="required" style="width: 100%; height: 50px;"><br>
                  <span id="pwCheck" style="font-size:11px"></span>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="password" name="newPw" id="newPw" placeholder="새 비밀번호" required="required" style="width: 100%; height: 50px;"><br>
                  <span id="newPwCheck" style="font-size:11px"></span>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="password" id="newPw2" placeholder="새 비밀번호 확인" required="required" style="width: 100%; height: 50px;">
                  <span id="newPwCheck2" style="font-size:11px"></span>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-6">
                  <button type="button" id="pwUpdate" class="btn btn-success" style="float: right;">수정</button>
               </div>
               <div class="col-md-6">
                  <button type="button" class="btn btn-success">취소</button>
               </div>
            </div>
         </div>
         <div class="col-md-2"></div>
      </div>
   </div>
   </form>
</body>
</html>