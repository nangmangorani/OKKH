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
                                                    onclick="location.href='list.lab'">라벨</button>
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
                                                            <th>총 라벨 수 : ${ lList.size() }</th>
                                                            <th></th>
                                                            <th></th>
                                                            <th>진행상태</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="issueTableBody">
														<tr>
															<c:forEach var="l" items="${ lList }">
																<td>${ l.name }</td>
																<td>${ l.description }</td>
																<td>${ l.name }</td>
																<td>${ l.name }</td>
															</c:forEach>
														</tr>
				
                                                        

                                                                
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <nav aria-label="Page navigation example" id="paging">
                                            <ul class="pagination pagination-primary justify-content-center">

                                                <c:choose>
                                                    <c:when test="${ pi.currentPage eq 1 }">
                                                        <li class="page-item disabled"><a class="page-link"
                                                                href="#">Prev</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item"><a class="page-link"
                                                                href="list.iss?cpage=${ pi.currentPage - 1 }">Prev</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                                    <li class="page-item"><a class="page-link"
                                                            href="list.iss?cpage=${ p }">${ p }</a></li>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                                        <li class="page-item disabled"><a class="page-link"
                                                                href="#">Next</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="page-item"><a class="page-link"
                                                                href="list.iss?cpage=${ pi.currentPage + 1 }">Next</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <jsp:include page="../common/footer.jsp"></jsp:include>
                    </div>
                </div>

                





                <script src="resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                <script src="resources/js/bootstrap.bundle.min.js"></script>

                <!--         <script src="resources/vendors/apexcharts/apexcharts.js"></script> -->
                <!--         <script src="resources/js/pages/dashboard.js"></script> -->

                <script src="resources/js/main.js"></script>
                <script src="resources/vendors/choices.js/choices.min.js"></script>

                <script src="resources/js/main.js"></script>
            </body>

            </html>