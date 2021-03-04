<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<div id="qna" class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-9">
			<h2>Write QnA</h2><br>
			<div class="card border-light mb-3 cc_cursor">
			<!--   <div class="card-header">Submit QnA</div> -->
				<div class="card-body">
					<form:form action='${root }qna/regQna_pro' method='post' modelAttribute="regQnaBoardVO" enctype="multipart/form-data">
						<%-- <form:hidden path="${infoNo }"/> --%>
						<div class="form-group">
						<form:label path="boardTitle">제목</form:label>
						<form:input path="boardTitle" class="form-control"/>
						<form:errors path="boardTitle" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="boardContent">내용</form:label>
						<form:textarea path="boardContent" class="form-control" rows="10" style="resize:none"/>
						<form:errors path="boardContent" style="color:red"/>
					</div>
					<div class="form-group">
						<form:label path="uploadFile">이미지</form:label>
						<form:input type="file" path="uploadFile" class="form-control" accept="image/*"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<form:button type="submit" class="btn btn-primary">Submit</form:button>
							<a href="${root }qna/list?infoNo=2&page=1" class="btn btn-info">취소</a>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>
</div>
</body>
</html>