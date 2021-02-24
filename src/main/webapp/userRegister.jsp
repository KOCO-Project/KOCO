<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="userRegister.do" method="post">
		<ul>
			<li><label for="userId">아이디</label><input type="text" name="userId"></li>
			<li><label for="userPw">비밀번호</label><input type="password" name="userPw"></li>
			<li><label for="userNickname">닉네임</label><input type="text" name="userNickname"></li>
			<li><label for="userEmail">이메일</label><input type="email" name="userEmail"></li>
			<li><input type="submit" value="회원가입"></li>
		</ul>
	</form>
</body>
</html>