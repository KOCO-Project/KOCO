<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div id="free" class="container" style="height: 90%; margin-top: 10%;">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<h1>자유 게시판</h1>
				<hr>
				<div class="card  border-light mb-3 cc_cursor">
					<div class="card-body">
						<div class="row">
							<div class="col-md-7">
								<input id="userNo" name="userNo" type="hidden"
									value=${sessionScope.user.userNo } "/>
								<div class="form-group">
									<label for="writer">WRITER</label> <input type="text"
										id="writer" name="writer" class="form-control"
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
							<textarea rows="boardContent" name="boardContent"
								class="form-control" rows="10" style="resize: none"
								disabled="disabled">${readContentBean.boardContent }</textarea>
						</div>

						<div class="form-group">
							<div class="text-right">
								<a href="freeBoardList?infoNo=1&page=${page }"
									class="btn btn-primary" style="width: 100px;">글목록</a>
								<c:if test="${sessionScope.user.userNo == readContentBean.userNo }">
									<a
										href="freeBoardUpdate?infoNo=1&boardNo=${boardNo}&page=${page}"
										class="btn btn-success" style="width: 100px;">수정하기</a>
									<a href="freeBoardDelete?infoNo=1&boardNo=${boardNo}"
										class="btn btn-danger" style="width: 100px;">삭제하기</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-sm-1"></div>

	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>