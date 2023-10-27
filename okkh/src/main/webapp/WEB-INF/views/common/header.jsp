<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!--  
<script>
	var socket = null;
	
	$(document).ready(function(){
		if(${loginMember != null}) {
			connect();
			}
	})
	
	//소켓
	function connect(){
		console.log("소켓 고고!!")
		
		var ws = new SockJS("/okkh/myPage.me");
		socket = ws;
		
		ws.onopen = function() {
	 		console.log('Info: connection opened');
		};
	
		ws.onmessage = function(event) {
			console.log("onmessage"+ event.data);
			let $socketAlert = $('div#socketAlert');
			
			$socketAlert.html(event.data);
			$socketAlert.css('display', 'block');
			
			setTimeout(function() {
				$socketAlert.css('display','none');
			}, 5000);
		};
	
		ws.onclose = function(event) {
		    console.log('Info: connection closed');
		};
	};
	//소켓끝
	
	$(documet).ready(function(){
		$("#myPage").on('click', function(evt){
			evt.preventDefault();
			if(socket.readyState !== 1) return;
			
			let msg = $("input#mnsg").val();
			ws.send(msg);
		});
	})
	
</script>
-->
</head>

<body>
    <header class="mb-3 card">
        <nav class="navbar navbar-expand navbar-light navbar-top">
            <div class="container-fluid">
                <!-- <a href="#" class="burger-btn d-block">
                    <i class="bi bi-justify fs-3"></i>
                </a> -->
                
                <h3 style="margin: 0%;"></h3>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <c:choose>
                    <c:when test="${ not empty loginMember }">
                        <input>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mb-lg-0">
                                <li class="nav-item dropdown me-1">
                                    <a class="nav-link active dropdown-toggle text-gray-600" href="#" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class='bi bi-envelope bi-sub fs-4'></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                                        <li>
                                            <h6 class="dropdown-header">Mail</h6>
                                        </li>
                                        <li><a class="dropdown-item" href="#">No new mail</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown me-3">
                                    <a class="nav-link active dropdown-toggle text-gray-600" href="#" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                        <i class='bi bi-bell bi-sub fs-4'></i>
                                        <span class="badge badge-notification bg-danger">7</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end notification-dropdown" aria-labelledby="dropdownMenuButton">
                                        <li class="dropdown-header">
                                            <h6>Notifications</h6>
                                        </li>
                                        <li class="dropdown-item notification-item">
                                            <a class="d-flex align-items-center" href="#">
                                                <div class="notification-icon bg-primary">
                                                    <i class="bi bi-cart-check"></i>
                                                </div>
                                                <div class="notification-text ms-4">
                                                    <p class="notification-title font-bold">Successfully check out</p>
                                                    <p class="notification-subtitle font-thin text-sm">Order ID #256</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="dropdown-item notification-item">
                                            <a class="d-flex align-items-center" href="#">
                                                <div class="notification-icon bg-success">
                                                    <i class="bi bi-file-earmark-check"></i>
                                                </div>
                                                <div class="notification-text ms-4">
                                                    <p class="notification-title font-bold">Homework submitted</p>
                                                    <p class="notification-subtitle font-thin text-sm">Algebra math homework</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <p class="text-center py-2 mb-0"><a href="#">See all notification</a></p>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="user-menu d-flex">
                                        <div class="user-name text-end me-3">
                                           	<h6 class="mb-0 text-gray-600">${ git.gitNick }</h6>
                                            <p class="mb-0 text-sm text-gray-600">@${ git.type }</p>
                                        </div>
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                <img src="${ git.profile }" style="border: 1px solid #cecece;">
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton" style="min-width: 11rem;">
                                    <li>
                                        <h6 class="dropdown-header">Hello, ${ git.gitNick }!</h6>
                                    </li>
                                    <li><a class="dropdown-item" href="myPage.me" id="myPage"><i class="icon-mid bi bi-person me-2"></i> My
                                            Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="icon-mid bi bi-gear me-2"></i>
                                            Settings</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="icon-mid bi bi-wallet me-2"></i>
                                            Wallet</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="logout.me"><i
                                                class="icon-mid bi bi-box-arrow-left me-2"></i>Logout</a></li>
                                </ul>
                            </div>
                        </div>
                        
                    </c:when>
                    <c:otherwise>
                        
	                    <!-- 로그인버튼 -->
	                    <button type="button" onclick="login()" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right;">
	                        Github Login
	                    </button>

	                    <!-- 로그인 모달 창 -->
	                    <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog"
	                    aria-labelledby="myModalLabel33" aria-hidden="true">
	                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
	                            role="document">
	                            <div class="modal-content">
	                                <div class="modal-header">
	                                    <div style="text-align: center; margin: auto;">
	                                        <span>Sign into Github to continue to OKKH!</span>
	                                    </div>
	                                    <button type="button" class="close" data-bs-dismiss="modal"
	                                        aria-label="Close">
	                                        <i data-feather="x"></i>
	                                    </button>
	                                </div>
                                    <div class="modal-body">
                                        <a href="https://github.com/login/oauth/authorize?scope=user%20repo%20project&client_id=d81caaa37ed07a86dd0e">
                                        	<img src="resources/images/logo/gitLogo.png" alt="" style="width: 20%; margin: auto; display: block;">
                                        </a>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-light-secondary"
                                            data-bs-dismiss="modal">
                                            <i class="bx bx-x d-block d-sm-none"></i>
                                            <span class="d-none d-sm-block">Close</span>
                                        </button>
                                    </div>
	                            </div>
	                        </div>
	                    </div>
                        
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </header>
    <!-- 상단바 끝 -->
    


</body>



</html>

















