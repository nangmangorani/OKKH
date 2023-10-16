<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write Project</title>
    
    
    
  


 
<!--여기 두개는 quill을 위한 거라 지우면 안됨-->
  <link rel="stylesheet" href="resources/vendors/quill/quill.bubble.css">
  <link rel="stylesheet" href="resources/vendors/quill/quill.snow.css">

<!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>


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


   <script src="resources/assets/static/js/initTheme.js"></script>
    
    
    
    <div id="app">
    
       <!-- 사이드바 시작 -->
        <jsp:include page="../common/leftSide.jsp"></jsp:include>
        <!-- 사이드바 끝 -->

        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"></jsp:include>
            <!-- 상단바 끝 -->
            

<div class="page-content"> 
    <section class="row">

        <!-- 프로젝트 모집 작성하기 -->
        <div class="col-12 col-lg-9">
            
           

            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                          
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="UJ-WriteHeader">
                                        <button>1</button>
                                        <span>프로젝트 기본 정보를 입력해주세요</span>
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form">
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">모집 인원</label>
                                                    <!-- <input type="text" id="first-name-column" class="form-control"
                                                        placeholder="모집 인원을 숫자로 입력해주세요 (ex 3)" name="peoNo"> -->
                                                      

                                                        <select class="form-select" id="peopleNo">
                                                            <option value="0">인원 미정</option>
                                                            <option value="1">1명</option>
                                                            <option value="2">2명</option>
                                                            <option value="3">3명</option>
                                                            <option value="4">4명</option>
                                                            <option value="5">5명</option>
                                                            <option value="6">6명</option>
                                                            <option value="7">7명</option>
                                                            <option value="8">8명</option>
                                                            <option value="9">9명</option>
                                                            <option value="10">10명 이상</option> 
                                                        </select>

                                               
                                                    </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column">진행 기간</label>
                                                    <!-- <input type="text" id="last-name-column" class="form-control"
                                                        placeholder="기간 미정 ~ 6개월 이상" name="period"> -->

                                                        <select class="form-select" id="basicSelect">
                                                            <option value="10">기간 미정</option>
                                                            <option value="11">1개월</option>
                                                            <option value="12">2개월</option>
                                                            <option value="13">3개월</option>
                                                            <option value="14">4개월</option>
                                                            <option value="15">5개월</option>
                                                            <option value="16">6개월 이상</option>
                                                           
                                                        </select>




                                                </div>
                                            </div>

                                         
                                            <div class="col-md-6 col-12">
                                               
                                                    <div class="form-group">
                                                        
                                                        <label for="company-column">모집 포지션</label>
                                                        <select class="choices form-select multiple-remove" multiple="multiple" >
                                                            
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
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">모집 마감일</label>
                                                    <input type="date" id="country-floating" class="form-control"
                                                        name="endDate" >
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
                                             
                                            
                                            

                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating"> 프로젝트 시작예정일</label>
                                                    <input type="date" id="country-floating" class="form-control"
                                                        name="startDate" >
                                                </div>
                                            </div>
                                            <div class="form-group col-12">
                                              
                                            </div>
                                           
                                            <br><br>
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                <button>2</button>
                                                <span>프로젝트에 대해 소개해주세요</span>
                                                <hr >
                                            </div>

                                            <span>제목</span>
                                             <br>
                                            <input type="text" id="company-column" class="form-control"
                                                name="proTitle" placeholder="프로젝트 제목을 입력해주세요" style="width: 1100px; margin-left: 10px;" >
                                                
                                               
                                            <!-- 프로젝트 내용 -->

                                            <div class="card">
                                                <br>
                                                    <div id="snow" name="proContent"   style="height: 200px;">
                                                        
                                                      프로젝트 내용~~
                                    
                                                    </div>
                                                </div>
                                            </div>


                                           <!-- 제출하기 버튼 -->
                                            <div class="col-12 d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary me-1 mb-1">작성하기</button>
                                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">초기화</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


			<!-- 여기는 삭제하면 안됨 -->
            <script src="resources/assets/extensions/quill/quill.min.js"></script>
            <script src="resources/assets/static/js/pages/quill.js"></script> 
            
            <script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                
                
           
                

            <!--여기 두개가 다중 select박스인듯-->    
            <script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
            <script src="resources/assets/static/js/pages/form-element-select.js"></script>



        </div>


       <footer>
    <div class="footer clearfix mb-0 text-muted">
        <div class="float-start">
          <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
        <div class="float-end">
            <p>Crafted with <span class="text-danger"><i class="bi bi-heart-fill icon-mid"></i></span>
                by <a href="https://saugi.me">Hobbang</a></p>
        </div>
    </div>
</footer>
        </div>
    </div>
    <script src="resources/assets/static/js/components/dark.js"></script>
    <script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    
 
    

    
<!-- Need: Apexcharts -->

<script src="resources/vendors/quill/quill.min.js"></script>




</body>
</html>