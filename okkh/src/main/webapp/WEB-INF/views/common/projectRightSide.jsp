<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
    
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>

            <style>
                /*
	.list-group-item>div{
		float:left;
	}
	
	.upDiv{
		width:60%;
		height:100%;
	}
	
	.downDiv{
		width:40%;
		height:100%;
	}

    */
            </style>

        </head>

        <body>

            <div class="col-12 col-lg-3"  >
                <div class="row">
                    <div class="col-md-15">
                        <div class="card" style="padding-left: 35px;">
                            <div class="card-body">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <!-- 친구 -->
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="Friends-tab" data-bs-toggle="tab" href="#Friends" role="tab"
                                            aria-controls="Friends" aria-selected="true" style="width: 125px; text-align: center;">Friends</a>
                                    </li>
        
                                    <!-- 팀원 -->
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" id="TeamMates-tab" data-bs-toggle="tab" href="#TeamMates" role="tab"
                                            aria-controls="TeamMates" aria-selected="true" style="width: 125px; text-align: center;">TeamMates</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="Friends" role="tabpanel" aria-labelledby="Friends-tab">
                                        <br>
                                        <div class="recent-message d-flex px-4 py-3">
                                            <div class="avatar avatar-lg">
                                                <img src="resources/compiled/jpg/4.jpg">
                                                <span class="avatar-status bg-success"></span>
                                            </div>
                                            <div class="name ms-4">
                                                <h5 class="mb-1">Hank Schrader</h5>
                                                <h6 class="text-muted mb-0">@johnducky</h6>
                                            </div>
                                        </div>
                                        <div class="recent-message d-flex px-4 py-3">
                                            <div class="avatar avatar-lg">
                                                <img src="resources/compiled/jpg/5.jpg">
                                                <span class="avatar-status bg-danger"></span>
                                            </div>
                                            <div class="name ms-4">
                                                <h5 class="mb-1">Dean Winchester</h5>
                                                <h6 class="text-muted mb-0">@imdean</h6>
                                            </div>
                                        </div>
                                        <div class="recent-message d-flex px-4 py-3">
                                            <div class="avatar avatar-lg">
                                                <img src="resources/compiled/jpg/1.jpg">
                                                <span class="avatar-status bg-success"></span>
                                            </div>
                                            <div class="name ms-4">
                                                <h5 class="mb-1">John Dodol</h5>
                                                <h6 class="text-muted mb-0">@dodoljohn</h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="TeamMates" role="tabpanel" aria-labelledby="TeamMates-tab">
                                        <br>
                                        <div class="recent-message d-flex px-4 py-3">
                                            <div class="avatar avatar-lg">
                                                <img src="resources/compiled/jpg/4.jpg">
                                                <span class="avatar-status bg-success"></span>
                                            </div>
                                            <div class="name ms-4">
                                                <h5 class="mb-1">Hank Schrader</h5>
                                                <h6 class="text-muted mb-0">@johnducky</h6>
                                            </div>
                                        </div>
                                        <div class="recent-message d-flex px-4 py-3">
                                            <div class="avatar avatar-lg">
                                                <img src="resources/compiled/jpg/5.jpg">
                                                <span class="avatar-status bg-danger"></span>
                                            </div>
                                            <div class="name ms-4">
                                                <h5 class="mb-1">Dean Winchester</h5>
                                                <h6 class="text-muted mb-0">@imdean</h6>
                                            </div>
                                        </div>
                                        <div class="recent-message d-flex px-4 py-3">
                                            <div class="avatar avatar-lg">
                                                <img src="resources/compiled/jpg/1.jpg">
                                                <span class="avatar-status bg-success"></span>
                                            </div>
                                            <div class="name ms-4">
                                                <h5 class="mb-1">John Dodol</h5>
                                                <h6 class="text-muted mb-0">@dodoljohn</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <br><br><br><br><br>
                    </div>
               
            
            


            <!-- 여기가 바로 프로젝트 참여한 회원들 목록 보여주는 곳!! -->
            <!-- 여기는 무조건 프로젝트 게시글 작성자만 보임!! -->
            <!-- 체크박스로 추가할 회원 선택해서 db에 업데이트 치기 -->
            
            
		<c:if test="${loginMember.memNo eq projectSession.memNo  }">
            <div class="col-lg-6 col-md-12" style="width: 100%;">


                <div class="card">

                    <div class="card-content">
                        <div class="card-body">
                            <h4 align="center">팀원 추가</h4>
                          
                         
		                            <p>
		                                프로젝트에 추가할 팀원을 선택한 후 하단에 '팀원 추가하기' 버튼을 눌러주세요! <br>
		                                (체크가 된 회원은 프로젝트 팀원입니다)
		                            </p>
		                            
		                      
                            <br>


                            <form action="#">

                                <!-- 반복문 돌릴거임 -->
                                <ul class="list-group">
							
                                    <!-- 프로젝트 상세페이지에서 세션에 담아온 teamList의 for문 돌릴거임 -->
                                    
                                 <c:choose >
	                                 	<c:when test="${not empty teamList }">
	                                
			                                   <c:forEach var="team" items="${teamList }">
			                                        <c:if test="${team.team eq projectSession.proNo }">
					                                    <li class="list-group-item">
					
					                                        <div class="upDiv">
					                                          <c:choose>
					                                          	<c:when test="${team.teamStatus eq 'Y' }">
						                                          	 <input  class="form-check-input me-1" type="checkbox"
						                                                name="memNo"    value="${team.memNo }" checked>
								
						                                            <label for="checkbox-2">${team.gitNick} </label>
						                                             <a style="float: right; "
						                                                class="btn btn-sm btn-light-primary" href="#">PR 보러가기</a>
					                                          	
					                                          	</c:when>
					                                          	
					                                          	<c:otherwise>
						                                          	<input  class="form-check-input me-1" type="checkbox"
						                                                name="memNo"    value="${team.memNo }">
								
						                                            <label for="checkbox-2">${team.gitNick} </label>
						
						                                            <a style="float: right; "
						                                                class="btn btn-sm btn-light-primary" href="#">PR 보러가기</a>
						
					                                          	</c:otherwise>
					                                          	
					                                          	
					                                          </c:choose>
					                                            
					
					                                        </div>
					
					
					                                    </li>
					                                    
													</c:if>			
												</c:forEach>
										</c:when>
										
										<c:otherwise>
											 <li class="list-group-item">
											 	프로젝트에 참여를 희망하는 회원이 아직 없습니다.
											 </li>
										</c:otherwise>										
										
					
									
							  </c:choose>   
                                    
                                </ul>

                                <br>
                            	
							
	                        
										<c:if test="${not empty teamList }">
		                             	
			                                <div align="center">
			                                    <button type="button" class="btn btn-primary" id="enrollTeamMate">팀원 추가하기</button>
			
			                                </div>
			                            </c:if>  
			                                
		                                
                            </form>
                            
                            
                            <script>
                             
                            	
                                
                            	 // 팀원 추가하기 버튼을 눌렀을 경우 실행할 함수	
                            	 
                            	 /*
                            	 // 이렇게 작성하니까 체크해제해도 계속 db에는 team_status가 Y임....
                                $("#enrollTeamMate").click(function(){   
		                            	$("input[name='memNo']:checked").each(function(){
		                            		
		                                        checkbox.push($(this).val());
		
		                            	});
		
		                                // 중복값 제거 (filter이용 i는 index값 v는 찐 값)
		                                // checkbox의 i번째 인덱스의 값이 v랑 같을 때? 걸러라 의미
		                                let check = checkbox.filter((i,v) => checkbox.indexOf(i) === v);
		                            	
		                               //console.log(check + "과연될까아아앙")
		                                
		                        */
		                        
		                        // 체크된 회원만 team_status를 y로 하고 체크해지되면 n으로 하기
		                        $("#enrollTeamMate").click(function () {
		                            
		                        	var checkbox = [];
		                        	var checkedMembers = [];
		                            var uncheckedMembers = [];

		                            $("input[name='memNo']").each(function () {
		                                if ($(this).is(":checked")) {
		                                    checkedMembers.push($(this).val());
		                                    
		                                } else {
		                                    uncheckedMembers.push($(this).val());
		                                }
		                            })
		                            
		                            // console.log(checkedMembers  + "체크체크");
		                           // console.log( uncheckedMembers + "   노체크");
		                            
		                              
		                           
		                           
		                           
		                                
		                                $.ajax({
	                            			url:"enrollTeamMate.pro",
	                            			data:{
	                            				checkedMembers: checkedMembers,
	                            	            uncheckedMembers: uncheckedMembers
	                            			},
	                            			success:function(data){
	                            				if(data=="success"){
	                            					alertify.alert("프로젝트 회원 상태 변경을 성공했습니다!")
	                            					
	                            					// 상태 변경 성공하면 회원들에게 실시간 알람가게 하기 -> 그냥 안할래...ㅠㅠ
	                            					/*
													if (${ loginMember.memNo ne projectSession.memNo }) {

														// 만약 게시글 작성자와 현재 로그인한 회원의 번호가 다르다면?
														if (socket.readyState == 1) {
															// 소켓
															// 메세지 보낼 때 , 무조건 포함시키고 String형은 무조건 ""안에다가 작성하기 
															let socketMsg = "updateTeamStatus" + "," + ${ loginMember.memNo }+"," + ${ projectSession.memNo } +"," + ${ projectSession.proNo } +",${projectSession.proTitle},${loginMember.gitNick}," + ${ loginMember.team } + ", 팀원 상태를 변경했습니다!";
															console.log(socketMsg);
															socket.send(socketMsg);  // 찐으로 소켓에게 메시지 보내기
														}
													}
	                            					*/
	                            					
	                            					
	                            					
	                            					
	                            				}else{
	                            					alertify.alert("프로젝트 회원 상태 변경을 실패했습니다ㅠㅠ")
	                            				}
	                            			},
	                            			error:function(){
	                            				console.log("프로젝트 팀원 추가용 ajax실패ㅠㅠ")
	                            			}
	                            		})
		
		                            
		
		                                })
		                                
		                                
		                                
		                    
		                     
		                    	  
		                      
		                                
		                                
		                                
		                                
                           
                            </script>
                            
                        </div>
                    </div>
                </div>
            </div>
           </c:if>
           
           
           
        </div>  <!-- 전체 감싸는 div 끝 -->






        </body>

        </html>