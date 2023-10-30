<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈상세페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


	<style>
        .iss-wrap{
            border: 1px solid #e9ecef;
            height: 180px;
            overflow: auto;
        }

        .iss-time{
            border: 1px solid #e9ecef;
            background-color: #e9ecef;
            font-size: 13px;
            height: 30px;
            line-height: 28px;
        }
        
        .labelSpan {
            font-size: 13px;
            font-weight: 600;
            padding: 3px 5px;
            border-radius: 5px;
            color: white;
        }
    </style>
    
</head>
<body>
<!-- 주야간모드 버튼 js 시작 -->
    <script src="../../resources/assets/static/js/initTheme.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/marked@3.0.7/marked.min.js"></script>    
    
    <!-- /주야간모드 버튼 js 끝 -->
    <div id="app">
        <!-- 사이드바! -->
        <jsp:include page="../common/leftSide.jsp"/>
        
        <div id="main">
    		<jsp:include page="../common/header.jsp"/>
	            <section class="section">
	                <div class="row">
	                    <div class="col">
	                        <div class="card">
	                            <div class="card-header" style="font-size: 30px;">
	                                <span>${ title }</span>
	                                <span>#${ bno }</span> 
	                                
	                                <form action="editForm.iss?ino=${bno}" method="post">
									   <input type="hidden" name="state" value="${ state }"> 
                     		           <button class="btn btn-primary" style="float:right">이슈 수정</button>
	                                </form>
	                                
	                                <br>
	                                
	                                
									<c:choose>
									    <c:when test="${state eq 'open'}">
									        <span class="badge bg-success"
		                                    style="height: 50px; width: 100px; font-size: 20px; line-height: 35px;">Open</span>
									    </c:when>
									    <c:otherwise>
									        <span class="badge bg-danger"
		                                    style="height: 50px; width: 100px; font-size: 20px; line-height: 35px;">Closed</span>
									    </c:otherwise>
									</c:choose>
	                            </div>
	                            
	                        </div>
	                    </div>
	                </div>
	            </section>
            <section class="section">
                <form action="">
                    <div class="row">
                        <div class="col-12 col-md-9">
                            <div class="card" style="height: 513px;">
                                <div class="card-body">
                                    <div id="full" style="height: 300px;">
                                        <div class="card-body">
			                                <div class="iss-wrap">
			                                    <div class="iss-time">
			                                        <span style="padding-left: 5px;">${ userLogin } comments 작성시간-현재시간?? minutes ago</span>
			                                    </div>
			                                    <span style="padding-left: 7px;" id="exampleFormControlTextarea1"></span>
			                                </div> 
		                            		<input type="hidden" id="bodyChangePlease" value="${ body }">
			                            </div>
			                            <div class="card-body">
			                                <div class="form-group with-title mb-3">
			                                    	<textarea class="form-control" id="exampleFormControlTextarea2" rows="3"
			                                        style="resize: none;background-color: white;"
			                                        disabled>하단에서 커멘트 추가작성시 그 내용을 담고 이textarea가 하단에 추가됨</textarea>
			                                   <label style="font-size: 13px;">
			                                        nangmangorani comment 15 minutes ago
			                                    </label>
			                                </div>
			                            </div>
                                    </div> <br>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-3">
                            <div class="card" style="height: 513px;">
                                <div class="card-body">
                                    <h6>이슈 담당자</h6>
                                    <c:forEach var="a" items="${ assignees }">
                                    	${ a.gitNick }
                                    </c:forEach>
                                    <br><br>
                                    <h6>라벨</h6>
                                    <c:forEach var="l" items="${ labels }">
                                    	<span class="labelSpan"
                                    	style="background-color:#${l.color};">${ l.name }</span>
                                    </c:forEach>
                                    <br><br>
                                    <h6>마일스톤</h6>
                                    ${ milestoneOne.title }
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="directInput" style="display: none;"
                                            placeholder="직접 입력해주세요">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </section>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2021 &copy; Mazer</p>
                    </div>
                    <div class="float-end">
                        <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                href="http://ahmadsaugi.com">A. Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <script>
        $(function () {
        	var bodyChangePlease = $("#bodyChangePlease").val();
        	console.log(bodyChangePlease);
        	
        	var htmlContent = marked(bodyChangePlease, { sanitize: true });
        	console.log(bodyChangePlease);
        	$("#exampleFormControlTextarea1").html(htmlContent);
        	
            $("#milestoneSelect").change(function () {
                var selectedOption = $(this).find(":selected").val();

                if (selectedOption === "direct") {
                    $("#directInput").show();
                } else {
                    $("#directInput").hide();
                }
            });
            
            
            
        });
    </script>


    <!-- <script src="../../resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../resources/js/bootstrap.bundle.min.js"></script>

    <script src="../../resources/vendors/apexcharts/apexcharts.js"></script>
    <script src="../../resources/js/pages/dashboard.js"></script>

    <script src="../../resources/js/main.js"></script>


    <script src="../../resources/vendors/choices.js/choices.min.js"></script>

    <script src="../../resources/vendors/quill/quill.min.js"></script>
    <script src="../../resources/js/pages/form-editor.js"></script> -->


    <!-- 템플릿 js 시작 -->
    <script src="../../resources/assets/static/js/components/dark.js"></script>
    <script src="../../resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../resources/assets/compiled/js/app.js"></script>

    <!-- Need: Apexcharts -->
    <script src="../../resources/assets/extensions/apexcharts/apexcharts.min.js"></script>
    <script src="../../resources/assets/static/js/pages/dashboard.js"></script>
    <!-- /템플릿 js 끝 -->

    <!-- fontawesome 이미지 -->
    <script src="https://kit.fontawesome.com/d3dccd5748.js" crossorigin="anonymous"></script>
</body>
</html>