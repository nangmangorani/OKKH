<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
	#friendList{
		font-weight:bolder;
		font-size: 20px;
		color: black;
	}
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
                        <!-- 친구, 팀원 목록 시작 -->
                        <div class="tab-content" id="myTabContent">
                        	<!-- 친구 목록 시작 -->
                            <div class="tab-pane fade show active" id="Friends" role="tabpanel" aria-labelledby="Friends-tab">
                                <div style="margin:auto;">
                                    		<i class="fa-solid fa-lock fa-beat fa-2xl" style="margin:120px;"></i>
                                </div>
                            </div>
                            
                            <script>
                            $(function(){
                            	if(${not empty loginMember}){
									myBfList();
                            	}
							})
							
							function myBfList(){
                            	$.ajax({
                            		url:"mainListFriend.fri",
    				  				data:{
                            			memNo : ${loginMember.memNo}
                            		},
                            		success:function(list){
                            			console.log(list)
                            			let value = "";
                            			if (list.length == 0){
                            				value = "<br><br><div style='margin:30px'><a id='friendList' href='friendList.f'>친구를 사귀어보세요!!</a></div>"
                            				$("#Friends").html(value);
                            				
                            			} else {
                            				for(let i in list){
                                   				value += "<br>"
                                   					   + "<div class='recent-message d-flex px-4 py-3'>"
                                   					   + "<div class='avatar avatar-lg'>"
                                   					   + "<img src='" + list[i].avatarUrl + "'>"
                                   					   + "</div>"
                                   					   + "<div class='name ms-4'>"
                                   					   + "<h5 class='mb-1'>" + list[i].gitNick + "</h5>"
                                   					   + "<h6 class='text-muted mb-0'>@베스트프렌드!!</h6>"
                                   					   + "</div></div>";
                                   			}
                               				
                               				$("#Friends").html(value);
                            			}
                            			
                           			},
                            		error:function(){
                            			console.log("메인 친구 ajax 실패요")
                            			
                            		}
                            	})
                            }
                            </script>
                            
                            
                            <div class="tab-pane fade" id="TeamMates" role="tabpanel" aria-labelledby="TeamMates-tab">
                                <!-- 팀원 보여주는 자리 -->
                                <!--  
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
                                -->
                            </div>
                            <!-- /팀원 목록 끝 -->
                            
                            <script>
                            
                            	$(() => {
                            		
                            		$.ajax({
                            			
                            			url:"selectTeamMateList.re",
                            			success:(list) => {
                            				console.log(list);
                            				
                            				value = "<br>";
                            				
                            				if(list.length == 0) {
                            					
                            					value += "팀원이 없습니다.";
                            					
                            				}
                            				else {
                            					
	                            				for(let i in list) {
	                        						
	                        						value += "<div class='recent-message d-flex px-4 py-3'>"
	                            								+ "<div class='avatar avatar-lg'>"
		                            								+ "<img src='" + list[i].profile + "'>"
		                            								+ "<span class='avatar-status bg-success'></span>"
	                        									+ "</div>"
	                            								+ "<div class='name ms-4'>"
		                            								+ "<h5 class='mb-1'>" + list[i].gitNick + "</h5>"
		                            								+ "<h6 class='text-muted mb-0'>Member</h6>"
	                            								+ "</div>"
	                        								+ "</div>"
	                        						
	                        					}
                            				
                            				}
                            				
                            				
                            				$("#TeamMates").html(value);
                            				
                            			},
                            			error:(exeption) => {
                            				console.log(exeption);
                            				
                            				$("#TeamMates").html("<br>" + exeption.responseText);
                            			}
                            			
                            		})
                            		
                            	})
                            	
                            </script>
                            
                        </div>
                        <!-- /친구, 팀원 목록 끝 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
</body>
</html>