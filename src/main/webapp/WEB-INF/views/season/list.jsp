<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Season List</title>


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
				<h1>�����Խ���</h1>
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
							<th scope="col">��ȣ</th>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">�ۼ���</th>
							<th scope="col">�����</th>
							<th scope="col">����</th>
						</tr>
					</thead>
					<c:forEach items="${seasonList}" var="season">
						<tr class="table-light">
							<th scope="row">${season.seasonNo}</th>
							<td><a href="getSeasonBoard?seasonNo=${season.seasonNo}">${season.seasonTitle}</a></td>
							<td>
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
							<td>${season.userNo}</td>
							<td>${season.seasonRegdate}</td>
							<td style="color: red; font-weight: bold;"><a
								href="deleteSeasonBoard?seasonNo=${season.seasonNo}"
								style="color: red;">����</a></td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-right">
					<br> <a href="seasonRegisterForm" class="btn btn-secondary">��
						���</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
