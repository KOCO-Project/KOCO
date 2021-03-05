<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update QnA</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<div id="qna" class="container">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
		<h2>Update QnA</h2><br>
			<div class="card border-light mb-3 cc_cursor">
			  <!-- <div class="card-header">Update QnA</div> -->
				<div class="card-body">
					<form:form action='${root }qnaUpdate_pro' method='post' modelAttribute="qnaUpdateBoardVO" enctype="multipart/form-data">
						<form:hidden path="boardNo"/><!-- 글 번호 -->
						<form:hidden path="boardCategory"/> <!-- 게시판 번호 -->
						<input type="hidden" name ="page" value="${page }">
						<div class="form-group">
							<form:label path="writer">작성자</form:label>
							<form:input path="writer" class='form-control' readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="boardRegdate">작성날짜</form:label>
							<form:input path="boardRegdate" class='form-control' readonly='true'/>
						</div>
						<div class="form-group">
							<form:label path="boardTitle">제목</form:label>
							<form:input path="boardTitle" class='form-control'/>

						</div>
						<div class="form-group">
							<form:label path="boardContent">내용</form:label>
							<form:textarea path="boardContent" class="form-control" rows="10" style="resize:none"/>

						</div>
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<c:if test="${qnaUpdateBoardVO.fileName != null }">
							<img src="${root }upload/${qnaUpdateBoardVO.fileName}" width="100%"/>	
							<form:hidden path="fileName"/><!-- 기존 첨부 파일 -->
							</c:if>
							<form:input path="uploadFile" type='file' class="form-control" accept="image/*"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="submit" class="btn btn-success" style="width: 100px;">수정완료</button>
								<a href="${root }getQna?infoNo=${infoNo}&boardNo=${boardNo}&page=${page}" class="btn btn-danger" style="width: 100px;">취소</a>
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