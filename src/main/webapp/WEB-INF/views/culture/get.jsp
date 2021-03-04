<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Culture getBoard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
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
				<div class="card border-light mb-12" style="max-width: 100%;">
					<div class="card-header" style="font-weight: bold;">[culturePick] &nbsp;CultureBoard</div>
					<div class="card-body">
						<h4 class="card-title">${culture.cultureTitle}</h4>
						<h4 class="card-title" style="font-size: 12px;">${culture.userNo} &nbsp; ${culture.cultureRegdate }</h4>
						<p class="card-text">${culture.cultureContent }</p>
						<div class="form-group">
							<div class="text-right">
								<a href="cultureList" class="btn btn-primary">목록보기</a> <a
									href="cultureUpdateBoardForm?cultureNo=${culture.cultureNo}"
									class="btn btn-info">수정하기</a> <a
									href="deleteCultureBoard?cultureNo=${culture.cultureNo}"
									class="btn btn-danger">삭제하기</a>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
