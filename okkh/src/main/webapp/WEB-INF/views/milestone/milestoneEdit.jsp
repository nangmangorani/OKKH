<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script>
function submitState() {
    var state = "closed";
    var title = "${milestone.title}";
    var mno = "${milestone.number}";

    var form = document.createElement("form");
    form.method = "post";
    form.action = "edit.mile?mno=" + mno;

    var stateInput = document.createElement("input");
    stateInput.type = "hidden";
    stateInput.name = "state";
    stateInput.value = state; // state 값을 설정합니다.

    var titleInput = document.createElement("input");
    titleInput.type = "hidden";
    titleInput.name = "title";
    titleInput.value = title;

    form.appendChild(stateInput);
    form.appendChild(titleInput);

    document.body.appendChild(form);
    form.submit();
}

</script> -->
</head>
<body>
    <div id="app">
        <!-- 사이드바 시작 -->
        <jsp:include page="../common/leftSide.jsp"></jsp:include>
        
        <!-- 사이드바 끝 -->
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"></jsp:include>
            <!-- 상단바 끝 -->

            <section class="section">
                <form action="edit.mile?mno=${ milestone.number }" method="post">
                    <div class="row">
                    	<div class="col-12">
	                        <div class="card" style="height: 600px;">
	                            <div class="card-header">
	                                <h4 class="card-title">마일스톤 수정하기</h4>
	                            </div>
	                            <div class="card-body">
	                                <div class="form-group">
	                                    <label for="basicInput">제목</label>
	                                    <input type="text" class="form-control" id="basicInput" name="title" value="${ milestone.title }">
	                                </div>
	                                <label for="mileDate">마감일(선택)</label>
	                                <div class="form-group">
	                                    <input type="date" class="form-control" name="dueOnDate" id="mileDate" value="${ milestone.dueOn }">
	                                </div>
	                                <div class="form-group mb-3">
	                                    <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	                                    <c:choose>
	                                    	<c:when test="${ empty milestone.content }">
	                                    		<textarea class="form-control" id="exampleFormControlTextarea1"
	                                        	rows="3" style="height: 300px;" name="content"></textarea>
	                                        </c:when>
	                                        <c:otherwise>
	                                        	<textarea class="form-control" id="exampleFormControlTextarea1"
	                                        	rows="3" style="height: 300px;" name="content">${ milestone.content }</textarea>
	                                        </c:otherwise>
	                                    </c:choose>
	                                </div>
	                            </div>
	                        </div>
                        </div>
                    </div>
                    <button class="btn btn-primary" style="float: right; margin-left: 10px;">수정하기</button>
                </form>
                <form action="edit.mile?mno=${ milestone.number }" method="post">
                    <input type="hidden" name="state" value="closed">
                    <button class="btn btn-primary" style="float: right">마일스톤 종료</button> 
                </form>
            </section>
            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
        <script>
		    $(function () {
		        $("#milestoneSelect").change(function () {
		            var selectedOption = $(this).find(":selected").val();
		            console.log("선택된 옵션: " + selectedOption);
		
		            if (selectedOption === "direct") {
		                $("#mileInput").show();
		                console.log("directInput 표시");
		            } else {
		                $("#mileInput").hide();
		                console.log("directInput 숨김");
		            }
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

        <script src="../../resources/vendors/quill/quill.min.js"></script>
        <script src="../../resources/js/pages/form-editor.js"></script>
</body>
</html>