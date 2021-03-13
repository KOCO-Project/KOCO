<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminEventList // 현재 구현되지 않은 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
				<h1><a href="adminEventList" class="header"
							style="color: black; text-decoration: none; font-weight: bold;">이벤트게시판 관리</a></h1>
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
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<c:forEach items="${eventBoardList }" var="event">
						<tr class="table-light">
							<th scope="row">${event.boardNo }</th>
							<td>${event.boardTitle }</td>
							<td>${event.writer }</td>
							<td>${event.boardRegdate }</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<table style="width: 100%">
					<tr>
						<td></td>
						<!-- 검색 영역 -->
						<td style="width: 40%;">
							<form class="navbar-form" action="adminEventList" method="post">
								<div class="input-group" style="width: 70%; float: right;">
									<div class="form-group navbar-left" style="margin: 0;">
										<select class="input-group-text" style="height: 100%;"
											name="searchCondition">
											<!--<option selected="" style="background-color: white;">검색</option> -->
											<option style="background-color: white;" value="TITLE">제목</option>
											<option style="background-color: white;" value="CONTENT">내용</option>
											<!-- 작성자로 찾는 것 보류 -->
											<option style="background-color: white;" value="NICKNAME">작성자</option>
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
				<br> <br> <br>
			
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageVO.prevPage <=0 }">
							<li class="page-item disabled"><a href="#" class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="adminEventList?infoNo=${infoNo }&page=${pageVO.prevPage }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
								class="page-link">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
						<c:choose>
							<c:when test="${idx == pageVO.currentPage }">
								<li class="page-item active"><a
									href="adminEventList?infoNo=${infoNo }&page=${idx }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
									class="page-link">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="adminEventList?infoNo=${infoNo }&page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
									class="page-link">${idx }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageVO.max >= pageVO.pageCnt }">
							<li class="page-item disabled"><a href="#" class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="adminQnaList?infoNo=${infoNo }&page=${pageVO.nextPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
								class="page-link">다음</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<div class="col-md-1"></div>
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