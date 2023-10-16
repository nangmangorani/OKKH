<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>
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
            
            <div class="page-heading">

                <!-- 페이지 제목 시작 -->
                <h3 style="margin-left: 20px; margin-top: 10px;">My Project</h3>
                <!-- /페이지 제목 끝 -->

            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 컨텐츠 시작 -->
            <div class="page-content">
            	<!-- 본문 시작 -->
                <section class="row">
                	<!-- 완료, 진행 프로젝트 navs 시작 -->
             		<div class="col-12 col-lg-9">
		                <div class="card">
		                    <div class="card-body">
		                        <ul class="nav nav-tabs" id="myTab" role="tablist">
		                            <li class="nav-item" role="presentation">
		                                <a class="nav-link active" id="ing-tab" data-bs-toggle="tab" href="#ing" role="tab"
		                                    aria-controls="home" aria-selected="true">진행중인 프로젝트</a>
		                            </li>
		                            <li class="nav-item" role="presentation">
		                                <a class="nav-link" id="fin-tab" data-bs-toggle="tab" href="#fin" role="tab"
		                                    aria-controls="profile" aria-selected="false">완료된 프로젝트</a>
		                            </li>
		                        </ul>
		                        <div class="tab-content" id="myTabContent">
		                            <div class="tab-pane fade show active" id="ing" role="tabpanel" aria-labelledby="ing-tab">
		                            	<br><br>
		                                <!-- 진행중인 프로젝트 리스트 시작 -->
					                    <div class="col-12 col-lg-9">
					                        <div class="row">
					                            <!-- 진행중인 프로젝트 시작 -->
					                            <div class="col-6 col-lg-3 col-md-6">
				                                	<a href="repoList.re?pno=1">
					                                	<div class="card" style="border: 1px solid #cecece;">
					                                   		<div class="card-body px-3 py-4-5">
						                                        <div class="row">
						                                            <div class="col-md-4">
						                                                <!-- <div class="stats-icon blue">
						                                                    <i class="iconly-boldShow"></i>
						                                                </div> -->
						                                                <img src="resources/icons/ing.png" alt="" width="50" height="50">
						                                            </div>
						                                            <div class="col-md-8">
						                                                <h6 class="text-muted font-semibold">파이널 프로젝트</h6>
						                                                <h6 class="font-extrabold mb-0">OKKH</h6>
						                                            </div>
						                                        </div>
					                                    	</div>
					                                	</div>
				                                    </a>
					                            </div>
					                            <!-- /진행중인 프로젝트 끝 -->
					                            <!-- 진행중인 프로젝트 시작 -->
					                            <div class="col-6 col-lg-3 col-md-6">
					                            	<a href="repoList.re?pno=1">
						                                <div class="card" style="border: 1px solid #cecece;">
						                                   	<div class="card-body px-3 py-4-5">
						                                        <div class="row">
						                                            <div class="col-md-4">
						                                                <!-- <div class="stats-icon blue">
						                                                    <i class="iconly-boldShow"></i>
						                                                </div> -->
						                                                <img src="resources/icons/ing.png" alt="" width="50" height="50">
						                                            </div>
						                                            <div class="col-md-8">
						                                                <h6 class="text-muted font-semibold">개인 프로젝트</h6>
						                                                <h6 class="font-extrabold mb-0">계산기 만들기</h6>
						                                            </div>
						                                        </div>
						                                    </div>
						                                </div>
					                                </a>
					                            </div>
					                            <!-- /진행중인 프로젝트 끝 -->
					                        </div>
					                    </div>
					                    <!-- /진행중인 프로젝트 리스트 끝 -->
		                            </div>
		                            <div class="tab-pane fade" id="fin" role="tabpanel" aria-labelledby="fin-tab">
		                                <br><br>
		                                <!-- 완료된 프로젝트 리스트 시작 -->
					                    <div class="col-12 col-lg-9">
					                        <div class="row">
					                            <!-- 완료된 프로젝트 시작 -->
					                            <div class="col-6 col-lg-3 col-md-6">
				                                	<a href="repoList.re?pno=1">
					                                	<div class="card" style="border: 1px solid #cecece;">
					                                   		<div class="card-body px-3 py-4-5">
						                                        <div class="row">
						                                            <div class="col-md-4">
						                                                <!-- <div class="stats-icon blue">
						                                                    <i class="iconly-boldShow"></i>
						                                                </div> -->
						                                                <img src="resources/icons/fin.png" alt="" width="50" height="50">
						                                            </div>
						                                            <div class="col-md-8">
						                                                <h6 class="text-muted font-semibold">세미 프로젝트</h6>
						                                                <h6 class="font-extrabold mb-0">티켓딱대</h6>
						                                            </div>
						                                        </div>
					                                    	</div>
					                                	</div>
				                                    </a>
					                            </div>
					                            <!-- /완료된 프로젝트 끝 -->
					                            <!-- 완료된 프로젝트 시작 -->
					                            <div class="col-6 col-lg-3 col-md-6">
					                            	<a href="repoList.re?pno=1">
						                                <div class="card" style="border: 1px solid #cecece;">
						                                   	<div class="card-body px-3 py-4-5">
						                                        <div class="row">
						                                            <div class="col-md-4">
						                                                <!-- <div class="stats-icon blue">
						                                                    <i class="iconly-boldShow"></i>
						                                                </div> -->
						                                                <img src="resources/icons/fin.png" alt="" width="50" height="50">
						                                            </div>
						                                            <div class="col-md-8">
						                                                <h6 class="text-muted font-semibold">개인 프로젝트</h6>
						                                                <h6 class="font-extrabold mb-0">To-do List</h6>
						                                            </div>
						                                        </div>
						                                    </div>
						                                </div>
					                                </a>
					                            </div>
					                            <!-- /완료된 프로젝트 끝 -->
					                        </div>
					                    </div>
					                    <!-- /완료된 프로젝트 리스트 끝 -->
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <!-- /완료, 진행 프로젝트 navs 끝 -->
                    <!-- 친구 및 팀원 시작 -->
                    <jsp:include page="../common/rightSide.jsp"/>
                    <!-- 친구 및 팀원 끝 -->
                </section>
                <!-- /본문 끝 -->
            </div>
            <!-- /컨텐츠 끝 -->

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
</body>

</html>