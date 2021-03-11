<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.test {
height: 100%;
width: 100%;
}

form{
text-align: -webkit-center;
}

label{
float: left;
}

small{
float: left;
}

fieldset{
width: 50%;
}

div.form-group{
margin-bottom : 3rem;
}

legend{
 font-weight: bold;
}

html body form{
line-height: 2;
}
</style>
<meta charset="UTF-8">
<title>문의 메일</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<br><br>
	<form action="supportMail" method="post">
		<fieldset>
			<legend>KOCO 이메일 문의</legend>
			<br><br>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> 
				<input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${user.userEmail}" readonly="readonly"> 
				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>

			<div class="form-group">
				<label for="exampleSelect1">Example select</label> 
				<select class="form-control" id="exampleSelect1" name="example">
					<option>홈페이지 관련 문의</option>
					<option>관리자 관련 문의</option>
					<option>회원 문의</option>
					<option>광고 문의</option>
					<option>연락처 문의</option>
					<option>기타</option>
				</select>
			</div>

			<div class="form-group">
				<label for="exampleTextarea">text</label>
				<textarea class="form-control" id="exampleTextarea" rows="11" required="required" name="content"></textarea>
			</div>

			<button type="submit" class="btn btn-primary">메일 보내기</button>
			<a href="main" class="btn btn-danger">취소</a>
		</fieldset>
	</form>
	<br><br><br>

	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>