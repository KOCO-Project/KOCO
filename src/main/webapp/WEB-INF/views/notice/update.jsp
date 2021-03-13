<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input {
	border: none;
	background: #fff;
}

h1.card-title {
	font-weight: bold;
	float: left;
}

body {
	text-align: -webkit-center;
}

div#qna.container {
	box-shadow: 3px 3px 15px 0px grey;
	margin-top: 5%;
	max-width: 80%;
}

div.card-body {
	min-height: 200px;
}

input#uploadFile.form-control {
	border-left-width: 0px;
	border-top-width: 0px;
	border-bottom-width: 0px;
	border-right-width: 0px;
	float: left;
	padding-left: 0px;
	padding-right: 0px;
	padding-top: 0px;
	padding-bottom: 0px;
	height: 100%;
}

label {
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	var setting = {
		height: 250,
		lang: "ko-KR"
	};
	
	$('.summernote').summernote(setting);
});
</script>
<body class="suk">
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div id="qna" class="container">
		<a href="noticeList" class="header"style="color: black; text-decoration: none; font-weight: bold; font-size: 2rem;">공지사항</a>
		<table class="table table">
			<th scope="col" style="border-top: 1px solid #f8f5f0 !important;">게시글 수정</th>
		</table>
	
		<div class="card border-light mb-3 cc_cursor">
			<div class="card-body">
				<form action="updateNotice" method="post">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}" /> 
				<input type="hidden" name="userNo" value="${notice.userNo}">
					<div class="form-group">
						<input type="text" placeholder="글 제목" name="noticeTitle"
							required="required" class='form-control' value="${notice.noticeTitle }">
					</div>
					<div class="form-group">
						<textarea class="summernote" name="noticeContent" id="editor" rows="12" style="resize:none">${notice.noticeContent }</textarea>
					</div>
					<br><br><br>
					<div class="form-group">
						<div class="text-right">
							<button type="submit" class="btn btn-primary" style="width: 100px;">수정완료</button>
							<button type="button" class="btn btn-danger" style="width: 100px;"
								onclick="history.back()">취소</button>
						</div>
					</div>
				</form>	
			</div>
		</div>
	</div>
</body>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />	
</footer>
</html>
