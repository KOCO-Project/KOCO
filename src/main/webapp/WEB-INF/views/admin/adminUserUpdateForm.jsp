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
	
	function btnClick(){
		var chk = confirm("정말 수정하시겠습니까?");
		if(chk) {
			$('#adminSubmit').submit();
		}else{
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
						style="color: black; text-decoration: none; font-weight: bold;">회원관리</a>
				</h1>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-1"></div>
					<br>
					<div class="col-md-10">
						<table class="table table">
							<th scope="col">유저 정보 변경</th>
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
					<form action="adminUserUpdate" method="post" id="adminSubmit">
						<input type="hidden" name="userNo" value="${getUser.userNo}">
						<div class="seopBody">
							<div class="form-group">
								<div class="seopLabel">


									<label>User ID</label> 
									<input type="text" class="form-control" value="${getUser.userId}" name="userId" style="font-size: 10px;" />
								</div>
							</div>

							<div class="form-group">
								<div class="seopLabel">
									<label>User NAME</label> 
									<input type="text" class="form-control" value="${getUser.userNickname }" name="userNickname" style="font-size: 10px;" />
								</div>
							</div>

							<div class="form-group">
								<div class="seopLabel">
									<label>User PW</label> 
									<input type="password" class="form-control" value="${getUser.userPw }" name="userPw" style="font-size: 10px;" />
								</div>
							</div>

							<div class="form-group">
								<div class="seopLabel">
									<label>User EMAIL</label> 
									<input type="text" class="form-control" value="${getUser.userEmail }" name="userEmail" style="font-size: 10px;" />
								</div>
							</div>

							<div class="form-group">
								<div class="seopLabel">
									<label>User REGDATE</label> 
									<input type="text" class="form-control" value="${getUser.userRegdate }" style="font-size: 10px;" readonly="readonly"/>
								</div>
							</div>

							<div class="form-group">
								<div class="seopLabel">
									<label>User STATUS</label>
									<select class="form-control" name="userStatus" style="font-size: 10px;">
									<c:if test="${getUser.userStatus == 1}">
										<option value="1">활성</option>
										<option value="2">비활성</option>
									</c:if>
									<c:if test="${getUser.userStatus == 2}">
										<option value="2">비활성</option>
										<option value="1">활성</option>
									</c:if>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="seopLabel">
									<label>User CASE</label>
									<select class="form-control" name="userCase" style="font-size: 10px;">
									<c:if test="${getUser.userCase == 1}">
										<option value="1">관리자</option>
										<option value="0">일반유저</option>
									</c:if>
									<c:if test="${getUser.userCase == 0}">
										<option value="0">일반유저</option>
										<option value="1">관리자</option>
									</c:if>
									</select>
								</div>
							</div>
						</div>
					

					<br> <br> <br>
					<div class="form-group">
						<div class="text-right">
								<button type="button" class="btn btn-info" onclick="btnClick()">수정완료</button>
								<button type="button" class="btn btn-danger" onClick="goBack()">수정취소</button>
						</div>
					</div>
					</form>
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
