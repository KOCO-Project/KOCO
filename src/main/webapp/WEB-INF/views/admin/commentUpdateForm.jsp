<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="commentUpdate" method="get">
<input type="text" name = "commentContent" required="required" placeholder="no=${comment.commentNo } content= ${comment.commentContent }">
<input type = "hidden" name="commentNo" value="${comment.commentNo }">
<input type = "submit" value="수정 완료">
</form>
</body>
</html>