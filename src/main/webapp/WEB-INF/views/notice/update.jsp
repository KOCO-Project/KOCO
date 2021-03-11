<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/footer.css">
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
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1>
					<a href="noticeList" class="header"
						style="color: black; text-decoration: none; font-weight: bold;">공지사항</a>
				</h1>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-1"></div>
					<br>
					<div class="col-md-10">
						<table class="table table">
							<th scope="col">게시글 수정&nbsp;&nbsp;│&nbsp;&nbsp;기존&nbsp;제목&nbsp;:&nbsp;${notice.noticeTitle }&nbsp;│&nbsp;작성일&nbsp;:&nbsp;${notice.noticeRegdate }</th>
						</table>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div class="table table-hover">
						<form action="updateNotice" method="post">

							<input type="hidden" name="noticeNo" value="${notice.noticeNo}" /> 
							<input type="hidden" name="userNo" value="${notice.userNo}">

							<div class="form-group">
								<label>제목</label> 
								<input type="text" class="form-control" name="noticeTitle" value="${notice.noticeTitle }" required="required" maxlength="50"/>
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="summernote" name="noticeContent" id="editor" rows="12">${notice.noticeContent }</textarea>
							</div>

							<div class="form-group">
								<div class="text-right">
									<input type="submit" class="btn btn-info" value="수정완료" />
									<button type="button" class="btn btn-danger" onclick="history.back()">취소하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>
