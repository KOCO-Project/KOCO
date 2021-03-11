<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.reg{	
	background-image: url('images/reg.png');
	background-size: 100%;
	background-repeat: no-repeat;
	height: 10rem;
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
.mypage{height: 100%; text-align: center;}
.mypage #info{height: 100%;position: relative;width:100%;height:33rem ;}
.row{background-color: #fff;padding: 5rem;height: 10rem;}
ul{list-style: none;padding-left: 0px;}
ul li{line-height: 3rem;}
ul.infoform{list-style: none;display: flex;}
#info ul li{line-height: inherit;}
</style>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css?v=1">
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
   <div class="reg"><br><br><br><h2>Change Your Password</h2></div>
   <div class="mypage">
   		<div id="info">
   			<div class="row">
   				<div class="col-md-3 cc_cursor" style="height: 100%;"></div>
					<div class="col-md-6 cc_cursor" style="height: 100%;">
   					<form action="pwUpdate" method="post" id="form1" style="margin-top: 1rem;">
   					<input type="hidden" value="${user.userId }" name="userId">
   					<input type="hidden" value="${user.userPw }" id="userPw">
   						<div class="form-group">
   							<label for="">현재 비밀번호</label>
   							<ul class="infoform">
   							<li style="width: 100%;"><input type="password" class="form-control" id="currentPw" name="currentPw" style="text-align: center;"/>
   							<span id="pwCheck" style="font-size:11px"></span></li>
							</ul>
						</div>
						<div class="form-group">
							<label for="">새 비밀번호</label>
							<ul class="infoform">
   							<li style="width: 100%;"><input type="password" class="form-control" id="newPw" name="newPw" style="text-align: center;"/>
   							<span id="newPwCheck" style="font-size:11px"></span></li>
							</ul>
						</div>
						<div class="form-group">
							<label for="">새 비밀번호</label>
							<ul class="infoform">
   							<li style="width: 100%;"><input type="password" class="form-control" id="newPw2" style="text-align: center;"/>
   							<span id="newPwCheck2" style="font-size:11px"></span></li>
							</ul>
						</div>
						<button type="button" class="btn btn-primary" id="pwUpdate" style="width: 100px;">Submit</button>
						<button type="button" class="btn btn-primary" style="width: 100px;" onclick="history.back()">Cancel</button>
					</form>
         			</div>
         			<div class="col-md-3 cc_cursor"></div>
      		</div>
   		</div>
	</div>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</body>
</html>