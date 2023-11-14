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

	 <script type="text/javascript">
	 
	 //var socket = new SockJS('http://192.168.20.57:7777/okkh/websocket');  // 이건 서버 컴퓨터 주소

	 var socket = new SockJS('http://localhost:7777/okkh/websocket');
	 //domRect = element.getBoundingClientRect();  // 이게 없다고 해서 추가했는데 왜 안돼...?
		
		//소켓
		
		socket.onopen = function(){
			console.log("소켓이 열림!")
		};
		
		socket.onmessage  = function(event){
			//console.log('jsonObject로 받은 메세지 : ' + event.data);
			 //var message = JSON.parse(event.data); // JSON 형식의 메시지를 파싱
		 
			var message = JSON.parse(event.data)
				console.log(message);  //-> 내가 보낸 값이 객체 형태로 담겨있음 
				
				var category = message.category;
				var nick = message.nickName;
				var title = message.title;
				var pno = message.pno;
				var team = message.teamNo;
				var content = message.content;
			 
				console.log(category + " : 카테고리명!!!!")
		
				 // 메세지가 생성될 때마다 동적으로 a태그와 a태그 안에 div를 그릴 예정
				 // 동적으로 그리지 않으면 메세지가 없는대도 메세지 띄워지는 창을 누르면 이동이 되어버림  
				 var link = document.createElement('a');

				
			// url설정을 category별로 따로 설정
			if(category == "project"){
			     link.href = 'selectDetailPro.pro?pno=' + pno;
				
			}else if(category =="friend"){
				 link.href = 'friendList.f';
			}
			
			 	link.style.color= 'black';
			 
			 var div = document.createElement('div');
			
			 // 카테고리별로 메세지 다르게 보낼거임
			 if(category == "project"){
				 
				 div.textContent = nick + ' 님이 '+ "'" + title   +"'  " + content;
				 
			 }else if(category == "friend"){
				
				 div.textContent = nick + ' 님이 '+ content;
			 }
			
			 
			 var container = document.getElementById('messageArea');
			 
			 container.appendChild(link);
			 link.appendChild(div);
		
		 };
		 
		 socket.onclose = function(event) {
			    if (event.wasClean) {
			        console.log('WebSocket 연결이 정상적으로 닫혔습니다.');
			    } else {
			        console.error('WebSocket 연결이 비정상적으로 닫혔습니다.');
			    }
			 
			    
			}; 
						
						
			// WebSocket 에러 발생 시 실행될 함수
			socket.onerror = function(error) {
			    console.error('WebSocket 에러: ' + error.message);
			};
			
	//소켓끝
	</script>
</head>

<body>


    <header class="mb-3 card">
        <nav class="navbar navbar-expand navbar-light navbar-top">
            <div class="container-fluid">
            	<a href="#" class="burger-btn d-block">
                	<i class="bi bi-justify fs-3"></i>
                </a>
               	<h3 style="margin: 0%;"></h3>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <c:choose>
                    <c:when test="${ not empty loginMember }">
                        
                        
                         <div id="socketAlert" >
                           	
                           </div>
                        
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mb-lg-0">
                                <li class="nav-item dropdown me-3">
                                    <a class="nav-link active dropdown-toggle text-gray-600" href="#" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                        <i class='bi bi-bell bi-sub fs-4'></i>
                                        <span class="badge badge-notification bg-danger">7</span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end notification-dropdown" aria-labelledby="dropdownMenuButton">
                                        <li class="dropdown-header">
                                            <h6>Notifications</h6>
                                        </li>
                                        
                                        <li class="dropdown-item notification-item" id="messageArea">
                                          	<!-- 실시간 메세지가 있으면 동적으로 a태그와 div를 그려서 메시지 나타낼 거임 -->
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
                                            <p class="mb-0 text-sm text-gray-600">💗Welcome🙋‍♂️</p>
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
                                    <li>
                                    	<a class="dropdown-item" href="myPage.me" id="myPage"><i class="icon-mid bi bi-person me-2"></i> My Profile </a>
                                    </li>
                                    <li>
                                    	<a class="dropdown-item" href="logout.me"><i class="icon-mid bi bi-box-arrow-left me-2"></i>Logout</a>
                                    </li>
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
                                        <a href="https://github.com/login/oauth/authorize?scope=user%20repo%20delete_repo%20project&client_id=44f96bb68ae9fe16e964">
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

















