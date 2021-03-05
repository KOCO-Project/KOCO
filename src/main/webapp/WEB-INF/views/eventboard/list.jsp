<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <c:import url="/WEB-INF/views/include/top_menu.jsp"/> --%>
<%-- <c:set var="root" value="${pageContext.request.contextPath }/"/> --%>

<%-- <%@include file="../includes/header.jsp"%> --%>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>KOCO - Korea Offer Culture Organizaion</title>
<!-- 
    Bootstrap Core CSS
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    MetisMenu CSS
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    DataTables CSS
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    DataTables Responsive CSS
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    Custom CSS
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    Custom Fonts
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 -->
	<title>QnA</title>
	<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap CDN -->
</head>

<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-heading">
				<!-- Event Board !! -->
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Event</button>
				<br>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>마음</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="event">
						<!-- 조회페이지 이동 수정 후 -->
						<tr>
							<td><c:out value="${event.boardNo}" /></td>
							<td><a class='move' href='eventboard/get?boardNo=<c:out value="${event.boardNo}"/>'>
									<c:out value="${event.boardTitle}" />
							</a></td>
							<td><c:out value="${event.writer}" /></td>
							<td><c:out value="${event.boardRegdate}" /></td>
							<td><c:out value="${event.boardReadcount}" /></td>
							<td><a href="users/mypage">마음</a></td>
						</tr>
					</c:forEach>
				</table>
				<div class='pull-right'>
					<ul class="pagination">
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
				<form id="actionForm" action="/eventboard/list" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }">
				</form>
			</div>
		</div>
	</div>
	<!-- </div> -->
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
		self.location = "/eventboard/register";
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
		actionForm.attr("action","/eventGet");	//컨트롤러 매핑
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