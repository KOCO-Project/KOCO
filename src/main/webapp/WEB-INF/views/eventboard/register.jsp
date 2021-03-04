<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">

				<form role="form" action="/eventboard/register" method="post">
				<%-- <form:hidden path="3"/> --%>
					<div class="form-group">
						<label>제목</label>
						<input name="boardTitle" class="form-control"/>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" name='boardContent' rows="20"></textarea>
					</div>
					<div class="form-group">
						<label>첨부파일</label>
						<input name="fileName" class="form-control" type="file" accept="image/*"/>
					</div>
					<button type="reset"  style="float: right" class="btn btn-default">Reset Button</button>
					<button type="submit" style="float: right" class="btn btn-default">등록하기</button>
				</form>

			</div>
		</div>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>
