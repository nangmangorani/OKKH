<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="resources/assets/extensions/quill/quill.snow.css">
	<link rel="stylesheet" href="resources/assets/extensions/quill/quill.bubble.css">
	
	<!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->
<link rel="stylesheet" href="resources/assets/extensions/choices.js/public/assets/styles/choices.css">
	
	
	
	<style>
    .UJ-WriteHeader>button{
        border: 0;
        border-radius: 100px;
       
        color: darkslategray;
        font-weight: 900;
        width: 30px;
        height: 30px;
    }
  </style>
  
</head>
<body>

 <div id="app">
       
       <!-- 사이드바 시작 -->
        <jsp:include page="../common/leftSide.jsp"></jsp:include>
        <!-- 사이드바 끝 -->
        
        
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"></jsp:include>
            <!-- 상단바 끝 -->
       
       <br><br>
<div class="page-heading">
    <h3>Update Personal PR</h3>
</div> 
<div class="page-content"> 
    <section class="row">

        <!-- PR 수정하기 -->
        <div class="col-12 col-lg-9">
            
           

            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                          
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="UJ-WriteHeader">
                                        <button>1</button>
                                        <span>수정할 자신의 기본 정보를 입력해주세요</span>
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form">
                                        <div class="row">
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column">프로젝트 가능 시간 (단위 기간 : 24HR)</label>
                                                    <!-- <input type="text" id="last-name-column" class="form-control"
                                                        value="2개월" name="period"> -->

                                                        <select class="form-select" id="basicSelect">
                                                            <option value="0">시간 미정</option>
                                                            <option value="1">1시간</option>
                                                            <option value="2">2시간</option>
                                                            <option value="3">3시간</option>
                                                            <option value="4">4시간</option>
                                                            <option value="5">5시간</option>
                                                            <option value="6">6시간 이상</option>

                                                           
                                                        </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                    <div class="form-group">
                                                        <label for="country-floating">기술 스택</label>
                                                        <select class="choices form-select multiple-remove" multiple="multiple">
                                                            
                                                                <option value="romboid">Romboid</option>
                                                                <option value="trapeze" >Trapeze</option>
                                                                <option value="triangle">Triangle</option>
                                                                <option value="polygon">Polygon</option>
                                                        
                                                                <option value="red">Red</option>
                                                                <option value="green">Green</option>
                                                                <option value="blue" >Blue</option>
                                                                <option value="purple">Purple</option>
                                                            
                                                        </select>
                                                    </div>
                                                 </div>
                                            
                                            <div class="form-group col-12">
                                              
                                            </div>
                                           
                                            <br><br>
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                <button>2</button>
                                                <span>수정할 자기 소개 내용을 작성해주세요</span>
                                                <hr >
                                            </div>

                                            <span>제목</span>
                                             <br>
                                            <input type="text" id="company-column" class="form-control"
                                                name="proTitle" value="성실한 대한 건아" style="width: 1100px; margin-left: 10px;" >
                                                
                                               
                                            <!-- 프로젝트 내용 -->

                                            <div class="card">
                                                <br>
                                                    <div id="snow" name="proContent" style="height: 200px;">
                                                        
                                                      아주 성실한 대한의 건아 입니다
                                    
                                                    </div>
                                                </div>
                                            </div>

                            




                                           <!-- 제출하기 버튼 -->
                                            <div class="col-12 d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary me-1 mb-1">수정하기</button>
                                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">초기화</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
              	 <!-- 친구 및 팀원 시작 -->
                  		<jsp:include page="../common/rightSide.jsp"></jsp:include>
                  <!-- 친구 및 팀원 끝 -->
                    
                    
                    
            </section>

		<!-- 글쓰기 에디터 사용할때 필요함 -->
            <script src="resources/assets/extensions/quill/quill.min.js"></script>
            <script src="resources/assets/static/js/pages/quill.js"></script> 
            
            
          <!--여기 두개가 다중 select박스인듯-->    
         <script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
         <script src="resources/assets/static/js/pages/form-element-select.js"></script>

	
        </div>

		
           

    

</body>
</html>