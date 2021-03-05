<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Event Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Event Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>번호</label> <input class="form-control" name='boardNo'
						value='<c:out value="${event.boardNo}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='boardTitle'
						value='<c:out value="${event.boardTitle}"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='boardContent'
						readonly="readonly"><c:out value="${event.boardContent}" /></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='userNo'
						value='<c:out value="${event.userNo}"/>' readonly="readonly">
				</div>
				<button data-oper='update' class="btn btn-default">Modify</button>
				<button type="submit" data-oper='delete' class="btn btn-danger">Remove</button>
				<button data-oper='list' class="btn btn-info">List</button>
				<form id='operForm' action="/eventboard/update" method="get">
					<input type='hidden' id='boardNo' name='boardNo'
						value='<c:out value="${event.boardNo}"/>'>
				</form>
				<!-- /.여기까지 -->
			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		
		var operForm = $("#operForm");

		$("button[data-oper='update']").on("click", function(e) {
			operForm.attr("action", "/eventboard/update").submit();
			});
		
		var formObj = $("form");
		
		$('.btn').click(function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'list'){
				self.location ="/eventboard/list?pageNum=${cri.pageNum}&amount=${cri.amount}";
			}else if(operation === 'delete'){
				formObj.attr("action","/eventboard/delete")
				.attr("method", "post");
				formObj.submit();
				}
			})
		});
</script>
