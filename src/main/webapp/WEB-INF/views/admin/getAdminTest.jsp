<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#toc-input {
	display: none;
}
</style>
<meta charset="UTF-8">
<title>get admin test</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>

<body>
	<c:import url="/WEB-INF/views/include/admin_top.jsp" />
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="card border-light mb-12" style="max-width: 100%;">
					<div class="card-header" style="font-weight: bold;">adminTest</div>
					<div class="card-body">
						<h4 class="card-title">제목</h4>
						<h4 class="card-title" style="font-size: 15px;">유저이름
							${groupNo } / 업로드일</h4>
						<p class="card-text">내용</p>
						<div class="form-group">
							<div class="text-right">
								<a href="adminTest" class="btn btn-primary">목록보기</a> <a href=""
									class="btn btn-info">수정하기</a> <a href="" class="btn btn-danger">삭제하기</a>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>

	<!--댓글 관련 css -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12" style="top: 30px;">
				<form action="commentRegister" method="post">
					<input type="hidden" name="depth" value="0"> <input
						type="hidden" name="boardCategory" value="2"> <input
						type="hidden" name="boardNo" value="464"> <input
						type="hidden" name="userNo" value="1"> <input
						type="hidden" name="groupNo" value="${groupNo }">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<div class="row">
								<div class="col-md-11" style="height: 100px;">
									<textarea name="commentContent" placeholder="댓글을 입력해주세요"
										required="required" style="width: 100%; height: 100%;"></textarea>
								</div>
								<div class="col-md-1">
									<button type="submit" class="btn btn-success">작성완료</button>
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</form>

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-12" style="top: 30px;">

								<c:forEach items="${commentList }" var="comment">
									<c:set var="depth" value="${comment.depth }" />
									<c:if test="${depth eq 0 }">
										<div class="row">
											<div class="col-md-3">
												<h3>유저번호 : ${comment.userNo} / 작성 날짜 :
													${comment.commentRegdate} / 그룹번호 : ${comment.groupNo }</h3>
											</div>
											<div>
												<button type="button"
													onclick="self.location.href='commentUpdateForm?commentNo=${comment.commentNo}&commentContent=${comment.commentContent }'"
													class="btn btn-info">수정</button>

												<button type="button"
													onclick="self.location.href='commentDelete?groupNo=${comment.groupNo}'"
													class="btn btn-danger">삭제</button>
												<button type="button" class="btn btn-success">대댓글</button>
											</div>
										</div>
										<p style="font-size: 20px;">부모댓글 내용 :
											${comment.commentContent}</p>

										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-11">
												<div class="row">
													<form action="comcommentRegister" method="post">
														<input type="hidden" name="depth" value="1"> <input
															type="hidden" name="boardCategory" value="1"> <input
															type="hidden" name="boardNo" value="639"> <input
															type="hidden" name="userNo" value="1"> <input
															type="hidden" name="groupNo" value="${comment.groupNo }">
														<div class="col-md-11" style="height: 80px;">
															<textarea name="commentContent" placeholder="대댓글을 입력해주세요"
																required="required" style="width: 100%; height: 100%;"></textarea>
														</div>
														<div class="col-md-1">
															<button type="submit" class="btn btn-success">작성완료</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</c:if>


									<!-- 대댓글css -->
									<c:if test="${depth eq 1 }">
										<div class="row">
											<div class="col-md-1"></div>
											<div class="col-md-11">
												<div class="row">
													<div class="col-md-3">
														<h3>유저번호 ${comment.userNo } / 날짜
															${comment.commentRegdate} / 그룹번호 : ${comment.groupNo }</h3>
													</div>
													<div>
														<button type="button"
															onclick="self.location.href='commentUpdateForm?commentNo=${comment.commentNo}&commentContent=${comment.commentContent }'"
															class="btn btn-info">수정</button>
													</div>
													<div>
														<button type="button"
															onclick="self.location.href='comcommentDelete?commentNo=${comment.commentNo}'"
															class="btn btn-danger">삭제</button>
													</div>
												</div>
												<p style="font-size: 20px;">${comment.commentContent }</p>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

