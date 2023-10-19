<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	
	<!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->
<link rel="stylesheet" href="resources/assets/extensions/choices.js/public/assets/styles/choices.css">
	
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
                                    <form class="form" action="updatePR.pr">
                                        <div class="row">
                                            
                                            <input type="hidden" name="prNo" value="${pr.prNo }">
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="last-name-column">프로젝트 가능 시간 (단위 기간 : 24HR)</label>
                                                    <!-- <input type="text" id="last-name-column" class="form-control"
                                                        value="2개월" name="period"> -->

                                                        <select class="form-select" id="basicSelect" name="prTime">
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
                                                        <select class="choices form-select multiple-remove" multiple id="multiSelect" name="stackName" >
                                                            
                                                            <c:forEach var="pr" items="${list }">
                                                                <option value="${pr.stackName }">${pr.stackName }</option>
                                                              
                                                            </c:forEach>
                                                            
                                                            
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
                                                name="prTitle" value="${pr.prTitle }" style="width: 1100px; margin-left: 10px; margin-bottom:10px;" >
                                                
                                               
                                            <!-- 프로젝트 내용 -->

                                             
                                               <textarea  class="summernote" id="summernote" name="prContent" required  >
                                               		${pr.prContent}
                                               </textarea>    
                                                  
                                    				
                                    				<script>
                                    				
                                    				$(".note-editable").text(content)
                                    				
                                    				
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
												
												
												          
												            
												        });
												    
												    
												  
												    </script>
												    
												    <script>
												    
												    // 프로젝트 참여 가능 시간 select박스에서 사용자가 선택한 값 선택되게 하는 곳
												    // 위에 script에다가 작성하면 여기가 작동안됨...
												    $("#basicSelect option").each(function(){
												    	// 시간 선택하는 select박스(id=basicSelect)의 후손 option을 
												    	// 각각 접근해서 실행할 함수 
												    	
												    	if($(this).val() == "${pr.prTime}"){
												    		// 만약 select박스의 value와 사용자가 선택한 value값이 같다면 
												    		// 선택되게 하기 
												    		$(this).attr("selected", true);
												    	}
												    	
												    	
												    })
												    
												    
												   
												    
												    </script>
												    
												    
												    
												    <script>
												    
										    	
										    	
										    		const stack = "${pr.stackName}";
										    		
										    		
										    		/*
										    		$("#multiSelect option").each(function(){
										    			if(stack.search($(this).text()) != -1 ){
										    				$(this).attr("selected", true);
										    				console.log(stack)
										    			}
										    		})
												    
										    		// 이 코드를 작성하면 되긴 하는데, 정확히 일치가 아닌 특정단어가 포함된 것도 
										    		// selected가 되어버림
										    		//  예) 'goCompany, go' 면 goCompany만 나와야하는데 go도 같이 나와버림
										    		
												   */
												    
												    
												    $("#multiSelect option").each(function() {
												        const optionText = $(this).text();
												        const values = stack.split(',');

												        if (values.includes(optionText.trim())) {
												            $(this).prop("selected", true);
												        }
												    });
												    // 그래서 이렇게 stack을 split로 구분하고 변수로 설정, select 박스의 text값도 
												    // 변수에 저장하고서 두 변수를 이용해서 비교하기....
												   	
												    		
												    				
													   
												    </script>
												   
                                            </div>

                            
										


                                           <!-- 제출하기 버튼 -->
                                            <div class="col-12 d-flex justify-content-end" style="margin-top:40px;">
                                            
                                                <button type="submit" class="btn btn-primary me-1 mb-1" >수정하기</button>
                                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">초기화</button>
                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="javascript:history.go(-1)">뒤로가기</button>
                                            </div>
                                    </form>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
              	 <!-- 친구 및 팀원 시작 -->
                  		<jsp:include page="../common/rightSide.jsp"></jsp:include>
                  <!-- 친구 및 팀원 끝 -->
                    
                    

						<!-- 썸머노트 이용하려면 필요함 -->
						<script src="resources/assets/extensions/jquery/jquery.min.js"></script>	
						<script src="resources/assets/extensions/summernote/summernote-lite.min.js"></script>
						<script src="resources/assets/static/js/pages/summernote.js"></script>
                    
            </section>

		 
            
            
          <!--여기 두개가 다중 select박스인듯-->    
         <script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
         <script src="resources/assets/static/js/pages/form-element-select.js"></script>

	
        </div>

		
           

    

</body>
</html>