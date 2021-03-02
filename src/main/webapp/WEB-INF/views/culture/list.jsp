<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Culture List</title>
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
				<h4 class="card-title">문화 게시판</h4>
				<table class="table table-hover" id='board_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">번호</th>
							<th class="w-50">제목</th>
							<th class="text-center d-none d-md-table-cell">작성자</th>
							<th class="text-center d-none d-md-table-cell">등록일</th>
						</tr>
					</thead>
					<c:forEach items="${cultureList}" var="culture">
						<tr>
							<td class="text-center d-none d-md-table-cell">${culture.cultureNo}</td>
							<td><a href="getCultureBoard?cultureNo=${culture.cultureNo}">${culture.cultureTitle}</a></td>
							<td class="text-center d-none d-md-table-cell">${culture.userNo}</td>
							<td class="text-center d-none d-md-table-cell">${culture.cultureRegdate}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-right">
					<br> <a href="cultureRegisterForm">글 등록</a>
					<br> <a href="cultureTestForm">테스트 페이지</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>