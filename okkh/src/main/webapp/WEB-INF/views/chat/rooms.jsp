<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
    <link rel="stylesheet" href="resources/css/widgets/chat.css">
    <!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->
	<link rel="stylesheet" href="resources/assets/extensions/choices.js/public/assets/styles/choices.css">
	
	<style>
		.table-btn {
			width: 120px;
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
                                                <!--채팅방 목록-->
                                                <div class="col-md-12" style="margin:auto;">
                                                    <section class="section">
                                                        <div class="row" id="table-hover-row">
                                                            <div class="col-12">
                                                                <div class="card">
                                                                    <div class="card-header">
                                                                        <span class="card-title" style="font-weight: bolder; font-size: 30px">채팅방 목록</span>
                                                                        <!-- 채팅방 추가 모달 -->
                                                                        <button class="btn btn-primary" style="float: right;" id="addChat"
                                                                        data-bs-toggle="modal" data-bs-target="#addChatModal">추가</button>
                                                                        <!-- 채팅방 추가 모달 -->
                                                                    </div>
                                                                    <div class="card-content">
                                                                        <!-- table hover -->
                                                                        <div class="table-responsive">
                                                                           	<input type="hidden" name="memNo" value="${loginMember.memNo }">
                                                                           	<c:choose>
	                                                                           	<c:when test="${not empty loginMember }">
		                                                                            <table class="table table-hover mb-0" id="roomList">
		                                                                               	<c:forEach var="cr" items="${crList }">
		                                                                               		<tbody>
		                                                                                    <tr id="room">
		                                                                                    	<td class="crno" style="display:none;">${cr.roomNo }</td>
		                                                                                        <td class="text-bold-500" style="width: 50px;">
		                                                                                            <img src="resources/images/faces/1.jpg" alt="avtar img holder" width="30" height="30" class="rounded-circle">
		                                                                                        </td>
		                                                                                        <c:choose>
			                                                                                        <c:when test="${not empty cr.lastChat }">
				                                                                                        <td>
				                                                                                        	<span style="font-weight: bold; font-size: 20px;">${cr.roomTitle }</span> <br>
				                                                                                            <span style="font-size: 14px;">${cr.lastChat }</span>
				                                                                                        </td>
			                                                                                        </c:when>
			                                                                                        <c:otherwise>
				                                                                                        <td>
				                                                                                        	<span style="font-weight: bold; font-size: 18px;">${cr.roomTitle }</span> <br>
				                                                                                            <span style="font-size: 13px;">주고받은 메시지가 없습니다.</span>
				                                                                                        </td>
			                                                                                        </c:otherwise>
		                                                                                        </c:choose>
		                                                                                        <td class="table-btn"><a href="room.ch?crno=${cr.roomNo }" id="enterRoom" class="btn btn-outline-primary">입장하기</a></td>
		                                                                                    </tr>
		                                                                                    </tbody>
                                                                                   		</c:forEach>
		                                                                            </table>
	                                                                            </c:when>
	                                                                            <c:otherwise>
	                                                                            	존재하는 채팅방이 없습니다.
	                                                                            </c:otherwise>
                                                                            </c:choose>
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
              <h5 class="modal-title" id="invite">채팅방 생성</h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <form action="createChat.ch" method="post">
	            <div class="modal-body">
	              <div class="row">
	                <div class="col mb-3">
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
	                      <select class="choices form-select multiple-remove" multiple id="multiSelect" name="roomMem">
                              <c:forEach var="fr" items="${frList }">
                                  <option value="${fr.gitNick}">${fr.gitNick}</option>
                              </c:forEach>
                          </select>
                          <script>
				    		const mem = "${fr.gitNick}";
				    		
						    $("#multiSelect option").each(function() {
						        const optionText = $(this).text();
						        const values = mem.split(',');
						        
						        if (values.includes(optionText.trim())) {
						            $(this).prop("selected", true);
						        }
						    });
					    </script>
	                </div>
	              </div>
	            </div>
	            <div class="modal-footer">
	              <button type="submit" class="btn btn-primary">Create</button>
	              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
	                Close
	              </button>
	            </div>
            </form>
          </div>
        </div>
      </div>
      
<!--여기 두개가 다중 select박스인듯-->    
<script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="resources/assets/static/js/pages/form-element-select.js"></script>

</body>
</html>
