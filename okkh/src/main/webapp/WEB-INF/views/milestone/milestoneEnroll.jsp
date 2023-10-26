<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                <form action="">
                    <div class="row">
                    	<div class="col-12">
	                        <div class="card" style="height: 600px;">
	                            <div class="card-header">
	                                <h4 class="card-title">마일스톤 생성하기</h4>
	                            </div>
	                            <div class="card-content">
		                            <div class="card-body">
		                                <div class="form-group">
		                                    <label for="basicInput">Title</label>
		                                    <input type="text" class="form-control" id="basicInput" value="${ milestone.title }">
		                                </div>
		                                <label for="mileDate">Due date(optional)</label>
		                                <div class="form-group">
		                                    <input type="date" class="form-control" name="" id="mileDate" value="">
		                                </div>
		                                <div class="form-group mb-3">
		                                    <label for="exampleFormControlTextarea1" class="form-label">Content</label>
		                                    <textarea class="form-control" id="exampleFormControlTextarea1"
		                                        rows="3" style="height: 300px;"></textarea>
		                                </div>
		                             </div>
		                       	</div>
		                    </div>
                        </div>
                    </div>
                    <button class="btn btn-primary" style="float: right">등록하기</button>
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