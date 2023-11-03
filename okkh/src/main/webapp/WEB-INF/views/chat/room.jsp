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
		.chat .chat-message{
			font-size: 15px;
			margin-bottom: 0px!important;
		}
		
		#msgArea{
		    overflow-y: scroll;
		    height: 350px;
		    width: 100%;
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
                                                                <div class="avatar avatar-xl" style="padding-right:20px">
                                                                    <img src="${git.profile }" alt="">
                                                                </div>
                                                                <div>
                                                                    <h3 class="mb-0">${cr.roomTitle }</h3>
                                                                    <div>총 인원 : </div>
                                                                </div>
                                                                <button class="btn btn-sm">
                                                                    <i data-feather="x"></i>
                                                                </button>
                                                            </div>
                                                        <hr>
                                                        </div>
                                                        <!-- 채팅 프로필 끝 -->
                                                        
														<!-- 채팅 메세지들 시작 -->
                                                        <div class="card-body pt-4 bg-grey">
                                                            <div class="chat-content" id="msgArea" style="width:100%; height:350px; overflow-y: auto;">
                                                            
                                                            </div>
                                                        </div>
                                                        <!-- 채팅 메세지들 끝 -->

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
                                                                           	<input type="hidden" name="gitNick" value="${loginMember.gitNick }">
	                                                                         	
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
                                                                <button class="btn btn-danger" style="width:100%;" onclick="history.go(-1);">나가기</button>
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
	
	var username = "${loginMember.gitNick}";
	
	$(document).ready(function(){
	    
	    $("#button-send").on("click", () => {
	        send();
	    });

	    ws.onmessage = onMessage;
	    ws.onopen = onOpen;
	    ws.onclose = onClose;
	    ws.onerror = onError;
		
	    // input에서 작성한 메시지를 핸들러의 handelTextMessage로 보냄
	    function send() {
	        let msg = document.getElementById("msg");
	        console.log("send메소드 -> " +  msg.value);
	        
	        ws.send(msg.value);
	        msg.value = '';
	    }

		//채팅창에 들어왔을 때
		function onOpen(evt) {
	        console.log("채팅방 연결 성공");
	        
	        var str = username + ": 님이 입장하셨습니다.";
            ws.send(str);
	    }
		
		//채팅창에서 나갔을 때
		function onClose(evt) {
			console.log("채팅방 연결 해제");
			
			var str = username + ": 님이 방을 나가셨습니다.";
            ws.send(str);
		}
		
		// 에러
		function onError(error) {
	        console.error("에러라는데?..", error);
	    }
		
		// 핸들러 hadleTextMessage를 통해 받은 메시지를 어떤 형식으로 띄워줄 것인지 정하고 채팅 올림
		function onMessage(msg) {
		    var data = msg.data;
		    var sessionId = null; //데이터를 보낸 사람
		    var message = null;
		    var arr = data.split(" : ");
		    
		    console.log("onMessage -> " + data);
		    
		    for(var i=0; i<3; i++){
		        console.log("onMessage for문 -> " + 'arr[' + i + ']:' + arr[i]);
		    }
		
		    var cur_session = "${loginMember.gitNick}";
		
		    //현재 세션에 로그인 한 사람
		    sessionId = arr[0];
		    message = arr[1];
		    time = arr[2];
		    
		    profile = "${loginMember.profile}"
		
		    console.log("sessionId : " + sessionId);
		    console.log("cur_session : " + cur_session);
		
		    //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
		    if(sessionId == cur_session){
		        var str = "<div class='chat' style='width:100%;'>";
		        str += "<div class='chat-body'>";
		        str += "<div class='chat-message'>" + message + "</div>";
		        str += "<spa style='float:right;'>" + time + "</span>";
		        str += "</div></div>";
		        str += "<br><br><br>";
		        
		        $("#msgArea").append(str);
		        $('#msgArea').scrollTop($('#msgArea')[0].scrollHeight);
		    }
		    else{
		    	var str = "<div class='chat chat-left' style='width:100%; height:75px;'>";
		    	str += "<i class='fa-solid fa-circle-user fa-fade fa-lg'></i>"
		    	str += "<span style='font-size:14px'>&nbsp;&nbsp;" + sessionId + "</span>";
		        str += "<div class='chat-body'>";
		        str += "<div class='chat-message'>" + message + "</div>";
		        str += "</div>";
		        str += "<span>" + time + "</span>";
		        str += "</div>";
		        str += "<br>";
		        
		        $("#msgArea").append(str);
		        $('#msgArea').scrollTop($('#msgArea')[0].scrollHeight);
		    }
		    
		}
		
	})
</script>
	
</body>

</html>