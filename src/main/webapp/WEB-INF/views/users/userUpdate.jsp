<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPagePwTest</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
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
</script>
<body>
   <c:import url="/WEB-INF/views/include/top_menu.jsp" />
   <fmt:formatDate value="${user.userRegDate }" pattern="yyyy-MM-dd" var="userDate"></fmt:formatDate>
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
                  <h3 style="text-align: center;">"${user.userNickname }" 님의 회원정보입니다.</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <label style="font-size: 10px; color:gray; margin-left:50px;">*아이디는 변경이 불가합니다.</label><br>
                  <label>아이디</label>
                  <input type="text" name="userId" value="${user.userId }" readonly style="width: 80%; height: 50px;">
               </div>
            </div>
            <br>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
               	  <label>닉네임</label>
                  <input type="text" value="${user.userNickname }" id="userNickname" style="width: 80%; height: 50px;" onblur="userNicknameExist()"><br>
                  <span id="nickCheck" style="margin-left:50px; font-size:11px"></span>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
               	  <label>이메일</label>
                  <input type="email" value="${user.userEmail }" id="userEmail" style="width: 80%; height: 50px;" onblur="userEmailExist()"><br>
                  <span id="emailCheck" style="margin-left:50px; font-size:11px"></span>
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12">
               	  <label>가입일</label>
                  <input type="text" value="${userDate }" readonly style="width: 80%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-6">
                  <button type="button" class="btn btn-success" style="float: right;">수정</button>
               </div>
               <div class="col-md-6">
                  <button type="button" class="btn btn-success">취소</button>
               </div>
            </div>
         </div>
         <div class="col-md-2"></div>
      </div>
   </div>
</body>
</html>