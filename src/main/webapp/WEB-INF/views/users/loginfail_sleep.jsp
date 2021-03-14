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
	  text: "계정이 비활성화 상태입니다. 이메일 인증을 통해 계정을 활성화 시켜주세요.",
	  icon: "warning"
}).then((result) => {
	location.href='sleepUserView'
});
</script>
</body>
</html>