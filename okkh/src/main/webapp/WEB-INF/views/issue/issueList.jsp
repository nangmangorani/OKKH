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
		
		.pull-up {
		  	transition: all 0.25s ease;
		}
		
		.pull-up:hover {
		    transform: translateY(-4px) scale(1.02);
		    box-shadow: 0 0.25rem 1rem rgba(161, 172, 184, 0.45);
		    z-index: 30;
		    border-radius: 50%;
		}
        
        
    </style>
</head>
<body>
<div id="app">
       	<!-- 사이드바 시작 -->
		<jsp:include page="../common/leftSide.jsp"></jsp:include>
           <!--사이드바 끝-->
           <div id="main">
               <jsp:include page="../common/header.jsp"></jsp:include>
               <section class="section">
                   <div class="row" id="table-head">
                       <div class="col-12">
                           <div class="card">
                               <div class="card-header">
                                   <h4 class="card-title">Issue</h4>
                                   <div class="form-group">
                                       <button type="submit" class="btn btn-primary me-1 mb-1"
                                           style="width: 100px; float: right;"
                                           onclick="location.href='enrollForm.iss'">이슈등록</button>
                                   </div>
                                   <button class="btn btn-outline-primary" id="continueBtn">진행중</button>
                                   <button class="btn btn-outline-primary" id="finishBtn">진행완료</button>
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
                                                <tr id="Ilist">
                                                    <td class="text-bold-500">${ i.number }</td>
                                                    <td class="text-bold-500"><a href="detail.iss?bno=${ i.number }"
                                                            style="color: black; font-weight: bold;">${ i.title }</a></td>
                                                    <td>${ i.createdAt }</td>
                                                    <!-- 여기 td는 String으로 받은 여러 라벨들을 풀어서 보여줘야함. -->
                                                    
                                                    
	                                                    <td class="text-bold-500"><div class="avatar-group">
                                                            <span title="${i.user }" class="avatar avatar-sm pull-up">
                                                                <img alt="avatar"
                                                                    src="${ i.profile }"
                                                                    class="rounded-circle writerAvatar">
                                                            </span>
                                                        </div></td>
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
                                                            <c:forEach var="j" items="${ i.assigneeProfiles }" varStatus="loop">
                                                            	<span class="avatar avatar-sm pull-up" title=${ i.assignees[loop.index]}>
                                                                <img alt="avatar"
                                                                    src="${ j }"
                                                                    class="rounded-circle assigneesAvatar">
                                                            </span>
                                                            </c:forEach>
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
				<jsp:include page="../common/footer.jsp"></jsp:include>
            </div>
        </div>

        <script>
        	
        
        
        
        
        
        
        
            $(function () {
            	$("#continueBtn").click(function () {
                    if ($("#continue").text() === "진행중") {
                        $("tbody tr").hide();
                        $("tbody tr:has(td#continue:contains('진행중'))").show();
                    }
                })

                // 진행완료 조회
                $("#finishBtn").click(function () {
                    $("tbody tr").hide();
                    $("tbody tr:has(td#continue:contains('진행완료'))").show();
                });
            	
            	
            	$("#continueBtn").click(function () {
                    sendRequest("open");
                });

            	
            	
            	
                // When the "진행완료" button is clicked
                $("#finishBtn").click(function () {
                    sendRequest("closed");
                });

                // Function to send an HTTP GET request to the controller
                function sendRequest(state) {
                    // Replace 'your_controller_url' with the actual URL of your controller
                    var url = "list.iss?state=" + state;

                    $.get(url, function (data) {
                        // Handle the response from the controller if needed
                        console.log("Request sent with state: " + state);
                    });
                }
                
                
                $('.choices').on('change', function () {
                    var selectedLabels = $(this).val();

                    if (selectedLabels && selectedLabels.length > 0) {
                        // 모든 행 숨기기
                        $("tbody tr").hide();

                        // 각 선택된 라벨에 대해 확인
                        selectedLabels.forEach(function (selectedLabel) {
                            // 선택된 라벨과 일치하는 행 보이기
                            $("tbody tr:has(td span.labelSpan:contains('" + selectedLabel + "'))").show();
                        });
                    } else {
                        // 선택한 라벨이 없으면 모든 행 보이기
                        $("tbody tr").show();
                    }
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