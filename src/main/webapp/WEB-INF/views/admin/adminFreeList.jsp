<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFreeList</title>
<link rel="stylesheet" href="css/bootstrap.css?v=1">
<link rel="stylesheet" href="css/footer.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script type="text/javascript">
	function del() {
		var chk = confirm("정말 삭제하시겠습니까?");
		 var cnt = $("input[name='check']:checked").length;
		var form = document.freeDeleteList;
		if(cnt == 0){
            alert("선택된 글이 없습니다.");
		}else{
		if (chk) {
			form.submit();
		}
		}
	}
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/admin_top2.jsp" />
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1><a href="adminFreeList" class="header"
							style="color: black; text-decoration: none; font-weight: bold;">자유게시판 관리</a></h1>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 10%;">선택</th>
							<th scope="col" style="width: 10%;">번호</th>
							<th scope="col" style="width: 40%;">제목</th>
							<th scope="col" style="width: 20%;">작성자</th>
							<th scope="col" style="width: 20%;">작성일</th>
						</tr>
					</thead>
					<form action="freeDeleteList" method="post" name="freeDeleteList">
						<!--↓ freeBoard 값 forEach 출력 ↓-->
						<c:forEach items="${freeBoardList }" var="freeBoard">
							<tr class="table-light">
							<!--↓ 삭제하기 체크박스 ↓-->
							<th><input type="checkbox" name="check" value="${freeBoard.boardNo }"/></th>
								<th scope="row">${freeBoard.boardNo }</th>
								<td>${freeBoard.boardTitle }</td>
								<td>${freeBoard.writer }</td>
								<td>${freeBoard.boardRegdate }</td>
							</tr>
						</c:forEach>
					</form>
				</table>
				<br>
				<table style="width: 100%">
					<tr>
						<td style="padding-top: 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;">
							<input type="button" class="input-group-text" value="선택 삭제" style="width: 10%;justify-content: center;padding: 0;" onclick="del()">
						</td>
						
						<!--↓ 검색 영역 ↓-->
						<td style="width: 40%;">
							<form class="navbar-form" action="adminFreeList" method="post">
								<div class="input-group" style="width: 70%; float: right;">
									<div class="form-group navbar-left" style="margin: 0;">
										<!--↓ 검색 메뉴 선택 ↓-->
										<select class="input-group-text" style="height: 100%;"name="searchCondition">
											<option style="background-color: white;" value="TITLE">제목</option>
											<option style="background-color: white;" value="CONTENT">내용</option>
											<option style="background-color: white;" value="NICKNAME">작성자</option>
										</select>
									</div>
									<!--↓ 검색 키워드 입력 ↓-->
									<input type="text" class="form-control" placeholder="SEARCH"
										style="border: 1px solid #ced4da;" name="searchKeyword">
									<div class="input-group-append">
										<button class="input-group-text" type="submit">
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-search"
												viewBox="0 0 16 16">
  									<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" /></svg>
										</button>
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table><br><br><br>

			<!--↓ 페이징 시작 ↓-->
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pageVO.prevPage <=0 }">
							<li class="page-item disabled"><a href="#" class="page-link">이전</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							<!--↓ 페이징을 list에서 처리할 수 있도록 하여 클릭 시 전달 값에 검색키워드 & 검색컨디션 전달 이하 페이징 기능 전체 동일 ↓-->
							<a href="adminFreeList?infoNo=${infoNo }&page=${pageVO.prevPage }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
								class="page-link">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
						<c:choose>
							<c:when test="${idx == pageVO.currentPage }">
								<li class="page-item active"><a
									href="adminFreeList?infoNo=${infoNo }&page=${idx }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
									class="page-link">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a
									href="adminFreeList?infoNo=${infoNo }&page=${idx}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
									class="page-link">${idx }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageVO.max >= pageVO.pageCnt }">
							<li class="page-item disabled"><a href="#" class="page-link">다음</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="adminFreeList?infoNo=${infoNo }&page=${pageVO.nextPage}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"
								class="page-link">다음</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
			<div class="col-md-1"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
</body>
	<footer>
		<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
	</footer>
</html>