<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input{border: none;background: #fff;}

</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QnA</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<input type="hidden" name ="boardNo" value="${readContentBean.boardNo }">
 	<input id="userNo" name="userNo" type="hidden" value="${sessionScope.user.userNo }"/>
 	<input type="hidden" id="boardTitle" name="boardTitle" class="form-control" value="${readContentBean.boardTitle }" disabled="disabled" />
	<input type="hidden" id="writer" name="writer" class="form-control" value="${readContentBean.writer }" disabled="disabled" />
	<input type="hidden" id="boardRegdate" name="boardRegdate" class="form-control" value="${readContentBean.boardRegdate }" disabled="disabled" />
	<input type="hidden" id="boardReadcount" name="boardReadcount" class="form-control" value="${readContentBean.boardReadcount }" disabled="disabled" />
				
<div id="qna" class="container" style="height: 90%;margin-top: 10%;">
<div class="row">
<div class="col-sm-1"></div>
<div class="col-sm-10">
<h2>QnA</h2><br>
			
<div class="card border-light mb-12">
 <div class="card-header" style="display: flex;">
 
 <div class="col-md-6" style="line-height: 3rem;">
	${readContentBean.boardTitle }
	  </div>
	<div class="col-md-2"style="line-height: 3rem;">
		${readContentBean.writer }
	 </div>
	<div class="col-md-2"style="line-height: 3rem;">
		${readContentBean.boardRegdate }
	</div>
	<div class="col-md-2" style="text-align: center;">
		<label for="boardReadcount">조회수</label> <br>
		${readContentBean.boardReadcount }
	</div>
</div>

<div class="card-body">

<div class="row">
	<div class="col-md-12">
		<div class="container-fluid">
		<div class="row">
			<textarea id="boardContent" name="boardContent"	class="form-control" rows="10" 
			style="resize: none;border: none;background-color: #fff;" disabled="disabled">${readContentBean.boardContent }</textarea>
		</div>																
		</div>
	</div>
		<c:if test="${readContentBean.fileName !=null }">
			<div class="form-group">
				<label for="board_file">IMAGE</label> <img
					src="${root }upload/${readContentBean.fileName }" width="100%" />
			</div>
		</c:if>

	<div class="form-group" style="margin-left: auto;margin-right: 2rem;">
		<div class="text-right">
			<a href="${root }qnalist?infoNo=${infoNo }&page=${page}"
				class="btn btn-primary" style="width: 100px;">목록보기</a>
			<a href="${root }ansRegister?infoNo=${infoNo }&boardNo=${boardNo }&page=${page}"
				class="btn btn-primary" style="width: 100px;">답글달기</a>
			<c:if test="${sessionScope.user.userNo == readContentBean.userNo }">
			<a href="${root }qnaupdate?infoNo=${infoNo }&boardNo=${boardNo }&page=${page}"
				class="btn btn-success" style="width: 100px;">수정하기</a> 
			<a href="${root }qnadelete?infoNo=${infoNo }&boardNo=${boardNo }"
				class="btn btn-danger" style="width: 100px;">삭제하기</a>
			</c:if>
		</div>
	</div>

						<!-- 댓글 -->
						<div id="comment">
							<!-- <ol class="commentList"> -->
							<ul class="list-group">
								<c:forEach items="${commentList}" var="comment">
									<li
										class="list-group-item d-flex justify-content-between align-items-center">
										<p>유저번호 : ${comment.userNo}</p>
										<p>댓글 내용 : ${comment.commentContent}</p>
										<p>작성 날짜 : ${comment.commentRegdate}</p>
									</li>
								</c:forEach>
							</ul>
							<!-- 	</ol> -->
						</div>

						
					</div><!-- row -->
				</div><!-- card-body -->
			</div><!-- card -->
		</div><!-- col-sm-10 -->
	</div><!-- row -->
</div><!-- container -->
	<div class="col-sm-1"></div>
	
	
<footer>
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>	

</body>
</html>
