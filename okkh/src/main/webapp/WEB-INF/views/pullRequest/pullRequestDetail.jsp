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
					                    	<span style="font-weight:bold; font-size:25px; margin-right:15px;" id="title">
					                    		${pull.title }
					                    	   
					                    	</span>

											<span style="float:right; " id="btn">

												<button  class="btn btn-primary" onclick="updateTitle();">Update Title</button>

											</span>
					                    	
					                    	
					                    	
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
											 <span style="margin-left:20px;">
					                          
					                          <c:choose>
					                          	<c:when test="${pull.state eq 'open' }">
													<button type="button" class="btn btn-success" style="border-radius:50px; ">
														<i class="fa-solid fa-code-pull-request"></i>
													
															&nbsp;Open
													
													</button>					                          	
					                          	
					                          	</c:when>
					                          
					                           <c:when test="${pull.state eq 'closed' }">
													<button type="button" class="btn btn-danger" style="border-radius:50px; ">
														<i class="fa-solid fa-code-pull-request"></i>
														 &nbsp; Close
													</button>					                          	
					                          	
					                          	</c:when>
					                          
					                          </c:choose>
					                        
					                        
					                        </span>
												
										<c:choose>		
											<c:when test="${loginMember.gitNick eq pull.user and pull.state eq 'open' }">
												
												<button type="button" class="btn btn-danger" onclick="changeState(${pull.fullRequestNum},'closed');"  data-bs-target="#inlineForm" style="float: right; ">
													Close
												</button>
												
												<button type="button" class="btn btn-primary" onclick="updatePullBody();" data-bs-target="#inlineForm" style="float: right; margin-right:7px;">
													Update PullRequest
												</button>
												
												
												
											</c:when>
											
											<c:when test="${loginMember.gitNick eq pull.user and pull.state eq 'closed' }">
											   <button type="button" class="btn btn-success"  onclick="changeState(${pull.fullRequestNum},'open');"  data-bs-target="#inlineForm" style="float: right; ">
													Reopen PullRequest
												</button>
											
											</c:when>	
										</c:choose>	
											</span>
											
					                    </div>
					                    <div class="card-body">
					                        <div class="form-group with-title mb-3">
					                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly style="resize: none;">${pull.body }</textarea>
					                            
												<div style="float: right;" id="btn3">
													<!-- 여기에는 updateRequest 버튼을 눌렀을 때 동적으로 다른 버튼들을 그려줄 거임ㄴ -->
												</div>



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
															
															<c:if test="${loginMember.gitNick eq review.pullReviewWriter }">
																<button type="button" class="btn btn-light-secondary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right; ">
																	Delete Review
																</button>
																<c:set var="id" value="${review.id }" />
																<button type="button" class="btn btn-primary" onclick="updateReview(${review.refPull}, ${review.id });" data-bs-target=".form-control ${review.id }"   style="float: right; margin-right:5px;">
																	Update Review
																</button>
															</c:if>	
															</span>
									                    </div>
									                    <div class="card-body">
									                        <div class="form-group with-title mb-3">
									                           <c:choose>
											                      	<c:when test="${loginMember.gitNick eq review.pullReviewWriter }">
											                      	
											                            <textarea class="form-control" id="${review.id }" rows="3"  style="resize: none;">${review.reviewContent }</textarea>
											                      	     
											                      	
											                      	</c:when>
											                        
											                      	<c:otherwise>
											                      		<textarea class="form-control" id="exampleFormControlTextarea2" rows="3" readonly style="resize: none;">${review.reviewContent }</textarea>
											                      	</c:otherwise>
																
															
									                           </c:choose>  
									                            
									                            
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
				                <h4 class="card-title">Review Write</h4>
				            </div>
				            <div class="card-body">
				                <div id="snow" style="height:150px;">
				                	<textarea  ></textarea>
				                </div>
				                <br>
				                <div class="buttons" align="right">
									<button onclick="enrollReview(${pull.fullRequestNum});" class="btn btn-primary">Comment</button>
									<a href="myPullRequest.pu" class="btn btn-light-secondary">Back</a>
								</div>
				            </div>
				        </div>
				        
				          
				    </section>
				    <!-- /풀리퀘 리뷰 작성 끝 -->
                    <!-- /왼쪽 내용 끝 -->

							
					<script>
					
					
						// 상태 변화시키는 함수
						function changeState(num, state){
							
							location.href ="updatePullState.pull?pno="+num + "&state=" + state;
							
						}
						
						
					
						// 리뷰 작성하는 함수 
						function enrollReview(num){
							
							let value = document.getElementById("snow").innerText;
							
							location.href="enrollReview.pull?pno="+num +"&body="+ value;
							
							
						}
							
							
					
						// 풀리퀘 제목 수정하는 함수
						function updateTitle(){

							let span1 = document.getElementById("title");
							let span2 = document.getElementById("btn");
							let input = document.createElement("input");
							let btn1 = document.createElement("button");
							let btn2 = document.createElement("button");


							input.type = "text";
							input.value = "${pull.title}";
							input.style.width = "800px"; 
							input.id="updatePullTitle";

							// 찐 수정하는 버튼
							btn1.type ="button";
							btn1.innerHTML ="submit";
							btn1.className ="btn btn-primary";
							btn1.id ="submitBtn";
							
							// 그냥 onclick을 사용하면 동적으로 생긴 버튼의 동작이 잘 안됨....
							 btn1.addEventListener("click", function() {
							        updatePullTitle(${pull.fullRequestNum}, input.value);
							    });


							// 수정 취소하는 버튼
							btn2.type="button";
							btn2.innerHTML ="cancle";
							btn2.className ="btn btn-light-secondary";
							btn2.id ="cancle";
							btn2.style = "margin-left:10px;";
							 btn2.addEventListener("click", function() {
							       cancle('${pull.title}');
							    });

							span1.innerHTML = ''; // span 요소의 내용을 비웁니다.
    						span1.appendChild(input);

							span2.innerHTML = '';
							span2.appendChild(btn1);
							span2.appendChild(btn2);


						}
					
						
						// 풀리퀘스트 제목을 수정하는 함수
						function updatePullTitle(num, value){

							//let value = document.getElementById("updatePullTitle").value;

							location.href = "updatePullTitle.pull?pno=" + num + "&title=" + value;

						}
						
						
						// 풀리퀘 내용 수정하는 함수
						function updateRealPullBody(num,value){
							console.log("넘어옴?")
							
							//let value = document.getElementById("exampleFormControlTextarea1").innerHTML;
							
							location.href = "updatePullBody.pull?pno=" + num +"&body="+ value;
						}
						
						
						
						// 풀리퀘 내용 수정하는 버튼을 눌렀을 경우
						function updatePullBody(){
							
							let div = document.getElementById("btn3");
							let btn3 = document.createElement("button");
							let btn4 = document.createElement("button");


							let body = document.getElementById("exampleFormControlTextarea1");
							
   							 body.removeAttribute("readonly");
							 body.focus();
							 
							 div.appendChild(btn3);
							 div.appendChild(btn4);
							 
							 
							 
							 // 찐 수정하는 버튼
							btn3.type ="button";
							btn3.innerHTML ="submit";
							btn3.className ="btn btn-primary";
							btn3.style =" margin-top:10px;"
							btn3.id ="submitBtn1";
							// 그냥 onclick을 사용하면 동적으로 생긴 버튼의 동작이 잘 안됨....
							btn3.addEventListener("click", function() {
								console.log("왜 안탐?")
								updateRealPullBody(${pull.fullRequestNum},body.value);
								
								
								
							});



							// 수정 취소하는 버튼
							btn4.type="button";
							btn4.innerHTML ="cancle";
							btn4.className ="btn btn-light-secondary";
							btn4.id ="cancle1";
							btn4.style = "margin-left:10px; margin-top:10px;";
							btn4.addEventListener("click", function() {
								body.setAttribute("readonly", true);
								div.innerHTML = '';
								body.style ="resize:none;"
							    
							});


							
						}
						
						
						
						// 제목 수정 취소하는 함수
						
						function cancle(value){
							let span1 = document.getElementById("title");
							let span2 = document.getElementById("btn");
							let btn = document.createElement("button");
							
							
							span1.innerText = "${pull.title }";
							
							span2.innerText='';
							
							btn.className = "btn btn-primary";
							btn.innerHTML = "Update Title";
							btn.addEventListener("click",function(){
								updateTitle();
							})
							
							span2.appendChild(btn);
							
						}
						

						
						// 리뷰 수정하는 함수
						function updateReview(num,id){
							
							
							
							let value = document.getElementById(id).value;
							
							// 아아
							//console.log(value + " 과연 " + id);

							location.href="updatePullReview.pull?pno="+num+"&body="+value+"&reviewId="+id;
							
							
							
						}
						
                	   
						
						
						
					
					</script>		
							
							
							
							
							
							
							
								
			       
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