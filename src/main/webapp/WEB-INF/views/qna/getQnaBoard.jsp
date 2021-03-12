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
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QnA</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body class="seopBody">

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<input type="hidden" name="boardNo" value="${readContentBean.boardNo }">
	<input type="hidden" id="userNo" name="userNo"
		value="${sessionScope.user.userNo }" />
	<input type="hidden" id="boardTitle" name="boardTitle"
		class="form-control" value="${readContentBean.boardTitle }"
		disabled="disabled" />
	<input type="hidden" id="writer" name="writer" class="form-control"
		value="${readContentBean.writer }" disabled="disabled" />
	<input type="hidden" id="boardRegdate" name="boardRegdate"
		class="form-control" value="${readContentBean.boardRegdate }"
		disabled="disabled" />
	<input type="hidden" id="boardReadcount" name="boardReadcount"
		class="form-control" value="${readContentBean.boardReadcount }"
		disabled="disabled" />


	<div id="qna" class="container">
		<a href="qnalist" class="header"
			style="color: black; text-decoration: none; font-weight: bold; font-size: 2rem;">Q&A</a>
		<div>
			<div class="card-body">
				<div class="card-header"
					style="display: flex; padding: 0.75rem 0.75rem;">

					<div style="font-size: 20px; font-weight: bold; width: 100%;">
						${readContentBean.boardTitle }
						<div
							style="float: right; font-weight: normal; font-size: 12px; margin-top: 6px;">
							조회수&nbsp;${readContentBean.boardReadcount }</div>
					</div>
				</div>
				<div style="padding: 0.75rem;">${readContentBean.writer }&nbsp;&nbsp;${readContentBean.boardRegdate }
				</div>

				<div class="card-body" style="padding: 0.75rem;" row="10">
					${readContentBean.boardContent }
					<c:if test="${readContentBean.fileName !=null }">
						<div class="form-group">
							<label for="board_file">IMAGE</label> <img
								src="${root }upload/${readContentBean.fileName }" width="100%" />
						</div>
					</c:if>

				</div>
			</div>

			<div class="form-group"
				style="margin-left: auto; margin-right: 2rem;">
				<div class="text-right">
					<a href="${root }qnalist?infoNo=${infoNo }&page=${page}"
						class="btn btn-primary" style="width: 100px;">목록보기</a> <a
						href="${root }ansRegister?infoNo=${infoNo }&boardNo=${boardNo }&page=${page}"
						class="btn btn-primary" style="width: 100px;">답글달기</a>
					<c:if test="${sessionScope.user.userNo == readContentBean.userNo }">
						<a
							href="${root }qnaupdate?infoNo=${infoNo }&boardNo=${boardNo }&page=${page}"
							class="btn btn-success" style="width: 100px;">수정하기</a>
						<a href="${root }qnadelete?infoNo=${infoNo }&boardNo=${boardNo }"
							class="btn btn-danger" style="width: 100px;">삭제하기</a>
					</c:if>
					<br> <br>
				</div>
			</div>
		</div>
		<br> <br>


		<!--댓글 입력 창 -->
		<div id="comment" style="text-align: -webkit-center;">
			<div>
				<form action="" method="post"
					style="width: 100%; place-content: center;">
					<div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="max-width: 95%;">
						<input type="text" class="toast-body" placeholder="댓글입력" style="text-align: left; border-radius: 15px; width: 100%; height: 100px;">
						<div>
							<input type="submit" class="btn btn-success" value="전송" style="box-shadow: 0 0.25rem 0.75rem rgb(0 0 0/ 10%); float: right; position: relative; top: -65px; right: 10px;">
						</div>
					</div>
				</form>
				<br>
				<br>
			</div>

			<!-- 댓글 -->
			<c:forEach items="${commentList}" var="comment">
				<div class="toast show" role="alert" aria-live="assertive" aria-atomic="true" style="width: 95%; max-width: 100%;">
					<div class="toast-header">
						<strong class="mr-auto">${comment.userNo}</strong> <small>${comment.commentRegdate}</small>
					</div>
					<div class="toast-body" style="text-align: left;">${comment.commentContent}</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</footer>
</html>
