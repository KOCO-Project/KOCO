<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
tbody tr.table-light th h5{margin: 0;font-size: 0.8rem;}
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/admin_top2.jsp" />
	<br>
	<br>
	<br>
	<div style="height: auto;min-height: 500px;">
	
	<!--↓ 메인 상단 ↓-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1>
					<a href="cultureList" class="header"
						style="color: black; text-decoration: none; font-weight: bold; ">문화게시판</a>
				</h1>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<!--↓ 게시글 영역 ↓-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" style="width: 10%;">번호</th>
							<th scope="col" style="width: 10%;">메인</th>
							<th scope="col" style="width: 40%;">제목</th>
							<th scope="col" style="width: 20%;">작성자</th>
							<th scope="col" style="width: 20%;">작성일</th>
						</tr>
					</thead>
					
					<!--↓ DB 저장된 데이터 값 출력 ↓-->
					<c:forEach items="${cultureList}" var="culture">
						<tr class="table-light">
							<th scope="row">${culture.cultureNo}</th>

							<th scope="row" style="display: inline-flex;">
							<c:if test="${culture.culturePick  == 1}">
									<h5>[</h5>
									<h5 style="color: red;font-weight: bold;">Main</h5>
									<h5>]</h5>
								</c:if></th>

							<td><a href="getCultureBoard?cultureNo=${culture.cultureNo}"
								style="color: black;" onMouseover="this.style.fontWeight='bold'"
								onMouseout="this.style.fontWeight=''">${culture.cultureTitle}</a></td>
							<td>${culture.userNickname}</td>
							<td>${culture.cultureRegdate}</td>
						</tr>
					</c:forEach>
				</table>

				<table style="width: 100%">
					<tr>
						<td>
							<div class="page-item">
								<a href="cultureRegisterForm" class="input-group-text" style="width: 100px; justify-content: center;">글 쓰기</a>
							</div>
						</td>
						
						<!--↓ 검색 영역 ↓-->
						<td style="width: 40%;">
							<form class="navbar-form" action="cultureList" method="post">
								<div class="input-group" style="width: 70%; float: right;">
									<div class="form-group navbar-left" style="margin: 0;">
										<select class="input-group-text" style="height: 100%;" name="searchCondition">
											<option style="background-color: white;" value="TITLE">제목</option>
											<option style="background-color: white;" value="CONTENT">내용</option>
											<option style="background-color: white;" value="NICKNAME">작성자</option>
										</select>
									</div>
									<input type="text" class="form-control" placeholder="SEARCH" style="border: 1px solid #ced4da;" name="searchKeyword">
									<div class="input-group-append">
										<button class="input-group-text" type="submit">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  											<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" /></svg>
										</button>
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
				
				<!--↓ 리스트 부분과 페이징 부분의 영역 구분을 위한 br태그.. (이때까지만해도 CSS에 대한 지식이 부족하여 아래 방법으로 처리) ↓-->
				<br><br><br><br>

				<!--↓ 페이징 영역 ↓-->
				<div class="d-none d-md-block">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pageVO.prevPage <= 0 }">
								<li class="page-item disabled"><a href="#"
									class="page-link">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="cultureList?page=${pageVO.prevPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
									class="page-link">이전</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
							<c:choose>
								<c:when test="${idx == pageVO.currentPage }">
									<li class="page-item active"><a
										href="cultureList?page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
										class="page-link">${idx }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a
										href="cultureList?page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
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
									href="cultureList?page=${pageVO.nextPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
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
</body>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</html>