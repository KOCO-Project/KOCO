<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<div id="qna" class="container" style="margin-top:100px">

			<h1 class="card-title">QnA</h1><br>
			<table class="table table-hover" id='board_list'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="w-50">제목</th>
						<th class="text-center d-none d-md-table-cell">작성자</th>
						<th class="text-center d-none d-md-table-cell">작성날짜</th>
						<th class="text-center d-none d-md-table-cell">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='obj' items="${qnaList }">
					<tr>
						<td class="text-center d-none d-md-table-cell">${obj.boardNo }</td>
						<td><a href='${root }getQna?infoNo=${infoNo }&boardNo=${obj.boardNo }&page=${page}'>${obj.boardTitle }</a></td>
						<td class="text-center d-none d-md-table-cell" style="color: #325d88;font-weight: 500;">${obj.writer }</td>
						<td class="text-center d-none d-md-table-cell">${obj.boardRegdate }</td>
						<td class="text-center d-none d-md-table-cell">${obj.boardReadcount }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table><br><br><br>
			
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageVO.prevPage <= 0 }">
							<li class="page-item disabled">
								<a href="#" class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }qnalist?infoNo=${infoNo }&page=${pageVO.prevPage}" class="page-link">이전</a>
							</li>
						</c:otherwise>
					</c:choose>

					<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
						<c:choose>
							<c:when test="${idx == pageVO.currentPage }">
							<li class="page-item active">
								<a href="${root }qnalist?infoNo=${infoNo }&page=${idx}" class="page-link">${idx }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }qnalist?infoNo=${infoNo }&page=${idx}" class="page-link">${idx }</a>
							</li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageVO.max >= pageVO.pageCnt }">
							<li class="page-item disabled">
								<a href="#" class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a href="${root }qnalist?infoNo=${infoNo }&page=${pageVO.nextPage}" class="page-link">다음</a>
							</li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
			
			<div class="text-right">
				<a href="${root }qnaRegister?infoNo=${infoNo }" class="btn btn-primary btn-lg">Write</a>
				
			</div>
		</div>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>

</body>
</html>