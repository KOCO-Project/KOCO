<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html body p {
	margin: 0;
	pointer-events: none;
}

html body {
	background-color: #3e3f3a !important;
}

.jb-wrap {
	position: relative;
}

.jb-wrap img {
	width: 100%;
	vertical-align: middle;
}

.jb-text {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	z-index: 20;
	letter-spacing: 10px;
}

div.jb-wrap div.jb-text h6 {
	font-size: 40px;
	font-weight: bold;
}
</style>
<meta charset="UTF-8">
<title>Season Board Main</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="jb-wrap">
		<div class="jb-image">
			<img src="${root }/images/cultureMainTop.png"
				style="width: 100%; height: 100%;" />
		</div>
		<div class="jb-text">
			<h6>대한민국 계절</h6>
		</div>
	</div>


	<c:forEach items="${seasonList}" var="season">
		<c:if test="${season.seasonPick  == 1}">
			${season.seasonContent}
		</c:if>
	</c:forEach>

	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>