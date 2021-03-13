<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update comment</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<!-- 	<form action="qnaCommentUpdate" method="get"> -->
<%-- 		<input type="hidden" name="commentNo" value="${comment.commentNo }"> --%>
<%-- 		<input type="hidden" name="boardNo" value="${comment.boardNo }"> --%>
<!-- 		<input type="text" name="commentContent" required="required" -->
<%-- 			placeholder="no=${comment.commentNo } content= ${comment.commentContent } ${comment.boardNo}"> --%>
<!-- 		<input type="submit" value="수정 완료"> -->
<!-- 	</form> -->
			<br><br><br>
			<div>
				<form action="qnaCommentUpdate" method="get" style="width: 100%; place-content: center;">
					<input type="hidden" name="commentNo" value="${comment.commentNo }">
					<input type="hidden" name="boardNo" value="${comment.boardNo }">
					<div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="max-width: 95%;">
						<input type="text" class="toast-body" name="commentContent" placeholder="${comment.commentContent }" required="required"
						style="text-align: left;border-radius: 15px;width: 100%;height: 100px;font-size: 13px;">
						<div>
							<input type="submit" class="btn btn-success" value="수정완료" 	style="box-shadow: 0 0.25rem 0.75rem rgb(0 0 0/ 10%); float: right; position: relative; top: -65px; right: 10px;">
						</div>
					</div>
				</form>
			</div>
</body>
</html>
