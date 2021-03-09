<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
<!--뒤로가기기능-->
	function goBack() {
		window.history.back();
	}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update CultureBoard</title>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/footer.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/admin_top2.jsp" />
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1>
					<a href="cultureList" class="header"
						style="color: black; text-decoration: none; font-weight: bold;">문화게시판</a>
				</h1>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-1"></div>
					<br>
					<div class="col-md-10">
						<table class="table table">
							<th scope="col">게시글 수정&nbsp;&nbsp;│&nbsp;&nbsp;기존&nbsp;제목&nbsp;:&nbsp;${culture.cultureTitle }&nbsp;│&nbsp;작성일&nbsp;:&nbsp;${culture.cultureRegdate }</th>
						</table>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<div class="table table-hover">
						<form action="cultureUpdateBoard" method="post">

							<input type="hidden" name="cultureNo" value="${culture.cultureNo}" /> 
							<input type="hidden" name="userNo" value="${culture.userNo}">

							<div class="form-group">
								<label>제목</label> 
								<input type="text" class="form-control" name="cultureTitle" value="${culture.cultureTitle }" required="required" mexlength="50"/>
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" name="cultureContent" rows="12">${culture.cultureContent }</textarea>
								<script>
						    	   CKEDITOR.replace( 'cultureContent' );
    							</script>
							</div>

							<div class="form-group">
								<label>메인 여부&nbsp;</label> 
								<c:if test="${culture.culturePick == 1 }">
									<input type="radio" name="culturePick" value="1" checked>등록&nbsp; 
									<input type="radio" name="culturePick" value="0">미등록
								</c:if>
								
								<c:if test="${culture.culturePick != 1 }">
									<input type="radio" name="culturePick" value="1">등록&nbsp; 
									<input type="radio" name="culturePick" value="0" checked>미등록
								</c:if>
							</div>

							<div class="form-group">
								<div class="text-right">
									<input type="submit" class="btn btn-info" value="수정완료" />
									<button type="button" class="btn btn-danger" onClick="goBack()">취소하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-1"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</body>
</html>
