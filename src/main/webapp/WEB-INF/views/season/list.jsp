<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Season List</title>

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">���� �Խ���</h4>
				<table class="table table-hover" id='board_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">��ȣ</th>
							<th class="w-50">����</th>
							<th class="text-center d-none d-md-table-cell">����</th>
							<th class="text-center d-none d-md-table-cell">�ۼ���</th>
							<th class="text-center d-none d-md-table-cell">�����</th>
						</tr>
					</thead>
					<c:forEach items="${seasonList}" var="season">
						<tr>
							<td class="text-center d-none d-md-table-cell">${season.seasonNo}</td>
							<td><a href="getSeasonBoard?seasonNo=${season.seasonNo}">${season.seasonTitle}</a></td>
							
							<td class="text-center d-none d-md-table-cell">
							<c:set var="seasonNumber" value="${season.seasonStatus}"/>
							<c:choose>
								<c:when test="${seasonNumber eq 1}">
									��
								</c:when>
								<c:when test="${seasonNumber eq 2}">
									����
								</c:when>
								<c:when test="${seasonNumber eq 3}">
									����
								</c:when>
								<c:when test="${seasonNumber eq 4}">
									�ܿ�
								</c:when>
							</c:choose>
							</td>
							<td class="text-center d-none d-md-table-cell">${season.userNo}</td>
							<td class="text-center d-none d-md-table-cell">${season.seasonRegdate}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-right">
					<br> <a href="seasonRegisterForm">�� ���</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
