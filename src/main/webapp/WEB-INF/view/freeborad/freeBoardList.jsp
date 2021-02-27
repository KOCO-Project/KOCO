
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOCO</title>
</head>
<body>
	
		<h1>자유 게시판</h1>
		
		<!-- 검색 시작 -->
		<form action="freeBoardList.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
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

		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">번호</th>
				<th bgcolor="orange" width="200">제목</th>
				<th bgcolor="orange" width="150">작성자</th>
				<th bgcolor="orange" width="150">작성일</th>
				<th bgcolor="orange" width="100">조회수</th>
			</tr>
			
			<c:forEach items="${freeBoardList }" var="freeBoard">
			<tr>
				<td>${freeBoard.boardNo }
				<td align="left"><a href="getFreeBoard.do?boardNo=${freeBoard.boardNo}}">${freeBoard.boardTitle}</a></td>
				<td>${freeBoard.userNo }</td>
				<td>${freeBoard.boardRegdate }</td>
				<td>${freeBoard.boardReadcount }</td>
			</tr>
			</c:forEach>
			
		</table>
		<br> <a href="boardRegister.jsp">글쓰기</a>
	
</body>
</html>