<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 썸머노트 에디터 위해 필요함 -->
	<link rel="stylesheet" href="resources/assets/extensions/summernote/summernote-lite.css">

  	<link rel="stylesheet" href="resources/assets/compiled/css/form-editor-summernote.css">
  	
  	
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
                                    <form class="form" action="updateProject.pro">
                                    
                                    	<input type="hidden" name="proNo" value="${p.proNo }" >
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">모집 인원</label>
                                                    <!-- <input type="text" id="first-name-column" class="form-control"
                                                         name="peoNo" value="5명"> -->

                                                         <select class="form-select" id="peopleNo" name="proMember">
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

                                                        <select class="form-select" id="basicSelect" name="proPeriod">
                                                            <option value="기간 미정">기간 미정</option>
                                                            <option value="1개월">1개월</option>
                                                            <option value="2개월">2개월</option>
                                                            <option value="3개월">3개월</option>
                                                            <option value="4개월">4개월</option>
                                                            <option value="5개월">5개월</option>
                                                            <option value="6개월 이상">6개월 이상</option>
                                                           
                                                        </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="city-column">기술 스택</label>
                                                    
                                                    
                                                    	 <select class="choices form-select multiple-remove" multiple="multiple" name="proStack" id="multiSelect" required>
                                                            
                                                               <c:forEach var="pro" items="${list }">
                                                                  <option value="${pro.stackName }">${pro.stackName}</option>
                                                            
                                                               </c:forEach>
                                                            
                                                            
                                                        </select>
                                                      
                                                        
                                                        
                                                        
                                                        
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">모집 마감일</label>
                                                    <input type="date" id="country-floating" class="form-control"
                                                        name="proDeadLine" value="${p.proDeadLine }">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="company-column">모집 포지션</label>
                                                    <select class="choices form-select multiple-remove" multiple="multiple" name="proPosition"  id="proPosition" required>
                                                            
                                                                <option value="전체">전체</option>
                                                                <option value="프론트엔드" >프론트엔드</option>
                                                                <option value="백엔드">백엔드</option>
                                                                <option value="디자이너">디자이너</option>
                                                                <option value="IOS">IOS</option>
                                                                <option value="안드로이드">안드로이드</option>
                                                                <option value="데브옵스" >데브옵스</option>
                                                                <option value="PM">PM</option>
                                                                <option value="기획자">기획자</option>
                                                            
                                                        </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating"> 프로젝트 시작예정일</label>
                                                    <input type="date" id="country-floating" class="form-control"
                                                        name="proStartDate"  value="${p.proStartDate }">
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
                                                name="proTitle" value="${p.proTitle }" style="width: 1100px; margin-left: 10px; margin-bottom:20px;" >
                                                
                                               
                                        

                                             <!-- 프로젝트 내용 -->

                                           <textarea  class="summernote" id="summernote" name="proContent" required  >
                                           			${p.proContent }
                                           </textarea>    
                                                  
                                    				
                                    		<script>
												    $('.summernote').summernote({
												          // 에디터 높이
												       
												         
                                                          height: 600,
                                                          placeholder: 'dkssuddd',
												          // 에디터 한글 설정
												          lang: "ko-KR",
												          // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
												          focus : true,
												          toolbar: [
												                // 글꼴 설정
												                ['fontname', ['fontname']],
												                // 글자 크기 설정
												                ['fontsize', ['fontsize']],
												                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
												                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
												                // 글자색
												                ['color', ['forecolor','color']],
												                // 표만들기
												                ['table', ['table']],
												                // 글머리 기호, 번호매기기, 문단정렬
												                ['para', ['ul', 'ol', 'paragraph']],
												                // 줄간격
												                ['height', ['height']],
												                // 그림첨부, 링크만들기, 동영상첨부
												                ['insert',['picture','link','video']],
												                // 코드보기, 확대해서보기, 도움말
												                ['view', ['codeview','fullscreen', 'help']]
												              ],
												              // 추가한 글꼴
												            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
												             // 추가한 폰트사이즈
												            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
												
												          //콜백 함수
												            callbacks : { 
												            	onImageUpload : function(files, editor, welEditable) {
												            // 파일 업로드(다중업로드를 위해 반복문 사용)
												            for (var i = files.length - 1; i >= 0; i--) {
												            uploadSummernoteImageFile(files[i],
												            this);
												            		}
												            	}
												            }
												          
												            
												            
												        });
												    
												    
												    
												    
												   </script>
												   
												   
												   
												   <script>
												   		// 여기는 select박스 선택하는 곳 
												   		
												   		// 모집 인원부터 선택한 값 출력해보자
												   		$("#peopleNo option").each(function(){
												   			// 모집인원 selectbox에 각각 접근했을 때 실행할 함수 
												   			
												   			if($(this).val() == "${p.proMember}"){
												   				$(this).attr("selected", true);
												   			}
												   		
												   		})
												   		
												   		
												   		
												   		// 진행기간
												   		$("#basicSelect option").each(function(){
												   			
												   			if($(this).val() == "${p.proPeriod}"){
												   				$(this).attr("selected", true);
												   			}
												   		})
												   		
												   		
												   		
												   		
												   	// 기술 스택
											   		
											   		const stack = "${p.proStack}";
											   		
											   		
											   		$("#multiSelect option").each(function(){
											   			
											   			const text = $(this).text();
											   			const value = stack.split(',');
											   			
											   			if(value.includes(text.trim())){
											   				$(this).attr("selected", true);
											   			}
											   			
											   			
											   		});
											   		
											   		
											   		
											   		// 모집 포지션 
											   		
											   		let positions = "${p.proPosition}";
											   		
											   		$("#proPosition option").each(function(){
											   			
											   			let text = $(this).text();
											   			let position = positions.split(',');
											   			
											   			if(position.includes(text.trim())){
											   				$(this).attr("selected",true);
											   			}
											   			
											   			
											   		})
											   		
											   		
											   		
											   		
												   		
												   </script>
												   
												   
												  
												   
 										<!-- 썸머노트 이용하려면 필요함 -->
										<script src="resources/assets/extensions/jquery/jquery.min.js"></script>	
										<script src="resources/assets/extensions/summernote/summernote-lite.min.js"></script>
										<script src="resources/assets/static/js/pages/summernote.js"></script>

                            
							 			<!--여기 두개가 다중 select박스인듯-->    
							            <script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
							            <script src="resources/assets/static/js/pages/form-element-select.js"></script>



                                           <!-- 제출하기 버튼 -->
                                            <div class="col-12 d-flex justify-content-end" style="margin-top:20px;">
                                                <button type="submit" class="btn btn-primary me-1 mb-1">수정하기</button>
                                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">초기화</button>
                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="javascript:history.go(-1)">뒤로가기</button>
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
                  	
            </section>

		

        </div>


        
   
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
   
    
    
</body>
</html>