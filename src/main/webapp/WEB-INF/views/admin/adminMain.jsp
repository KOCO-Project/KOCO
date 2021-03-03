<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/admin_top.jsp" />
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
					<tr class="table-light">
						<th scope="row">Light</th>
						<td>Column content</td>
						<td>Column content</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</body>
</html>