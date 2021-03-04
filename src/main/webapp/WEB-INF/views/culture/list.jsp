<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Culture List</title>
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
				<h1 class="header" style="font-weight: bold;">문화게시판</h1>
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
						</tr>
					</thead>
					<c:forEach items="${cultureList}" var="culture">
						<tr class="table-light">
							<th scope="row">${culture.cultureNo}</th>
							<td><a href="getCultureBoard?cultureNo=${culture.cultureNo}">${culture.cultureTitle}</a></td>
							<td>${culture.userNickname}</td>
							<td>${culture.cultureRegdate}</td>
						</tr>
					</c:forEach>
				</table>
				
				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageVO.prevPage <= 0 }">
								<li class="page-item disabled"><a href="#"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="cultureList?page=${pageVO.prevPage}" class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
							<c:choose>
								<c:when test="${idx == pageVO.currentPage }">
									<li class="page-item active"><a
										href="cultureList?page=${idx}" class="page-link">${idx }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="cultureList?page=${idx}"
										class="page-link">${idx }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${pageVO.max >= pageVO.pageCnt }">
								<li class="page-item disabled"><a href="#"
									class="page-link">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="cultureList?page=${pageVO.nextPage}" class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

				<div class="text-right">
					<a href="" class="btn btn-primary">글쓰기</a>

				</div>
			</div>
		</div>
	</div>
</body>
</html>