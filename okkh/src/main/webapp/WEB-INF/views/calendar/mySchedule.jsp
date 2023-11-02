<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>

<!-- 캘린더 CSS 링크 -->
<link href='resources/calendar/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='resources/calendar/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />

<link rel=" shortcut icon" href="image/favicon.ico">

    <link rel="stylesheet" href="resources/nexus/css/fullcalendar.min.css" />
    <link rel="stylesheet" href='resources/nexus/css/select2.min.css' />
    <link rel="stylesheet" href='resources/nexus/css/bootstrap-datetimepicker.min.css' />
	
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="resources/nexus/css/calendar.css">

</head>

<body>

    <!-- 전체 div 시작 -->
    <div id="app">
        <!-- 사이드바 시작 -->
        <jsp:include page="../common/leftSide.jsp"/>
        <!-- 사이드바 끝 -->

        <!-- 메인 시작 -->
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"/>
            <!-- 상단바 끝 -->
            
            <div class="page-heading">

                <!-- 페이지 제목 시작 -->
                <!-- <h3 style="float: left; width: 65%;">My Repositories</h3> -->
                <!-- /페이지 제목 끝 -->

            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 컨텐츠 시작 -->
            <div class="page-content">
            	<!-- 본문 시작 -->
                <section class="row">
                    
                    <!-- 캘린더 시작 -->
                    <script>
						$(function(){
					
						// active 클래스 를 repository로 옮기기
						$(".active").removeClass("active");
						$("#calendar1").addClass("active");
					
						})
					
					 </script>
				
					 <div class="container-wrapper">
						<div class="container-xxl flex-grow-1 container-p-y">
				        <!-- 일자 클릭시 메뉴오픈 -->
				        <div id="contextMenu" class="dropdown clearfix">
				            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
				                style="display:block;position:static;margin-bottom:5px;">
				                <li><a tabindex="-1" href="#">업무</a></li>
				                <li><a tabindex="-1" href="#">개인 일정</a></li>
				                <li><a tabindex="-1" href="#">소셜 일정</a></li>
				                <li class="divider"></li>
				                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
				            </ul>
				        </div>
				
				        <div id="wrapper">
				            <div id="loading"></div>
				            <div id="calendar"></div>
				        </div>
				        
				       
				
				
				       <!--일정 추가 MODAL  -->
				        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
				             <div class="modal-dialog modal-dialog-centered" role="document">
				                <div class="modal-content">
				                    <div class="modal-header">
				                        <h4 class="modal-title"></h4>
				                    </div>
				                    <div class="modal-body">
											
										<table class="table table-borderless">
											<form>
												<tbody>
												<tr>
													<td class="align-middle"><label for="edit-allDay">하루 종일</label></td>
													<td class="py-3">
													<input class='allDayNewEvent  form-check-input' id="edit-allDay" type="checkbox"></input>
													</td>
												</tr>
												<tr>
													<td class="align-middle"><label for="edit-title">일정명</label></td>
													<td class="py-3">
													<input class="form-control" type="text" name="edit-title" id="edit-title"
															required="required" />
													</td>
												</tr>
												<tr>
													<td class="align-middle"><label  for="edit-start">시작</label></td>
													<td class="py-3">
													<input class="form-control" type="datetime-local" name="edit-start" id="edit-start"/> <!-- 아이디 선택자 지움 edit-start-->
													</td>
												</tr>
												<tr>
													<td class="align-middle"><label class="col mb-4" for="edit-end">끝</label></td>
													<td class="py-3">
													<input class="form-control" type="datetime-local" name="edit-end" id="edit-end"/> <!-- 아이디 선택자 지움  edit-end-->
													</td>
												</tr>
												<tr>
													<td class="align-middle"><label for="edit-type">구분</label></td>
													<td class="py-3">
													<select class="form-select" name="edit-type" id="edit-type">
															<option value="업무">업무</option>
															<option value="개인 일정">개인 일정</option>
															<option value="소셜 일정">소셜 일정</option>
														</select>
													</td>
												</tr>
												<tr>
													<td> <label for="edit-color">색상</label></td>
													<td class="py-3">
													<select class="form-select" name="color" id="edit-color">
															<option value="#D25565" style="color:#D25565;">빨간색</option>
															<option value="#9775fa" style="color:#9775fa;">보라색</option>
															<option value="#ffa94d" style="color:#ffa94d;">주황색</option>
															<option value="#74c0fc" style="color:#74c0fc;">파란색</option>
															<option value="#f06595" style="color:#f06595;">핑크색</option>
															<option value="#63e6be" style="color:#63e6be;">연두색</option>
															<option value="#a9e34b" style="color:#a9e34b;">초록색</option>
															<option value="#4d638c" style="color:#4d638c;">남색</option>
															<option value="#495057" style="color:#495057;">검정색</option>
														</select>
													</td>
												</tr>
												<tr>
													<td><label class="col mb-4" for="edit-desc">설명</label></td>
													<td class="py-3">
													<textarea rows="4" cols="50" class="form-control" name="edit-desc"
															id="edit-desc"></textarea>
													</td>
												</tr>
												</form>
												</tbody>
				                    	</table>
											
											
				                    </div>
				                    <div class="modal-footer modalBtnContainer-addEvent">
				                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
				                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
				                    </div>
				                    <div class="modal-footer modalBtnContainer-modifyEvent">
				                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
				                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
				                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
				                    </div>
				                </div><!-- /.modal-content -->
				            </div><!-- /.modal-dialog -->
				        </div><!-- /.modal -->
						 <br>
				        <div class="card">
				
			            <div class="card-header">
			                <h4 class="panel-title">필터</h4>
			            </div>
			
			            <div class="card-body">
			
		                	<div class="col-lg-6">
			                    <label for="calendar_view">구분별</label>
			                    <div class="input-group">
			                        <select class="filter" id="type_filter" multiple="multiple">
			                            <option value="업무">업무</option>
			                            <option value="개인 일정">개인 일정</option>
			                            <option value="소셜 일정">소셜 일정</option>
			                        </select>
			                    </div>
		                	</div>
				
								
				            </div>
				        </div>
				        <!-- /.filter panel -->
				        </div>
				    </div>
				    <!-- /.container -->
				    
				    <input type="hidden" id="userNo" value="${loginUser.userNo }">
				   
				    
				   	<script src="resources/nexus/js/jquery.min.js"></script>
				   	<script src="resources/nexus/js/bootstrap.min.js"></script>
				    <script src="resources/nexus/js/moment.min.js"></script>
				    <script src="resources/nexus/js/fullcalendar.min.js"></script>
				    <script src="resources/nexus/js/ko.js"></script>
				    <script src="resources/nexus/js/select2.min.js"></script>
				    <script src="resources/nexus/js/bootstrap-datetimepicker.min.js"></script>
				    <script src="resources/nexus/js/cal_main.js?ver=1"></script>
				    <script src="resources/nexus/js/cal_addEvent.js?ver=1"></script>
				    <script src="resources/nexus/js/cal_editEvent.js?ver=1"></script>
				    <script src="resources/nexus/js/cal_etcSetting.js?ver=1"></script>
                    <!-- /캘린더 끝 -->
                    
                </section>
                <!-- /본문 끝 -->
            </div>
            <!-- /컨텐츠 끝 -->

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
</body>

</html>