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
.mypage #about{height: 100%;background:url('images/bg2.png')bottom center fixed no-repeat;background-size:cover;}
.mypage #follow{height: 100%;background:url('images/bg3.png')bottom center fixed no-repeat;background-size:cover;}
.mypage #bookmark{height: 100%;background:url('images/bg4.png')bottom center fixed no-repeat;background-size:cover;}
.mypage #info{height: 100%;background:url('images/bg5.png')bottom center fixed no-repeat;background-size:cover;}
.mypage p{font-family:Georgia, 'Times New Roman', Times, serif}
.mypage_nav{position: fixed; height: 10rem; z-index: 1; top:40%; margin-top: auto; line-height: 3rem; padding-left: 2rem;}
.mypage_nav{list-style: none; margin-left: 5%; text-decoration: none;font-size: 1rem;}
.mypage_nav a{color: #3e3f3a;}
.mypage_nav a:hover{text-decoration: line-through;}
#welcome{line-height: 15rem;
height: 15rem;
}
.row{background-color: #fff;padding: 5rem;height: 50rem;}
.mypage h1{color: #fff;line-height: inherit;}

ul{
list-style: none;
padding-left: 0px;
}
ul li{line-height: 3rem;}

ul.infoform{
list-style: none;
display: flex;
}
#info ul li{
line-height: inherit;
}

</style>
<meta charset="UTF-8">
<title>KOCO❤MYPAGE❤</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>



<ul class="mypage_nav">
<li><a href="#about">내 프로필</a></li>
<li><a href="#follow">팔로우</a></li>
<li><a href="#bookmark">즐겨찾기</a></li>
<li><a href="#info">개인정보</a></li>
</ul>
<div class="mypage">

<div id="about">
<div class="col-md-12" id="welcome">
	<h1 class="text-center">Hello, User</h1>
</div>
<div class="row">
	<div class="col-md-3 cc_cursor"></div>
	<div class="col-md-7 cc_cursor">
	<div class="row">
		<div class="col-md-5" style="height: 40%;">
		<img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" class="rounded-circle cc_cursor" style="height: 200px;"/>
		</div>
		<div class="col-md-7" style="height: 40%;">
			<ul>
			<li><strong>userName</strong></li>
			<li>e-mail</li>
			<li>reg Date</li>
			</ul>
		</div>
		<div class="row"style="width: 100%;"><div class="col-md-12">
		<button type="button" class="btn btn-primary btn-lg" style="width: 100px;">팔로워수</button>&emsp;&emsp;&emsp;
		<button type="button" class="btn btn-primary btn-lg" style="width: 100px;">팔로잉수</button>
		</div></div>
	</div>
	</div>
<div class="col-md-2 cc_cursor" style="height: 100%;"></div>
</div>
</div>
		
		

		
<div id="follow">
<div class="col-md-12" id="welcome">
	<h1 class="text-center">Who are you following?</h1>
</div>
<div class="row">
	<div class="col-md-3 cc_cursor" style="height: 100%;"></div>
	<div class="col-md-7 cc_cursor" style="height: 100%;">
	<div class="row">
		<div class="col-md-12" style="height: 100%;">
		
		
		
		</div>
	</div>
	</div>
<div class="col-md-2 cc_cursor"></div>
</div>
</div>
	
	
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
		<th class="text-center d-none d-md-table-cell">글번호</th>
		<th class="w-50">제목</th>
		<th class="text-center d-none d-md-table-cell">작성자</th>
		<th class="text-center d-none d-md-table-cell">작성날짜</th>
	</tr>
	</thead>
	<tbody>
	<%-- <c:forEach var='' items=""> --%>
	<tr>
		<td class="text-center d-none d-md-table-cell">1</td>
		<td><a href=''>글 제목</a></td>
		<td class="text-center d-none d-md-table-cell" style="color: #325d88;font-weight: 500;">지원이</td>
		<td class="text-center d-none d-md-table-cell">날짜</td>
	</tr>
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
	
	
<form role="form">
 	<div class="form-group">
      <label for="">Name</label>
      <input type="password" class="form-control" id="" />
   </div>
   <div class="form-group">
      <label for="">Email address</label>
      <input type="email" class="form-control" id="" />
   </div>
   <div class="form-group">
      <label for="">Password</label>
      <ul class="infoform">
      <li style="width: 100%;"><input type="password" class="form-control" id="" /></li>
      <li><button type="submit" class="btn btn-primary"style="width: 80px;">변경하기</button></li>
      </ul>
   </div>
   <div class="form-group">
      <label for="">Password</label>
      <input type="password" class="form-control" id="" />
   </div>
      <button type="submit" class="btn btn-primary" style="width: 100px;">Submit</button>
</form>


	</div>
<div class="col-md-3 cc_cursor"></div>

</div>

</div>


<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>


</body>
</html>