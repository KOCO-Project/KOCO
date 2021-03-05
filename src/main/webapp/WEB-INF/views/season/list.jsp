<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Season List</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function delFun(){
		return confirm("삭제하시겠습니까?");
	}
</script>
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
				<h1>계절게시판</h1>
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
							<th scope="col">계절</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">관리</th>
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
									봄
								</c:when>
								<c:when test="${seasonNumber eq 2}">
									여름
								</c:when>
								<c:when test="${seasonNumber eq 3}">
									가을
								</c:when>
								<c:when test="${seasonNumber eq 4}">
									겨울
								</c:when>
							</c:choose>
							</td>
							<td>${season.userNo}</td>
							<td>${season.seasonRegdate}</td>
							<td style="color: red; font-weight: bold;">
							<a href="deleteSeasonBoard?seasonNo=${season.seasonNo}" style="color: red;" onclick="return delFun();">삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="text-right">
					<br> <a href="seasonRegisterForm" class="btn btn-secondary">글
						등록</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
