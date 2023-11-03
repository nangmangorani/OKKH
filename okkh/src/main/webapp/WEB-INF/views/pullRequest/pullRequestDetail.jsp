<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<!-- 
	* 받아온 값 
	- pull : 풀리퀘 상세내용
	- pullReview : 풀리퀘 리뷰리스트
	- commit : 풀리퀘 커밋내용
 -->

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
					<!-- 풀리퀘 리뷰 내용 시작 -->
					<section class="section">
				        <div class="row">
				            <div class="col">
				                <div class="card">
				                	<div class="review">
					                    <div class="card-header">
					                    	<span style="font-weight: bold; font-size: 25px;">${pull.title }</span>
					                        <span style="color: #707070; font-size:18px;">
					                        
					                        <c:choose>
					                        	<c:when test="${pull.fullRequestNum < 10 }">
					                        		#0${pull.fullRequestNum }
					                        	</c:when>
					                        	<c:otherwise>
					                        		#${pull.fullRequestNum }
					                        	</c:otherwise>
					                        
					                        </c:choose>
					                        
					                        
					                        </span>
					                    </div>
				                    </div>
				                	<div class="review">
					                    <div class="card-header">
					                        <img src="${pull.profile }" height="30" width="30" style="border-radius: 15px;"> 
					                        <span style="font-weight: bold; color: #198754;">${pull.user }</span>
											<span>
												
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right; ">
													Update PullRequest
												</button>
												
											</span>
											
					                    </div>
					                    <div class="card-body">
					                        <div class="form-group with-title mb-3">
					                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>${pull.body }</textarea>
					                            
					                            <!--  
					                                <c:set var="now" value="<%=new java.util.Date()%>" />
					                              
											        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
											-->  
											        <fmt:parseDate var="createDate" value="${pull.createdAt}" pattern="yyyy-MM-dd" />
											
											        <c:set var="timeDiffMillis" value="${now.time - createDate.time}" />
											        <c:set var="timeDiffDays" value="${timeDiffMillis / (1000*60*60*24)}" />
											        
											        <label><fmt:formatNumber  maxFractionDigits="0"   value="${timeDiffDays}" />일 전</label>
					                            
					                        </div>
					                    </div>
				                    </div>
				                    
				              
				                      
									                            
									                            
									                           
																
				                    
				                    
				                    <!-- 여기는 코드들 볼 수 있게 우리 프로젝트의 그동안의 커밋 내용들을 불러오기...? -->
				                    
				              <div class="card-body" style="width:90%;margin:auto" >      
				               <div class="table-responsive" style="width:90%; margin:auto;">
                                <table class="table table-lg" >
                                    <thead>
                                        <tr>
                                            <th style="width:20%;">Commits ...</th>
                                            <th style="width:80%;"></th>
                                        
                                        </tr>
                                    </thead>
                                    <tbody>
                                     
                                      <c:forEach var="c" items="${commit }">
                                    
                                        <tr>
                                            <td class="text-bold-500">
												<img src="${c.profile }" height="30" width="30" style="border-radius: 15px;">
												<span>${c.login }</span> 
											</td>
											<!-- a태그 안에 href에는 커밋 주소들이 번갈아가며 들어가야함... -->
                                            <td><a href="${c.url }" style="color: gray;">${c.massage }</a></td>
                                           

                                        </tr>
                                      </c:forEach>
                                    </tbody>
                                </table>
                            </div>
				         </div>
				                    
				                    
				                    
				                    <br><br>
				                    
				                    <h5 style="margin-left:25px;">Reviews....</h5>
				                    
				                    <hr>
				                    <div class="review">
				                    	
					                  
						                     <c:choose>
							                       <c:when test="${not empty pullReview }">
							                           <c:forEach var="review" items="${pullReview }">
									                    <div class="card-header">
									                        <img src="${review.profile }" height="30" width="30" style="border-radius: 15px;"> 
									                        <span>${review.pullReviewWriter }</span>
															<span>
																<button type="button" class="btn btn-light-secondary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right; ">
																	Delete Review
																</button>
																<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right; margin-right:5px;">
																	Update Review
																</button>
															</span>
									                    </div>
									                    <div class="card-body">
									                        <div class="form-group with-title mb-3">
									                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>${review.reviewContent }</textarea>
									                            
												               <!--  
								                                <c:set var="now" value="<%=new java.util.Date()%>" />
								                              
														        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
														       -->  
														        <fmt:parseDate var="createDate" value="${review.createDate}" pattern="yyyy-MM-dd" />
														
														        <c:set var="timeDiffMillis" value="${now.time - createDate.time}" />
														        <c:set var="timeDiffDays" value="${timeDiffMillis / (1000*60*60*24)}" />
														        
														        <label><fmt:formatNumber  maxFractionDigits="0"   value="${timeDiffDays}" />일 전</label>
									                        </div>
									                    </div>
									                    </c:forEach> 
								                    </c:when>
								                    <c:otherwise>
								                        <br><br>
								                    	<div align="center"><h5 style="color:gray;">아직 작성된 Review가 없습니다!</h5></div>
								                        <br><br>
								                    </c:otherwise>
								                    
							                   </c:choose> 
						                     
				                    </div>
				                    
				                    
				                    <script>
				                     
				                      
				                    
				                    
				                    </script>
				                    
				                    
				                    
				                    
				                </div>
				            </div>
				        </div>
				    </section>
				    <!-- /풀리퀘 리뷰 내용 끝 -->
				    <!-- 풀리퀘 리뷰 작성 시작 -->
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
									<a href="myPullRequest.pu" class="btn btn-light-secondary">Back</a>
								</div>
				            </div>
				        </div>
				        
				          
				    </section>
				    <!-- /풀리퀘 리뷰 작성 끝 -->
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