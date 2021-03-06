<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로워</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<h3>${selectUser }님을 팔로우하고 있는 회원</h3>
	<table>
	<c:forEach items="${followerList }" var="list">
		<tr>
			<td>${list.follower }</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>