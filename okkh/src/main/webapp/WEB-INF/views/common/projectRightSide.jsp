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

    <div class="col-12 col-lg-3">
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
            </div>
        </div>
        
        <br><br><br>
        
        
        
      <!-- 여기가 바로 프로젝트 참여한 회원들 목록 보여주는 곳!! -->
      <!-- 체크박스로 추가할 회원 선택해서 db에 업데이트 치기 -->
        
              <div class="col-lg-6 col-md-12" style=" width:100%;">
                <div class="card">
                   
                    <div class="card-content">
                        <div class="card-body">
                            <p>
                               프로젝트에 추가할 팀원을 선택한 후 하단에 '추가하기' 버튼을 눌러주세요!
                            </p>
                            <br>
                      
                            
                         <form action="#"  >
                         
                         <!-- 반복문 돌릴거임 -->
                            <ul class="list-group">
                               
                                <li class="list-group-item" style="border:1px solid red;">
                                	
	                                    <input id="checkbox-2" class="form-check-input me-1" type="checkbox" value="" aria-label="...">
	                                    <label for="checkbox-2" >찐빵맨</label>
                                    
                                    
                                     <button style="float:right; " class="btn btn-light-secondary">자기소개 보러가기</button>
                                    
                                
                                </li>
                                
                                
                                
                                
                                
                                
                                <li class="list-group-item">
                                    <input id="checkbox-3" class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                    <label for="checkbox-3">Morbi leo risus</label>
                                </li>
                                <li class="list-group-item">
                                    <input id="checkbox-4" class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                    <label for="checkbox-4">Porta ac consectetur ac</label>
                                </li>
                                <li class="list-group-item">
                                    <input id="checkbox-5" class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                    <label for="checkbox-5">Vestibulum at eros</label>
                                </li>
                                <li class="list-group-item">
                                    <input id="checkbox-6" class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                    <label for="checkbox-6">Vestibulum at eros</label>
                                </li>
                                <li class="list-group-item">
                                    <input id="checkbox-7" class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                                    <label for="checkbox-7">Vestibulum at eros</label>
                                </li>
                            </ul>
                            
                            <br><br>
                            <button type="submit" class="btn btn-light-primary" style="margin-left:150px">팀원 추가하기</button>
                            
                            </form>
                        </div>
                    </div>
                </div>
            </div>
             
             
          
                       
           
  
    </div>
    
    
</body>
</html>