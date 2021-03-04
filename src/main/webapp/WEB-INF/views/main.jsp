<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/> <!-- 절대경로구하기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOCO</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu2.jsp"/>


홈<a href="loginView">로그인</a><a href="registerView">회원가입</a>


<header>
	<%-- <c:import url="/WEB-INF/views/include/top_menu.jsp"/> --%>
</header>
<main>
	<%-- <c:import url="/WEB-INF/views/${ }.jsp"/> --%>
</main>
<footer>
	<%-- <c:import url="/WEB-INF/views/include/bottom_info.jsp"/> --%>
</footer>
</body>
</html>