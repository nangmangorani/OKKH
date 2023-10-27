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
                                                        <!--채팅 상대방 프로필-->
                                                        <div class="card-header">
                                                            <div class="media d-flex align-items-center">
                                                                <div class="avatar me-3">
                                                                    <img src="${git.profile }" alt="">
                                                                    <span class="avatar-status bg-success"></span>
                                                                </div>
                                                                <div class="name flex-grow-1">
                                                                    <h6 class="mb-0">${git.gitNick }</h6>
                                                                    <span class="text-xs">Online</span>
                                                                </div>
                                                                <button class="btn btn-sm">
                                                                    <i data-feather="x"></i>
                                                                </button>
                                                            </div>
                                                        <hr>
                                                        </div>
                                                        <!-- 채팅 상대방 프로필끝 -->

                                                        <!-- 채팅 메세지들 -->
                                                        <th:block th:replace="~{/layout/basic :: setContent(~{this :: content})}">
    													<th:block th:fragment="content">
                                                       
                                                        <div class="card-body pt-4 bg-grey">
                                                            <div class="chat-content" id="msgArea">
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
                                                            </div>
                                                        </div>
                                                        </th:block>
														</th:block>
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
	                                                                                        <td class="text-bold-500 rno" style="width: 50px;">
	                                                                                            <img src="resources/images/faces/1.jpg"
	                                                                                            alt="avtar img holder" width="30" height="30"
	                                                                                            class="rounded-circle">
	                                                                                        </td>
	                                                                                        <td>
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
	
</body>

</html>