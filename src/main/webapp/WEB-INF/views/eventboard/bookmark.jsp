<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script>
swal({
	  title: "Good job!",
	  text: "북마크에 추가되었습니다! MyPage로 이동하시겠습니까?",
	  icon: "success"
}).then((result) => {
	location.href = 'userPage?userNickname=${user.userNickname}#bookmark'
});
</script>
</body>
</html>