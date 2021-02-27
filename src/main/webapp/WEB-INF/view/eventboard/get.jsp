<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Event Register</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Event Read Page</div>
			<div class="panel-body">
				<div class="form-group">
					<label>번호</label> <input class="form-control" name='bno' value='<c:out value="${event.bno }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='title' value='<c:out value="${event.title }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${event.content}" /></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer' value='<c:out value="${event.writer }"/>' readonly="readonly">
				</div>
				<button data-oper='update' class="btn btn-default">수정하기</button>
				<form id='operForm' action="/eventboard/update" method="get">
					<input type='hidden' id='bno' name='bno' value='<c:out value="${event.bno}"/>'>
				</form>
				<button data-oper='list' class="btn btn-info">돌아가기</button>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper=''update'']").on("click", function(e) {
			operForm.attr("action", "/eventboard/update").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/eventboard/list")
			operForm.submit();
		});
	});
</script>
