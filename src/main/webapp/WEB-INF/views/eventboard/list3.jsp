<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
    <title>KOCO - Korean Offer Culture Organization</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Business Frontpage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <!-- Custom styles for this template -->
	
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/event.css?v=9">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<style>
		#thumbImg{width: 100%; height: 180px;}
	/* .card img{width: 240px; height: 180px;} */
	</style>
</head>

<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp" />
<div id="event" class="container">
	<div class="row">
		<div class="col-md-12 mb-5" style="text-align: center;">
			<h2>Event</h2>
			<p style="color: #939393;">이벤트 게시판 입니다 :)</p>
			<c:if test="${sessionScope.user.userCase == 1}">
			<button id='regBtn' type="button" onclick="return loginCheck();" class="btn btn-primary btn-lg pull-right" style="font-size: 10px; float: right;">New Event</button>
		</c:if>
		</div>
	</div>
    <div class="row">
	<c:forEach items="${list}" var="event">
    <div class="col-md-4 mb-5">
      	<div class="card h-100">
       		<div class="card">
	       		<a class='move' href='/KOCO/eventGet?boardNo=<c:out value="${event.boardNo}"/>&page=${page}'>
	         		<img class="card-img-top" id="thumbImg" src="imgUpload/2021/03/13/fd147ac8-e0e2-476e-8cfe-e5119f11db65_showtime.jpg" alt="">
	       			<%-- <img src="<c:out value="${event.thumbnail}"/>" class="card-img-top" id="thumbImg" /> --%>
	       			<%-- <img src="${event.thumbnail}" class="card-img-top" id="thumbImg" /> --%> 
	         	</a>
	        </div>
       		<div class="card-body">
		       	<h4 class="card-title">
		           	<a class='move' style="color: black; font-size: 1.1rem;" href='/KOCO/eventGet?boardNo=<c:out value="${event.boardNo}"/>&page=${page}'>
						<c:out value="${event.boardTitle}" /> 
					</a>
				</h4>
				<a href="userPage?userNickname=${event.writer}">
      				<p class="card-text" style="color: #939393; font-size: 0.8rem;"><c:out value="${event.writer}" /></p>
      			</a>
      			
      			<c:if test="${sessionScope.user.userCase == 1}">
      			<form role="form" action="/KOCO/bookmark" method="post" modelAttribute="bookmark" enctype="multipart/form-data">
      				<input type="hidden" id="userNo" name="userNo" value="${sessionScope.user.userNo }"/>
      				<%-- <input type="hidden" id="userNickname" name="userNickname" value="${user.userNickname}"/> --%>
      				<input type="hidden" id="boardNo" name="boardNo" value="${event.boardNo}"/>
      				<input type="hidden" id="boardCategory" name="boardCategory" value="3"/>
      				<button type="submit" style="float: right; background-color: #2172AF;" class="btn btn-info">마음</button>
      			</form>
      			</c:if>
      		</div>
      	</div>
    </div>
      
     <!--  <div class="col-md-4 mb-5">
        <div class="card h-80">
          <img class="card-img-top" src="images/2.jpeg" alt="">
          <div class="card-body">
            <h4 class="card-title">코코 X BC카드 즉시할인 이벤트</h4>
            <p class="card-text" style="color: #939393;">경영지원팀장_LEE</p>
          </div>
        </div>
      </div>
      
      <div class="col-md-4 mb-5">
        <div class="card h-80">
          <img class="card-img-top" src="images/chul.jpeg" alt="">
          <div class="card-body">
            <h4 class="card-title">KOCO 출석체크 이벤트 OPEN!</h4>
            <p class="card-text" style="color: #939393;">경영지원팀장_LEE</p>
          </div>
        </div>
      </div> -->
      </c:forEach>
</div>
<!-- <div class="row"> -->
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
			<a href="/KOCO/eventList?page=${pageVO.prevPage}" class="page-link">이전</a>
			</li>
		</c:otherwise>
		</c:choose>

		<c:forEach var='idx' begin="${pageVO.min }" end='${pageVO.max }'>
		<c:choose>
			<c:when test="${idx == pageVO.currentPage }">
				<li class="page-item active">
				<a href="/KOCO/eventList?page=${idx}" class="page-link">${idx }</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a href="/KOCO/eventList?page=${idx}" class="page-link">${idx }</a>
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
					<a href="/KOCO/eventList?page=${pageVO.nextPage}" class="page-link">다음</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- </div> -->
			<%-- <div class='center-block' style="width: 500px;padding:15px;">
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
	</form> --%>
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
</div>

  <!-- Footer -->
<!--  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    /.container
  </footer>  -->
<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
	
	/* $(".page-link").on("click", function(e) {
		e.preventDefault();//기본동작을 제한
		console.log("click");
		var targetPage = $(this).attr("href");//href(a태그)
		console.log(targetPage); //<form>태그의 내용 변경후 submit(전송)
		actionForm.find("input[name='pageNum']")
		.val($(this).attr("href"));//val(값을 전달해줌)
		actionForm.submit();//값이 전송돼서 날아감
		});  */
	/* $(".move").on("click",function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='boardNo' value='"+ $(this).attr("href")+ "'>");
		actionForm.attr("action","/KOCO/eventGet");	//컨트롤러 매핑
		actionForm.submit();
		}); */
	
	$(".paginate_button a").on("click",function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});
	}); 
</script>
</body>

</html>
