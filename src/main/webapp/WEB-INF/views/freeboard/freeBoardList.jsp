
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

</head>
<body>
	
		<h4 class="card-title">${infoName }</h4>
		
		<!-- 검색 시작 -->
		<form action="freeBoardList" method="post">
			<table>
				<tr>
					<td align="right"><select name="searchCondition">
							<c:forEach items = "${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
							</c:forEach> 
					</select> 
					<input name="searchKeyword" type="text" /> 
					<input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->

		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			
			<c:forEach items="${freeBoardList }" var="freeBoard">
			<tr>
				<td>${freeBoard.boardNo }
				<td align="left"><a href='getFreeBoard?infoNo=${infoNo }&boardNo=${freeBoard.boardNo}&page=${page}'>${freeBoard.boardTitle}</a></td>
				<td>${freeBoard.writer }</td>
				<td>${freeBoard.boardRegdate }</td>
				<td>${freeBoard.boardReadcount }</td>
			</tr>
			</c:forEach>		
		</table>
		<br><br><br>
		<div>
			<ul>
			<c:choose>
				<c:when test="${pageVO.prevPage <=0 }">
				<li>
				<a href="#">이전</a>
				</li>
				</c:when>
			<c:otherwise>
			<li>
			<a href="freeBoardList?infoNo=${infoNo }&page=${pageVO.prevPage }">이전</a>
			</li>
			</c:otherwise>
			</c:choose>
			
			<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
			<c:choose>
			<c:when test="${idx == pageVO.currentPage }">
			<li>
			<a href="freeBoardList?infoNo=${infoNo }&page=${idx }">${idx }</a>
			</li>
			</c:when>
			<c:otherwise>
			<li>
			<a href="freeBoardList?infoNo=${infoNo }&page=${idx}">${idx }</a>
			</li>
			</c:otherwise>
			</c:choose>
			</c:forEach>
			
			<c:choose>
			<c:when test="${pageVO.max >= pageVO.pageCnt }">
			<li>
			<a href="#">다음</a>
			</li>
			</c:when>
			<c:otherwise>
			<li>
			<a href="freeBoardList?infoNo=${infoNo }&page=${pageVO.nextPage}">다음</a>
			</li>
			</c:otherwise>
			</c:choose>
			
			</ul>
		</div> 
		<div>
				<a href="freeBoardRegister?infoNo=1">글쓰기</a>					
		</div>
	
</body>
</html>