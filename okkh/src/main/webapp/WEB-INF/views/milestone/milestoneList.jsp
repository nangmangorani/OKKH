<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>

        <body>
            <div id="app">
                <!-- 사이드바 시작 -->
                <jsp:include page="../common/leftSide.jsp" />
                <!-- 사이드바 끝 -->
                <div id="main">
                    <!-- 상단바 시작 -->
                    <jsp:include page="../common/header.jsp" />
                    <!-- 상단바 끝 -->

                    <section class="section">
                        <div class="row" id="table-head">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">마일스톤</h4>
                                        <div class="form-group" style="padding-top: 20px;">
                                            <button class="btn btn-primary" id="mileOpenBtn">Opened</button>
                                            <button class="btn btn-primary" id="mileCloseBtn">Closed</button>
                                            <button class="btn btn-primary" id="enrollMileBtn" style="float:right"
                                            onclick="location.href='enrollForm.mile'">마일스톤 생성</button>
                                        </div>
                                    </div>


                                    <div class="card-content">
                                        <div class="card-body">

                                        </div>
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table mb-0">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>번호</th>
                                                        <th>제목</th>
                                                        <th>생성일</th>
                                                        <th>종료일</th>
                                                        <th>최근수정일</th>
                                                        <th>진척도</th>
                                                        <th>진행중인 이슈</th>
                                                        <th>종료된 이슈</th>
                                                        <th>작성자</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="m" items="${ mList }">
                                                        <tr>
                                                            <td class="text-bold-500">${ m.number }</td>
                                                            <td class="text-bold-500"><a href="detail.mile?mno=${ m.number }"
                                                                    style="color: black; font-weight: bold;">${ m.title }</a>
                                                            </td>
                                                            <td>${ m.createdAt }</td>
                                                            <c:choose>
                                                                <c:when test="${ m.dueOn eq null && empty m.dueOn }">
                                                                    <td class="text-bold-500" id="mileContinue">No due
                                                                        date</td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td class="text-bold-500" id="mileContinue">${
                                                                        m.dueOn }</td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td>${ m.updatedAt }</td>
                                                            <td class="align-middle text-dark">
                                                                <div class="float-start me-3">${ m.finPercent }%</div>
                                                                <div class="mt-2">
                                                                    <div style="height:5px" class="progress">
                                                                        <div role="progressbar" class="progress-bar"
                                                                            style="width:${ m.finPercent }%"
                                                                            aria-valuenow="${ m.finPercent }"
                                                                            aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                            </td>

                                                            <td>${ m.openedIssues }</td>
                                                            <td>${ m.closedIssues }</td>
                                                            <td>나</td>
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
                                                href="list.mile?cpage=${ pi.currentPage - 1 }">Prev</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                    <li class="page-item"><a class="page-link"
                                            href="list.mile?cpage=${ p }">${ p }</a></li>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link"
                                                href="#">Next</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link"
                                                href="list.mile?cpage=${ pi.currentPage + 1 }">Next</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
                    <jsp:include page="../common/footer.jsp" />
                </div>
            </div>

            <script>
                $(function () {
                    // 전체조회
                    $("#mileAllBtn").click(function () {
                        $("tbody tr").show();
                    });

                    // 진행완료 조회
                    $("#mileCloseBtn").click(function () {
                        $("tbody tr").hide();
                        $("tbody tr:has(td#mileContinue:not(:contains('No due date')))").show();
                    });

                    // 진행중 조회
                    $("#mileOpenBtn").click(function () {
                        $("tbody tr").hide();
                        $("tbody tr:has(td#mileContinue:contains('No due date'))").show();
                    });

                });
            </script>

            <script src="../../resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="../../resources/js/bootstrap.bundle.min.js"></script>

            <script src="../../resources/vendors/apexcharts/apexcharts.js"></script>
            <script src="../../resources/js/pages/dashboard.js"></script>

            <script src="../../resources/js/main.js"></script>
            <script src="../../resources/vendors/choices.js/choices.min.js"></script>

            <script src="../../resources/js/main.js"></script>
        </body>

        </html>