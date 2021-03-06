
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
<title>자유게시판</title>
</head>
<body>

		<form action="freeBoardUpdate" method="post">
		<input id="boardNo" name="boardNo" type="hidden" value="${freeBoard.boardNo}"/>
		<input id="boardCategory" name="boardCategory" type="hidden" value="${freeBoard.boardCategory }"/>
		<input type ="hidden" name="page" value="${page }">
			<ul>
				<li><label for="제목">제목</label> 
				<input type="text" name="title" required="required" class="write_title" value="${freeBoard.boardTitle }">
				<input type="hidden" name="no" value="${freeBoard.boardNo }"></li>
			</ul>
			<hr>
			<ul>
				<li><label for="내용">내용</label>
				<textarea name="content" required="required" id="editor4">${freeBoard.boardContent }</textarea></li>
			</ul>
			<ul>
					<li><input type="submit" value="수정"></li>
					<li><input type="button" value="취소" onClick="goBack()"></li>
			</ul>
		</form>

	<script>
		CKEDITOR.replace('editor4',{
			filebrowserUploadUrl:'/mine/imageUpload.do'
		});
	</script>
	
</body>
</html>