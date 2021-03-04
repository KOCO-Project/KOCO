<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get admin test</title>
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
					<div class="card-header" style="font-weight: bold;">adminTest</div>
					<div class="card-body">
						<h4 class="card-title">제목</h4>
						<h4 class="card-title" style="font-size: 15px;">유저이름 / 업로드일</h4>
						<p class="card-text">내용</p>
						<div class="form-group">
							<div class="text-right">
								<a href="adminTest" class="btn btn-primary">목록보기</a> 
								<a href="" class="btn btn-info">수정하기</a> 
								<a href="" class="btn btn-danger">삭제하기</a>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>

	<!--댓글 관련 css -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12" style="top: 30px;">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-11" style="height: 100px;">
								<input type="text" value="댓글을 입력해주세요"
									style="width: 100%; height: 100%;">
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-success">작성완료</button>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-12" style="top: 30px;">
								<div class="row">
									<div class="col-md-3">
										<h3>부모댓글 이름 / 날짜</h3>
									</div>
									<div>
										<button type="button" class="btn btn-info">수정</button>
									</div>
									<div>
										<button type="button" class="btn btn-danger">삭제</button>
									</div>
									<div>
										<button type="button" class="btn btn-success">대댓글</button>
									</div>
								</div>
								<p style="font-size: 20px;">부모댓글 내용</p>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-11">
										<div class="row">
											<div class="col-md-12">대댓글 입력창</div>
										</div>
										<div class="row">
											<div class="col-md-11" style="height: 80px;">
												<input type="text" value="대댓글 입력창"
													style="height: 60px; width: 100%;">
											</div>
											<div class="col-md-1">
												<button type="button" class="btn btn-success">작성완료</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-11">
										<div class="row">
											<div class="col-md-3">
												<h3>자식댓글 이름 / 날짜</h3>
											</div>
											<div>
												<button type="button" class="btn btn-info">수정</button>
											</div>
											<div>
												<button type="button" class="btn btn-danger">삭제</button>
											</div>
										</div>
										<p style="font-size: 20px;">작식 댓글 내용</p>
									</div>
								</div>
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