<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Culture getBoard</title>


<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="writer">작성자</label> <input type="text" id="writer"
								name="userNo" class="form-control" value="${culture.userNo}"
								disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="boardRegdate">작성날짜</label> <input type="text"
								id="boardRegdate" name="cultureRegdate" class="form-control"
								value="${culture.cultureRegdate }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="boardTitle">제목</label> <input type="text"
								id="boardTitle" name="cultureTitle" class="form-control"
								value="${culture.cultureTitle }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="boardContent">내용</label>
							<textarea id="boardContent" name="cultureContent"
								class="form-control" rows="10" style="resize: none"
								disabled="disabled">${culture.cultureContent }</textarea>
						</div>

						<div class="form-group">
							<div class="text-right">
									<a href="cultureList" class="btn btn-primary">목록보기</a> 
									<a href="cultureUpdateBoardForm?cultureNo=${culture.cultureNo}" class="btn btn-info">수정하기</a> 
									<a href="deleteCultureBoard?cultureNo=${culture.cultureNo}" class="btn btn-danger" >삭제하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>


</body>
</html>
