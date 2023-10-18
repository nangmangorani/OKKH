<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>
<!-- 에디터 css -->
<link rel="stylesheet" href="resources/assets/extensions/quill/quill.snow.css">
<link rel="stylesheet" href="resources/assets/extensions/quill/quill.bubble.css">
</head>

<body>

    <!-- 전체 div 시작 -->
    <div id="app">
        <!-- 사이드바 시작 -->
        <jsp:include page="../common/leftSide.jsp"/>
        <!-- 사이드바 끝 -->

        <!-- 메인 시작 -->
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"/>
            <!-- 상단바 끝 -->
            
            <div class="page-heading" style="margin-left: 20px; margin-top: 15px;">

                <!-- 페이지 제목 시작 -->
                <h3 style="float: left; margin-right: 10px;">okkh</h3>
                <span class="badge bg-light-secondary">Public</span>
                <!-- /페이지 제목 끝 -->

                
            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 내용 시작 -->
            <div class="page-content"> 
                <section class="row">
                    <!-- 왼쪽 내용 시작 -->
                    <!-- 이슈, 마일스톤, 풀리퀘 버튼 시작 -->
					<div class="buttons">
						<a href="#" class="btn btn-outline-primary"><i class="bi bi-stack"> Issues</i></a>
						<a href="#" class="btn btn-outline-info"><i class="bi bi-puzzle"></i> Milestones</a>
						<a href="myPullRequest.pu" class="btn btn-outline-success"><i class="fa-solid fa-code-pull-request"></i> Pull Requests</a>
					</div>
					<!-- /이슈, 마일스톤, 풀리퀘 버튼 끝 -->
					
					<section class="section">
				        <div class="row">
				            <div class="col">
				                <div class="card">
				                	<div class="review">
					                    <div class="card-header">
					                    	<span style="font-weight: bold; font-size: 18px;">풀리퀘 테스트</span>
					                        <span style="color: #707070;">#01</span>
					                    </div>
				                    </div>
				                	<div class="review">
					                    <div class="card-header">
					                        <img src="https://avatars.githubusercontent.com/u/126389803?s=40&amp;v=4" height="30" width="30" style="border-radius: 15px;"> 
					                        <span style="font-weight: bold; color: #198754;">YoonTarget</span>
					                    </div>
					                    <div class="card-body">
					                        <div class="form-group with-title mb-3">
					                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>풀리퀘 받아라잉~!~!</textarea>
					                            <label>5일 전</label>
					                        </div>
					                    </div>
				                    </div>
				                    
				                    <hr>
				                    
				                    <div class="review">
					                    <div class="card-header">
					                        <img src="https://avatars.githubusercontent.com/u/134485713?v=4" height="30" width="30" style="border-radius: 15px;"> 
					                        <span>JMOOK0816</span>
					                    </div>
					                    <div class="card-body">
					                        <div class="form-group with-title mb-3">
					                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>아라따잉</textarea>
					                            <label>3일 전</label>
					                        </div>
					                    </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </section>
				    
				    <section class="section">
				        <div class="card">
				            <div class="card-header">
				                <h4 class="card-title">Write</h4>
				            </div>
				            <div class="card-body">
				                <div id="snow">
				                	<textarea></textarea>
				                </div>
				                <br>
				                <div class="buttons" align="right">
									<a href="#" class="btn btn-primary">Comment</a>
								</div>
				            </div>
				        </div>
				    </section>
                    <!-- /왼쪽 내용 끝 -->

                </section>
            </div>
            <!-- /내용 끝 -->

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
	
	<!-- 에디터 js -->
	<script src="resources/assets/extensions/quill/quill.min.js"></script>
	<script src="resources/assets/static/js/pages/quill.js"></script>
</body>

</html>