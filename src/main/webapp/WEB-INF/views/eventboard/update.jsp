<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>KOCO - Korea Offer Culture Organizaion</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/qna.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="ckeditor/ckeditor.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/event_top.jsp" />
	<div id="qna" class="container">

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/eventboard/update" method="post">
					<input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum }"/>'> <input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount }"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword }"/>'>


					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='boardNo'
							value='<c:out value="${event.boardNo }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='boardTitle'
							value='<c:out value="${event.boardTitle }"/>'>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='boardContent'>
						<c:out value="${event.boardContent}" /></textarea>
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

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='userNo'
							value='<c:out value="${event.userNo}"/>' readonly="readonly">
					</div>
					<button type="submit" data-oper='update' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
</div>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
<script>

$(document).ready(function() {
	
	var formObj = $("form");
	
	$('.btn').click(function(e){
	
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'list'){
			self.location ="/KOCO/eventList?pageNum=${cri.pageNum}&amount=${cri.amount}";
		}else if(operation === 'update'){
			formObj.attr("action","/KOCO/postEvnetUpdate")
			.attr("method", "post");
			formObj.submit();
		}
	})
	
})
</script>

</body>
</html>
