<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KOCO - Korea Offer Culture Organizaion</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/qna.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="ckeditor/ckeditor.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/event_top.jsp" />
	<div id="qna" class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Board Register</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<form role="form" action="/KOCO/eventRegister" method="post" enctype="multipart/form-data">
							<%-- <form:hidden path="3"/> --%>
							<div class="form-group">
								<label>제목</label> <input name="boardTitle" class="form-control" />
							</div>

							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" id='boardContent' name='boardContent' rows="20"></textarea>
								<script>
									var ckeditor_config = {
										resize_enaleb : false,
										enterMode : CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : "/KOCO/ckUpload"
									};

									CKEDITOR.replace("boardContent", ckeditor_config);
								</script>
							</div>
							<!-- <div class="form-group">
								<label>첨부파일</label> 
								<input name="fileName" class="form-control" type="file" accept="image/*" />
							</div> -->
							<div class="inputArea">
								<label for="fileName">첨부파일</label> <input type="file" id="fileName" name="uploadFile" /><br>
								<div class="select_img">
									<img src="" />
								</div>
								<script>
									$("#fileName").change(
										function() {
											if (this.files && this.files[0]) {
												var reader = new FileReader;
												reader.onload = function(data) {
													$(".select_img img").attr("src",data.target.result).width(500);
												}
												reader.readAsDataURL(this.files[0]);
											}
										});
								</script>
								<%-- <%=request.getRealPath("/") %> --%>
								<!-- /Users/isang-a/Documents/workspace-sts-3.9.15.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/KOCO/ -->
							</div>
							<button type="reset" style="float: right" class="btn btn-default">Reset
								Button</button>
							<button type="submit" style="float: right"
								class="btn btn-default">등록하기</button>
						</form>
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
