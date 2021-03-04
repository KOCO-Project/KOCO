
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<script type="text/javascript">
	function del() {

		if (confirm("정말로 게시글을 삭제하시겠습니까?") == true) {
			document.update.action = "freeBoardDelete.do";
			document.update.submit();
		} else {
			return false;
		}
	}
</script>

</head>
<body>

	<h1>자유 게시판</h1>
	<hr>
	<form action="freeBoardUpdate" method="post">
		<input name="no" type="hidden" value="${freeBoard.boardNo }" />
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input name="title" type="text"
					value="${freeBoard.boardTitle }" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${freeBoard.writer }</td>
			</tr>
			<tr>
				<td bgcolor="orange">작성일</td>
				<td align="left">${freeBoard.boardRegdate }</td>
			</tr>
		<%-- 	<tr>
				<td bgcolor="orange">좋아요</td>
				<td align="left">${freeBoard.boardLike? }</td>
			</tr> --%>
			<tr>
				<td bgcolor="orange">조회수</td>
				<td align="left">${freeBoard.boardReadcount }</td>
			</tr>
			<%-- <tr>
				<td bgcolor="orange">댓글</td>
				<td align="left">${freeBoard.board? }</td>
			</tr> --%>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="content" cols="40" rows="10">${freeBoard.boardContent }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="수정" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="삭제" onClick="del()"/></td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="freeboard/freeBoardRegister.jsp">글쓰기</a>&nbsp;&nbsp;&nbsp;
	<a href="freeBoardList">글목록</a>

</body>
</html>