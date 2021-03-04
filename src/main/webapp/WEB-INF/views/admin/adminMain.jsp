<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
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
				<h1>회원관리</h1>
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
							<th scope="col">No</th>
							<th scope="col">Name</th>
							<th scope="col">E-mail</th>
							<th scope="col">Status</th>
							<th scope="col">Case</th>
						</tr>
					</thead>
					<c:forEach items="${userList }" var="user">
					<tr class="table-light">
						<th scope="row">${user.userNo }</th>
						<td>${user.userNickname }</td>
						<td>${user.userEmail }</td>
						<td>${user.userStatus }</td>
						<td>${user.userCase }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>