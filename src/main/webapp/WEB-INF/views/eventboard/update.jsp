<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>KOCO - Korea Offer Culture Organizaion</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/event.css?v=9">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="ckeditor/ckeditor.js"></script>
	<script>	
	function loginCheck(){
		var loginyn = $('#loginyn').val();
		
		console.log(loginyn);
		
		if(loginyn == ''){
			alert('로그인 해주세요.');
			location.href = 'loginView';
			return false;
		} else {
			return true;
		}
	}
	</script>
	<style>
	#input{width: 115%;}
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div id="event" class="container">
	<div class="row">
			<div class="col-md-12 mb-3" style="text-align: center;">
				<h2>Update Event !! </h2>
				<p style="color: #939393;">이벤트를 수정해주세요 :)</p>
			</div>
		</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
			<form role="form" action="/KOCO/postEventUpdate" method="post" modelAttribute="event" enctype="multipart/form-data">
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'> 
				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'> 
				<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<div class="form-inline form-group">
						<label style="font-weight: bolder; font-size: 18px;">제목&nbsp;&nbsp;&nbsp;</label>
						<div class="col-sm-10">
						<input type="text" id="input" name="boardTitle" class="form-control" size="100" value='<c:out value="${event.boardTitle }"/>'> 
						</div>
					</div>
					<div class="form-inline form-group">
						<label style="font-weight: bolder; font-size: 18px;">마감일</label> 
						<div class="col-sm-10">
						<input type="date" id="input" name="boardRegdate" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<label style="font-weight: bolder; font-size: 18px;">내용</label><br><br>
						<textarea class="form-control" rows="3" name='boardContent'>
						<c:out value="${event.boardContent}" />
						</textarea>
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
					<div class="inputArea">
						<label for="fileName" style="font-weight: bolder; font-size: 18px;">썸네일&nbsp; &nbsp; &nbsp; &nbsp;</label> 
						<input type="file" id="fileName" name="uploadFile" /><br>
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
					<div class="form-inline form-group">
						<label style="font-weight: bolder; font-size: 18px;">작성자</label>
						<div class="col-sm-10">
						<input type="text" id="input" class="form-control" name='userNo' value='<c:out value="${event.writer}"/>' readonly="readonly">
						</div>
					</div>
					<div class="form-group"  style="text-align: center;">
					<button type="submit" data-oper='update' class="btn btn-success"  style="background-color: #2172AF;">수정완료</button>
					<button type="submit" data-oper='list' class="btn" style="background-color: #EDB95F; color: white;">리스트</button> 
					</div>
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
			self.location ="/KOCO/eventList?page=${page}";
		}
		else if(operation === 'update'){
			formObj.attr("action","/KOCO/postEventUpdate")
			.attr("method", "post");
			formObj.submit();
		}
	})
	
})
</script>

</body>
</html>
