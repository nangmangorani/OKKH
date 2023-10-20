<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	
	<!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->
<link rel="stylesheet" href="resources/assets/extensions/choices.js/public/assets/styles/choices.css">




	<!-- summernote 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
	
	<!-- 썸머노트 에디터 위해 필요함 -->
	<link rel="stylesheet" href="resources/assets/extensions/summernote/summernote-lite.css">

  	<link rel="stylesheet" href="resources/assets/compiled/css/form-editor-summernote.css">
	
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
    <h3>New Personal PR</h3>
</div> 
<div class="page-content"> 
    <section class="row">

        <!-- PR 작성하기 -->
        <div class="col-12 col-lg-9">
            
           

            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                          
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="UJ-WriteHeader">
                                        <button>1</button>
                                        <span>자신의 기본 정보를 입력해주세요</span>
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form" action="enrollPr.pr">
                                        <div class="row">
                                           
                                            <input type="hidden" value="1" name="prWriter">
                                           
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column">프로젝트 가능 시간 (단위 기간 : 24HR)</label>
                                                    <!-- <input type="text" id="last-name-column" class="form-control"
                                                        placeholder="기간 미정 ~ 6개월 이상" name="period"> -->

                                                        <select class="form-select" id="basicSelect" name="prTime" required>
                                                            <option value="0">시간 미정</option>
                                                            <option value="1">1시간</option>
                                                            <option value="2" >2시간</option>
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
                                                    <select class="choices form-select multiple-remove" multiple="multiple" name="stackName" required>
                                                        
                                                        <c:forEach var="s" items="${list }">
                                                            <option value="${s.stackName }">${s.stackName }</option>
                                                         </c:forEach>
                                                        
                                                    </select>
                                                </div>
                                             </div>
                                            
                                            

                                          
                                            <div class="form-group col-12">
                                              
                                            </div>
                                           
                                            <br><br>    <br><br>
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                <button>2</button>
                                                <span>자신에 대해 소개해주세요</span>
                                                <hr >
                                            </div>
                                            
                                            

                                            <span>제목</span>
                                             <br>
                                            <input type="text" id="company-column" class="form-control"
                                                name="prTitle" placeholder="자기 소개 제목을 입력해주세요" style="width: 1100px; margin-left: 10px; margin-bottom:10px;" required >
                                               
                                               
                                            <!-- PR 내용 -->

                                                 
                                               
                                               <textarea  class="summernote" id="summernote" name="prContent" required  ></textarea>    
                                                  
                                    				
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
												    
												    $('#summernote').summernote(setting);
										             });
												    
												    function uploadSummernoteImageFile(file, el) {
														data = new FormData();
														data.append("file", file);
														$.ajax({
															data : data,
															type : "POST",
															url : "uploadSummernoteImageFile",
															contentType : false,
															enctype : 'multipart/form-data',
															processData : false,
															success : function(data) {
																$(el).summernote('editor.insertImage', data.url);
															}
														});
													}
												  
												    </script>
												                                                  
                                               
                                               
                                            </div>

                          				<!-- 썸머노트 이용하려면 필요함 -->
										<script src="resources/assets/extensions/jquery/jquery.min.js"></script>	
										<script src="resources/assets/extensions/summernote/summernote-lite.min.js"></script>
										<script src="resources/assets/static/js/pages/summernote.js"></script>
										
										
										
										
										
 										<br><br><br><br><br>

                                           <!-- 제출하기 버튼 -->
                                            <div class="col-12 d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary me-1 mb-1" id="submit-button">작성하기</button>
                                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">초기화</button>
                                                <button type="button" class="btn btn-light-secondary me-1 mb-1"  onclick="javascript:history.go(-1)">뒤로가기</button>
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

            

             <!--여기 두개가 다중 select박스인듯-->    
             <script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
             <script src="resources/assets/static/js/pages/form-element-select.js"></script>

       		
   
       
    
       	   </div>


   
		</div> 

           
     </div>
  

           

    

</body>
</html>