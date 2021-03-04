<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


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
						<textarea class="form-control" rows="3" name='boardContent'><c:out
								value="${event.boardContent}" /></textarea>
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

<%@include file="../includes/footer.jsp"%>
<script>

$(document).ready(function() {
	
	var formObj = $("form");
	
	$('.btn').click(function(e){
	
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'list'){
			self.location ="/eventboard/list?pageNum=${cri.pageNum}&amount=${cri.amount}";
		}else if(operation === 'remove'){
			formObj.attr("action","/eventboard/delete")
			.attr("method", "post");
			formObj.submit();
			
		}else if(operation === 'update'){
			formObj.attr("action","/eventboard/update")
			.attr("method", "post");
			formObj.submit();
		}
	})
	
})
</script>
