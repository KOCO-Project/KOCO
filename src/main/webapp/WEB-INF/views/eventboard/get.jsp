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
	<link rel="stylesheet" href="css/event.css?v=9">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="ckeditor/ckeditor.js"></script>
	<script>	
	function loginCheck(){
		var loginyn = $('#loginyn').val();
		
		console.log(loginyn);
		
		if(loginyn == ''){
			alert('로그인 해주세요.');
			location.href = 'loginView';
			return false;
		} else {
			return true;
		}
	}
	</script>
	<style>
	.boardContent {text-align: center;}
	.boardContent img { max-width:600px; height:auto;}
	.thumbImg {max-width:600px; height:auto; }
	</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<div id="event" class="container">
		<div class="row">
			<div class="col-md-12 mb-3" style="text-align: center;">
				<h2>Event</h2>
				<p style="color: #939393;">이벤트 게시판 입니다 :)</p>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
					<div class="panel-body">
						<div class="form-group">
							<hr>
							<label>&nbsp;&nbsp;제목&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<c:out value="${event.boardTitle}" /></label> <br><br> 
							<label>&nbsp;&nbsp;마감일&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
								<c:out value="${event.boardRegdate}" /></label> <br>
							<hr>
						</div>
						<br>
						<div class="form-group">
							<div class="boardContent">
								${event.boardContent}
								<%-- <c:out value="${event.boardContent}"/> --%>
							</div>
							<br>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-7">
								<label>&nbsp;&nbsp;작성자&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									<c:out value="${event.writer}" />
								</label> 
							</div>
						</div>
						<div class="form-group">
							<hr>
							<label>&nbsp;&nbsp;첨부파일&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							<c:out value="${event.fileName}"/></label>
							<hr>
							<%-- <div class="inputArea">
								<p>&nbsp;&nbsp;썸네일 (썸네일 시험용 보기. 없어질 영역.)</p>
								<img src="${event.thumbnail}" class="thumbImg" />
							</div> --%>
						</div>
						<div class="form-group" style="text-align: center;">
						<c:if test="${sessionScope.user.userCase == 1}">
							<button data-oper='update' class="btn btn-success" style="background-color: #2172AF;">수정하기</button>
							<%-- <a href="getEventUpdate?boardNo=${event.boardNo}&page=${page}" class="btn btn-success" style="width: 100px;">수정하기</a> --%> 
							<button type="submit" data-oper='delete' class="btn btn-danger">삭제하기</button>
							<%-- <a href="eventDelete?boardNo=${event.boardNo}" class="btn btn-danger" style="width: 100px;">삭제하기</a> --%>
						</c:if>
							<button data-oper='list' class="btn" style="background-color: #EDB95F; color: white;">돌아가기</button>
							<button data-oper='remove' class="btn" style="background-color: #EDB95F; color: white;">삭제하기</button>
							<%-- <a href="/KOCO/eventDelete?boardNo=${boardNo}" class="btn btn-danger" style="width: 100px;">삭제하기</a> --%>
						</div>
						<form id='operForm' action="/eventboard/update" method="get">
							<input type='hidden' id='boardNo' name='boardNo'
								value='<c:out value="${event.boardNo}"/>'>
						</form>
					</div>
				<!-- </div> -->
			</div>
		</div>
		</div>
	<footer>
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</footer>
<script type="text/javascript">
	$(document).ready(function() {
		
		var operForm = $("#operForm");

		$("button[data-oper='update']").on("click", function(e) {
			operForm.attr("action", "/KOCO/getEventUpdate?page=${page}").submit();
			});
		
		var formObj = $("form");
		
		$('.btn').click(function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'list'){
				self.location ="/KOCO/eventList?page=${page}";
			}else if(operation === 'delete'){
				/* formObj.attr("action", "/KOCO/eventDelete"); */  
				result = confirm('삭제 하시겠습니까');
    			if(result == true){
					formObj.attr("action","/KOCO/eventDelete")
					.attr("method", "post");
					formObj.submit();
    			} else{
    				return false;
    			}
			}else if(operation === 'remove'){
				self.location ="/KOCO/eventDelete?boardNo=${boardNo}";
			}
		})
	});
	/* function test() { 
		txt = document.getElementById("userNo"); 
		if( txt.readOnly == true ) { 
		txt.style.backgroundColor = "#505050"; 
		return false; 
		} 
		}  */
</script>
</body>
</html>
