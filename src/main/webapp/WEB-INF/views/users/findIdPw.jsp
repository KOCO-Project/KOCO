<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.jb-wrap {position: relative;}
.jb-wrap img {width: 100%;vertical-align: middle;}
.jb-text {position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);color: white;z-index: 20;letter-spacing: 10px;}
img {height: 200px;}
legend {font-weight: bold;font-size: 2rem;}
div.jumbotron{background-color:white; text-align: -webkit-center;}
h1.display-3{font-size: 2rem; font-weight: bold;}
.seopBody{width: 70%}
</style>
<meta charset="UTF-8">
<title>ID & Password</title>
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

	<div class="jumbotron">
		<div class="seopBody">
			<h1 class="display-3">"${findUser.userNickname}" 님의 로그인 정보 입니다.</h1>
			<hr class="my-4">
			<p>아이디: ${findUser.userId }</p>
			<p>비밀번호:${findUser.userPw }</p>
			<br>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="main" role="button">HOME</a>
			</p>
		</div>
	</div>

</body>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</html>