<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath}/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Season Register Form</title>
</head>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form action='seasonRegister' method='post'>
							<input type="hidden" name="userNo" value="1">
							<div class="form-group">
								<td>제목</td> 
								<input type="text" class="form-control" required = "required" name="seasonTitle" />
							</div>
							<div class="form-group">
								<td>내용</td>
								<textarea class="form-control" name="seasonContent" required = "required"></textarea>
							</div>
							<ul>
								<div class = "form-group">
									<div class="text-right">
										<select name="seasonStatus" required="required">
											<option value="">계절 선택</option>
											<option value="1">봄</option>
											<option value="2">여름</option>
											<option value="3">가을</option>
											<option value="4">겨울</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-right">
										<button type="submit" class="btn btn-primary">작성하기</button>
									</div>
								</div>
							</ul>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>