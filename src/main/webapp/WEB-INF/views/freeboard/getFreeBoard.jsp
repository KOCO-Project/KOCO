
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>

	<h1>자유 게시판</h1>
	<hr>
	<input id="userNo" name="userNo" type="hidden" value=${sessionScope.user.userNo }"/>
		<div>
		<label for = "writer">WRITER</label>
		<input type="text" id="writer" name="writer" class="form-control"
		value="${readContentBean.writer }" disabled="disabled"/>
		</div>
		<div>
		
			<label for="boardRegdate">DATE</label>
			<input type="text" id = "boardRegdate" name="boardRegdate" class="form-control"
			value="${readContentBean.boardRegdate }" disabled="disabled"/>
		</div>
		
		<div>
			<label for="boardReadcount">조회수</label>
			<input type="text" id="boardReadcount" name="boardReadcount" class="form-control"
			value="${readContentBean.boardReadcount }" disabled="disabled"/>
		</div>
		
		<div>
			<label for="boardTitle">TITLE</label>
			<input type="text" id="boardTitle" name="boardTitle" class="form-control"
			value="${readContentBean.boardTitle }" disabled="disabled"/>
		</div>
		
		<div>
			<label for="boardContent">CONTENT</label>
			<textarea rows="boardContent" name="boardContent" class="form-control" rows="10"
			style="resize: none" disabled="disabled">${readContentBean.boardContent }</textarea>
		</div>
		
			
	<div>
	<a href="freeBoardList?infoNo=1&page=${page }" class="btn btn-primary" style="width: 100px;">글목록</a>
	<c:if test = "${sessionScope.user.userNo == readContentBean.userNo }">
	<a href="freeBoardUpdate?infoNo=${infoNo }&boardNo=${boardNo}&page=${page}">수정하기</a>
	<a href="freeBoardDelete?infoNo=${infoNo }&boardNo=${boardNo}"
	class="btn btn-danger" style="width: 100px;">삭제하기</a>
	</c:if>
	</div>
</body>
</html>