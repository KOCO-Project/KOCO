<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로잉</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div style="min-height: 30rem;">
		<div style="text-align: -webkit-center; margin-top: 5%;">
			<div class="card border-dark mb-3"
				style="max-width: 50%; text-align: center;">
				<div class="card-header">"${selectUser }" 님을 팔로우 하고 있는 회원</div>
				<div class="card-body">
					<c:forEach items="${followingList }" var="list">
						<p class="card-text">
							<a href="userPage?userNickname=${list }"
								onMouseover="this.style.fontWeight='bold'"
								onMouseout="this.style.fontWeight=''"
								style="color: black; text-decoration: none; font-size: 13px;">${list }</a>
						</p>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
</body>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</footer>
</html>