<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var='root' value='${pageContext.request.contextPath }/'/>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
swal({
	  title: "Good job!",
	  text: "새 답글이 등록되었습니다",
	  icon: "success"
}).then((result) => {
	location.href = '${root}qnalist?infoNo=${regQnaBoardVO.boardCategory}&page=1'
});
</script>
</body>
</html>