<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
                            			
                            			let value = "";
                            			for(let i in list){
                            				value += "<br>"
                            					   + "<div class='recent-message d-flex px-4 py-3'>"
                            					   + "<div class='avatar avatar-lg'>"
                            					   + "<img src='" + list[i].profile + "'>"
                            					   + "</div>"
                            					   + "<div class='name ms-4'>"
                            					   + "<h5 class='mb-1'>" + list[i].gitNick + "</h5>"
                            					   + "<h6 class='text-muted mb-0'>@베스트프렌드!!</h6>"
                            					   + "</div></div>";
                            			}	
                            			
                            			$("#Friends").html(value);
                            			
                            		},
                            		error:function(){
                            			console.log("친구 ajax 통신 실패");
                            		}
                            	})
                            }
                            </script>
                            
                            
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
            </div>
        </div>
    </div>
    
    
</body>
</html>