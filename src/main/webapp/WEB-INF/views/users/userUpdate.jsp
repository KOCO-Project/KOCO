<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPagePwTest</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
   <c:import url="/WEB-INF/views/include/top_menu.jsp" />
   <div class="container-fluid">
      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-8" style="margin-top: 150px;">
            <div class="row">
               <div class="col-md-6" style="height: 60px;">
                  <a href="myPageTest" class="btn btn-success" style="float: right;">개인정보 변경</a>
               </div>
               <div class="col-md-6">
                  <a href="myPagePwTest" class="btn btn-success">비밀번호 변경</a>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <h3 style="text-align: center;">석무지님 안녕하세요</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="text" value="id" style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="text" value="name" style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="text" value="email"
                     style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12">
                  <input type="text" value="date" style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-6">
                  <button type="button" class="btn btn-success" style="float: right;">수정완료</button>
               </div>
               <div class="col-md-6">
                  <button type="button" class="btn btn-success">취소</button>
               </div>
            </div>
         </div>
         <div class="col-md-2"></div>
      </div>
   </div>
</body>
</html>