<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
swal({
	  title: "Warning",
	  text: "로그인 해주세요",
	  icon: "warning"
}).then((result) => {
	location.href='loginView'
});
</script>
</body>
</html>