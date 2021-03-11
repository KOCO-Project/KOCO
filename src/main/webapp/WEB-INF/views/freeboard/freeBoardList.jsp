
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div id="qna" class="container">
		<h1 class="card-title">${infoName }</h1>

		<table class="table table-hover" id='board_list'
			style="border-bottom: 1px solid #dfd7ca;">
			<tr>
				<th class="text-center d-none d-md-table-cell">번호</th>
				<th class="w-50">제목</th>
				<th class="text-center d-none d-md-table-cell">작성자</th>
				<th class="text-center d-none d-md-table-cell">작성일</th>
				<th class="text-center d-none d-md-table-cell">조회수</th>
			</tr>

			<c:forEach items="${freeBoardList }" var="freeBoard">
				<tr>
					<td class="text-center d-none d-md-table-cell">${freeBoard.boardNo }
					<td><a
						href='getFreeBoard?infoNo=${infoNo }&boardNo=${freeBoard.boardNo}&page=${page}'>${freeBoard.boardTitle}</a></td>
					<td class="text-center d-none d-md-table-cell"
						style="color: #325d88; font-weight: 500;">${freeBoard.writer }</td>
					<td class="text-center d-none d-md-table-cell">${freeBoard.boardRegdate }</td>
					<td class="text-center d-none d-md-table-cell">${freeBoard.boardReadcount }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<table style="width: 100%">
			<tr>
				<td>
					<div class="text-left">
						<a href="${root }freeBoardRegister?infoNo=${infoNo }" class="btn btn-success"
							style="width: 100px;">글쓰기</a>
					</div>
				</td>

				<!-- 검색 시작 -->
				<td style="width: 50%;">
					<form action="freeBoardList" method="post" class="navbar-form">
						<div class="input-group">
							<div class="form-group navbar-left" style="margin: 0;">
								<select name="searchCondition" class="custom-select">
									<option value="TITLE">제목</option>
									<option value="CONTENT">내용</option>
								</select>
							</div>
							<input name="searchKeyword" type="text" class="form-control"
								placeholder="SEARCH" style="border: 1px solid #ced4da;" />
							<div class="input-group-append" style="height: fit-content;">
								<button class="btn btn btn-primary" type="submit">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" /></svg>
								</button>
							</div>
						</div>

					</form>
				</td>
			</tr>
		</table>
		<!-- 검색 종료 -->

		<br>
		<br>
		<br>


		<div class="d-none d-md-block">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${pageVO.prevPage <=0 }">
						<li class="page-item disabled"><a href="#" class="page-link">이전</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a
							href="freeBoardList?infoNo=${infoNo }&page=${pageVO.prevPage }"
							class="page-link">이전</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
					<c:choose>
						<c:when test="${idx == pageVO.currentPage }">
							<li class="page-item active"><a
								href="freeBoardList?infoNo=${infoNo }&page=${idx }"
								class="page-link">${idx }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="freeBoardList?infoNo=${infoNo }&page=${idx}"
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
							href="freeBoardList?infoNo=${infoNo }&page=${pageVO.nextPage}"
							class="page-link">다음</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>

	</div>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>

</body>
</html>