<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<body>
<h1>${boardInfoName }</h1>
<table id='board_list'>
<thead>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
	</tr>
</thead>
<tbody>
	<c:forEach var='obj' items="${contentList }">
		<tr>
			<td>${obj.content_idx }</td>
			<td><a href='${root }board/read?board_info_idx=${board_info_idx}&content_idx=${obj.content_idx}&page=${page}'>${obj.content_subject }</a></td>
			<td>${obj.content_writer_name }</td>
			<td>${obj.content_date }</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<div>
	<ul>
	<c:choose>
		<c:when test="${pageBean.prevPage <= 0 }">
			<li><a href="#">이전</a>
			</li>
		</c:when>
		<c:otherwise>
			<li><a href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.prevPage}">이전</a></li>
		</c:otherwise>
	</c:choose>
	<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
		<c:choose>
			<c:when test="${idx == pageBean.currentPage }">
				<li><a
					href="${root }board/main?board_info_idx=${board_info_idx}&page=${idx}">${idx }</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${root }board/main?board_info_idx=${board_info_idx}&page=${idx}">${idx }</a></li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		<c:choose>
		<c:when test="${pageBean.max >= pageBean.pageCnt }">
			<li><a href="#">다음</a>
			</li>
		</c:when>
		<c:otherwise>
			<li><a
				href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}">다음</a></li>
		</c:otherwise>
	</c:choose>
	</ul>
</div>
<div>
	<a href="${root }board/write?board_info_idx=${board_info_idx}">글쓰기</a>
</div>
</body>
</html>