<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* html, body {
	position: absolute;
	height: 100%;
	width: 100%;
}
.row{
height: 100%;
padding:2rem;
background-color: #fff;}
.col-md-4{text-align: center;}
ul{
list-style: none; padding: 0px;
}
#nav{
position: fixed;
margin-top: 10%;
    padding-left: 1rem;
    width: 20%;}
#nav a{
font-size: 1.2rem;
padding-left: 40%;
}
#nav.col-md-12 ul li{
    height: 3rem;
    width: 100%;
} */
body{height: 100%;}
html{height: 100%;}
.text.active{opacity: 1;}
.text{
    display: none;
    background-color: black;
    position: relative;
    top:61%;
    height: 21%;
    padding: 3rem;
    opacity: 0.5;
    }
.mypage{height: 100%; text-align: center;}
.mypage #about,.mypage #follow,.mypage #bookmark,.mypage #info{height: 100%;position: relative;width:100%;height:49rem ;}
.mypage #about{height: 99%;background:url('images/bg2.png')bottom center fixed no-repeat;background-size:cover;}
.mypage #follow{height: 100%;background:url('images/bg3.png')bottom center fixed no-repeat;background-size:cover;}
.mypage #bookmark{height: 100%;background:url('images/bg4.png')bottom center fixed no-repeat;background-size:cover;}
.mypage #info{height: 100%;background:url('images/bg5.png')bottom center fixed no-repeat;background-size:cover;}
.mypage p{font-family:Georgia, 'Times New Roman', Times, serif}
.mypage_nav{position: fixed; height: 10rem; z-index: 1; top:40%; margin-top: auto; line-height: 3rem; padding-left: 2rem;}
.mypage_nav{list-style: none; margin-left: 5%; text-decoration: none;font-size: 1rem;}
.mypage_nav a{color: #3e3f3a;}
.mypage_nav a:hover{font-size: 1.2rem;color: #3e3f3a; text-decoration: none;font-weight: 700;}
#welcome{line-height: 15rem;height: 16rem;}
.row{background-color: #fff;padding: 5rem;height: 50rem;}
.mypage h1{color: #fff;line-height: inherit;}
ul{list-style: none;padding-left: 0px;}
ul li{line-height: 3rem;}
ul.infoform{list-style: none;display: flex;}
#info ul li{line-height: inherit;}
table.infobox{margin: auto;width: 100%;}
table.infobox tbody tr{line-height: 100px;}
table.infobox tbody tr td a{font-size: 3rem;}
table.infobox tbody tr td a:hover{text-decoration: none;}
</style>
<meta charset="UTF-8">
<c:choose>
<c:when test="${user.userNickname == selectUser.userNickname}">
<title>KOCO❤MYPAGE❤</title>
</c:when>
<c:otherwise>
<title>KOCO❤USERPAGE❤</title>
</c:otherwise>
</c:choose>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
$(function(){
	var nickCheck = "true";
	var nickname = $('#currentNick').val();
	
	$('a[href^="#"]').on('click', function (e){
		e.preventDefault();
		
		var target = this.hash;
		var $target = $(target);
		
		$('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 800, 'swing', function () {
            window.location.hash = target;
        });
	});
	
	$('#followbtn').on('click', function follow(){
		var selectUser = $('#selectUser').val();
		
		$.ajax({
			url: 'follow?toFollow=' + selectUser,
			type: 'get',
			dataType: 'text',
			success: function(data){
				console.log(data);
				$('#followyn').load(location.href + " #followyn");
				$('#cnt').load(location.href + " #cnt");
			}
		});
	});
	
	$('#unfollowbtn').on('click', function unfollow(){
		var selectUser = $('#selectUser').val();
		
		$.ajax({
			url: 'unfollow?toFollow=' + selectUser,
			type: 'get',
			dataType: 'text',
			success: function(data){
				console.log(data);
				$('#followyn').load(location.href + " #followyn");
				$('#cnt').load(location.href + " #cnt");
			}
		});
	});
	
	$('#userNickname').on('blur', function userNicknameExist(){
		var userNickname = $('#userNickname').val();
		if(userNickname == ""){
			$('#nickCheck').text('NickName을 입력해주세요.');
			$('#nickCheck').css('color', '#55B836');
			return false;
		}
		
		$.ajax({
			url: 'userNicknameExist',
			type: 'post',
			data: {
				'userNickname': userNickname
			},
			dataType: 'text',
			success: function(data){
				console.log(data);
				if(data == 1){
					$('#nickCheck').text('사용 가능한 NickName 입니다.');
					$('#nickCheck').css('color', '#55B836');
					nickCheck = "true";
				} else {
					if(nickname == userNickname){
						nickCheck = "true";
					} else {
						$('#nickCheck').text('이미 존재하는 NickName 입니다.');
						$('#nickCheck').css('color', 'red');
						nickCheck = "false";
					}
				}
			},
			error: function(data){
				console.log('error');
			},
			failure: function(data){
				console.log('fail');
			}
		});
	});
	
	$('#userUpdate').on('click', function userUpdate(){
		if(nickCheck == "true"){
			$('#form1').submit();
			alert('수정되었습니다. 로그아웃 됩니다.');
		} else {
			alert('닉네임 및 이메일 중복확인을 해주세요.');
		}
	});
});
</script>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
<input type="hidden" value="${selectUser.userNickname }" id="selectUser">
<c:choose>
<c:when test="${user.userNickname == selectUser.userNickname}">
<ul class="mypage_nav">
<li><a href="#about">프로필</a></li>
<li><a href="#bookmark">즐겨찾기</a></li>
<li><a href="#info">닉네임 및 비밀번호 변경</a></li>
</ul>
</c:when>
<c:otherwise>
<ul class="mypage_nav">
<li><a href="#about">프로필</a></li>
</ul>
</c:otherwise>
</c:choose>
<div class="mypage">

<div id="about">
<div class="col-md-12" id="welcome">
<c:choose>
<c:when test="${user.userNickname == selectUser.userNickname}">
	<h1 class="text-center">Hello, ${user.userNickname }</h1>
</c:when>
<c:otherwise>
	<h1 class="text-center">Welcome to ${selectUser.userNickname }'s</h1>
</c:otherwise>
</c:choose>
</div>
<div class="row">
	<div class="col-md-3 cc_cursor"></div>
	<div class="col-md-7 cc_cursor" style="padding-top: 5rem;">
	<div class="row"style="padding: 0;height: auto;">
		<div class="col-md-5" style="height: 40%;">
		<c:if test="${selectUser.userNo == '1' or selectUser.userNo == '26'}">
			<img src="images/profile.png" class="rounded-circle cc_cursor" style="height: 200px;width: 200px;"/>
		</c:if>
		<c:if test="${selectUser.userNo == '32' }">
			<img src="images/team/developer_seop.jpg" class="rounded-circle cc_cursor" style="height: 200px;width: 200px;"/>
		</c:if>
		<c:if test="${selectUser.userNo == '27' }">
			<img src="images/team/jiwon.jpeg" class="rounded-circle cc_cursor" style="height: 200px;width: 200px;"/>
		</c:if>
		<c:if test="${selectUser.userNo == '36' }">
			<img src="images/team/developer_Ayoung.jpg" class="rounded-circle cc_cursor" style="height: 200px;width: 200px;"/>
		</c:if>
		<c:if test="${selectUser.userNo == '28' }">
			<img src="images/team/sanga.jpeg" class="rounded-circle cc_cursor" style="height: 200px;width: 200px;"/>
		</c:if>
		</div>
		<div class="col-md-7" style="height: 40%;">
			<ul>
			<c:if test="${user.userNickname == selectUser.userNickname}">
			<li>ID : ${user.userId }</li>
			</c:if>
			<li><strong>NAME : ${selectUser.userNickname }</strong></li>
			<li>MAIL : ${selectUser.userEmail }</li>
			<li>SINCE : ${selectUser.userRegdate }</li>
			</ul>
		</div>
		<div class="col-md-5" style="margin-top: 1rem;">
		<div id="followyn">
		<c:if test="${user.userNickname != selectUser.userNickname && followyn == 0}"> 
		  <button type="button" class="btn btn-danger" style="width: 100px;" id="followbtn">팔로우</button>
		</c:if>
		<c:if test="${user.userNickname != selectUser.userNickname && followyn == 1}">
		  <button type="button" class="btn btn-danger" style="width: 100px;" id="unfollowbtn">언팔로우</button>
		</c:if>
		</div>
		</div><div class="col-md-2"> </div>
		<div class="row" style="height: auto;padding: 0;width: 100%;margin-top: 3rem;"><div class="col-md-12">	
		<div id="cnt">
		<table class="infobox">
		<thead>
		<tr>
			<th><a>팔로워</a></th>
			<th><a>팔로잉</a></th>
		</tr></thead><tbody><tr>
			<td><a href="followerList?toFollow=${selectUser.userNickname }">${followerCnt }</a></td>
			<td><a href="followingList?fromFollow=${selectUser.userNickname }">${followingCnt }</a></td>
		</tr></tbody>
		</table>
		</div>
		</div></div>
	</div>
	</div>
<div class="col-md-2 cc_cursor" style="height: 100%;"></div>
</div>
</div>

<c:choose>
<c:when test="${user.userNickname == selectUser.userNickname}">
<div id="bookmark">
<div class="col-md-12" id="welcome">
	<h1 class="text-center">Your favorite</h1>
</div>
<div class="row">
	<div class="col-md-2 cc_cursor" style="height: 100%;"></div>
	<div class="col-md-8 cc_cursor" style="height: 100%;">

<table class="table table-hover" id='board_list' style="border-bottom: 1px solid #dfd7ca;">
	<thead>
	<tr>
		<th class="text-center d-none d-md-table-cell">카테고리</th>	
		<!-- <th class="text-center d-none d-md-table-cell">글번호</th> -->
		<th class="w-50">제목</th>
		<th class="text-center d-none d-md-table-cell">작성자</th>
		<th class="text-center d-none d-md-table-cell">삭제</th>
	</tr>
	</thead>
	<tbody>
	<%-- <c:forEach var='' items=""> --%>
	<c:forEach items="${bookmarklist}" var="bookmark">
	<tr>
		<td class="text-center d-none d-md-table-cell"><c:out value="${bookmark.categoryName}"/></td>
		<c:if test="${bookmark.categoryName == '이벤트게시판' }">
			<td><a href='/KOCO/eventGet?boardNo=${bookmark.boardNo}'><c:out value="${bookmark.boardTitle}"/></a></td>
		</c:if>
		<c:if test="${bookmark.categoryName == '자유게시판' }">
			<td><a href='getFreeBoard?boardNo=${bookmark.boardNo}'><c:out value="${bookmark.boardTitle}"/></a></td>
		</c:if>
		<td class="text-center d-none d-md-table-cell" style="color: #325d88;font-weight: 500;"><a href="userPage?userNickname=${bookmark.writer }" style="color: #325d88"><c:out value="${bookmark.writer}"/></a></td>
		<td class="text-center d-none d-md-table-cell"><a href="#" style="color: red;font-weight: 500;">삭제</a></td>
	</tr>
	</c:forEach>
	<%-- </c:forEach> --%>
	</tbody>
</table>		
		
		
	</div>

<div class="col-md-2 cc_cursor"></div>
</div>
</div>

	
	
	
<div id="info">
<div class="col-md-12" id="welcome">
	<h1 class="text-center">Only I can change my life</h1>
</div>
<div class="row">
	<div class="col-md-3 cc_cursor" style="height: 100%;"></div>
	<div class="col-md-6 cc_cursor" style="height: 100%;">
	
<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded-circle cc_cursor" style="height: 200px;"/>

	
<form role="form" style="margin-top: 1rem;" id="form1" action="userUpdate">
<input type="hidden" id="currentNick" name="oldNick" value="${user.userNickname }">
<input type="hidden" name="userId" value="${user.userId }">
<!--    <div class="form-group"> -->
<!--    	  <label for="">ID (변경불가)</label> -->
<%--       <input type="text" class="form-control" name="userId" value="${user.userId }"  style="text-align: center;" readonly="readonly"/>       --%>
<!--    </div> -->
   <div class="form-group">
      <label for="">Name</label>
      <ul class="infoform">
      <li style="width: 100%;"><input type="text" class="form-control" id="userNickname" name="newNick" value="${user.userNickname }" style="text-align: center;"/>
      </li>
  <!--     <li><button type="submit" class="btn btn-primary"style="width: 80px;">변경하기</button></li> -->
      </ul>
   </div>
   <div style="height:0;"><span id="nickCheck" style="text-align:center; font-size:11px"></span></div>
<!--    <div class="form-group"> -->
<!--       <label for="">Email Address</label> -->
<%--       <input type="email" class="form-control" id="userEmail" name="userEmail" value="${user.userEmail }" style="text-align: center;" readonly="readonly"/> --%>
<!--    </div> -->
   <div class="form-group">
      <ul class="infoform">      
      <li><button type="button" class="btn btn-danger"style="width: 100px;" onclick="location.href='pwUpdateView'">비밀번호변경</button></li>
      </ul>   
   </div>
   
      <button type="button" class="btn btn-primary" id="userUpdate" style="width: 100px;">Submit</button>
      <button type="button" class="btn btn-primary" style="width: 100px;" onclick="history.back()">Cancel</button>
</form>


	</div>
<div class="col-md-3 cc_cursor"></div>

</div>

</div>
<br><br><br>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</c:when>
</c:choose>
</div>
<br><br><br>
</body>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
</html>