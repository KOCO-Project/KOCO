<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
div.card.border-light.mb-12 div.card-body h5 {margin: 0;font-size: 0.8rem;display: inline-flex;}
html, body {position: absolute;height: 100%;width: 100%;}
.seopLabel {align-self: center;width: 30%;}
.seopBody {text-align: -webkit-center;}
label {float: left;}
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
			return true;
		}else{
			return false;
		}
	}
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin get user</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
							<th scope="col">유저 상세 정보</th>
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

								<!--↓ 권한과 계정 상태에 따른 최초 select 값을 불러들여온 값에 맞게 출력할 수 있도록 조건문 설정 ↓-->
								<div class="form-group">
									<div class="seopLabel">
										<label>User STATUS</label> 
										<c:if test="${getUser.userStatus == 1}">
											<input type="text"class="form-control" value="활성 계정" readonly="readonly" style="font-size: 10px;" />
										</c:if>
										<c:if test="${getUser.userStatus == 2}">
											<input type="text" class="form-control" value="비활성 계정" readonly="readonly" style="font-size: 10px;" />
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
									<a href="adminUserList" class="btn btn-primary">목록보기</a>
									<a href="adminUserUpdateForm?userNo=${getUser.userNo}"
										class="btn btn-info">수정하기</a> 
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
</body>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</html>
