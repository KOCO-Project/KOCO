<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script>
	alert('수정되었습니다')
	location.href = 'getFreeBoard?infoNo=${freeBoardVO.boardCategory}&boardNo=${freeBoardVO.boardNo}&page=1'
</script>
</body>
</html>