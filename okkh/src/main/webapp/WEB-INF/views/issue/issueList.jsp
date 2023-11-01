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
                                                            <th>번호</th>
                                                            <th>제목</th>
                                                            <th>생성일</th>
                                                            <th>작성자</th>
                                                            <th>
                                                                <div class="row" style="margin-top: 8px;">
                                                                    <div class="col-1" style="line-height: 50px;">라벨
                                                                    </div>
                                                                    <div class="form-group col-11" style="width:500px;">

                                                                        <select
                                                                            class="choices form-select multiple-remove"
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
                                                    <tbody id="issueTableBody">
                                                        <input type="hidden" name="state" id="state" value="${state}">


                                                        <c:forEach var="i" items="${ list }">
                                                            <tr id="Ilist">
                                                                <td class="text-bold-500">${ i.number }</td>
                                                                <td class="text-bold-500"><a
                                                                        href="detail.iss?ino=${ i.number }"
                                                                        style="color: black; font-weight: bold;">${
                                                                        i.title }</a> &nbsp;&nbsp;
                                                                    <c:if
                                                                        test="${ i.milestone != null || not empty i.milestone }">
                                                                        <a href="detail.mile?mno=${ i.milestoneNum }">
                                                                            <img src="resources/icons/milestone.png"
                                                                                id="mileImg">
                                                                            <span id="mileText" title="milestone">${
                                                                                i.milestone }</span>
                                                                        </a>
                                                                    </c:if>
                                                                </td>
                                                                <td>${ i.createdAt }</td>

                                                                <!-- 여기 td는 String으로 받은 여러 라벨들을 풀어서 보여줘야함. -->


                                                                <td class="text-bold-500">
                                                                    <div class="avatar-group">
                                                                        <span title="${i.user }"
                                                                            class="avatar avatar-sm pull-up">
                                                                            <img alt="avatar" src="${ i.profile }"
                                                                                class="rounded-circle writerAvatar">
                                                                        </span>
                                                                    </div>
                                                                </td>
                                                                <td>
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
                                                                        <c:forEach var="j"
                                                                            items="${ i.assigneeProfiles }"
                                                                            varStatus="loop">
                                                                            <span class="avatar avatar-sm pull-up"
                                                                                title=${ i.assignees[loop.index]}>
                                                                                <img alt="avatar" src="${ j }"
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
                        <jsp:include page="../common/footer.jsp" />
                    </div>
                </div>

                <script>

                    var state = "open";
                    var currentPage;

                    function sendAjaxRequest(state, cpage) {
                        $.ajax({
                            url: "ajaxIssue",
                            data: {
                                state: state,
                                cpage: cpage
                            },
                            success: function (data) {
                                ajaxIssueFunction(data);
                            },
                            error: function (xhr, status, error) {
                                console.log("AJAX 오류: " + error);
                            }
                        });
                    }





                    $("#continueBtn").click(function () {
                        state = "open";
                        var cpage = 1;
                        console.log(state);
                        sendAjaxRequest(state, cpage);
                    });

                    $("#finishBtn").click(function () {
                        state = "closed";
                        var cpage = 1;
                        console.log(state);
                        sendAjaxRequest(state, cpage);
                    });

                    function ajaxIssueFunction(data) {
                        var tableBody = $("#issueTableBody");
                        tableBody.empty();  // 테이블 몸체 초기화

                        var issues = data.issues;
                        var pagination = data.pagination;
                        var lList = data.lList;

                        currentPage = data.pagination.currentPage;
                        var listCount = data.pagination.listCount;
                        var pageLimit = data.pagination.pageLimit;
                        var boardLimit = data.pagination.boardLimit;
                        var maxPage = data.pagination.maxPage;
                        var startPage = data.pagination.startPage;
                        var endPage = data.pagination.endPage;
                        state = data.issues[0].state;
                        console.log(lList)


                        for (var i = 0; i < issues.length; i++) {
                            var item = issues[i];

                            var row = $("<tr>");

                            var numberCell = $("<td>").text(item.number);
                            var titleCell = $("<td>").addClass("text-bold-500");
                            var titleLink = $("<a>")
                                .attr("href", "detail.iss?ino=" + item.number)
                                .css({ "color": "black", "font-weight": "bold" });

                            titleLink.append(item.title); // 텍스트를 추가

                            if (item.milestone && item.milestoneNum) {
                                var milestoneLink = $("<a>")
                                    .attr("href", "detail.mile?mno=" + item.milestoneNum);

                                var milestoneImg = $("<img>")
                                    .attr("src", "resources/icons/milestone.png")
                                    .attr("id", "mileImg");

                                var milestoneText = $("<span>")
                                    .attr("id", "mileText")
                                    .text(item.milestone);

                                milestoneLink.append(milestoneImg, ' ', milestoneText); // 이미지와 텍스트를 추가
                                titleLink.append(' &nbsp;&nbsp; ', milestoneLink); // 기존 titleLink에 이미지와 텍스트를 추가
                            }

                            titleCell.append(titleLink);

                            var createdAtCell = $("<td>").text(item.createdAt);

                            var userCell = $("<td>").addClass("text-bold-500");
                            var userAvatarGroup = $("<div>").addClass("avatar-group");
                            var userAvatar = $("<span>")
                                .attr("title", item.user)
                                .addClass("avatar avatar-sm pull-up");
                            var userAvatarImg = $("<img>")
                                .attr("alt", "avatar")
                                .attr("src", item.profile)
                                .addClass("rounded-circle writerAvatar");
                            userAvatar.append(userAvatarImg);
                            userAvatarGroup.append(userAvatar);
                            userCell.append(userAvatarGroup);

                            var labelsCell = $("<td>").addClass("text-bold-500");
                            $.each(item.labels, function (index, label) {
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

                            var assigneesCell = $("<td>").addClass("align-middle");
                            var assigneesAvatarGroup = $("<div>").addClass("avatar-group");
                            $.each(item.assigneeProfiles, function (index, j) {
                                var assigneeAvatar = $("<span>")
                                    .attr("title", item.assignees[index])
                                    .addClass("avatar avatar-sm pull-up");
                                var assigneeAvatarImg = $("<img>")
                                    .attr("alt", "avatar")
                                    .attr("src", j)
                                    .addClass("rounded-circle assigneesAvatar");
                                assigneeAvatar.append(assigneeAvatarImg);
                                assigneesAvatarGroup.append(assigneeAvatar);
                            });
                            assigneesCell.append(assigneesAvatarGroup);

                            var stateCell = $("<td>").attr("id", "continue").text(item.state);

                            var mailCell = $("<td>");
                            var mailLink = $("<a>").attr("href", "#");
                            var mailIcon = $("<i>")
                                .addClass("badge-circle badge-circle-light-secondary font-medium-1")
                                .attr("data-feather", "mail");
                            mailLink.append(mailIcon);
                            mailCell.append(mailLink);

                            row.append(numberCell, titleCell, createdAtCell, userCell, labelsCell, assigneesCell, stateCell, mailCell);
                            tableBody.append(row);
                        }

                        var paging = $("#paging");
                        paging.empty();

                        var ul = $("<ul>").addClass("pagination pagination-primary justify-content-center");

                        // Prev 버튼 생성
                        if (currentPage != 1) { // state, labels
                            if(lList != null && lList.length === 0) {
                                ul.append($("<li>").addClass("page-item").append($("<a>").addClass("page-link").attr("href", "javascript:void(0);").text("Prev").attr("onclick", "callAjaxIssueFunction(lList,'" + state + "', " + (currentPage - 1) + ");")));
                            } else {
                            ul.append($("<li>").addClass("page-item").append($("<a>").addClass("page-link").attr("href", "javascript:void(0);").text("Prev").attr("onclick", "sendAjaxRequest('" + state + "', " + (currentPage - 1) + ");")));
                            }
                        } else {
                        	if(lList != null && lList.length === 0) {
                                ul.append($("<li>").addClass("page-item disabled").append($("<a>").addClass("page-link").attr("href", "javascript:void(0);").text("Prev").attr("onclick", "callAjaxIssueFunction(lList,'" + state + "', " + (currentPage - 1) + ");")));
                        	} else {
                            ul.append($("<li>").addClass("page-item disabled").append($("<a>").addClass("page-link").attr("href", "#").text("Prev")));
                        	}
                        }
						
                        
                        if(lList != null && lList.length === 0) {
                        	for (var p = startPage; p <= endPage; p++) {
	                            ul.append($("<li>").addClass("page-item").append($("<a>").addClass("page-link").attr("href", "javascript:void(0);").text(p).attr("onclick", "callAjaxIssueFunction(lList,'" + state + "', " + p + ");")));
                        	}
                        } else {
	                        for (var p = startPage; p <= endPage; p++) {
	                            ul.append($("<li>").addClass("page-item").append($("<a>").addClass("page-link").attr("href", "javascript:void(0);").text(p).attr("onclick", "sendAjaxRequest('" + state + "', " + p + ");")));
                        	}
                        }

                        // Next 버튼 생성
                        // Next 버튼 생성
                        if (currentPage < maxPage) {
                            ul.append($("<li>").addClass("page-item").append($("<a>").addClass("page-link").attr("href", "javascript:void(0);").text("Next").attr("onclick", "sendAjaxRequest('" + state + "', " + (currentPage + 1) + ");")));
                            console.log(currentPage + 1)
                        } else {
                            ul.append($("<li>").addClass("page-item disabled").append($("<a>").addClass("page-link").attr("href", "#").text("Next")));
                        }

                        $("#paging").html(ul);

                    }


                    var selectElement = document.querySelector(".choices.form-select");


                    function handleSelectChange() {
                        var selectedValues = new Array();
                        for (var i = 0; i < selectElement.selectedOptions.length; i++) {
                            selectedValues.push(selectElement.selectedOptions[i].value);
                        }
                        
                        var currentPage = 1;

                        // Determine the state based on the selected button
                        var selectedState = "open"; // Default to the current state
                        if ($("#continueBtn").hasClass("active")) {
                            selectedState = "open";
                        } else if ($("#finishBtn").hasClass("active")) {
                            selectedState = "closed";
                        }

                        // Call your function with the selected state
                        callAjaxIssueFunction(selectedValues, selectedState, currentPage);
                    }

                    // Define a function to call the AJAX issue function with parameters
                    function callAjaxIssueFunction(selectedValues, state, cpage) {
                    	console.log("왜 나에대한 기준만 엄격한거지")
                    	console.log(cpage)
                        console.log(state)
                        console.log(selectedValues)
                        
                        $.ajax({
                            type: 'post',
                            url: "AjaxIssueByLabels.iss",
                            data: {
                                selectedValues: selectedValues,
                                state: state,
                                cpage: cpage
                            },
                            success: function (response) {
                                ajaxIssueFunction(response, cpage, state);
                                console.log("서버 응답: " + response);
                            },
                            error: function (xhr, status, error) {
                                console.error("AJAX 오류: " + error);
                            }
                        });
                    }

                    selectElement.addEventListener("change", handleSelectChange);

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