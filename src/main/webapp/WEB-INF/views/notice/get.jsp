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
<title>공지사항</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body class="suk">
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div id="qna" class="container">
		<a href="noticeList" class="header"	
			style="color: black; text-decoration: none; font-weight: bold; font-size: 2rem;">공지사항</a>
		<div>
			<div class="card-body">
				<div class="card-header"
					style="display: flex; padding: 0.75rem 0.75rem;">
					
					<div style="font-size: 20px; font-weight: bold; width: 100%;">
						${notice.noticeTitle }
						<div style="float: right; font-weight: normal; font-size: 12px; margin-top: 6px;">
							조회수&nbsp;${notice.readcount }</div>
					</div>
				</div>
				<div style="padding: 0.75rem;">
					<a href="userPage?userNickname=${notice.userNickname}"
						onMouseover="this.style.fontWeight='bold'"
						onMouseout="this.style.fontWeight=''"
						style="color: black; text-decoration: none;">${notice.userNickname }</a>&nbsp;&nbsp;${notice.noticeRegdate }
				</div>	
				
				<div class="card-body" style="padding: 0.75rem;" row="10">
					${notice.noticeContent }
				</div>
			</div>
			
			<div class="form-group" style="margin-left: auto; margin-right: 2rem;">
				<div class="text-right">
					<a href="noticeList?page=${page }" class="btn btn-primary" style="width: 100px;">글목록</a>
					<c:if test="${notice.userNickname == user.userNickname }">
						<a href="updateNoticeView?noticeNo=${notice.noticeNo}" class="btn btn-success" style="width: 100px;">수정하기</a>
						<a href="deleteNoticeBoard?noticeNo=${notice.noticeNo}"	class="btn btn-danger" style="width: 100px;">삭제하기</a>
					</c:if>
					<br><br>
				</div>
			</div>
			</div>
			<br><br>		
		</div>
	<br><br><br>
</body>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</footer>
</html>
