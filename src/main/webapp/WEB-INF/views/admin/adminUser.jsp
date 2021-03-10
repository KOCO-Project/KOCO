<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
tbody tr.table-light th h5 {
	margin: 0;
	font-size: 0.8rem;
}
a:hover {
	text-decoration: none;
	color: black;
}

</style>
<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
</script>
<meta charset="UTF-8">
<title>Culture List</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
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
	<div style="height: auto; min-height: 500px;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<h1>
						<a href="adminUserList" class="header"
							style="color: black; text-decoration: none; font-weight: bold;">회원관리</a>
					</h1>
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
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">E-mail</th>
								<th scope="col">Status</th>
								<th scope="col">Case</th>
								<th scope="col">Management</th>
								<th scope="col"></th>


							</tr>
						</thead>

						<c:forEach items="${adminUserList}" var="user">
							<tr class="table-light">
								<th scope="row">${user.userNo}</th>
								<td>${user.userId}</td>
								<td><a href="getCultureBoard?cultureNo=${user.userNo}"
									style="color: black;"
									onMouseover="this.style.fontWeight='bold'"
									onMouseout="this.style.fontWeight=''">${user.userNickname}</a></td>
								<td>${user.userEmail}</td>

								<form action="adminSimpleUpdate" method="post" class="navbar-form">
									<td><select class="input-group-text" style="padding: 0;">
									<c:if test="${user.userStatus == 1}">
											<option style="background-color: white;" value="1">활성</option>
											<option style="background-color: white;" value="2">비활성</option>
											</c:if>
											<c:if test="${user.userStatus == 2}">
											<option style="background-color: white;" value="2">비활성</option>
											<option style="background-color: white;" value="1">활성</option>
											</c:if>											
									</select></td>

									<td><select class="input-group-text"style="padding: 0;">
									<c:if test="${user.userCase == 0}">
											<option value="0">일반</option>
											<option value="1">관리자</option>
											</c:if>
											<c:if test="${user.userCase == 1}">
											<option value="1">관리자</option>
											<option value="0">일반</option>
											</c:if>
									</select></td>
									<td style="width: 10%;" class="page-item">
									<input type="submit" value="수정" class="input-group-text"
									style="width: 50%;justify-content: center;padding: 0;"/></td>
								</form>
								<td style="width: 10%;" class="page-item">
								<button type="button" class="input-group-text" style="width: 50%;justify-content: center;padding: 0;" onclick="location.href='adminUserDelete?no=${user.userNo}'">삭제</button></td>
							</tr>
						</c:forEach>
					</table>


					<table style="width: 100%">
						<tr>
							<!-- 검색 영역 -->
							<td style="width: 40%;">
								<form class="navbar-form" action="adminUserList" method="post">
									<div class="input-group" style="width: 30%; float: right;">
										<div class="form-group navbar-left" style="margin: 0;">
											<select class="input-group-text" style="height: 100%;"
												name="searchCondition">
												<option style="background-color: white;" value="ID">ID</option>
												<option style="background-color: white;" value="NAME">NAME</option>
												<option style="background-color: white;" value="EMAIL">EMAIL</option>
											</select>
										</div>
										<input type="text" class="form-control" placeholder="SEARCH"
											style="border: 1px solid #ced4da;" name="searchKeyword">
										<div class="input-group-append">
											<button class="input-group-text" type="submit">
												<svg xmlns="http://www.w3.org/2000/svg" width="16"
													height="16" fill="currentColor" class="bi bi-search"
													viewBox="0 0 16 16">
  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" /></svg>
											</button>
										</div>
									</div>
								</form>
							</td>
						</tr>
					</table>
					<br> <br> <br> <br>

					<div class="d-none d-md-block">
						<ul class="pagination justify-content-center">
							<c:choose>
								<c:when test="${pageVO.prevPage <= 0 }">
									<li class="page-item disabled"><a href="#"
										class="page-link">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="adminUserList?page=${pageVO.prevPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
										class="page-link">이전</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
								<c:choose>
									<c:when test="${idx == pageVO.currentPage }">
										<li class="page-item active"><a
											href="adminUserList?page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
											class="page-link">${idx }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a
											href="adminUserList?page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
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
										href="adminUserList?page=${pageVO.nextPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
										class="page-link">다음</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>