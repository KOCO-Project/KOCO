<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
	function follow(){
		var selectUser = $('#selectUser').val();
		
		$.ajax({
			url: 'follow?toFollow=' + selectUser,
			type: 'get',			
			dataType: 'text',
			success: function(data){
				console.log(data);
				$('#cnt').load(location.href +" #cnt a");
				$('#follow').val('언팔로우');
			}
		});
	}
</script>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<input type="hidden" value="${selectUser }" name="selectUser" id="selectUser">
	<div class="container" style="margin-top: 100px">
		<div class="card-body" style="text-align: center;">
		<c:choose>
		<c:when test="${sessionScope.user.userNickname == selectUser}">
			<h2>${user.userNickname }</h2><br>
			<a href="userUpdateView" class="btn btn-primary">개인정보수정</a><br><br>
			<strong>팔로워</strong><strong style="margin-left:70px">팔로잉</strong><br>
			<a href="followerList?toFollow=${selectUser }">${followerCnt }</a><a href="followingList?fromFollow=${selectUser }" style="margin-left:90px;">${followingCnt }</a>
		</c:when>
		<c:otherwise>
			<h2>${selectUser }</h2><br>
			<input type="button" class="btn btn-primary" value="팔로우" id="follow" onclick="follow()"><br><br>
			<strong>팔로워</strong><strong style="margin-left:70px">팔로잉</strong><br>
			<div id="cnt">
			<a href="followerList?toFollow=${selectUser }" id="followerCnt">${followerCnt }</a><a href="followingList?fromFollow=${selectUser }" style="margin-left:90px;">${followingCnt }</a>
			</div>
		</c:otherwise>
		</c:choose>			
		</div>
	</div>
</body>
</html>