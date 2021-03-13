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

#panel, #flip {
	padding: 5px;
	text-align: center;
	background-color: #e5eecc;
	border: solid 1px #c3c3c3;
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

<script type="text/javascript">

function filp(groupNo){
	$('#panel'+groupNo).slideToggle('slow');
}

</script>
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
					${readContentBean.boardContent }</div>
			</div>




			<div class="form-group"
				style="margin-left: auto; margin-right: 2rem;">
				<div class="text-right">
					<a href="freeBoardList?infoNo=1&page=${page }"
						class="btn btn-primary" style="width: 100px;">글목록</a>
					<c:if test="${sessionScope.user.userNo == readContentBean.userNo }">
						<a href="freeBoardUpdate?infoNo=1&boardNo=${boardNo}&page=${page}"
							class="btn btn-success" style="width: 100px;">수정하기</a>
						<a href="freeBoardDelete?infoNo=1&boardNo=${boardNo}"
							class="btn btn-danger" style="width: 100px;">삭제하기</a>
					</c:if>
					<br> <br>
				</div>
			</div>
		</div>
		<br> <br>

		<!--댓글 입력 창 -->

		<div id="comment" style="text-align: -webkit-center;">
			<div>
				<form action="freeCommentRegister" method="post"
					style="width: 100%; place-content: center;">
					<input type="hidden" name="depth" value="0"> <input
						type="hidden" name="boardCategory" value="1"> <input
						type="hidden" name="boardNo" value="${boardNo}"> <input
						type="hidden" name="userNo" value="${sessionScope.user.userNo }">
					<input type="hidden" name="groupNo" value="${groupNo }">
					<div class="toast show" role="alert" aria-live="assertive"
						aria-atomic="true" style="max-width: 95%;">
						<input type="text" class="toast-body" name="commentContent"
							placeholder="댓글입력" required="required"
							style="text-align: left; border-radius: 15px; width: 100%; height: 100px;">
						<div>
							<input type="submit" class="btn btn-success" value="작성완료"
								style="box-shadow: 0 0.25rem 0.75rem rgb(0 0 0/ 10%); float: right; position: relative; top: -65px; right: 10px;">
						</div>
					</div>
				</form>
				<br> <br>
			</div>
			<!-- 댓글 리스트 -->
			<c:forEach items="${commentList}" var="comment">
				<c:set var="depth" value="${comment.depth }" />
				<c:set var="BoardCATE" value="${comment.boardCategory }"></c:set>
				<c:set var="BoardNumber" value="${boardNo}"></c:set>
				<c:set var="BoardNumber2" value="${comment.boardNo}"></c:set>
				<c:set var="GroupNo" value="${comment.groupNo}"></c:set>
				<c:if test="${depth eq 0 }">
					<c:if test="${BoardCATE eq 1 }">
						<c:if test="${BoardNumber eq BoardNumber2 }">
							<div class="toast show" role="alert" aria-live="assertive"
								aria-atomic="true" style="width: 95%; max-width: 100%;">
								<div class="toast-header">
									<strong class="mr-auto"> ${comment.userNickname}</strong>



									<%-- <input type="hidden" value="${comment.groupNo }"> --%>
									<c:if test="${sessionScope.user.userNo == comment.userNo}">

										<small><a
											href="freeCommentUpdateForm?commentNo=${comment.commentNo}&commentContent=${comment.commentContent }">수정</a>
											<a
											href="freeCommentDelete?groupNo=${comment.groupNo}&boardNo=${boardNo}">삭제</a></small>
									</c:if>
								</div>
								<div class="toast-body" style="text-align: left;">
									${comment.commentContent} <small style="float: right;">${comment.commentRegdate}</small>
								</div>
								<!-- 대댓글 리스트 -->
								<c:forEach items="${commentList}" var="comcomment">
									<c:set var="depth" value="${comcomment.depth }" />
									<c:set var="GroupNo2" value="${comcomment.groupNo }" />
									<c:if test="${depth eq 1 }">
										<c:if test="${GroupNo eq GroupNo2 }">
											<div class="toast-header">
												<strong class="mr-auto">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comcomment.userNickname}</strong>
												<c:if
													test="${sessionScope.user.userNo == comcomment.userNo}">

													<small> <%-- 													<c:if test="${comment.userNo } eq ${sessionScope.user.userNo }"> --%>
														<a
														href="freeCommentUpdateForm?commentNo=${comcomment.commentNo}&commentContent=${comcomment.commentContent }">수정</a>
														<a href="#"
														coClick="freeCommentUpdatForm(${comment.commentNo})">수정(미완성)</a>
														<a
														href="freeComcommentDelete?commentNo=${comcomment.commentNo}&boardNo=${boardNo}">삭제</a>
												</c:if>
											</div>


											<div class="toast-body" style="text-align: left;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${comcomment.commentContent}<small
													style="float: right;">${comcomment.commentRegdate}</small></small>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
								<div id="flip" onclick="filp(${comment.groupNo });">대댓글 입력</div>
								<div id="panel${comment.groupNo }"
									style="padding: 10px; padding-bottom: 30px; display: none;">

									<!-- 대댓글 입력창 -->
									<div style="text-align: -webkit-center;">
										<form action="freeComcommentRegister" method="post"
											style="width: 100%; place-content: center;">
											<input type="hidden" name="depth" value="1"> <input
												type="hidden" name="boardCategory" value="1"> <input
												type="hidden" name="boardNo" value="${comment.boardNo }">
											<input type="hidden" name="userNo" value="${sessionScope.user.userNo }">
											<input type="hidden" name="groupNo"
												value="${comment.groupNo }">
											<div class="toast show" role="alert" aria-live="assertive"
												aria-atomic="true" style="max-width: 95%;">
												<input type="text" class="toast-body" name="commentContent"
													placeholder="대댓글입력" required="required"
													style="text-align: left; border-radius: 15px; width: 100%; height: 100px;">
												<div>
													<input type="submit" class="btn btn-success" value="작성완료"
														style="box-shadow: 0 0.25rem 0.75rem rgb(0 0 0/ 10%); float: right; position: relative; top: -65px; right: 10px;">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:if>
				<br>
			</c:forEach>
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