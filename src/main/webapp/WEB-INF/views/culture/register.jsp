<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value='${pageContext.request.contextPath}/' />
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
function check(){
    var editorValue = CKEDITOR.instances.editor.getData();
    console.log(editorValue);
    if(editorValue == "" || editorValue.length == 0){
       alert('내용을 입력해주세요.');
       return false;
    } else {
       return true;
    }
 }
	function goBack() {
		window.history.back();
	}  
</script>
<meta charset="UTF-8">
<title>Culture Register Form</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/footer.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>

<!--↓ summerNote 사용을 위한 자바스크립트 구문 구분 ↓-->
<script type="text/javascript">
$(function(){
	var setting = {
		height: 250,
		lang: "ko-KR"
	};
	
	$('.summernote').summernote(setting);
});
</script>

<body>
	<c:import url="/WEB-INF/views/include/admin_top2.jsp" />
	<br><br><br>
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
							<th scope="col">게시글 작성</th>
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
						<form action='cultureRegister' method='post'>
							
							<input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
							
							<div class="form-group">
								<label>제목</label> 
								<input type="text" class="form-control" name="cultureTitle" placeholder="제목을 입력하세요" required="required" mexlength="50" />
							</div>
							
							<!--↓ summerNote 구현 ↓-->
							<div class="form-group">
								<label>내용</label>
								<textarea class="summernote" id="editor" name="cultureContent"  rows="12"></textarea>
							</div>
							
							<!--↓ 게시글 main 노출 여부 ↓-->
							<div class="form-group">
								<label>메인 여부&nbsp;</label>
								<input type="radio" name="culturePick" value="1">등록&nbsp;
								<input type="radio" name="culturePick" value="0" checked>미등록
							</div>

							<div class="form-group">
								<div class="text-right">
									<button type="submit" class="btn btn-info">작성</button>
									<button type="button" class="btn btn-danger" onClick="goBack()">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div><br><br><br>
</body>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
</footer>
</html>