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
		                        <ul class="nav nav-tabs" id="myTab" role="tablist" style="float: left;">
		                            <li class="nav-item" role="presentation">
		                                <a class="nav-link active" id="ing-tab" data-bs-toggle="tab" href="#ing" role="tab"
		                                    aria-controls="home" aria-selected="true">진행중인 프로젝트</a>
		                            </li>
		                            <li class="nav-item" role="presentation">
		                                <a class="nav-link" id="fin-tab" data-bs-toggle="tab" href="#fin" role="tab"
		                                    aria-controls="profile" aria-selected="false">완료된 프로젝트</a>
		                            </li>
		                        </ul>
		                        <!-- 프로젝트 추가 버튼 시작 -->
		                        <button id="newProject" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right;">
				                    New Project
				                </button>
				                <!-- /프로젝트 추가 버튼 끝 -->
				                
				                <br>
				                
				                <script>
				                
				                	$(() => {
				                		
				                		$("#newProject").click(() => {
				                			
				                			$.ajax({
				                				url:"selectTeamMateList.re",
				                				success:(list) => {
				                					
				                					
				                					
				                				},
				                				error:() => {
				                					console.log("new Project ajax failed");
				                				}
				                			})
				                			
				                		})
				                		
				                	})
				                
				                </script>
				
				                <!--프로젝트 추가 form Modal 시작 -->
				                <div class="modal fade text-left" id="inlineForm" tabindex="-1"
				                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
				                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				                        role="document">
				                        <div class="modal-content">
				                            <div class="modal-header bg-primary">
				                                <h5 class="modal-title white" id="myModalLabel160">
				                                    New Project
				                                </h5>
				                                <button type="button" class="close"
				                                    data-bs-dismiss="modal" aria-label="Close">
				                                    <i data-feather="x"></i>
				                                </button>
				                            </div>
				                            <form action="insertMyProject.re">
				                                <div class="modal-body">
				                                    <label>Project Title:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="프로젝트명을 입력해주세요."
				                                            class="form-control" name="myproTitle">
				                                    </div>
				                                    <label>Project Type:</label>
				                                    <div class="form-group">
								                        <input type="radio" class="btn-check" name="myproType" id="solo-outlined" value="개인 프로젝트"
								                            autocomplete="off" checked>
								                        <label class="btn btn-outline-success" for="solo-outlined">개인 프로젝트</label>
								
								                        <input type="radio" class="btn-check" name="myproType" id="team-outlined" value="팀 프로젝트"
								                            autocomplete="off">
								                        <label class="btn btn-outline-success" for="team-outlined">팀 프로젝트</label>
				                                    </div>
				                                    <label>Project Member:</label>
				                                    <div class="form-group">
								                        <div>
								                        	<a href="#" class="btn btn-outline-primary"><img src="${ loginMember.avatarUrl }" width="25" height="25" style="border-radius: 20px;">${ loginMember.gitNick }</a>
								                        </div>
				                                    </div>
				                                </div>
				                                <div class="modal-footer">
				                                    <button type="button" class="btn btn-light-secondary"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-x d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Cancel</span>
				                                    </button>
				                                    <button type="submit" class="btn btn-primary ml-1"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-check d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Create</span>
				                                    </button>
				                                </div>
				                            </form>
				                        </div>
				                    </div>
				                </div>
				                <!--/프로젝트 추가 form Modal 끝 -->
		                        <div class="tab-content" id="myTabContent">
		                            <div class="tab-pane fade show active" id="ing" role="tabpanel" aria-labelledby="ing-tab">
		                            	<br><br>
		                                <!-- 진행중인 프로젝트 리스트 시작 -->
					                    <div class="col-12 col-lg-9">
					                        <div class="row">
					                        	<c:choose>
					                        		<c:when test="${ not empty loginMember and not empty pIngList }">
						                        		<!-- 로그인을 하고 해당 유저의 진행중인 프로젝트가 있다면 리스트 출력 -->
						                        		<!-- 진행중인 프로젝트 시작 -->
							                        	<c:forEach var="pIng" items="${ pIngList }">
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
									                                                <h6 class="text-muted font-semibold">${ pIng.myproType }</h6>
									                                                <h6 class="font-extrabold mb-0">${ pIng.myproTitle }</h6>
									                                            </div>
									                                        </div>
								                                    	</div>
								                                	</div>
							                                    </a>
								                            </div>
							                        	</c:forEach>
								                        <!-- /진행중인 프로젝트 끝 -->
					                        		</c:when>
					                        		<c:when test="${ not empty loginMember and empty pEndList }">
					                        			<!-- 로그인을 했지만 해당 유저의 진행중인 프로젝트가 없다면 진행중인 프로젝트가 없다는 문구 출력 -->
					                        			<div>진행중인 프로젝트가 없습니다.</div>
					                        		</c:when>
					                        		<c:otherwise>
						                        		<!-- 로그인을 안 했다면 로그인 후 이용 가능하다는 문구 출력 -->
					                        			<div>로그인 후 이용 가능한 서비스입니다.</div>
					                        		</c:otherwise>
					                        	</c:choose>
					                        </div>
					                    </div>
					                    <!-- /진행중인 프로젝트 리스트 끝 -->
		                            </div>
		                            <div class="tab-pane fade" id="fin" role="tabpanel" aria-labelledby="fin-tab">
		                                <br><br>
		                                <!-- 완료된 프로젝트 리스트 시작 -->
					                    <div class="col-12 col-lg-9">
					                        <div class="row">
					                        	<c:choose>
					                        		<c:when test="${ not empty loginMember and not empty pEndList }">
						                        		<!-- 로그인을 했고 해당 유저의 완료된 프로젝트가 있다면 리스트 출력 -->
						                            	<!-- 완료된 프로젝트 시작 -->
					                        			<c:forEach var="pEnd" items="${ pEndList }">
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
									                                                <h6 class="text-muted font-semibold">${ pEnd.myproType }</h6>
									                                                <h6 class="font-extrabold mb-0">${ pEnd.myproTitle }</h6>
									                                            </div>
									                                        </div>
								                                    	</div>
								                                	</div>
							                                    </a>
								                            </div>
							                            </c:forEach>
							                            <!-- /완료된 프로젝트 끝 -->
					                        		</c:when>
					                        		<c:when test="${ not empty loginMember and empty pEndList }">
					                        			<!-- 로그인을 했지만 해당 유저의 완료된 프로젝트가 없다면 완료된 프로젝트가 없다는 문구 출력 -->
					                        			<div>완료된 프로젝트가 없습니다.</div>
					                        		</c:when>
					                        		<c:otherwise>
						                        		<!-- 로그인을 안 했다면 로그인 후 이용 가능하다는 문구 출력 -->
					                        			<div>로그인 후 이용 가능한 서비스입니다.</div>
					                        		</c:otherwise>
					                        	</c:choose>
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