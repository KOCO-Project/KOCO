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

.seopLabel {
	align-self: center;
	width: 30%;
}

.seopBody {
	text-align: -webkit-center;
}

label {
	float: left;
}
</style>

<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
	
	function del(userNo) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='adminUserDelete?userNo='+userNo;
		}
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin get user</title>
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
					<a href="adminUserList" class="header"
						style="color: black; text-decoration: none; font-weight: bold;">유저관리</a>
				</h1>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-1"></div>
					<br>
					<div class="col-md-10">
						<table class="table table">
							<th scope="col">유저 상세 정보 보기</th>
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
							<div class="seopBody">
								<div class="form-group">
									<div class="seopLabel">
										<label>User ID</label> <input type="text" class="form-control"
											value="${getUser.userId}" readonly="readonly"
											style="font-size: 10px;" />
									</div>
								</div>

								<div class="form-group">
									<div class="seopLabel">
										<label>User NAME</label> <input type="text"
											class="form-control" value="${getUser.userNickname }"
											readonly="readonly" style="font-size: 10px;" />
									</div>
								</div>

								<div class="form-group">
									<div class="seopLabel">
										<label>User PW</label> <input type="password"
											class="form-control" value="${getUser.userPw }"
											readonly="readonly" style="font-size: 10px;" />
									</div>
								</div>

								<div class="form-group">
									<div class="seopLabel">
										<label>User EMAIL</label> <input type="text"
											class="form-control" value="${getUser.userEmail }"
											readonly="readonly" style="font-size: 10px;" />
									</div>
								</div>

								<div class="form-group">
									<div class="seopLabel">
										<label>User REGDATE</label> <input type="text"
											class="form-control" value="${getUser.userRegdate }"
											readonly="readonly" style="font-size: 10px;" />
									</div>
								</div>

								<div class="form-group">
									<div class="seopLabel">
										<label>User STATUS</label> 
										<c:if test="${getUser.userStatus == 1}">
										<input type="text"
											class="form-control" value="활성 계정"
											readonly="readonly" style="font-size: 10px;" />
										</c:if>
										<c:if test="${getUser.userStatus == 2}">
										<input type="text"
											class="form-control" value="비활성 계정"
											readonly="readonly" style="font-size: 10px;" />
										</c:if>
									</div>
								</div>

								<div class="form-group">
									<div class="seopLabel">
										<label>User CASE</label> 
										<c:if test="${getUser.userCase == 1}">
										<input type="text"
											class="form-control" value="관리자"
											readonly="readonly" style="font-size: 10px;" />
										</c:if>
										<c:if test="${getUser.userCase == 0}">
										<input type="text"
											class="form-control" value="일반 유저"
											readonly="readonly" style="font-size: 10px;" />
										</c:if>
									</div>
								</div>
							</div>

							<br> <br> <br>
							<div class="form-group">
								<div class="text-right">
									<button type="button" class="btn btn-primary"
										onClick="goBack()">목록보기</button>
									<a href="userUpdateForm?userNo=${getUser.userNo}"
										class="btn btn-info">수정하기</a> 
										
<%-- 										<a href="adminUserDelete?userNo=${getUser.userNo}" class="btn btn-danger">삭제하기</a> --%>
										<input type="button" class="btn btn-danger" value="삭제하기" onclick="del(${getUser.userNo})">
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
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
