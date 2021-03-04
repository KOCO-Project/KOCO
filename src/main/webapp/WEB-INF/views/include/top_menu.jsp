<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse justify-content-md-center cc_cursor" id="navbarsExample08">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="${root }main"><b>KOCO</b> <span class="sr-only">(current)</span></a>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About</a>
        <div class="dropdown-menu" aria-labelledby="dropdown08">
          <a class="dropdown-item" href="freeBoardList">Culture</a>
          <a class="dropdown-item" href="#">Seasons</a>
        </div>
      </li>

      <li class="nav-item">  
        <a class="nav-link" href="#">Support</a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Community</a>
        <div class="dropdown-menu" aria-labelledby="dropdown08">
          <a class="dropdown-item" href="freeBoardList">Board</a>
          <a class="dropdown-item" href="${root }qna/list?infoNo=2">QnA</a>
          <a class="dropdown-item" href="#">Event</a>
        </div>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li> -->
      <li class="nav-item dropdown"> 
      <c:choose>
	  <c:when test="${sessionScope.user == null }">     
        <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</a>
        <div class="dropdown-menu" aria-labelledby="dropdown08">      
          <a class="dropdown-item" href="loginView">Sign In</a>
          <a class="dropdown-item" href="registerView">Sign Up</a>
<!--           <a class="dropdown-item" href="#">Blah blah</a>       -->
        </div>
      </c:when>
      <c:otherwise>
        <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.user.userNickname }</a>
        <div class="dropdown-menu" aria-labelledby="dropdown08">
          <a class="dropdown-item" href="mypage">Mypage</a>
          <a class="dropdown-item" href="userLogout">Logout</a>
        </div>
	  </c:otherwise>
	  </c:choose>      
      </li>
      
      <li class="nav-item"><a href="adminMain" class="nav-link">admin test</a></li>
      
    </ul> 
  </div>
</nav>
<style>
@media (min-width: 992px){
.navbar-expand-lg .navbar-nav .nav-link {
    padding-right: 2rem;
    padding-left: 2rem;
}}
.dropdown-menu{
background-color:#3e3f3a;

}
.dropdown-menu a{color:white; font-size: 1rem;}
.dropdown-toggle::after {display: none;}

</style>


<script>
var $dropdown = $(".navbar-nav .dropdown");
var $dropdownToggle = $(".dropdown-toggle");
var $dropdownMenu = $(".dropdown-menu");
var showClass = "show";

$(window).on("load resize", function() {
  if (this.matchMedia("(min-width: 768px)").matches) {
    $dropdown.hover(
      function() {
        var $this = $(this);
        $this.addClass(showClass);
        $this.find($dropdownToggle).attr("aria-expanded", "true");
        $this.find($dropdownMenu).addClass(showClass);
      },

      function() {
        var $this = $(this);
        $this.removeClass(showClass);
        $this.find($dropdownToggle).attr("aria-expanded", "false");
        $this.find($dropdownMenu).removeClass(showClass);
      }
    );
  } else {
    $dropdown.off("mouseenter mouseleave");
  }
});


</script>


