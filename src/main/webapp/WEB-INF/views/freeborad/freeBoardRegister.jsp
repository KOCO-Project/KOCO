<%@page import="co.kr.koco.vo.BoardInfoVO"%>
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
	<div class="">
		<div class="">
	
			<h1>자유게시판 글쓰기</h1>
			<form method="post" action="freeBoardRegister">
			<input type="hidden" name="no" value="${boardInfoVO.infoNo }">
				<hr>
				<ul>
					<li><input type="text" placeholder="글 제목" name="title"
						required="required" class="write_title"></li>
				</ul>
				<ul>
					<li><textarea name="content" id="editor4"></textarea></li>
				</ul>
				<ul class="btns">
					<li><input type="submit" value="작성"></li>
					<li><input type="button" value="취소" onClick="goBack()"></li>
				</ul>
			</form>
			<script>
				CKEDITOR.replace('editor4',{
					filebrowserUploadUrl:'/mine/imageUpload.do'
				});
			</script>
		</div>
	</div>
</body>
</html>