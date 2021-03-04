<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CDN -->
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
	<div class="container" style="margin-top: 100px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">문화테스트</h4>
				<table class="table table-hover" id='board_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">글번호</th>
							<th class="w-50">제목</th>
							<th class="text-center d-none d-md-table-cell">작성자</th>
							<th class="text-center d-none d-md-table-cell">작성날짜</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var='obj' items="${cultureList }">
							<tr>
								<td class="text-center d-none d-md-table-cell">${obj.cultureNo }</td>
								<td><a
									href=''>${obj.cultureTitle }</a></td>
								<td class="text-center d-none d-md-table-cell">${obj.userNickname }</td>
								<td class="text-center d-none d-md-table-cell">${obj.cultureRegdate }</td>
								
							</tr>
						</c:forEach>
					</tbody>
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
									href="listTest?page=${pageVO.prevPage}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
							<c:choose>
								<c:when test="${idx == pageVO.currentPage }">
									<li class="page-item active"><a
										href="listTest?page=${idx}"
										class="page-link">${idx }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="listTest?page=${idx}"
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
									href="listTest?page=${pageVO.nextPage}"
									class="page-link">다음</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

				<div class="text-right">
					<a href=""
						class="btn btn-primary">글쓰기</a>

				</div>

			</div>
		</div>
	</div>

</body>
</html>