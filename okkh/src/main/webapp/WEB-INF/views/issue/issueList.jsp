<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/bootstrap.css">

    <link rel="stylesheet" href="resources/vendors/iconly/bold.css">

    <link rel="stylesheet" href="resources/vendors/choices.js/choices.min.css" />


    <link rel="stylesheet" href="resources/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="resources/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="resources/css/app.css">
    <link rel="shortcut icon" href="resources/images/favicon.svg" type="image/x-icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        .labelSpan{
            font-size: 13px;
            font-weight: 600;
            padding : 3px 5px;
            border-radius: 5px;
            color: white;
        }
    </style>
</head>
<body>
<div id="app">
        	<!-- 사이드바 시작 -->
			<jsp:include page="../common/leftSide.jsp"></jsp:include>
            <!--사이드바 끝-->
            <div id="main">
                <header class="mb-3 card">
                    <nav class="navbar navbar-expand navbar-light navbar-top">
                        <div class="container-fluid">
                            <!-- <a href="#" class="burger-btn d-block">
                                <i class="bi bi-justify fs-3"></i>
                            </a> -->
    
                            <h3 style="margin: 0%;">Main Home</h3>
    
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <c:choose>
                                <c:when test="${ not empty loginMember }">
    
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav ms-auto mb-lg-0">
                                            <li class="nav-item dropdown me-1">
                                                <a class="nav-link active dropdown-toggle text-gray-600" href="#"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class='bi bi-envelope bi-sub fs-4'></i>
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end"
                                                    aria-labelledby="dropdownMenuButton">
                                                    <li>
                                                        <h6 class="dropdown-header">Mail</h6>
                                                    </li>
                                                    <li><a class="dropdown-item" href="#">No new mail</a></li>
                                                </ul>
                                            </li>
                                            <li class="nav-item dropdown me-3">
                                                <a class="nav-link active dropdown-toggle text-gray-600" href="#"
                                                    data-bs-toggle="dropdown" data-bs-display="static"
                                                    aria-expanded="false">
                                                    <i class='bi bi-bell bi-sub fs-4'></i>
                                                    <span class="badge badge-notification bg-danger">7</span>
                                                </a>
                                                <ul class="dropdown-menu dropdown-menu-end notification-dropdown"
                                                    aria-labelledby="dropdownMenuButton">
                                                    <li class="dropdown-header">
                                                        <h6>Notifications</h6>
                                                    </li>
                                                    <li class="dropdown-item notification-item">
                                                        <a class="d-flex align-items-center" href="#">
                                                            <div class="notification-icon bg-primary">
                                                                <i class="bi bi-cart-check"></i>
                                                            </div>
                                                            <div class="notification-text ms-4">
                                                                <p class="notification-title font-bold">Successfully check
                                                                    out</p>
                                                                <p class="notification-subtitle font-thin text-sm">Order ID
                                                                    #256</p>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li class="dropdown-item notification-item">
                                                        <a class="d-flex align-items-center" href="#">
                                                            <div class="notification-icon bg-success">
                                                                <i class="bi bi-file-earmark-check"></i>
                                                            </div>
                                                            <div class="notification-text ms-4">
                                                                <p class="notification-title font-bold">Homework submitted
                                                                </p>
                                                                <p class="notification-subtitle font-thin text-sm">Algebra
                                                                    math homework</p>
                                                            </div>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <p class="text-center py-2 mb-0"><a href="#">See all
                                                                notification</a></p>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <div class="dropdown">
                                            <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                                <div class="user-menu d-flex">
                                                    <div class="user-name text-end me-3">
                                                        <h6 class="mb-0 text-gray-600">John Ducky</h6>
                                                        <p class="mb-0 text-sm text-gray-600">Administrator</p>
                                                    </div>
                                                    <div class="user-img d-flex align-items-center">
                                                        <div class="avatar avatar-md">
                                                            <img src="../../resources/assets/compiled/jpg/1.jpg">
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton"
                                                style="min-width: 11rem;">
                                                <li>
                                                    <h6 class="dropdown-header">Hello, John!</h6>
                                                </li>
                                                <li><a class="dropdown-item" href="#"><i
                                                            class="icon-mid bi bi-person me-2"></i> My
                                                        Profile</a></li>
                                                <li><a class="dropdown-item" href="#"><i
                                                            class="icon-mid bi bi-gear me-2"></i>
                                                        Settings</a></li>
                                                <li><a class="dropdown-item" href="#"><i
                                                            class="icon-mid bi bi-wallet me-2"></i>
                                                        Wallet</a></li>
                                                <li>
                                                    <hr class="dropdown-divider">
                                                </li>
                                                <li><a class="dropdown-item" href="logout.me"><i
                                                            class="icon-mid bi bi-box-arrow-left me-2"></i> Logout</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <!-- <a href="loginForm.me" class="btn btn-primary">로그인 해주세요.</a> -->
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </nav>
                </header>

                <section class="section">
                    <div class="row" id="table-head">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Issue</h4>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary me-1 mb-1"
                                            style="width: 100px; float: right;"
                                            onclick="location.href='issueEnroll.html'">이슈등록</button>
                                    </div>
                                    <button class="btn btn-primary" id="allBtn">전체</button>
                                    <button class="btn btn-primary" id="continueBtn">진행중</button>
                                    <button class="btn btn-primary" id="finishBtn">진행완료</button>
                                </div>


                                <div class="card-content">
                                    <!-- table head dark -->
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>번호</th>
                                                    <th>제목</th>
                                                    <th>생성일</th>
                                                    <th>작성자</th>
                                                    <th>
                                                        <div class="row" style="margin-top: 8px;">
                                                            <div class="col-1" style="line-height: 50px;">라벨</div>
                                                            <div class="form-group col-11" style="width:500px;">
																
                                                                <select class="choices form-select multiple-remove"
                                                                    multiple="multiple">
                                                                    <optgroup label="Figures">
                                                                    	<c:forEach var="l" items="${ lList }">
                                                                    		<option>${ l.name }</option>
                                                                    	</c:forEach>
                                                                    </optgroup>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <th>담당자</th>
                                                    <th>진행상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            
                                            	<c:forEach var="i" items="${ list }">
	                                                <tr>
	                                                    <td class="text-bold-500">${ i.number }</td>
	                                                    <td class="text-bold-500"><a href="issueDetail.html"
	                                                            style="color: black; font-weight: bold;">${ i.title }</a></td>
	                                                    <td>${ i.createdAt }</td>
	                                                    <!-- 여기 td는 String으로 받은 여러 라벨들을 풀어서 보여줘야함. -->
	                                                    
	                                                    
		                                                    <td class="text-bold-500">${ i.user }</td>
		                                                    <td>
                                                            <c:forEach var="j" items="${ i.labels }">
                                                            	<c:forEach var="l" items="${ lList }">
                                                            		<c:if test="${ j eq l.name }">
                                                                    	<span class="labelSpan" style="background-color: #${l.color};">${ l.name }</span>                                                            		
                                                            		</c:if>
                                                            	</c:forEach>
                                                            </c:forEach>
		                                                    </td>

	                                                    <td class="align-middle">
	                                                        <div class="avatar-group">
	                                                            <span class="avatar avatar-sm">
	                                                                <img alt="avatar"
	                                                                    src="https://img.sbs.co.kr/newsnet/etv/upload/2023/08/17/30000869319_1280.jpg"
	                                                                    class="rounded-circle">
	                                                            </span>
	                                                        </div>
	                                                    </td>
	                                                    <td id="continue">${ i.state }</td>
	                                                    <td><a href="#"><i
	                                                                class="badge-circle badge-circle-light-secondary font-medium-1"
	                                                                data-feather="mail"></i></a></td>
	                                                </tr>
                                                </c:forEach>	
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <footer>
                    <div class="footer clearfix mb-0 text-muted">
                        <div class="float-start">
                            <p>2021 &copy; Mazer</p>
                        </div>
                        <div class="float-end">
                            <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                    href="http://ahmadsaugi.com">A. Saugi</a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script>
            $(function () {

                // 진행중 조회
                $("#continueBtn").click(function () {
                    if ($("#continue").text() === "진행중") {
                        $("tbody tr").hide();
                        $("tbody tr:has(td#continue:contains('진행중'))").show();
                    }
                })

                // 전체조회
                $("#allBtn").click(function () {
                    $("tbody tr").show();
                });

                // 진행완료 조회
                $("#finishBtn").click(function () {
                    $("tbody tr").hide();
                    $("tbody tr:has(td#continue:contains('진행완료'))").show();
                });
            });

            
        </script>
        
        



        <script src="resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="resources/js/bootstrap.bundle.min.js"></script>

        <script src="resources/vendors/apexcharts/apexcharts.js"></script>
        <script src="resources/js/pages/dashboard.js"></script>

        <script src="resources/js/main.js"></script>
        <script src="resources/vendors/choices.js/choices.min.js"></script>

        <script src="resources/js/main.js"></script>
</body>
</html>