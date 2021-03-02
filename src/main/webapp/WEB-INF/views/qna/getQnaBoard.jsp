<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QnA</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="writer">작성자</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${readContentBean.writer }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="boardRegdate">작성날짜</label>
						<input type="text" id="boardRegdate" name="boardRegdate" class="form-control" value="${readContentBean.boardRegdate }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="boardTitle">제목</label>
						<input type="text" id="boardTitle" name="boardTitle" class="form-control" value="${readContentBean.boardTitle }" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="boardContent">내용</label>
						<textarea id="boardContent" name="boardContent" class="form-control" rows="10" style="resize:none" disabled="disabled">${readContentBean.boardContent }</textarea>
					</div>
					<c:if test="${readContentBean.fileName !=null }">
					<div class="form-group">
						<label for="board_file">첨부 이미지</label>
						<img src="${root }upload/${readContentBean.fileName }" width="100%"/>						
					</div>
					</c:if>
					<div class="form-group">
						<div class="text-right">
							<a href="${root }qna/list?infoNo=${infoNo }&page=${page}" class="btn btn-primary">목록보기</a>
						<%-- <c:if test="${loginUser.userNo==readContentBean.userNo }"> --%>
							<a href="${root }qna/update?infoNo=${infoNo }&boardNo=${boardNo }&page=${page}" class="btn btn-info">수정하기</a>
							<a href="${root }qna/delete?infoNo=${infoNo }&boardNo=${boardNo }" class="btn btn-danger">삭제하기</a>
						<%-- </c:if> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>


</body>
</html>
    