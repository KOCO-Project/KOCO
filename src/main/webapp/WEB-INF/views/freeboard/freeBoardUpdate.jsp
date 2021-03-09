
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
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div id="qna" class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h2>자유게시판 수정</h2>
				<br>
				<div class="card border-light mb-3 cc_cursor">
					<div class="card-body">
						<form action="freeBoardUpdate" method="post">
							<input id="boardNo" name="boardNo" type="hidden"
								value="${boardNo}" /> <input id="boardCategory" name="infoNo"
								type="hidden" value="${infoNo }" /> <input type="hidden"
								name="page" value="${page }">
							<div class="form-group">
								<input type="text" placeholder="글 제목" name="boardTitle"
									required="required" class='form-control'
									value="${freeBoardVO.boardTitle }">
							</div>
							<div class="form-group">
								<textarea name="boardContent" required="required" id="editor4"
									class="form-control" rows="10" style="resize: none">${freeBoardVO.boardContent }</textarea>
							</div>
							<div class="form-group">
								<div class="text-right">
									<input type="submit" class="btn btn-success"
										style="width: 100px;" value="수정"> <input type="button"
										value="취소" class="btn btn-danger" style="width: 100px;"
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