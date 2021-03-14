<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <!-- title과 title icon -->
        <title>KOCO - Korean Offer Culture Organization</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

        <!-- fab 아이콘 -->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css?v=4" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/qna.css?v=5">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
   	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
        <!-- Masthead-->
        <header class="deSeop">
            <div style="text-align-last: center;padding: 41px;">
<!--                 <div class="masthead-subheading" style="color: black;">Welcome To KOCO!</div> -->
                <div class="masthead-heading text-uppercase" style="color: white;font-weight: bold;font-size: 50px;letter-spacing: 20px;">Our Team</div>
                <a class="btn btn-dark btn-xl text-uppercase js-scroll-trigger" href="supportMailForm" style="background-color: white;border-radius: 50px;border: none;color: black;font-size: 10px;letter-spacing: 1px;margin-top: 10px;">Would you contact us?</a>
                
            </div>
        </header>
        
        <!-- Team-->
        <section class="page-section bg-light" id="team" style="background-color: white !important;">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase"style="font-weight: bold;font-size: 30px;">KOCO의 팀원을 소개합니다</h2>
<!--                     <h3 class="section-subheading text-muted">Introducing the team members of our team KOCO</h3> -->
                </div>
                <div class="row" style="padding: 7%;">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="images/team/developer_seop.jpg" alt=""  style="box-shadow: 1px 2px 10px 2px grey;"/>
                            <h4 style="font-weight: bold;">TaeSeop-Kim</h4>
                            <p class="text-muted">Project Manager</p>
                            <a class="btn" href="https://github.com/tseop"><i class="fab fa-github" style="width: 30px; height: 30px;"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> -->
                            <a class="btn" href="https://www.instagram.com/seop_tae/"><i class="fab fa-instagram" style="width: 30px; height: 30px;"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="images/team/minseuk.jpeg" alt=""  style="box-shadow: 1px 2px 10px 2px grey;"/>
                            <h4 style="font-weight: bold;">MinSuk-Ryu</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn" href="https://github.com/sukmuzi"><i class="fab fa-github" style="width: 30px; height: 30px;"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> -->
                            <a class="btn" href="https://www.instagram.com/sukmuzi/"><i class="fab fa-instagram" style="width: 30px; height: 30px;"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="images/team/jiwon.jpeg" alt=""  style="box-shadow: 1px 2px 10px 2px grey;"/>
                            <h4 style="font-weight: bold;">JiWon-Oh</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn" href="https://github.com/trydoit9"><i class="fab fa-github" style="width: 30px; height: 30px;"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> -->
                            <a class="btn" href="https://www.instagram.com/gee_wonny/"><i class="fab fa-instagram" style="width: 30px; height: 30px;"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="images/team/sanga.jpeg" alt=""  style="box-shadow: 1px 2px 10px 2px grey;"/>
                            <h4 style="font-weight: bold;">SangA-Lee</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn" href="https://github.com/stkddks"><i class="fab fa-github" style="width: 30px; height: 30px;"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> -->
                            <a class="btn" href="https://www.instagram.com/ivovrysanga/"><i class="fab fa-instagram" style="width: 30px; height: 30px;"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="images/team/developer_Ayoung.jpg" alt="" style="box-shadow: 1px 2px 10px 2px grey;"/>
                            <h4 style="font-weight: bold;">AYoung-Lee</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn" href="https://github.com/ARONGLEE"><i class="fab fa-github" style="width: 30px; height: 30px;"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> -->
                            <a class="btn" href="https://www.instagram.com/lylykymm/"><i class="fab fa-instagram" style="width: 30px; height: 30px;"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="images/team/yongwon.png" alt="" style="box-shadow: 1px 2px 10px 2px grey;"/>
                            <h4 style="font-weight: bold;">YongWon-Cho</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a class="btn" href="https://github.com/dyddnjs524"><i class="fab fa-github" style="width: 30px; height: 30px;"></i></a>
                            <!-- <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> -->
                            <a class="btn" href="https://www.instagram.com/be_quiet_o/"><i class="fab fa-instagram" style="width: 30px; height: 30px;"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center">
                        <p class="large text-muted" style="font-size: 10px;letter-spacing: 1px;">
                        	2020년 9월 KH정보교육원에서 만나 6개월간의 웹개발자 과정에서 맺어진 인연 입니다.
                            <br>서로 다른 직종에서 개발자의 꿈을 이루고자 모여 
                            <br>코로나19의 어려운 상황에서 4개월간 2개의 프로젝트를 진행하였으며
                            <br>파이널 프로젝트인 KOCO가 완성이 되었습니다.
                            <br>KOCO는 한국문화커뮤니티로 한국에 대한 문화, 여행등의 정보를 교류할 수 있는 페이지로 
                            <br>많은 국내외 사람들이 대한민국이란 국가의 아름다움을 더 알았으면 하는 마음에 기획을 하게 되었습니다.
                            </p>
                            
                            </div>
                </div>
            </div>
        </section>
        
        <!-- Contact-->
        <!-- <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contact Developer</h2>
                    <h3 class="section-subheading text-muted">개발자에게 개인적인 문의사항이 있으시다면 보내주세요</h3>
                </div>
                <form id="contactForm" name="sentMessage" novalidate="novalidate">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input class="form-control" id="name" type="text" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address." />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="form-group mb-md-0">
                                <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number." />
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <div id="success"></div>
                        <button class="btn btn-primary btn-x2 text-uppercase" id="sendMessageButton" type="submit">Send Message</button>
                    </div>
                </form>
            </div>
        </section> -->
        <footer>
			<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
		</footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>