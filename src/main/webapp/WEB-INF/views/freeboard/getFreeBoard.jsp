<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input {
	border: none;
	background: #fff;
}

h1.card-title {
	font-weight: bold;
	float: left;
}

body {
	text-align: -webkit-center;
}

div#qna.container {
	box-shadow: 3px 3px 15px 0px grey;
	margin-top: 5%;
	max-width: 80%;
}

div.card-body {
	min-height: 200px;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유게시판</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript">
/* 좋아요 */
function like_func(){
  var frm_read = $('#frm_read');
  var boardno = $('#boardno', frm_read).val();
  var userno = $('#userno', frm_read).val();
  console.log("boardno, userno : " + boardno +","+ userno);
  
  $.ajax({
    url: "../liketo/like.do",
    type: "GET",
    cache: false,
    dataType: "json",
    data: 'boardno=' +boardno+ '&userno=' +userno,
    success: function(data) {
      var msg = '';
      var like_img = '';
      msg += data.msg;
      alert(msg);
      
      if(data.like_check == 0){
        like_img = "../images/emptyheart.png";
      } else {
        like_img = "../images/heart.png";
      }      
      $('#like_img', frm_read).attr('src', like_img);
      $('#like_cnt').html(data.like_cnt);
      $('#like_check').html(data.like_check);
    },
    error: function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}

</script> -->
</head>
<body class="seopBody">
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div id="qna" class="container">
		<a href="freeBoardList?infoNo=1" class="header"
			style="color: black; text-decoration: none; font-weight: bold; font-size: 2rem;">자유게시판</a>
		<div>
			<div class="card-body">
				<div class="card-header"
					style="display: flex; padding: 0.75rem 0.75rem;">
					
					<input id="userNo" name="userNo" type="hidden"
						value="${sessionScope.user.userNo }" />

					<div style="font-size: 20px; font-weight: bold; width: 100%;">
						${readContentBean.boardTitle }
						<div
							style="float: right; font-weight: normal; font-size: 12px; margin-top: 6px;">
							조회수&nbsp;${readContentBean.boardReadcount }</div>
					</div>
				</div>
				<div style="padding: 0.75rem;">
					<a href="userPage?userNickname=${readContentBean.writer}"
						onMouseover="this.style.fontWeight='bold'"
						onMouseout="this.style.fontWeight=''"
						style="color: black; text-decoration: none;">${readContentBean.writer }</a>&nbsp;&nbsp;${readContentBean.boardRegdate }
				</div>

				<div class="card-body" style="padding: 0.75rem;" row="10">
					${readContentBean.boardContent }
				</div>
			</div>
			

			<!-- <label for="writer">WRITER</label> <input type="text" id="writer"
				name="writer" class="form-control"
				value="${readContentBean.writer }" disabled="disabled" />
		</div>
	</div>
	
	<div class="col-md-3">
		<div class="form-group">
			<label for="boardRegdate">DATE</label> <input type="text"
				id="boardRegdate" name="boardRegdate" class="form-control"
				value="${readContentBean.boardRegdate }" disabled="disabled" />
		</div>
	</div>
	<div class="col-md-2">
		<label for="boardReadcount">조회수</label> <input type="text"
			id="boardReadcount" name="boardReadcount" class="form-control"
			value="${readContentBean.boardReadcount }" disabled="disabled" />
	</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="boardTitle">TITLE</label> <input type="text"
					id="boardTitle" name="boardTitle" class="form-control"
					value="${readContentBean.boardTitle }" disabled="disabled" />
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="boardContent">CONTENT</label>
		<textarea rows="boardContent" name="boardContent" class="form-control"
			rows="10" style="resize: none" disabled="disabled">${readContentBean.boardContent }</textarea>
	</div> -->
	<%-- <div class="div1">
							<div class="div2">
							<div class="div3">
							<c:choose>
							
							<c:when test="${userNo ne null }">
								<a href='javascript: like_func();'><img id="heart_img" src="../images/emptyheart.png"></a>
							</c:when>
							
							<c:otherwise>
								<a href='javascript: login_need();'><img src="../images/emptyheart.png"></a>
							</c:otherwise>
							
							</c:choose>
							</div>
							</div>
							</div> --%>
							
	<div class="form-group" style="margin-left: auto; margin-right: 2rem;">
		<div class="text-right">
			<a href="freeBoardList?infoNo=1&page=${page }"
				class="btn btn-primary" style="width: 100px;">글목록</a>
			<c:if test="${sessionScope.user.userNo == readContentBean.userNo }">
				<a href="freeBoardUpdate?infoNo=1&boardNo=${boardNo}&page=${page}"
					class="btn btn-success" style="width: 100px;">수정하기</a>
				<a href="freeBoardDelete?infoNo=1&boardNo=${boardNo}"
					class="btn btn-danger" style="width: 100px;">삭제하기</a>
			</c:if>
			<br><br>
		</div>
	</div>
	</div>
	<br><br>	
	</div>

	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>