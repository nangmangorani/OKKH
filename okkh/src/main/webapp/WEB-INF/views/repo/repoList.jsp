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
                <!-- <h3 style="float: left; width: 65%;">My Repositories</h3> -->
                <!-- /페이지 제목 끝 -->

                <!-- Button trigger for 레파지 추가 form modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm">
                    New Repository
                </button>

                <!--레파지 추가 form Modal -->
                <div class="modal fade text-left" id="inlineForm" tabindex="-1"
                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                        role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary">
                                <h5 class="modal-title white" id="myModalLabel160">
                                    New Repository
                                </h5>
                                <button type="button" class="close"
                                    data-bs-dismiss="modal" aria-label="Close">
                                    <i data-feather="x"></i>
                                </button>
                            </div>
                            <form action="insertRepo.re">
                                <div class="modal-body">
                                    <label>Repository Name*:</label>
                                    <div class="form-group">
                                        <input type="text" placeholder="레파지토리 이름을 입력해주세요."
                                            class="form-control">
                                    </div>
                                    <label>Description:</label>
                                    <div class="form-group">
                                        <input type="text" placeholder="레파지토리에 대한 설명을 입력해주세요."
                                            class="form-control">
                                    </div>
                                    <label>Public or Private:</label>
                                    <div class="form-group">	
                                        <div class="form-check">
				                            <input class="form-check-input" type="radio" name="Publict" id="Public" checked>
				                            <label class="form-check-label" for="Public">
				                                Public
				                            </label>
				                        </div>
                                        <div class="form-check">
				                            <input class="form-check-input" type="radio" name="Private" id="Private">
				                            <label class="form-check-label" for="Private">
				                                Private
				                            </label>
				                        </div>
                                    </div>
                                    <label>ReadMe:</label>
                                    <div class="form-group">	
                                        <div class="form-check">
				                            <input class="form-check-input" type="radio" name="ReadMe"
				                                id="ReadMe" checked disabled>
				                            <label class="form-check-label" for="ReadMe">
				                                ReadMe
				                            </label>
				                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-light-secondary"
                                        data-bs-dismiss="modal">
                                        <i class="bx bx-x d-block d-sm-none"></i>
                                        <span class="d-none d-sm-block">Cancel</span>
                                    </button>
                                    <button type="button" class="btn btn-primary ml-1"
                                        data-bs-dismiss="modal">
                                        <i class="bx bx-check d-block d-sm-none"></i>
                                        <span class="d-none d-sm-block">Create</span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /레파지토리 추가 버튼 끝 -->
            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 컨텐츠 시작 -->
            <div class="page-content">
            	<!-- 본문 시작 -->
                <section class="row">
                    <!-- 레파지토리 리스트 시작 -->
                    <div class="col-12 col-lg-9">
                        <div class="row">
                            <!-- 레파지토리 시작 -->
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <a href="repoDetail.re?rno=1">
                                    	<div class="card-body px-3 py-4-5">
	                                        <div class="row">
	                                            <div class="col-md-4">
	                                                <!-- <div class="stats-icon blue">
	                                                    <i class="iconly-boldShow"></i>
	                                                </div> -->
	                                                <img src="../../resources/images/tag/java.png" alt="" width="50" height="50">
	                                            </div>
	                                            <div class="col-md-8">
	                                                <h6 class="text-muted font-semibold">Java</h6>
	                                                <h6 class="font-extrabold mb-0">00_test-workspace</h6>
	                                            </div>
	                                        </div>
	                                    </div>
                                    </a>
                                </div>
                            </div>
                            <!-- /레파지토리 끝 -->
                            <!-- 레파지토리 시작 -->
                            <div class="col-6 col-lg-3 col-md-6">
                                <div class="card">
                                    <a href="">
                                    	<div class="card-body px-3 py-4-5">
	                                        <div class="row">
	                                            <div class="col-md-4">
	                                                <!-- <div class="stats-icon blue">
	                                                    <i class="iconly-boldShow"></i>
	                                                </div> -->
	                                                <img src="../../resources/images/tag/java.png" alt="" width="50" height="50">
	                                            </div>
	                                            <div class="col-md-8">
	                                                <h6 class="text-muted font-semibold">Java</h6>
	                                                <h6 class="font-extrabold mb-0">00_test-workspace</h6>
	                                            </div>
	                                        </div>
	                                    </div>
                                    </a>
                                </div>
                            </div>
                            <!-- /레파지토리 끝 -->
                        </div>
                    </div>
                    <!-- /레파지토리 리스트 끝 -->

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