<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <link rel="stylesheet" href="resources/css/widgets/chat.css">
	<style>
		.chat-message{
			font-size: 13px;
		}
	</style>
</head>

<body>
    <div id="app">
        <!-- 사이드바! -->
        <jsp:include page="../common/leftSide.jsp"></jsp:include>
        <!-- 사이드바끝 -->

        <!-- 메인 시작 -->
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"></jsp:include>
            <!-- 상단바 끝 -->
            <div class="page-content">
                <section class="row">
                    <div class="col-12 col-lg-9">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                    </div>
                                    <div class="card-body">
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="card">
                                                        <!--채팅 프로필-->
                                                        <div class="card-header">
                                                            <div class="media d-flex align-items-center">
                                                                <div class="avatar me-3">
                                                                    <img src="${git.profile }" alt="">
                                                                    <span class="avatar-status bg-success"></span>
                                                                </div>
                                                                <div class="name flex-grow-1">
                                                                    <h6 class="mb-0">${loginMember.gitNick }</h6>
                                                                    <span class="text-xs">Online</span>
                                                                </div>
                                                                <button class="btn btn-sm">
                                                                    <i data-feather="x"></i>
                                                                </button>
                                                            </div>
                                                        <hr>
                                                        </div>
                                                        <!-- 채팅 프로필끝 -->

                                                        <div class="card-body pt-4 bg-grey">
                                                            <div class="chat-content" id="msgArea">
                                                            	<!-- 
                                                                <div class="chat">
                                                                    <div class="chat-body">
                                                                        <div class="chat-message">Hi Alfy, how can i help you?</div>
                                                                    </div>
                                                                </div>
                                                                <div class="chat chat-left">
                                                                    <div class="chat-body">
                                                                        <div class="chat-message">I'm looking for the best admin dashboard
                                                                            template</div>
                                                                    </div>
                                                                </div>
                                                                -->
                                                            </div>
                                                        </div>
                                                        <!-- 채팅 메세지들끝 -->

                                                        <!--채팅 전송폼-->
                                                        <div class="card-footer">
                                                            <div class="message-form d-flex flex-direction-column align-items-center">
                                                                <a href="http://" class="black"><i data-feather="smile"></i></a>
                                                                <div class="d-flex flex-grow-1 ml-4">
                                                                    <input type="text" id="msg" class="form-control" placeholder="Type your message.." style="width: 100%;">
                                                                    <button class="btn btn-primary" id="button-send" style="width: 100px;">Send</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--채팅 전송폼-->
                                                    </div>
                                                </div>
	
                                                <!--채팅원 목록-->
                                                <div class="col-md-3">
                                                    <section class="section">
                                                        <div class="row" id="table-hover-row">
                                                            <div class="col-12" style="padding: 0 12px 0 50px">
                                                                <div class="card">
                                                                    <div class="card-header" style="padding: 24px 0 5px 10px">
                                                                        <span class="card-title" style="font-weight: bolder; font-size: 20px">채팅원</span>
                                                                    </div>

                                                                    <div class="card-content">
                                                                        <!-- table hover -->
                                                                        <div class="table-responsive">
                                                                           	<input type="hidden" name="memNo" value="${loginMember.memNo }">
	                                                                         	
	                                                                            <table class="table table-hover mb-0">
	                                                                            	<c:forEach var="cm" items="${cmList }">
	                                                                                    <tr id="rommList">
	                                                                                        <td>
	                                                                                            <div class="avatar me-3">
								                                                                    <img src="${cm.profile }" alt="">
								                                                                    <span class="avatar-status bg-success"></span>
								                                                                </div>
	                                                                                        </td>
	                                                                                        <td class="text-bold-500 rno" style="width: 50px;">
	                                                                                        	${cm.gitNick }
	                                                                                        </td>
	                                                                                    </tr>
	                                                                            	</c:forEach>
	                                                                            </table>
	                                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </div>
                                                <!--채팅방 목록끝-->
                                            </div>
                                        </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <!-- 친구 및 팀원 시작 -->
                    <jsp:include page="../common/rightSide.jsp"></jsp:include>
                    <!-- 친구 및 팀원 끝 -->
                </section>
            </div>

            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>
<script>
	var ws = null;
	
	$(function(){
		connectWs();
	})
	
	function connectWs(){
		var socket = new SockJS("http://localhost:7777/okkh/chat");
		ws = socket;
	}
	
	$(document).ready(function(){
	    const username = ${loginMember.memNo};
	    
	    $("#button-send").on("click", () => {
	        send();
	    });

	    ws.onmessage = onMessage;
	    ws.onopen = onOpen;
	    ws.onclose = onClose;
	    ws.onerror = onError; // 에러 처리를 위한 콜백

	    function send() {
	        let msg = document.getElementById("msg");
	        console.log("send메소드 -> " + username + "/" + msg.value);
	        ws.send(username + "/" + msg.value);
	        msg.value = '';
	    }

		//채팅창에 들어왔을 때
		function onOpen(evt) {
	        console.log("연결!!!!!!!!!!!!");
	        var str = username + "님이 입장하셨습니다.";
	        $("#msgArea").append(str);
	    }
		
		//채팅창에서 나갔을 때
		function onClose(evt) {
			console.log("연결 왜 끊겨 ㅡㅡ..");
		    var str = username + "님이 방을 나가셨습니다.";
		    $("#msgArea").append(str);
		}
		
		function onError(error) {
	        console.error("에러라는데?..", error);
	        // 에러 처리 로직 (예: 사용자에게 에러 표시, 재연결 시도 등)
	    }
		
		function onMessage(msg) {
		    var data = msg.data;
		    var sessionId = null; //데이터를 보낸 사람
		    var message = null;
		    var arr = data.split("/");
		    
		    console.log("onMessage -> " + data);
		    
		    for(var i=0; i<2; i++){
		        console.log("onMessage for문 -> " + 'arr[' + i + ']/' + arr[i]);
		    }
		
		    var cur_session = username;
		
		    //현재 세션에 로그인 한 사람
		    sessionId = arr[0];
		    message = arr[1];
		
		    console.log("sessionId : " + sessionId);
		    console.log("cur_session : " + cur_session);
		
		    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		    if(sessionId == cur_session){
		        var str = "<div class='chat'>";
		        str += "<div class='chat'>";
		        str += "<div class='chat-message'>" + message + "</div>";
		        str += "</div></div>";
		        $("#msgArea").append(str);
		    }
		    else{
		    	var str = "<div class='chat chat-left'>";
		        str += "<div class='chat-body'>";
		        str += "<div class='chat-message'>" + sessionId + " : " + message + "</div>";
		        str += "</div></div>";
		        $("#msgArea").append(str);
		    }
		    
		}
		
	})
</script>
	
</body>

</html>