<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
swal({
	  title: "경고!",
	  text: "잘못된 접근입니다",
	  icon: "error"
}).then((result) => {
	location.href = '${root}main'
});
</script>
</body>
</html>