<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div.card.border-light.mb-12 div.card-body h5 {
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

<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Season getBoard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/footer.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/admin_top2.jsp" />
	<br>
	<br>
	<br>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1>
					<a href="seasonList" class="header"
						style="color: black; text-decoration: none; font-weight: bold;">계절게시판</a>
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
						<div class="card-header" style="font-weight: bold;">SeasonBoard</div>
						<div class="card-body">
							<h4 class="card-title">

								<c:if test="${season.seasonPick  == 1}">
									<th scope="row">
										<h5>[</h5>
										<h5 style="color: red; font-weight: bold;">Main</h5>
										<h5>]&nbsp;&nbsp;&nbsp;</h5>
									</th>
								</c:if>
								<h9 style="font-size: 20px;font-weight: bold; ">${season.seasonTitle}</h9>

							</h4>
							<h4 class="card-title" style="font-size: 12px;">${season.userNickname}&nbsp;
								${season.seasonRegdate }</h4>
							<p class="card-text">${season.seasonContent }</p>

							<c:set var="seasonNumber" value="${season.seasonStatus}" />
							<div class="text-right">
								<select name="seasonStatus" disabled="disabled">
									<option value="1"
										<c:if test="${seasonNumber eq '1'}">selected</c:if>>봄</option>
									<option value="2"
										<c:if test="${seasonNumber eq '2'}">selected</c:if>>
										여름</option>
									<option value="3"
										<c:if test="${seasonNumber eq '3'}">selected</c:if>>
										가을</option>
									<option value="4"
										<c:if test="${seasonNumber eq '4'}">selected</c:if>>
										겨울</option>
								</select>
							</div>
							<br>

							<div class="form-group">
								<div class="text-right">
									<button type="button" class="btn btn-primary"
										onClick="goBack()">목록보기</button>
									<a href="seasonUpdateBoardForm?seasonNo=${season.seasonNo}"
										class="btn btn-info">수정하기</a> <a
										href="deleteSeasonBoard?seasonNo=${season.seasonNo}"
										class="btn btn-danger">삭제하기</a>
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
