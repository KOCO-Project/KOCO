<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
input#userEmail.form-control {width: 60%;display: initial;}
input#inputCode.form-control {width: 90%;}
input#findUserEmail.btn.btn-primary {width: 30%}
form {width: 30%;}
.jb-wrap {position: relative;}
.jb-wrap img {width: 100%;vertical-align: middle;}
.jb-text {position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);color: white;z-index: 20;letter-spacing: 10px;}
img {height: 200px;}
legend {font-weight: bold;font-size: 2rem;}
.seopBody{height: 17rem;margin-top: 5%;margin-bottom: 5%;  min-height 860px;}
</style>
<meta charset="UTF-8">
<title>ID & Password 찾기</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
			if (code.trim() == inputCode.trim()) {
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

	<div class="jb-wrap">
		<div class="jb-image">
			<img src="images/mailBackImage.png" />
		</div>
		<div class="jb-text">
			<legend>KOCO ID & PW 찾기</legend>
		</div>
	</div>

	<div class="seopBody">
		<div style="text-align: -webkit-center;">
			<form id="form1" action="findIdPwd">
				<fieldset>
					<div class="form-group">
						<div>
							<div class="seopTest">
								<input type="email" class="form-control" id="userEmail"
									aria-describedby="emailHelp" placeholder="E-Mail"
									name="userEmail"> <input type="button" value="인증번호 발송"
									id="findUserEmail" class="btn btn-primary">
							</div>
							<small id="emailHelp" class="form-text text-muted">We'll
								never share your email with anyone else.</small>
						</div>
					</div>
					<br>
					<div class="form-group">
						<input type="text" name="inputCode" class="form-control"
							id="inputCode" placeholder="인증번호 입력"> <br> <br>
						<input type="button" value="Continue" class="btn btn-primary"
							id="checkAuthKey"> <input type="button" value="Cancel"
							onclick="history.back()" class="btn btn-danger">
					</div>
				</fieldset>
			</form>
		</div>
	</div>
<br><br><br>

</body>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</html>