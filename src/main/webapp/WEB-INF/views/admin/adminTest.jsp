<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
</head>
<body>


	<c:import url="/WEB-INF/views/include/admin_top2.jsp" />
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1>adminTestPage</h1>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">관리</th>
						</tr>
					</thead>

					<tr class="table-light">
						<th scope="row">1</th>
						<td><a href="getAdminTest">2</a></td>
						<td>3</td>
						<td>4</td>
						<td style="color: red; font-weight: bold;"><a href=""
							style="color: red;">삭제</a></td>
					</tr>

				</table>
				<div class="text-right">
					<br> <a href="cultureRegisterForm" class="btn btn-secondary">글
						등록</a>
				</div>
			</div>
		</div>

	</div>

</body>
</html>