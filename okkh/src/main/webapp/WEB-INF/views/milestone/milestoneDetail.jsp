<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <style>
    	.labelSpan{
            font-size: 13px;
            font-weight: 600;
            padding : 3px 5px;
            border-radius: 5px;
            color: white;
        }
    </style>
    
</head>
<body>
    <div id="app">
        <jsp:include page="../common/leftSide.jsp"></jsp:include>
        <div id="main">
            <jsp:include page="../common/header.jsp"></jsp:include>

            <section class="section">
                <div class="row" id="table-head">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">${milestone.title}</h4>

                                <c:choose>
                                    <c:when test="${empty milestone.dueOn}">
                                        <span>종료일 : no due date</span> &nbsp;&nbsp;&nbsp;
                                    </c:when>
                                    <c:otherwise>
                                        <span>종료일 : ${milestone.dueOn}</span> &nbsp;&nbsp;&nbsp;
                                    </c:otherwise>
                                </c:choose>
                                <br>
                                <span>진척도 : ${milestone.finPercent}%</span>
                                <div class="mt-2">
                                    <div style="height: 5px; width: 220px;" class="progress">
                                        <div role="progressbar" class="progress-bar"
                                            style="width: ${milestone.finPercent}%" aria-valuenow="${milestone.finPercent}"
                                            aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="button"
                                        class="btn btn-primary me-1 mb-1"
                                        style="width: 100px; float: right;"
                                        onclick="location.href='issueEnroll.html'">이슈등록</button>
                                    <button type="button"
                                        class="btn btn-primary me-1 mb-1"
                                        style="width: 150px; float: right;"
                                        onclick="location.href='milestoneEdit.html'">마일스톤 편집</button>
                                </div>
                                <button class="btn btn-primary" id="continueMile">진행중</button>
                                <button class="btn btn-primary" id="finishMile">진행완료</button>
                            </div>

                            <input type="hidden" value="${milestone.number}" id="mileNo">
                            <div class="card-content">
                                <!-- table head dark -->
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                            </tr>
                                        </thead>
                                        <tbody id="mileTableBody">

                                            <c:forEach var="i" items="${iList}">
                                                <tr>
                                                    <td class="text-bold-500">${i.number}</td>
                                                    <td class="text-bold-500"><a href="issueDetail.html" style="color: black; font-weight: bold;">${i.title}</a></td>
                                                    <c:forEach var="j" items="${ i.labels }">
                                                     	<c:forEach var="l" items="${ lList }">
                                                     		<c:if test="${ j eq l.name }">
                                                             	<span class="labelSpan" style="background-color: #${l.color};">${ l.name }</span>                                                            		
                                                     		</c:if>
                                                     	</c:forEach>
                                                     </c:forEach>
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

            var mno = $("#mileNo").val();

            $("#continueMile").click(function () {
                var state = "open";
                console.log(state);
                sendAjaxRequest(state, mno);
            });

            $("#finishMile").click(function () {
                var state = "closed";
                console.log(state);
                sendAjaxRequest(state, mno);
            });

            function sendAjaxRequest(state, mno) {
                $.ajax({
                    url: "ajaxDetail.mile",
                    data: { state: state, mno: mno },
                    success: function (data) {
                        ajaxMileFunction(data);
                    },
                    error: function (xhr, status, error) {
                        console.log("AJAX 오류: " + error);
                    }
                });
            }

            function ajaxMileFunction(data) {
                var tableBody = $("#mileTableBody");
                tableBody.empty();

                for (var i = 0; i < data.length; i++) {
                    var issue = data[i];
                    var tableRow = $('<tr>');
                    var numberCell = $('<td>').addClass('text-bold-500').text(issue.number);
                    var link = $('<a>').attr('href', 'issueDetail.html').css('color', 'black').css('font-weight', 'bold').text(issue.title);
                    tableRow.append($('<td>').addClass('text-bold-500').append(link));
                    tableBody.append(tableRow);
                }
            }
        });
    </script>

    <!-- 기타 스크립트 및 리소스 로드 -->
</body>
</html>
