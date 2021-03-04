<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath }/' />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Season getBoard</title>
<link rel="stylesheet" href="css/bootstrap.css">
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

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="writer">�ۼ���</label> <input type="text" id="writer"
								name="userNo" class="form-control" value="${season.userNo}"
								disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="boardRegdate">�ۼ���¥</label> <input type="text"
								id="boardRegdate" name="seasonRegdate" class="form-control"
								value="${season.seasonRegdate }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="boardTitle">����</label> <input type="text"
								id="boardTitle" name="seasonTitle" class="form-control"
								value="${season.seasonTitle }" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="boardContent">����</label>
							<textarea id="boardContent" name="seasonContent"
								class="form-control" rows="10" style="resize: none"
								disabled="disabled">${season.seasonContent }</textarea>
						</div>

						<c:set var="seasonNumber" value="${season.seasonStatus}" />
						<div class="text-right">
							<select name="seasonStatus" disabled="disabled">
								<option value="1"
									<c:if test="${seasonNumber eq '1'}">selected</c:if>>��</option>
								<option value="2"
									<c:if test="${seasonNumber eq '2'}">selected</c:if>>
									����</option>
								<option value="3"
									<c:if test="${seasonNumber eq '3'}">selected</c:if>>
									����</option>
								<option value="4"
									<c:if test="${seasonNumber eq '4'}">selected</c:if>>
									�ܿ�</option>
							</select>
						</div>

						<div class="form-group">
							<div class="text-right">
								<a href="seasonList" class="btn btn-primary">��Ϻ���</a> <a
									href="seasonUpdateBoardForm?seasonNo=${season.seasonNo}"
									class="btn btn-info">�����ϱ�</a>
								<button id="btn-remove" class="btn btn-danger">�����ϱ�</button>
							</div>
						</div>
						<script>
							$(function() {
								$('#btn-remove').click(	function() {
									if (confirm("�����Ͻðڽ��ϱ�?")) {
										self.location.href = "deleteSeasonBoard?seasonNo=${season.seasonNo}";
									}
								});
							});
						</script>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>