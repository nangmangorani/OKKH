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
            
            <div class="page-heading" style="margin-left: 10px;">

                <!-- 페이지 제목 시작 -->
                <!-- <h3 style="float: left; width: 65%;">My Repositories</h3> -->
                <!-- /페이지 제목 끝 -->

                <!-- Button trigger for 레파지 추가 form modal -->
                <br>
                <h3>My Repository</h3>
            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 컨텐츠 시작 -->
            <div class="page-content">
            	<!-- 본문 시작 -->
                <section class="row">
                	<!-- 프로젝트 상세페이지 시작 -->
             		<div class="col-12 col-lg-9">
		                <div class="card">
		                    <div class="card-body">
		                    	<!-- 프로젝트명 시작 -->
		                        <ul class="nav nav-tabs" id="myTab" role="tablist" style="float: left; width: 50%;">
		                            <li class="nav-item" role="presentation">
		                                <a class="nav-link active" id="ing-tab" data-bs-toggle="tab" href="#ing" role="tab" aria-controls="home" aria-selected="true">
		                                    <c:choose>
		                                    	<c:when test="${ not empty mypro }">
		                                    		${ mypro.myproTitle }
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		New Project
		                                    	</c:otherwise>
		                                    </c:choose>
	                                  	</a>
		                            </li>
		                        </ul>
		                        <!-- /프로젝트명 끝 -->
		                        <!-- 레파지 추가 버튼 시작 -->
		                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right;">
				                    New Repository
				                </button>
				                <!-- /레파지 추가 버튼 끝 -->
				                <br>
				                <!--레파지 추가 form Modal 시작 -->
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
				                            	<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
				                                <div class="modal-body">
				                                    <label>Repository Name*:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="레파지토리 이름을 입력해주세요."
				                                            class="form-control" name="repoTitle">
				                                    </div>
				                                    <label>Description:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="레파지토리에 대한 설명을 입력해주세요."
				                                            class="form-control" name="repoContent">
				                                    </div>
				                                    <label>Public or Private:</label>
				                                    <div class="form-group">	
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="public" id="Public" checked>
								                            <label class="form-check-label" for="Public">
								                                Public
								                            </label>
								                        </div>
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="private" id="Private">
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
				                <!--/레파지 추가 form Modal 끝 -->
				                <c:choose>
				                	<c:when test="${ not empty repoList }">
				                		<!-- 레파지토리 리스트 시작 -->
				                        <div class="tab-content" id="myTabContent">
				                            <div class="tab-pane fade show active" id="ing" role="tabpanel" aria-labelledby="ing-tab">
				                            	<br><br>
							                    <div class="col-12">
							                        <div class="row">
							                        	<c:forEach var="r" items="${ repoList }">
								                            <!-- 레파지토리 시작 -->
								                            <div class="col-6 col-lg-3 col-md-6">
								                                <div class="card" style="border: 1px solid #cecece; height: 150px;">
							                                    	<div class="card-body px-3 py-4-5">
								                                    	<a href="repoDetail.re?pno=${ mypro.myproNo }&rnm=${ r.name }&vis=${ r.visibility }">
									                                        <div class="row">
									                                            <div class="col-md-4">
									                                                <!-- <div class="stats-icon blue">
									                                                    <i class="iconly-boldShow"></i>
									                                                </div> -->
									                                                <img src="${ r.owner.avatar_url }" width="50" height="50" style="border-radius: 50px; border: 1px solid #cecece;">
									                                            </div>
									                                            <div class="col-md-8">
									                                                <h6 class="text-muted font-semibold">${ r.visibility }</h6>
									                                                <h5 class="font-extrabold mb-0">${ r.name }</h5>
									                                            </div>
									                                        </div>
							                                    		</a>
							                                    		<br>
						                                    			<form action="deleteRepo.re" method="post" style="float: right; margin-left: 8px;">
								                                			<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
										                                	<input type="hidden" name="myproTitle" value="${ mypro.myproTitle }">
										                                	<input type="hidden" name="repoTitle" value="${ r.name }">
								                                			<button class="btn btn-sm btn-outline-danger">삭제</button>
						                                    			</form>
							                                    		<button type="button" class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#updateRepoForm" style="float: right;">수정</button>
								                                    </div>
								                                </div>
								                            </div>
								                            <!-- /레파지토리 끝 -->
							                           	</c:forEach>
							                        </div>
							                    </div>
				                            </div>
				                        </div>
				                        <!-- /레파지토리 리스트 끝 -->
				                	</c:when>
				                	<c:otherwise>
				                		<br><br>
				                		<div>레파지토리가 없습니다. 새로운 레파지토리를 생성해주세요.</div>
				                	</c:otherwise>
				                </c:choose>
				                <!--레파지 수정 form Modal 시작 -->
				                <div class="modal fade text-left" id="updateRepoForm" tabindex="-1"
				                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
				                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				                        role="document">
				                        <div class="modal-content">
				                            <div class="modal-header bg-primary">
				                                <h5 class="modal-title white" id="myModalLabel160">
				                                    Update Repository
				                                </h5>
				                                <button type="button" class="close"
				                                    data-bs-dismiss="modal" aria-label="Close">
				                                    <i data-feather="x"></i>
				                                </button>
				                            </div>
				                            <form action="insertRepo.re">
				                            	<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
				                                <div class="modal-body">
				                                    <label>Repository Name*:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="수정할 레파지토리명을 입력해주세요."
				                                            class="form-control" name="repoTitle">
				                                    </div>
				                                    <label>Description:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="레파지토리에 대한 설명을 입력해주세요."
				                                            class="form-control" name="repoContent">
				                                    </div>
				                                    <label>Public or Private:</label>
				                                    <div class="form-group">	
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="public" id="Public" checked>
								                            <label class="form-check-label" for="Public">
								                                Public
								                            </label>
								                        </div>
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="private" id="Private">
								                            <label class="form-check-label" for="Private">
								                                Private
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
				                                    <button type="submit" class="btn btn-primary ml-1"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-check d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Update</span>
				                                    </button>
				                                </div>
				                            </form>
				                        </div>
				                    </div>
				                </div>
				                <!--/레파지 수정 form Modal 끝 -->
		                    </div>
		                </div>
		            </div>
		            <!-- /프로젝트 상세페이지 끝 -->
		            
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
	
	<script>

		console.log(${ response });
	
		function updateDeleteRepo(repo, act) {
			
			const repo = $("input [name=repoTitle]").val(repo);
			
			console.log(repo);
			
			$("#updateDeleteForm").attr("action", act + ".re").submit();
			
			return false;
			
		}
	
	</script>
</body>

</html>