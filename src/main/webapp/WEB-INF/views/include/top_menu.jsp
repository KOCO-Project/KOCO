<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!-- 상단 메뉴 부분 -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top shadow-lg">
	<a class="navbar-brand" href="${root }main">KOCO</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
	        data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>        
	</button>
	<div class="collapse navbar-collapse" id="navMenu">
		<ul class="navbar-nav">
			<c:forEach var="obj" items='${topMenuList }'>
				<li class="nav-item">
					<a href="${root }qna/list?infoNo=${obj.infoNo }" class="nav-link">${obj.infoName }</a>
				</li>
			</c:forEach>
			<li class="nav-item"><a href="cultureList" class="nav-link">문화게시판</li>
			<%-- <li class="nav-item">
				<a href="${root }qna/list?infoNo=2&boardNo=1" class="nav-link">QnA게시판</a>
			</li> --%>
			
		</ul>
		
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a href="loginView" class="nav-link">로그인</a>
			</li>
			<li class="nav-item">
				<a href="registerView" class="nav-link">회원가입</a>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">회원정보</a>
			</li>
			<li class="nav-item">
				<a href="#" class="nav-link">로그아웃</a>
			</li>
		</ul>
	</div>
</nav>