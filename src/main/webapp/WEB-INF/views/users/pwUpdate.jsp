<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageTest</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
   <c:import url="/WEB-INF/views/include/top_menu.jsp" />
   <div class="container">
      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-8" style="margin-top: 150px;">
            <div class="row">
               <div class="col-md-6" style="height: 60px;">
                  <a href="userUpdateView" class="btn btn-success" style="float: right;">개인정보 변경</a>
               </div>
               <div class="col-md-6">
                  <a href="pwUpdateView" class="btn btn-success">비밀번호 변경</a>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <h3 style="text-align: center;">비밀번호 변경</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="password" placeholder="현재 비밀번호" style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="password" placeholder="새 비밀번호" style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-12" style="height: 60px;">
                  <input type="password" placeholder="새 비밀번호 확인" style="width: 100%; height: 50px;">
               </div>
            </div>
            <br>
            <div class="row">
               <div class="col-md-6">
                  <button type="button" class="btn btn-success" style="float: right;">수정</button>
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