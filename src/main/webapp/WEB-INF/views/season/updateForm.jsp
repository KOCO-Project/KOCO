<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update SeasonBoard</title>
<link rel="stylesheet" href="css/bootstrap.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu2.jsp" />

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form action="seasonUpdateBoard" method="post">
							<input type="hidden" name="seasonNo" value="${season.seasonNo}" />

							<div class="form-group">
								<label for="writer">작성자</label> <input type="text" id="writer"
									name="userNo" class="form-control" value="${season.userNo}"
									disabled="disabled" />
							</div>
							<div class="form-group">
								<label for="boardRegdate">작성날짜</label> <input type="text"
									id="boardRegdate" name="seasonRegdate" class="form-control"
									value="${season.seasonRegdate }" disabled="disabled" />
							</div>
							<div class="form-group">
								<label for="boardTitle">제목</label> <input type="text"
									id="boardTitle" name="seasonTitle" class="form-control"
									value="${season.seasonTitle }" />
							</div>
							<div class="form-group">
								<label for="boardContent">내용</label>
								<textarea id="boardContent" name="seasonContent"
									class="form-control" rows="10" style="resize: none">${season.seasonContent }</textarea>
							</div>

							<c:set var="seasonNumber" value="${season.seasonStatus}" />
							<div class="text-right">
								<select name="seasonStatus" >
									<option value="1"
										<c:if test="${seasonNumber eq '1'}">selected</c:if>>
										봄</option>
									<option value="2"
										<c:if test="${seasonNumber eq '2'}">selected</c:if>>
										여름</option>
									<option value="3"
										<c:if test="${seasonNumber eq '3'}">selected</c:if>>
										가을</option>
									<option value="4"
										<c:if test="${seasonNumber eq '4'}">selected</c:if>>
										겨울</option>
								</select>
							</div>
							<div class="form-group">
								<div class="text-right">
									<input type="submit" class="btn btn-info" value="수정완료" /> <a
										href="getSeasonBoard?seasonNo=${season.seasonNo}"
										class="btn btn-danger">취소하기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
