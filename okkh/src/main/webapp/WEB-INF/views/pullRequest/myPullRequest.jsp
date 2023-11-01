<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>
<!-- 풀리퀘스트 css -->
<link rel="stylesheet" href="resources/okkh/pullRequest.css">
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
						<!-- 레파지 추가 버튼 시작 -->
	                   	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right;">
	                    	New PullRequest
	                	</button>
	                	
	                	
	                	<!-- /레파지 추가 버튼 끝 -->
					</div>
					<!-- /이슈, 마일스톤, 풀리퀘 버튼 끝 -->
					
					<!-- 풀리퀘 추가 form Modal 시작 -->
	                <div class="modal fade text-left" id="inlineForm" tabindex="-1"
	                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
	                        role="document">
	                        <div class="modal-content">
	                            <div class="modal-header bg-primary">
	                                <h5 class="modal-title white" id="myModalLabel160">
	                                    New PullRequest
	                                </h5>
	                                <button type="button" class="close"
	                                    data-bs-dismiss="modal" aria-label="Close">
	                                    <i data-feather="x"></i>
	                                </button>
	                            </div>
	                            <form action="insertRepo.re">
	                                <div class="modal-body">
	                                    <label>Title:</label>
	                                    <div class="form-group">
	                                        <input type="text" placeholder="제목을 입력해주세요."
	                                            class="form-control">
	                                    </div>
	                                    <label>Content:</label>
	                                    <div class="form-group">
	                                        <input type="text" placeholder="내용을 작성해주세요."
	                                            class="form-control">
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
	                                        <span class="d-none d-sm-block">Comment</span>
	                                    </button>
	                                </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	                <!--/풀리퀘 추가 form Modal 끝 -->
					
                    <!-- 풀리퀘스트 table start -->
				    <section class="section">
				        <div class="row" id="table-bordered">
				            <div class="col-12">
				                <div class="card">
					                <!-- nav바 시작 -->
					                <div class="card-body">
					                	<!-- open or close 선택창 시작 -->
				                        <ul class="nav nav-tabs" id="myTab" role="tablist">
				                        	<!-- open -->
				                            <li class="nav-item" role="presentation">
				                                <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab"
				                                    aria-controls="home" aria-selected="true"><i class="fa-solid fa-circle-notch" style="color: #0521f5;"></i> Open(2)</a>
				                            </li>
				                            <!-- /open -->
				                            <!-- close -->
				                            <li class="nav-item" role="presentation">
				                                <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile" role="tab"
				                                    aria-controls="profile" aria-selected="false"><i class="fa-solid fa-check" style="color: #f50535;"></i> Close(3)</a>
				                            </li>
				                            <!-- /close -->
				                        </ul>
				                        <!-- /open or close 선택창 끝 -->
				                        <!-- 선택창에 해당하는 테이블 시작 -->
				                        <div class="tab-content" id="myTabContent">
				                        	<!-- open 테이블 -->
				                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					                            <table class="table table-bordered mb-0" id="pullListTable">
					                                <thead>
					                                    <tr>
					                                    	<th>
						                                        <div class="checkbox">
						                                            <input type="checkbox" id="checkbox1" class="form-check-input">
						                                            <label for="checkbox1">TITLE</label>
						                                        </div>
					                                    	</th>
					                                        <th>AUTHOR</th>
					                                        <th>LABEL</th>
					                                        <th>MILESTONE</th>
					                                        <th>REVIEW</th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                           <c:choose> 
					                           		<c:when test="${not empty plist}">  
					                           		    
		                           		       		     <c:forEach var="pull" items="${plist }"> 
					                           		    
					                           		          <c:if test="${pull.state eq 'open' }">
					                           		             
													                <tr onclick="pullDetail(${pull.number });">
										                                 <td class='text-bold-500'>
											                                 <div class='checkbox'>
											                                 
											                                  <input type='checkbox' id='checkbox1' class='form-check-input'>
											                                 <label for='checkbox1'>${pull.title} </label>
											                                 </div>
										                                  </td>
										                                  <td>
											                                  <img src='${pull.profile}' height="30" width="30" style="border-radius: 15px;">
											                                  <span> ${pull.user } </span>   
																		  </td>
																		  
																		  <!-- 라벨.... 있는지 없는지 확인하기 -->
																		  <c:choose>
																		  	<c:when test="${not empty pull.labels }">
										                                  		<td class='text-bold-500'> ${pull.labels } </td>
																		  	
																		  	</c:when>
																		  	
																		  	<c:otherwise>
																		  	  <td class='text-bold-500'> labels null... </td>
																		  	</c:otherwise>
																		  </c:choose>
										                                  
										                                  
										                                  <!-- 마일스톤.... 있는지 없는지 확인하기 -->
										                                  
										                                  <c:choose>
																		  	<c:when test="${not empty pull.milestone }">
										                                  		<td class='text-bold-500'> ${pull.milestone } </td>
																		  	</c:when>
																		  	
																		  	<c:otherwise>
																		  	  <td class='text-bold-500'> milestone null... </td>
																		  	</c:otherwise>
																		  </c:choose>
										                                
										                                
										                                  <td><i class='fa-regular fa-comment'></i> 3 </td>
								                                    </tr>
								                                   
							                                    </c:if>
							                                    
					                                     </c:forEach>
					                                    </c:when> 
					                                
					                                <c:otherwise>
					                                <!--여긴 생성된 풀리퀘가 없을 때 -->
					                                	<tr>
					                                		<td colspan="5"><h5 style="">아직 생성된 Pull Request가 없습니다. Pull Request를 생성해보세요! </h5> </td>
					                                	</tr>
					                                </c:otherwise>  
					                                
					                                 	
					                            </c:choose>        
					                                    
					                                </tbody>
					                            </table>
				                            </div>
				                            <!-- /open 테이블 -->
				                            <!-- close 테이블 -->
				                            
				                     
				                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				                                <table class="table table-bordered mb-0">
					                                <thead>
					                                    <tr>
					                                    	<tr>
					                                    	<th>
						                                        <div class="checkbox">
						                                            <input type="checkbox" id="checkbox1" class="form-check-input">
						                                            <label for="checkbox1">TITLE</label>
						                                        </div>
					                                    	</th>
					                                        <th>AUTHOR</th>
					                                        <th>LABEL</th>
					                                        <th>MILESTONE</th>
					                                        <th>REVIEW</th>
					                                    </tr>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    
					                                    
					                       <!-- 여기는 state가 close인 풀리퀘를 조회하는 곳!! -->
		                                      <c:choose> 
					                           		<c:when test="${not empty plist}">  
					                           		    
		                           		       		     <c:forEach var="pull" items="${plist }"> 
					                           		    
					                           		          <c:if test="${pull.state eq 'closed' }">
					                           		             
													                <tr onclick="pullDetail(${pull.number });">
										                                 <td class='text-bold-500'>
											                                 <div class='checkbox' style="margin-left:20px;">
											                                 
											                                  <input type='checkbox' id='checkbox1' class='form-check-input'>
											                                 <label for='checkbox1' >${pull.title} </label>
											                                 </div>
										                                  </td>
										                                  <td>
											                                  <img src='${pull.profile}' height="30" width="30" style="border-radius: 15px;">
											                                  <span> ${pull.user } </span>   
																		  </td>
																		  
																		  <!-- 라벨.... 있는지 없는지 확인하기 -->
																		  <c:choose>
																		  	<c:when test="${not empty pull.labels }">
										                                  		<td class='text-bold-500'> ${pull.labels } </td>
																		  	
																		  	</c:when>
																		  	
																		  	<c:otherwise>
																		  	  <td class='text-bold-500'> labels null... </td>
																		  	</c:otherwise>
																		  </c:choose>
										                                  
										                                  
										                                  <!-- 마일스톤.... 있는지 없는지 확인하기 -->
										                                  
										                                  <c:choose>
																		  	<c:when test="${not empty pull.milestone }">
										                                  		<td class='text-bold-500'> ${pull.milestone } </td>
																		  	</c:when>
																		  	
																		  	<c:otherwise>
																		  	  <td class='text-bold-500'> milestone null... </td>
																		  	</c:otherwise>
																		  </c:choose>
										                                
										                                
										                                  <td><i class='fa-regular fa-comment'></i> 3 </td>
								                                    </tr>
								                                   
							                                    </c:if>
							                                    
					                                     </c:forEach>
					                                    </c:when> 
					                                
					                                <c:otherwise>
					                                <!--여긴 생성된 풀리퀘가 없을 때 -->
					                                	<tr>
					                                		<td colspan="5"><h5 style="">아직 생성된 Pull Request가 없습니다. Pull Request를 생성해보세요! </h5> </td>
					                                	</tr>
					                                </c:otherwise>  
					                                
					                                 	
					                            </c:choose>        
					                                    
					                                </tbody>
					                            </table>
				                            </div>
				                         
				                            <!-- /close 테이블 -->
				                        </div>
				                        <!-- /선택창에 해당하는 테이블 끝 -->
				                    </div>
            					    <!-- /nav바 끝 -->
				                    
				                </div>
				            </div>
				        </div>
				    </section>
				    <!-- /풀리퀘스트 table end -->
                    <!-- /왼쪽 내용 끝 -->

                </section>
            </div>
            <!-- /내용 끝 -->
            
            
            
            <script>
            /*
               $(function(){
            	   selectPullRequest();
               })
            
            
            	function selectPullRequest(){
            		
            		$.ajax({
            			url:"selectPullRequest.pull",
            			success:function(data){
            				
            				//const pullList = JSON.stringify(data, null, 2)
            				// 2는 들여쓰기 개수
            				
            				//console.log(pullList[5] + " 받아온 풀리퀘닷!!!!!!!!!!!!!!!!")
            				let value = "";
            				data.forEach(function(item){
            					
            				
            				value += "<tr>"
                                  + "<td class='text-bold-500'>"
                                  +	"<div class='checkbox'>"
                                  + "<input type='checkbox' id='checkbox1' class='form-check-input'>
                                  + "<label for='checkbox1'>" +  item.title + "</label>"
                                  + "</div>"
                                  + "</td>"
                                  + "<td>" 
                                  +"<img src='"+ item.user.avatar_url +"'>"
                                  + "<span>" + item.user.login  + "</span>"   
								  + "</td>"
                                  + "<td class='text-bold-500'> item.labels </td>"
                                  + "<td>item.milestone </td>"
                                  + "<td><i class='fa-regular fa-comment'></i>"+ 3 + "</td>"
                                  + "</tr>" 	
            					
            					
            				})
            				
            				
            				$("#pullListTable tbody").html(value);
            				
            				
            				
            				
            				
            				
            				
            			},
            			error:function(){
            				console.log("풀리퀘스트 리스트 조회용 아작스 실패ㅠㅠㅠ")
            			}
            		
            		})
            		
            	}	
            
            	
               
               $("#selectPull").click(function(){
            	   selectPullRequest();
               })
            	
            */
            </script>
            
            
            
            
            
            
            
            
            
            
            
            

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
	
	<!-- 풀리퀘스트 js -->
	<script>
	
		$(() => {
			
			$("#myTabContent tbody>tr").click(() => {
				
				location.href = "pullRequestDetail.pu?pno=1";
				
			});
			
		})
	
	</script>
</body>

</html>