<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

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
            </style>

        </head>

        <body>
            <div id="app">
                <jsp:include page="../common/leftSide.jsp" />
                <div id="main">
                    <jsp:include page="../common/header.jsp" />

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
                                                    style="width: ${milestone.finPercent}%"
                                                    aria-valuenow="${milestone.finPercent}" aria-valuemin="0"
                                                    aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-primary me-1 mb-1"
                                            style="width: 150px; float: right;"
                                            onclick="location.href='editForm.mile?mno=${milestone.number}'">마일스톤
                                            편집</button>
                                            <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);" style="float: right; margin-right: 5px;">이전으로</button>
                                        </div>
                                        <button class="btn btn-primary" id="continueMile">진행중</button>
                                        <button class="btn btn-primary" id="finishMile">진행완료</button>
                                    </div>
                                    <h5 style="padding-left: 20px;">이슈목록</h5>
                                    <input type="hidden" value="${milestone.number}" id="mileNo">
                                    <div class="card-content">
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table mb-0">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>번호</th>
                                                        <th>제목</th>
                                                        <th>라벨</th>
                                                        <th>작성자</th>

                                                    </tr>
                                                </thead>
                                                <tbody id="mileTableBody">

                                                    <c:forEach var="i" items="${iList}">
                                                        <tr>
                                                            <td class="text-bold-500">${i.number}</td>
                                                            <td class="text-bold-500"><a
                                                                    href="detail.iss?ino=${ i.number }"
                                                                    style="color: black; font-weight: bold;">${i.title}</a>
                                                            </td>
                                                            <td class="text-bold-500">
                                                                <c:forEach var="j" items="${ i.labels }">
                                                                    <c:forEach var="l" items="${ lList }">
                                                                        <c:if test="${ j eq l.name }">
                                                                            <span class="labelSpan"
                                                                                style="background-color: #${l.color};">${
                                                                                l.name }</span>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="align-middle">
                                                                <div class="avatar-group">
                                                                    <c:forEach var="j" items="${ i.assigneeProfiles }"
                                                                        varStatus="loop">
                                                                        <span class="avatar avatar-sm pull-up" title=${
                                                                            i.assignees[loop.index]}>
                                                                            <img alt="avatar" src="${ j }"
                                                                                class="rounded-circle assigneesAvatar">
                                                                        </span>
                                                                    </c:forEach>
                                                                </div>
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
                        var lList = data.lList;
                        var iList = data.iList;
                        console.log(iList)
                        console.log(lList)
                        var tableBody = $("#mileTableBody");
                        tableBody.empty();

                        for (var i = 0; i < iList.length; i++) {
                            var issue = iList[i];
                            var tableRow = $('<tr>');

                            // 번호 열
                            var numberCell = $('<td>').addClass('text-bold-500').text(issue.number);

                            // 제목 열
                            var link = $('<a>').attr('href', 'detail.iss?ino=' + issue.number).css('color', 'black').css('font-weight', 'bold').text(issue.title);
                            var titleCell = $('<td>').addClass('text-bold-500').append(link);

                            // 레이블 열
                            var labelsCell = $("<td>").addClass("text-bold-500");
                            $.each(issue.labels, function (index, label) {
                                $.each(lList, function (index, l) {
                                    if (label === l.name) {
                                        var labelSpan = $("<span>")
                                            .addClass("labelSpan")
                                            .css("background-color", "#" + l.color)
                                            .text(l.name);
                                        labelsCell.append(labelSpan);
                                    }
                                });
                            });

                            // 작성자 열
                            var assigneeCell = $('<td>').addClass('text-bold-500');
                            $.each(issue.assigneeProfiles, function (index, profile) {
                                var assigneeSpan = $('<span>')
                                    .addClass('avatar avatar-sm pull-up')
                                    .attr('title', issue.assignees[index]);
                                var assigneeImage = $('<img>')
                                    .attr('alt', 'avatar')
                                    .attr('src', profile)
                                    .addClass('rounded-circle assigneesAvatar');
                                assigneeSpan.append(assigneeImage);
                                assigneeCell.append(assigneeSpan);
                            });

                            tableRow.append(numberCell, titleCell, labelsCell, assigneeCell);
                            tableBody.append(tableRow);
                        }
                    }

                });
            </script>

            <!-- 기타 스크립트 및 리소스 로드 -->
        </body>

        </html>