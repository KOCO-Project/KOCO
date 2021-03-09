<%@page import="co.kr.koco.vo.BoardInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
</script>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div id="qna" class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h1>자유게시판 글쓰기</h1>
				<div class="card border-light mb-3 cc_cursor">
					<div class="card-body">
						<form method="post" action="freeBoardRegister">
							<input type="hidden" name="no" value="${boardInfoVO.infoNo }">
							<input id="userNo" name="userNo" type="hidden"
								value="${sessionScope.user.userNo }" />

							<div class="form-group">
								<input type="text" placeholder="글 제목" name="boardTitle"
									required="required" class="form-control">
							</div>
							<div class="form-group">
								<textarea name="boardContent" id="editor4" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<div class="text-right">
									<input type="submit" class="btn btn-primary"
										style="width: 100px;" value="작성"> <input type="button"
										class="btn btn-danger" style="width: 100px;" value="취소"
										onClick="goBack()">
								</div>
							</div>
						</form>
						<script>
							CKEDITOR.replace('editor4');
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>