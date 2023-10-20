<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
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
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <!--채팅 상대방 프로필-->
                                                        <div class="card-header">
                                                            <div class="media d-flex align-items-center">
                                                                <div class="avatar me-3">
                                                                    <img src="../../resources/images/faces/1.jpg" alt="" srcset="">
                                                                    <span class="avatar-status bg-success"></span>
                                                                </div>
                                                                <div class="name flex-grow-1">
                                                                    <h6 class="mb-0">Fred</h6>
                                                                    <span class="text-xs">Online</span>
                                                                </div>
                                                                <button class="btn btn-sm">
                                                                    <i data-feather="x"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <!-- 채팅 상대방 프로필끝 -->

                                                        <!-- 채팅 메세지들 -->
                                                        <div class="card-body pt-4 bg-grey">
                                                            <div class="chat-content">
                                                                <div class="chat">
                                                                    <div class="chat-body">
                                                                        <div class="chat-message">Hi Alfy, how can i help you?</div>
                                                                    </div>
                                                                </div>
                                                                <div class="chat chat-left">
                                                                    <div class="chat-body">
                                                                        <div class="chat-message">I'm looking for the best admin dashboard
                                                                            template</div>
                                                                        <div class="chat-message">With bootstrap certainly</div>
                                                                    </div>
                                                                </div>
                                                                <div class="chat">
                                                                    <div class="chat-body">
                                                                        <div class="chat-message">I recommend you to use Mazer Dashboard</div>
                                                                    </div>
                                                                </div>
                                                                <div class="chat chat-left">
                                                                    <div class="chat-body">
                                                                        <div class="chat-message">That"s great! I like it so much :)</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- 채팅 메세지들끝 -->

                                                        <!--채팅 전송폼-->
                                                        <div class="card-footer">
                                                            <div class="message-form d-flex flex-direction-column align-items-center">
                                                                <a href="http://" class="black"><i data-feather="smile"></i></a>
                                                                <form action="">
                                                                    <div class="d-flex flex-grow-1 ml-4">
                                                                        <input type="text" class="form-control" placeholder="Type your message.." style="width: 380px;">
                                                                        <button class="btn btn-primary" style="width: 110px;">등록하기</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <!--채팅 전송폼-->
                                                    </div>
                                                </div>

                                                <!--채팅방 목록-->
                                                <div class="col-md-6">
                                                    <section class="section">
                                                        <div class="row" id="table-hover-row">
                                                            <div class="col-12">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <span class="card-title" style="font-weight: bold;">채팅방 목록</span>

                                                                        <!-- 채팅방 추가 모달 -->
                                                                        <button class="btn btn-primary" style="float: right;" id="addChat"
                                                                        data-bs-toggle="modal" data-bs-target="#addChatModal">추가</button>
                                                                        <!-- 채팅방 추가 모달 -->
                                                                    </div>

                                                                    <div class="card-content">
                                                                        <!-- table hover -->
                                                                        <div class="table-responsive">
                                                                            <table class="table table-hover mb-0">
                                                                                
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td class="text-bold-500" style="width: 50px;">
                                                                                            <img src="../../resources/images/faces/1.jpg"
                                                                                            alt="avtar img holder" width="30" height="30"
                                                                                            class="rounded-circle"> <br>
                                                                                        </td>
                                                                                        <td>
                                                                                            <span style="font-weight: bold;">Y-MOOK</span> <br>
                                                                                            <span style="font-size: 14px;">마지막대화....</span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-bold-500">
                                                                                            <img src="../../resources/images/faces/1.jpg"
                                                                                            alt="avtar img holder" width="30" height="30"
                                                                                            class="rounded-circle"> <br>
                                                                                        </td>
                                                                                        <td colspan="5">
                                                                                            <span style="font-weight: bold;">Y-MOOK</span> <br>
                                                                                            <span style="font-size: 14px;">마지막대화....</span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-bold-500">
                                                                                            <img src="../../resources/images/faces/1.jpg"
                                                                                            alt="avtar img holder" width="30" height="30"
                                                                                            class="rounded-circle"> <br>
                                                                                        </td>
                                                                                        <td colspan="5">
                                                                                            <span style="font-weight: bold;">Y-MOOK</span> <br>
                                                                                            <span style="font-size: 14px;">마지막대화....</span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="text-bold-500">
                                                                                            <img src="../../resources/images/faces/1.jpg"
                                                                                            alt="avtar img holder" width="30" height="30"
                                                                                            class="rounded-circle"> <br>
                                                                                        </td>
                                                                                        <td colspan="5">
                                                                                            <span style="font-weight: bold;">Y-MOOK</span> <br>
                                                                                            <span style="font-size: 14px;">마지막대화....</span>
                                                                                        </td>
                                                                                    </tr>

                                                                                </tbody>
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
    <!--modal-->
    <div class="modal fade" id="addChatModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modalCenterTitle">채팅방 생성</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="col mb-3">
                <form  action="groupRoom.ih" method="post">
                  <label for="nameWithTitle" class="form-label">채팅방 이름</label>
                  <input
                    type="text"
                    id="nameWithTitle"
                    class="form-control"
                    name="roomTitle"
                    placeholder="Enter Name"
                    required
                  />
                </div>
              </div>
              <div class="row g-2">
                <div class="col mb-0">
                 <label for="" class="form-label">초대할 친구</label>
                      <input type="text"
                             name="" 
                             id=""
                             class="form-control">
                </div>
               <input type="hidden" name="uno" value="">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                Close
              </button>
              <button type="submit" class="btn btn-primary">Create</button>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>

</html>