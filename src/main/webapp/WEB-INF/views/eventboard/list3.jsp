<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
    <title>KOCO - Korea Offer Culture Organizaion</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Business Frontpage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <!-- Custom styles for this template -->
	
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/event.css?v=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<body>
<c:import url="/WEB-INF/views/include/event_top.jsp" />

  <!-- Header -->
  <!-- <header class="bg-primary py-5 mb-5">
    <div class="container h-100">
      <div class="row h-100 align-items-center">
        <div class="col-lg-12">
          <h1 class="display-4 text-white mt-5 mb-2">Business Name or Tagline</h1>
          <p class="lead mb-5 text-white-50">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non possimus ab labore provident mollitia. Id assumenda voluptate earum corporis facere quibusdam quisquam iste ipsa cumque unde nisi, totam quas ipsam.</p>
        </div>
      </div>
    </div>
  </header> -->
<div id="event" class="container">
  <!-- Page Content -->

    <div class="row">
      <div class="col-md-12 mb-5">
        <h1>Event</h1>
        <hr>
        <button id='regBtn' type="button" class="btn btn-primary btn-lg pull-right" style="font-size:10px;">New Event</button>
        <p>이벤트 게시판 입니다 :)</p>
      </div>
    </div>
    <!-- /.row -->
    <div class="row">
<c:forEach items="${list}" var="event">
      <div class="col-md-4 mb-5">
        <div class="card h-80">
          <img class="card-img-top" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample83.jpg" alt="">
          <div class="card-body">
            <h4 class="card-title"><a class='move' href='<c:out value="${event.boardNo}"/>'>
						<c:out value="${event.boardTitle}" />
				</a></h4>
            <p class="card-text"><c:out value="${event.writer}" /></p>
          </div>
          <!-- <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div> -->
        </div>
      </div>
      
      <div class="col-md-4 mb-5">
        <div class="card h-80">
          <img class="card-img-top" src="images/2.jpeg" alt="">
          <div class="card-body">
            <h4 class="card-title">코코 X BC카드 즉시할인 이벤트</h4>
            <p class="card-text">경영지원팀장_LEE</p>
          </div>
          <!-- <div class="card-footer">
            <a href="#" class="btn btn-primary">ㅇㅇ</a>
          </div> -->
        </div>
      </div>
      
      <div class="col-md-4 mb-5">
        <div class="card h-80">
          <img class="card-img-top" src="images/chul.jpeg" alt="">
          <div class="card-body">
            <h4 class="card-title">KOCO 출석체크 이벤트 OPEN!</h4>
            <p class="card-text">경영지원팀장_LEE</p>
          </div>
        </div>
      </div>
      </c:forEach>
</div>
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

  <!-- Footer -->
 <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    /.container
  </footer> 
<%-- <footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer> --%>

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
</body>

</html>