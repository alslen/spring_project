<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Camping GO</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/styles.css" rel="stylesheet" />
    <!-- Icons font CSS-->
    <link href="/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">        
            <!-- Vendor CSS-->
    <link href="/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Main CSS-->
    <link href="/css/main.css" rel="stylesheet" media="all">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    </head>
    <body>
   <sec:authorize access="isAuthenticated">
		<sec:authentication property="principal" var="principal"/>
	</sec:authorize>
        <!-- Navigation-->
        <!------------------로그인 전 화면---------------------->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <div class="container  px-4 px-lg-5 mr-auto">
            <a href="/"><img src="/img/logo2.jpg" height="40" width="40" alt="My Image" style="margin-right:10px"></a>
                <a class="navbar-brand" href="/">Camping Go</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse  " id="navbarSupportedContent" >
      				 <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 ">
      				 <sec:authorize access="isAnonymous()">
                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/join">회원가입</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/login">로그인</a></li>
                                <li><a class="dropdown-item" href="#!">고객센터</a></li>
                            </ul>
                        </li>
                     </sec:authorize>
                    </ul>
                            <!------------------로그인 후 화면---------------------->
   			 	<sec:authorize access="isAuthenticated()">
                 <div class="collapse navbar-collapse  " id="navbarSupportedContent" >
                     <ul class="navbar-nav "> 
                     	<li class="nav-item dropdown ">
                     		<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >Menu</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/update/${principal.member.id }">내정보</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="booking">예약정보</a></li>
                                <li><a class="dropdown-item" href="/logout">로그아웃(<sec:authentication property="principal.member.username" />)</a></li>
                                <li><a class="dropdown-item" href="#!">고객센터</a></li>
                            </ul>
                     	</li>
                     </ul>
                     </div>
                     </sec:authorize>
                     
                        <!-- 관리자만 볼 수 있는 메뉴 -->
                 <sec:authorize access="isAuthenticated()">
                 <c:if test="${principal.member.role == 'ROLE_ADMIN' }">
                 <div class="collapse navbar-collapse  " id="navbarSupportedContent" >
                     <ul class="navbar-nav "> 
                     	<li class="nav-item dropdown ">
                     		<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" >관리자</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="">회원목록</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/insert">캠핑장 등록</a></li>
                                <li><a class="dropdown-item" href="/insert">예약 목록</a></li>
                            </ul>
                     	</li>
                     </ul>
                     </div>
                     </c:if>
                     </sec:authorize>
                     
                     </div>
                     </div>
                     </nav>
                     
       <!-- Header--> 
        <header class="py-5">
            	<div class="wrapper wrapper--w1070">
                <div class="card-body">
                    <form class="form" method="POST" action="#">
                        <div class="input-group input--large">
                            <label class="label">going to</label>
                            <input class="input--style-1" type="button" placeholder="Camping name" name="going" id="btnGoing">
                        </div>
                        <div class="input-group input--medium">
                            <label class="label">Check-In</label>
                            <input class="input--style-1" type="text" name="checkin" placeholder="mm/dd/yyyy" id="input-start">
                        </div>
                        <div class="input-group input--medium">
                            <label class="label">Check-Out</label>
                            <input class="input--style-1" type="text" name="checkout" placeholder="mm/dd/yyyy" id="input-end">
                        </div>
                        <div class="input-group input--medium">
                            <label class="label">guests</label>
                            <div class="input-group-icon js-number-input">
                                <div class="icon-con">
                                    <span class="plus">+</span>
                                    <span class="minus">-</span>
                                </div>
                                <input class="input--style-1 quantity" type="text" name="guests" value="2 Guests">
                            </div>
                        </div>
                        <button class="btn-submit" type="submit">search</button>
                    </form>
                </div>
            </div>
        </header>
        
        
        <script>
        $("#btnGoing").click(function(){
        	window.open("/map", "", "width=550 height=450");
        })
        
        
        
        </script>
        
        
    <!-- Jquery JS-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="/vendor/select2/select2.min.js"></script>
    <script src="/vendor/jquery-validate/jquery.validate.min.js"></script>
    <script src="/vendor/bootstrap-wizard/bootstrap.min.js"></script>
    <script src="/vendor/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="/vendor/datepicker/moment.min.js"></script>
    <script src="/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/js/global.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>              