<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>QnA</title>
</head>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<div id="qna" class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<h2>답변 작성</h2><br>
			<div class="card border-light mb-3 cc_cursor">
				<div class="card-body">
					<form:form action='${root }ansRegister_pro' method='post' modelAttribute="ansQnaBoardVO" enctype="multipart/form-data">
						<form:hidden path="boardCategory"/>
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="boardNo" value="${ansQnaBoardVO.boardNo}">
						<input type="hidden" name="parent" value="${ansQnaBoardVO.parent}">
						<input type="hidden" name="depth" value="${ansQnaBoardVO.depth}">
						<input type="hidden" name="sequence" value="${ansQnaBoardVO.sequence}">
						<input id="userNo" name="userNo" type="hidden" value="${sessionScope.user.userNo }"/>
						<div class="form-group">
						<form:label path="boardTitle">제목</form:label>
						<form:input path="boardTitle" class="form-control"/>
						<form:errors path="boardTitle" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="boardContent">내용</form:label>
						<form:textarea path="boardContent" class="summernote" id="editor" rows="12" style="resize:none"/>
						<form:errors path="boardContent" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="uploadFile">이미지</form:label>
						<form:input type="file" path="uploadFile" class="form-control" accept="image/*"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<form:button type="submit" class="btn btn-primary" style="width: 100px;">Submit</form:button>
							<a href="${root }qnalist?infoNo=2&page=1" class="btn btn-danger" style="width: 100px;">Cancel</a>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</body>
</html>