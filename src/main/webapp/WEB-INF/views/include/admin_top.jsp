<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page TOP</title>
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>

	<div class="container-fluid">
		<div class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="col-md-1">
				<div class="row">
					<div class="col-md-12">
						<a class="btn btn-secondary" style="width: 100%;"
							href="${root }main">HOME</a>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="row">
					<div class="col-md-12" style="top: 4px;">
						<h3 style="color: white;">KOCO ADMIN TOP TEST PAGE</h3>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="row" style="float: right;">
					<div class="col-md-12" style="top: 4px;">
						<h3 style="color: white; font-size: 20px;">adminName 관리자님
							환영합니다.</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="col-md-1">
				<a href="adminMain" class="btn btn-secondary" style="width: 100%;">회원관리</a>
			</div>
			<div class="col-md-1">
				<a href="adminFreeList" class="btn btn-secondary"
					style="width: 100%;">자유게시판</a>
			</div>
			<div class="col-md-1">
				<a href="adminQnaList" class="btn btn-secondary"
					style="width: 100%;">질문게시판</a>
			</div>
			<div class="col-md-1">
				<a href="adminEventList" class="btn btn-secondary"
					style="width: 100%;">이벤트게시판</a>
			</div>
			<div class="col-md-1">
				<a href="adminNotiList" class="btn btn-secondary"
					style="width: 100%;">공지사항</a>
			</div>
			<div class="col-md-1">
				<a href="cultureList" class="btn btn-secondary" style="width: 100%;">문화게시판</a>
			</div>
			<div class="col-md-1">
				<a href="seasonList" class="btn btn-secondary" style="width: 100%;">계절게시판</a>
			</div>
			<div class="col-md-1">
				<a href="adminTest" class="btn btn-secondary" style="width: 100%;">test</a>
			</div>

		</div>
	</div>
</body>
</html>