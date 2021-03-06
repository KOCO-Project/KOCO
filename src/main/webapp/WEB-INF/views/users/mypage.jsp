<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: center;">
		<c:choose>
		<c:when test="${sessionScope.user.userNickname == selectUser}">
			<h2>${user.userNickname }</h2><br>
			<a href="userUpdateView" class="btn btn-primary">개인정보수정</a><br><br>
			<strong>팔로워</strong>&emsp;&emsp;&emsp;&emsp;&emsp;<strong>팔로잉</strong>
		</c:when>
		<c:otherwise>
			<h2>${selectUser }</h2><br>
			<a href="follow?toFollow=${selectUser }" class="btn btn-primary">팔로우</a><br><br>
			<strong>팔로워</strong>&emsp;&emsp;&emsp;&emsp;&emsp;<strong>팔로잉</strong><br>
			<a href="followerList?toFollow=${selectUser }">112</a>&emsp;&emsp;&emsp;&emsp;&emsp;<a href="#">132</a>
		</c:otherwise>
		</c:choose>			
		</div>
	</div>
</body>
</html>