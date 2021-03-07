<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
.mypage #about{height: 100%;position: relative;width:100%;height:49rem ;}
.mypage #about{height: 100%;background:url('images/bg6.png')bottom center fixed no-repeat;background-size:cover;}
#welcome{line-height: 15rem;height: 15rem;}
.row{background-color: #fff;padding: 3rem;height: 50rem;}
.mypage h1{color: #fff;line-height: inherit;}
ul{list-style: none;padding-left: 0px;}
ul li{line-height: 3rem;}
ul.infoform{list-style: none;display: flex;}
#info ul li{line-height: inherit;}
table.infobox{margin: auto;width: 100%;}
table.infobox thead tr{line-height: 100px;}
table.infobox tbody tr{line-height: 100px;}
table.infobox tbody tr td a{font-size: 3rem;}
table.infobox tbody tr td a:hover{text-decoration: none;}
</style>
<meta charset="UTF-8">
<title>KOCO❤USERPAGE❤</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<script>
</script>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>


<div class="mypage">

<div id="about">
<div class="col-md-12" id="welcome">
	<h1 class="text-center">Welcome to ${user.userNickname }'s</h1>
</div>
<div class="row">
	<div class="col-md-3 cc_cursor"></div>
	<div class="col-md-6 cc_cursor">
	<div class="row" style="height: 40rem;">
		<div class="col-md-6" style="height: fit-content;">
		<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded-circle cc_cursor" style="height: 200px;"/>
		</div>
		<div class="col-md-6" style="min-height: 40%;">
			<ul>
			<li><strong>NAME : ${user.userNickname }</strong></li>
			<li>MAIL : ${user.userEmail }</li>
			<li>SINCE : ${user.userRegdate }</li>
			<li>" put ur message here "</li>
			</ul>
		</div>
		<div class="row" style="height: auto;padding: 0;width: 100%;"><div class="col-md-12">
		<table class="infobox">
		<thead>
		<tr>
			<th><button type="button" class="btn btn-primary btn-lg" style="width: 100px;">팔로워수</button></th>
			<th><button type="button" class="btn btn-primary btn-lg" style="width: 100px;">팔로잉수</button></th>
		</tr></thead><tbody><tr>
			<td><a href="followerList?toFollow=${selectUser }">1234${followerCnt }</a></td>
			<td><a href="followingList?fromFollow=${selectUser }">1234${followingCnt }</a></td>
		</tr></tbody>
		</table>

		</div></div>
	</div>
	</div>
<div class="col-md-3 cc_cursor" style="height: 100%;"></div>
</div>
</div>

</div>
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>


</body>
</html>