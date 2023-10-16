<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<!-- 글 작성할 때 필요해서 지우면 안됨 -->
	<link rel="stylesheet" href="resources/assets/extensions/quill/quill.snow.css">
	<link rel="stylesheet" href="resources/assets/extensions/quill/quill.bubble.css">


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
       
            
<div class="page-heading">
    <h3>Update Project</h3>
</div> 
<div class="page-content"> 
    <section class="row">

        <!-- 프로젝트 수정 작성하기 -->
        <div class="col-12 col-lg-9">
            
           

            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                          
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="UJ-WriteHeader">
                                        <button>1</button>
                                        <span>수정할 프로젝트 기본 정보를 입력해주세요</span>
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form">
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">모집 인원</label>
                                                    <!-- <input type="text" id="first-name-column" class="form-control"
                                                         name="peoNo" value="5명"> -->

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
                                                        value="2개월" name="period"> -->

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
                                                    <label for="city-column">기술 스택</label>
                                                    <input type="text" id="city-column" class="form-control" value="자바, 스프링"
                                                        name="tech-stack">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">모집 마감일</label>
                                                    <input type="date" id="country-floating" class="form-control"
                                                        name="endDate" value="2023-10-10">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="company-column">모집 포지션</label>
                                                    <input type="text" id="company-column" class="form-control"
                                                        name="position"value="백엔드...">
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating"> 프로젝트 시작예정일</label>
                                                    <input type="date" id="country-floating" class="form-control"
                                                        name="startDate"  value="2023-10-20">
                                                </div>
                                            </div>
                                            
                                            <div class="form-group col-12">
                                              
                                            </div>
                                           
                                            <br><br>
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                <button>2</button>
                                                <span>수정할 프로젝트 내용을 작성해주세요</span>
                                                <hr >
                                            </div>

                                            <span>제목</span>
                                             <br>
                                            <input type="text" id="company-column" class="form-control"
                                                name="proTitle" value="[백엔드] 한달살기 플랫폼 - 창업 멤버!!" style="width: 1100px; margin-left: 10px;" >
                                                
                                               
                                            <!-- 프로젝트 내용 -->

                                            <div class="card">
                                                <br>
                                                    <div id="snow" name="proContent" style="height: 200px;">
                                                        
                                                      저랑 함께 창업하실 분?
                                    
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
            </section>

		<!-- 글 작성위해 필요함 지우면 안됨 -->
            <script src="resources/assets/extensions/quill/quill.min.js"></script>
            <script src="resources/assets/static/js/pages/quill.js"></script> 

        </div>


        <!-- <div class="col-12 col-lg-3">
            <div class="card">
                <div class="card-body py-4 px-4">
                    <div class="d-flex align-items-center">
                        <div class="avatar avatar-xl">
                            <img src="./assets/compiled/jpg/1.jpg" alt="Face 1">
                        </div>
                        <div class="ms-3 name">
                            <h5 class="font-bold">HoBBang</h5>
                            <h6 class="text-muted mb-0">@Hobbang1004</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h4>Recent Messages</h4>
                </div>
                <div class="card-content pb-4">
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="./assets/compiled/jpg/4.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">NangMan고라니</h5>
                            <h6 class="text-muted mb-0">@johnducky</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="./assets/compiled/jpg/5.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">Mokee</h5>
                            <h6 class="text-muted mb-0">@imdean</h6>
                        </div>
                    </div>
                    <div class="recent-message d-flex px-4 py-3">
                        <div class="avatar avatar-lg">
                            <img src="./assets/compiled/jpg/1.jpg">
                        </div>
                        <div class="name ms-4">
                            <h5 class="mb-1">Hyun22</h5>
                            <h6 class="text-muted mb-0">@dodoljohn</h6>
                        </div>
                    </div>
                    <div class="px-4">
                        <button class='btn btn-block btn-xl btn-outline-primary font-bold mt-3'>Start Conversation</button>
                    </div>
                </div>
            </div> 
            
        </div>
    </section>
</div> -->

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
   
    
    
</body>
</html>