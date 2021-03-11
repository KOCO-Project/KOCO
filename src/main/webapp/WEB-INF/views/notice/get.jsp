<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div.card.border-light.mb-12 div.card-body h5{
margin: 0;
font-size: 0.8rem;
display: inline-flex;
}

html, body {
	position: absolute;
	height: 100%;
	width: 100%;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/footer.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
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
							<th scope="col"></th>
						</table>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="card border-light mb-12" style="max-width: 100%;">
						<div class="card-header" style="font-weight: bold;">NoticeBoard</div>
						<div class="card-body">
							<h4 class="card-title">
								<h9 style="font-size: 20px;font-weight: bold; ">${notice.noticeTitle}</h9>								
							</h4>
							<h4 class="card-title" style="font-size: 12px;">${notice.userNickname}&nbsp; ${notice.noticeRegdate }</h4>
							<hr>
							<p class="card-text">${notice.noticeContent }</p>
							<div class="form-group">
								<div class="text-right">
									<button type="button" class="btn btn-primary" onclick="history.back()">목록보기</button>
									<c:if test="${notice.userNickname == user.userNickname }">
									<a href="updateNoticeView?noticeNo=${notice.noticeNo}" class="btn btn-info">수정하기</a> 
									<a href="deleteNoticeBoard?noticeNo=${notice.noticeNo}" class="btn btn-danger">삭제하기</a>
									</c:if>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
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
