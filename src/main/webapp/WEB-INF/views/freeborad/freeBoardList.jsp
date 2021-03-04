
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
					</select> <input name="serachKeyword" type="text" /> 
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
				<td align="left"><a href="getFreeBoard.do?boardNo=${freeBoard.boardNo}}">${freeBoard.boardTitle}</a></td>
				<td>${freeBoard.writer }</td>
				<td>${freeBoard.boardRegdate }</td>
				<td>${freeBoard.boardReadcount }</td>
			</tr>
			</c:forEach>		
		</table>
		<br> 
		<div>
				<a href="freeboard/freeBoardRegister?infoNo=${infoNo }">글쓰기</a>					
		</div>
	
</body>
</html>