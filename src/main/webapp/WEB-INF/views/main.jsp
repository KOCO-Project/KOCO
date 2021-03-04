<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/> <!-- 절대경로구하기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
main {
	height: 100%;
	width: 100%;
}

html, body {
	position: absolute;
	height: 100%;
	width: 100%;
}

footer {
	text-align: center;
	padding: 3rem;
	color: #8e8c84 !important;
	background-color: #3e3f3a;
}
footer ul{
	list-style: none;
    padding-left:0px;
    display: flex;
    justify-content: space-evenly;
    width: 40%;
    margin: 1rem auto;
}
footer ul li a img{
width: 30px; height: 30px;
}
</style>
<title>KOCO</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<header>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
</header>
<main>
	<%-- <c:import url="/WEB-INF/views/${ }.jsp"/> --%>
</main>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</body>
</html>