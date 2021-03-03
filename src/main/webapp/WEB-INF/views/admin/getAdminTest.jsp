<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get admin test</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/admin_top.jsp" />
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="card border-light mb-12" style="max-width: 100%;">
					<div class="card-header" style="font-weight: bold;">adminTest</div>
					<div class="card-body">
						<h4 class="card-title">제목</h4>
						<h4 class="card-title" style="font-size: 15px;">유저이름 / 업로드일</h4>
						<p class="card-text">내용</p>
						<div class="form-group">
							<div class="text-right">
								<a href="adminTest" class="btn btn-primary">목록보기</a> <a href=""
									class="btn btn-info">수정하기</a> <a href="" class="btn btn-danger">삭제하기</a>
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