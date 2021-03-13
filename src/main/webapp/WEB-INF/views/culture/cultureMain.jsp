<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
html body p{margin: 0;pointer-events : none;}
html body{background-color: white;}
.jb-wrap {position: relative;}
.jb-wrap img {width: 100%;vertical-align: middle;}
.jb-text {position: absolute;top: 50%;left: 50%;transform: translate( -50%, -50% );color: white;z-index: 20;letter-spacing: 10px;}
div.jb-wrap div.jb-text h6{font-size: 30px; font-weight: bold;}
</style>

<meta charset="UTF-8">
<title>Culture Board Main</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	
	
	<div class="jb-wrap">
		<div class="jb-image"><img src="${root }/images/top_main.1.png" style="width: 100%; height: 100%;"/></div>
			<div class="jb-text" >
				<h6>대한민국 문화</h6>
			</div>
	</div>
	
	<!--↓ 문화 메인페이지에서는 유저들에게 보여줄 게시글의 CONTENT만 출력, main에 보여줄 게시글을 구분하기 위해 pick의 1 값의 게시물만 출력 ↓-->
	<c:forEach items="${cultureList}" var="culture">
		<c:if test="${culture.culturePick  == 1}">
			<div>${culture.cultureContent}</div>
		</c:if>
	</c:forEach>
	
</body>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</html>