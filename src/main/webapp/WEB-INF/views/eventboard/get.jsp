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
	<link rel="stylesheet" href="css/qna.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/event_top.jsp" />
	<div id="qna" class="container">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Event Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="card  border-light mb-3 cc_cursor">
			<!-- <div class="panel-heading">Event Read Page</div> -->
			<!-- /.panel-heading -->
			<div class="panel-body">
				<%-- <div class="form-group">
					<label>번호</label> <input class="form-control" name='boardNo'
						value='<c:out value="${event.boardNo}"/>' readonly="readonly">
				</div> --%>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='boardTitle'
						value='<c:out value="${event.boardTitle}"/>' readonly="readonly" style="background-color: #FFF7DD;"><br>
						<label>마감일</label> <input class="form-control" name='boardTitle'
						value='<c:out value="${event.boardRegdate}"/>' readonly="readonly" style="background-color: #FFF7DD;">
				</div>

						<div class="form-group">
							<%-- <label>내용</label>
					<textarea class="form-control" rows="3" name='boardContent'
						readonly="readonly" style="background-color: #FFF7DD;"><c:out value="${event.boardContent}" /></textarea> --%>
							<div class="inputArea">
								<label for="fileName">이미지</label>
								<p>원본 이미지</p>
								<img src="${goods.fileName}" class="oriImg" />

								<p>썸네일</p>
								<img src="${goods.thumbnail}" class="thumbImg" />
							</div>
						</div>
						<div class="row">
				<div class="col-md-7">
					<label>작성자</label> <input class="form-control" name='userNo'
						value='<c:out value="${event.writer}"/>' readonly="readonly" style="background-color: #FFF7DD;">
						</div>
				<div class="col-md-5">
					<label>최근수정일</label> <input class="form-control" name='boardRegDate'
						value='<c:out value="${event.boardRegdate}"/>' readonly="readonly" style="background-color: #FFF7DD;"><br><br>
				</div>
				
				</div>
				<div class="form-group">
					<label>첨부파일</label> <input class="form-control" name='boardTitle'
						value='<c:out value="${event.fileName}"/>' readonly="readonly" style="background-color: #FFF7DD;">
				</div>
				<div class="form-group float-right">
				<button data-oper='update' class="btn btn-success" sty>Modify</button>
				<button type="submit" data-oper='delete' class="btn btn-danger">Remove</button>
				<button data-oper='list' class="btn btn-info">Go List</button>
				</div>
				<form id='operForm' action="/eventboard/update" method="get">
					<input type='hidden' id='boardNo' name='boardNo'
						value='<c:out value="${event.boardNo}"/>'>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>

<script type="text/javascript">
	$(document).ready(function() {
		
		var operForm = $("#operForm");

		$("button[data-oper='update']").on("click", function(e) {
			operForm.attr("action", "/KOCO/getEventUpdate").submit();
			});
		
		var formObj = $("form");
		
		$('.btn').click(function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'list'){
				self.location ="/KOCO/eventList?pageNum=${cri.pageNum}&amount=${cri.amount}";
			}else if(operation === 'delete'){
				formObj.attr("action","/KOCO/eventDelete")
				.attr("method", "post");
				formObj.submit();
				}
			})
		});
	function test() { 
		txt = document.getElementById("userNo"); 
		if( txt.readOnly == true ) { 
		txt.style.backgroundColor = "#505050"; 
		return false; 
		} 
		} 
</script>
</body>
</html>
