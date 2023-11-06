<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Dashboard - Mazer Admin Dashboard</title>

                <link rel="preconnect" href="https://fonts.gstatic.com">
                <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="resources/css/bootstrap.css">

                <link rel="stylesheet" href="resources/vendors/iconly/bold.css">

                <link rel="stylesheet" href="resources/vendors/choices.js/choices.min.css" />


                <link rel="stylesheet" href="resources/vendors/perfect-scrollbar/perfect-scrollbar.css">
                <link rel="stylesheet" href="resources/vendors/bootstrap-icons/bootstrap-icons.css">
                <link rel="stylesheet" href="resources/css/app.css">
                <link rel="shortcut icon" href="resources/images/favicon.svg" type="image/x-icon">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <style>
                    .labelSpan {
                        font-size: 13px;
                        font-weight: 600;
                        padding: 3px 5px;
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

                    #mileImg {
                        width: 13px;
                        height: 13px;
                    }

                    #mileText {
                        font-size: 13px;
                        font-weight: 600;
                        color: #607080;

                    }

                    .newLabel {
                        padding: 0.375rem 0.75rem;
                        font-size: 1rem;
                        font-weight: 400;
                        line-height: 1.5;
                        color: #607080;
                        -webkit-appearance: none;
                        appearance: none;
                        background-color: #fff;
                        background-clip: padding-box;
                        border: 1px solid #dce7f1;
                        border-radius: 0.25rem;
                        transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                    }

                    .hiddenFont {
                        font-weight: 600;
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
                                            <span class="card-title" style="font-weight:600">Label</span>
                                            <button class="btn btn-primary emrollBtn" style="float:right;">라벨추가</button>
                                            <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);" style="float: right; margin-right: 5px;">이전으로</button>
                                        </div>
                                        
                                        <div class="card-body enroll" style="padding-left: 25px; display:none;">
                                            <div style="display: flex; height: 25px; width: 800px;">
                                                <div style="flex: 1; width: 230px;">
                                                    <span class="hiddenFont">이름</span>
                                                </div>
                                                <div style="flex: 1; width: 20%;">
                                                    <span class="hiddenFont">내용</span>
                                                </div>
                                                <div style="flex: 1; width: 20%;">
                                                    <span class="hiddenFont">색</span>
                                                </div>
                                            </div>
                                            <form action="enroll.lab" method="post">
                                                <div style="display: flex; height: 40px; width: 800px;">
                                                    <div style="flex: 1;">
                                                        <input class="newLabel" style="width: 180px;" name="name">
                                                    </div>
                                                    <div style="flex: 1;">
                                                        <input class="newLabel" style="width: 180px;" name="description">
                                                    </div>
                                                    <div style="flex: 1;">
                                                        <input type="color" class="newLabel" style="width: 150px;" name="color">
                                                    </div>
                                                </div>
                                                <button class="btn btn-primary" style="float:right;">등록</button>
                                            </form>
                                                <button class="btn btn-primary enrollcloseBtn" style="float:right; margin-right:10px">닫기</button>
                                        </div>
                                        

                                        


                                        <div class="card-content">
                                            <!-- table head dark -->
                                            <div class="table-responsive">
                                                    <span style="padding-left:20px; font-weight:600;">라벨 수 : ${ lList.size() }</span>
                                                    <br><br>
                                                <table class="table mb-0">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>이름</th>
                                                            <th>내용</th>
                                                            <th></th>
                                                            <th></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="issueTableBody">
                                                      <c:forEach var="l" items="${ lList }">
                                                        <tr>
                                                            <td style="width:300px">
                                                            	<span class="labelSpan"
                                                            	style="background-color:#${l.color};">${ l.name }</span>
                                                            </td>
                                                            <td style="width:800px">${ l.description }</td>
                                                            <td></td>
                                                            <td style="text-align: right;">
                                                            	<button class="btn btn-outline-primary edit" onclick="editMileForm();">수정</button>
                                                            	<form action="delete.lab" style="display: inline;">
                                                            		<input type="hidden" value="${ l.name }" name="name">
                                                            		<button class="btn btn-outline-primary delete" onclick="return realDelete();">삭제</button>
                                                            	</form>
                                                            </td>
                                                            
                                                        </tr>
                                                        <tr style="display:none; background-color: rgb(241, 240, 240);">
	                                                        <form action="edit.lab" method="post">
	                                                        	<td>
	                                                        		<input class="form-control" style="width:200px;" value="${ l.name }" name="name">
	                                                        		<input type="hidden" name="originalName" value="${ l.name }">
	                                                        	</td>
	                                                        	<td>
	                                                        		<input class="form-control" style="width:500px;" value="${ l.description }" name="description">
	                                                        	</td>
	                                                        	<td>
	                                                        		<input class="form-control" type="color" value="#${l.color}" name="color">
	                                                        	</td>
	                                                        	<td style="text-align: right;">
	                                                        		<button class="btn btn-primary save">저장</button>
                                                        	</form>
	                                                        		<button class="btn btn-primary close" onclick="enrollFormClose();">닫기</button>
	                                                        	</td>
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
					$(function() {
						function editMileForm() {
							$(this).closest("tr").next("tr").show();
                        }
						
						function editFormClose() {
							$(this).closest("tr").hide();
						}
						
						function enrollForm() {
							$(".card-body").show();
						}
						
						function enrollFormClose() {
							$(".card-body").hide();
						}
						
						$(".edit").on("click", editMileForm);
						$(".close").on("click", function() {
				            $(this).closest("tr").hide();
				        });
						$(".emrollBtn").on("click", enrollForm);
						$(".enrollcloseBtn").on("click", enrollFormClose);
					})

                    function realDelete(labelName) {
                        if (confirm("정말 삭제하시겠습니까?")) {
                            return true; // 동작 허용
                        } else {
                            return false; // 동작 취소
                        }
                    }
				
				</script>





                <script src="resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                <script src="resources/js/bootstrap.bundle.min.js"></script>

                <!--         <script src="resources/vendors/apexcharts/apexcharts.js"></script> -->
                <!--         <script src="resources/js/pages/dashboard.js"></script> -->

                <script src="resources/js/main.js"></script>
                <script src="resources/vendors/choices.js/choices.min.js"></script>

                <script src="resources/js/main.js"></script>
            </body>

            </html>