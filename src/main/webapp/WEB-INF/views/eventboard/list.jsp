<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>KOCO - Korea Offer Culture Organizaion</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/qna.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/event_top.jsp" />
	<!-- <div class="row">
		<div class="col-lg-12"> -->
	<div id="qna" class="container">
	<h1 class="card-title">Event</h1><br>
	<button id='regBtn' type="button" class="btn btn-primary btn-lg pull-right" style="font-size:10px;">New Event</button><br><br><br>
<!-- <div class="panel-body"> -->
	<table class="table table-striped table-hover"id='board_list' style="border-bottom: 1px solid #dfd7ca;">
		<thead>
			<tr>
				<th class="text-center">글번호</th>
				<th class="text-center">제목</th>
				<th class="text-center">작성자</th>
				<th class="text-center">작성일</th>
				<th class="text-center">조회수</th>
				<th class="text-center">마음</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="event">
			<!-- 조회페이지 이동 수정 후 -->
			<tr>
				<td class="text-center"><c:out value="${event.boardNo}" /></td>
				<td class="text-center" ><a class='move' href='<c:out value="${event.boardNo}"/>'>
						<c:out value="${event.boardTitle}" />
				</a></td>
				<td class="text-center"><c:out value="${event.writer}" /></td>
				<td class="text-center"><c:out value="${event.boardRegdate}" /></td>
				<td class="text-center"><c:out value="${event.boardReadcount}" /></td>
				<td class="text-center"><a href="users/mypage">마음</a></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 검색 영역 -->
	<table style="width: 100%">
		<tr>
			<td style="width: 20%">
				<!-- <div class="text-left">
					<a href="#" class="btn btn-primary btn-lg" style="width: 100px; color: #fff;">공백</a>		
				</div> -->
			</td>
			<td style="width: 20%;">
				<form class="navbar-form">
					<div class="input-group text-right" >
						<div class="form-group navbar-left" style="width: 30%;">
							<select class="custom-select" style="height: fit-content;">
								<option selected="">🔎</option>
								<option value="1">제목</option>
								<option value="2">내용</option>
								<option value="3">작성자</option>
							</select>
						</div>
						<input type="text" class="form-control" placeholder="SERCH" style="border: 1px solid #ced4da; margin: 0; width: 58%;">
						<!-- <div class="input-group-append" style="height: fit-content; width: 20%;"> -->
							<button class="btn btn btn-primary" type="submit">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
								<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" /></svg>
							</button>
					</div>
					<!-- </div> -->
				</form>
			</td>
		</tr>
	</table><br><br>
	<div class="container">
			<div class='center-block' style="width: 500px;padding:15px;">
				<ul class="pagination" >
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1}">Previous</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
	</div>
	<form id="actionForm" action="/KOCO/eventList" method="get">
		<input type="hidden" name="pageNum"
			value="${pageMaker.cri.pageNum }"> <input type="hidden"
			name="amount" value="${pageMaker.cri.amount }">
	</form>
</div>
<div id="myModal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Save
					changes</button>
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>

<script>
$(document).ready(function() {
	var result = '<c:out value="${result}"/>';
	checkModal(result);
	history.replaceState({}, null, null);

function checkModal(result) {
	if (result === '' || history.state) {
		return;
	}
		if (result === 'success') {
			$(".modal-body").html("정상적으로 처리되었습니다.");
			} else if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result)+ " 번이 등록되었습니다.");
				}
		$("#myModal").modal("show");
		}
	$("#regBtn").on("click", function() {
		self.location = "/KOCO/eventRegister";
		});
	
	var actionForm = $("#actionForm");
	
	$(".page-link").on("click", function(e) {
		e.preventDefault();//기본동작을 제한
		console.log("click");
		var targetPage = $(this).attr("href");//href(a태그)
		console.log(targetPage); //<form>태그의 내용 변경후 submit(전송)
		actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));//val(값을 전달해줌)
		actionForm.submit();//값이 전송돼서 날아감
		});
	$(".move").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='boardNo' value='"+ $(this).attr("href")+ "'>");
		actionForm.attr("action","/KOCO/eventGet");	//컨트롤러 매핑
		actionForm.submit();
		});
	
	$(".paginate_button a").on("click",function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});
	});
</script>
</body></html>