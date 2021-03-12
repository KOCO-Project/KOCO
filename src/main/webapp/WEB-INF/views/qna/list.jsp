<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h1.card-title{	font-weight: bold;float: left;}
body{text-align: -webkit-center;}
div#qna.container{box-shadow: 3px 3px 15px 0px grey;margin-top: 5%;max-width: 80%;}
</style>
<meta charset="UTF-8">
<title>QnA</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body class="seopBody">
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

	<div id="qna" class="container">
	<a href="qnalist?infoNo=2" class="header"style="color: black; text-decoration: none; font-weight: bold; font-size: 2rem;">Q&A</a>
	<br><br>
	<table class="table table-hover" id='board_list' style="border-bottom: 1px solid #dfd7ca;">
	<thead>
	
	<tr>
		<th></th>
		<th class="w-50">제목</th>
		<th class="text-center d-none d-md-table-cell">작성자</th>
		<th class="text-center d-none d-md-table-cell">작성날짜</th>
		<th class="text-center d-none d-md-table-cell">조회수</th>
	</tr>
	
	</thead>
	<tbody>
	<c:forEach var='obj' items="${qnaList }">
	<tr>
		<td></td>
		<td>

	  	 <c:choose>
	   	   <c:when test='${obj.depth > 0 }'>     
	         <c:forEach begin="0" end="${obj.depth }" step="2">
	              <span style="padding-left:20px"></span>    
	         </c:forEach>
	         
	         <span style="font-size:12px;">[답변]</span>
          		 <a href='${root }getQna?infoNo=${infoNo }&boardNo=${obj.boardNo }&page=${page}'onMouseover="this.style.fontWeight='bold'"
								onMouseout="this.style.fontWeight=''">${obj.boardTitle }</a>
	     	</c:when>
	     
	      <c:otherwise>
	 			<a href='${root }getQna?infoNo=${infoNo }&boardNo=${obj.boardNo }&page=${page}'onMouseover="this.style.fontWeight='bold'"
								onMouseout="this.style.fontWeight=''">${obj.boardTitle }</a>
	      </c:otherwise>
	   </c:choose>
		</td>

		<td class="text-center d-none d-md-table-cell" style="color: #325d88;font-weight: 500;"><a href="userPage?userNickname=${obj.writer}"onMouseover="this.style.fontWeight='bold'"
								onMouseout="this.style.fontWeight=''">${obj.writer }</a></td>
		<td class="text-center d-none d-md-table-cell">${obj.boardRegdate }</td>
		<td class="text-center d-none d-md-table-cell">${obj.boardReadcount }</td>
	</tr>
	</c:forEach>
	</tbody>
</table>




<table style="width: 100%">
<tr><td>
<div class="text-left">
	<a href="${root }qnaRegister?infoNo=${infoNo }" class="btn btn-primary btn-lg" style="width: 100px; color: #fff;">Write</a>		
</div></td>
<!-- 검색 영역 -->
<td style=" width: 30%;">
<form class="navbar-form" action="qnalist" method="post">
<input type="hidden" name="infoNo" value="${infoNo }">
	<div class="input-group"><div class="form-group navbar-left" style="margin: 0;">
		    <select class="custom-select" name="searchCondition">
		      <option value="TITLE">TITLE</option>
		      <option value="CONTENT">CONTENT</option>
		      <option value="NICKNAME">AUTHOR</option>
		    </select></div>
		  <input type="text" class="form-control" placeholder="SEARCH" style="border: 1px solid #ced4da;" name="searchKeyword">
		  <div class="input-group-append" style="height: fit-content;">
		  <button class="btn btn btn-primary" type="submit">
		 	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg>
		  </button>
	</div></div>
</form>	
</td></tr>
</table><br><br>



<div class="d-none d-md-block">
	<ul class="pagination justify-content-center">
	<c:choose>
		<c:when test="${pageVO.prevPage <= 0 }">
			<li class="page-item disabled">
			<a href="#" class="page-link">이전</a>
			</li>
		</c:when>
		<c:otherwise>
			<li class="page-item">
			<a href="${root }qnalist?infoNo=${infoNo }&page=${pageVO.prevPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" class="page-link">이전</a>
			</li>
		</c:otherwise>
		</c:choose>

		<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
		<c:choose>
			<c:when test="${idx == pageVO.currentPage }">
				<li class="page-item active">
				<a href="${root }qnalist?infoNo=${infoNo }&page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" class="page-link">${idx }</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a href="${root }qnalist?infoNo=${infoNo }&page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" class="page-link">${idx }</a>
				</li>
			</c:otherwise>
		</c:choose>
		</c:forEach>
				
		<c:choose>
			<c:when test="${pageVO.max >= pageVO.pageCnt }">
				<li class="page-item disabled">
					<a href="#" class="page-link">다음</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a href="${root }qnalist?infoNo=${infoNo }&page=${pageVO.nextPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}" class="page-link">다음</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<br>
</div>
<br><br>

	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>

</body>
</html>