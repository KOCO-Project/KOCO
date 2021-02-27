<%@page import="co.kr.koco.vo.BoardVO"%>
<%@page import="java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
</script>

<meta charset="UTF-8">
<title>KOCO</title>
</head>
<body>
	<%
		BoardVO freeBoardVO = (BoardVO) request.getAttribute("freeBoardVO");
	%>
	
		<form action="freeBoardUpdate.do" method="get">
			<ul>
				<li><label for="제목">제목</label> <input type="text" name="title"
					required="required" class="write_title" value="<%=freeBoardVO.getBoardTitle()%>">
					<input type="hidden" name="no" value="<%=freeBoardVO.getBoardNo()%>"></li>
			</ul>
			<hr>
			<ul>
				<li><label for="내용">내용</label>
				<textarea name="content" required="required" id="editor"><%=freeBoardVO.getBoardContent()%></textarea></li>
			</ul>
			<ul>
					<li><input type="submit" value="수정"></li>
					<li><input type="button" value="취소" onClick="goBack()"></li>
			</ul>
		</form>

	<script>
		CKEDITOR.replace('content');
	</script>
	
</body>
</html>