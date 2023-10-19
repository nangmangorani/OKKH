<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- summernote 부트스트랩 -->

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
	
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


      /* 댓글 기능  */
        
      #UJ-reply{
            /* width:1200px; */
          
            background-color: #f7f7f7; 
            margin: auto;
            /* margin-top: 600px; */
            
        }

        #UJ-reply>table{
            /* width: 80%; */
            /* margin: auto; */
            /* border:1px solid red; */
            box-sizing: border-box;
          /*  background-color:#f7f7f7; */
          /* border: 1px solid red; */
            
        }


      


        #UJ-reply>table input{
            /* width: 1060px; */
            height: 40px;
            border: 1px solid lightgrey;
            border-radius: 5px;
            margin-left:80px;
            box-sizing: border-box;
            /* border: 1px solid red; */
            
        
        }
        
      
        #UJ-reply>table>thead>tr{
           /* width: 100%; */

          
       
         
        }

        #UJ-reply>table>tbody>tr{
           /* width: 100%; */
         
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
    <h3>Detail Personal PR</h3>
</div> 
<div class="page-content"> 
    <section class="row">

        <!-- 프로젝트 상세보기 -->
        <div class="col-12 col-lg-9">
            
           

            <section id="multiple-column-form">
                <div class="row match-height">
                    <div class="col-12">
                        <div class="card">
                          
                            <div class="card-content">
                                <div class="card-body">

                                    <div class="UJ-WriteHeader">
                                        
                                        <br>
                                        <!-- 제목 -->
                                        <div>
                                           <h3>${pr.prTitle } </h3> 
                                        </div>

                                        <br>

                                        <!-- 작성자/ 작성일 -->
                                        <div style="font-size: 17px;">
                                            작성자 : ${pr.prWriter } &nbsp; | &nbsp; ${pr.createDate }
                                        </div>
                                        
                                        <div style="font-size: 17px;">
                                            조회수 : ${pr.count }  &nbsp; | &nbsp; <img  style="width: 20px; height: 20px;" src="https://holaworld.io/images/info/bookmark_filled.png" alt=""> : 2
                                        </div>
                                        
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form">
                                        <div class="row">
                                            
                                            
                                            <div class="col-md-6 col-12">
                                                <!-- 사용언어는 기술 스택임 -->
                                                <div class="form-group">
                                                    <label for="city-column">기술 스택</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="tech-stack">
                                                    
                                                    
                                                    <!-- 기술 스택을 이미지와 글씨로 표현하는 	부분  -->
                                                    <c:set var="techStacks" value="${fn:split(pr.stackName, ',')}" />
														    <c:forEach items="${techStacks}" var="techStack">
														    <c:set var="src" value="https://holaworld.io/images/languages/${techStack}.svg"/>
														        
														         <button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 60px;padding-left: 0; margin-right: 3px; ">
										                           <div style=" border-radius:50px; ">
                                                                    
                                                                        <span class="badge bg-transparent"   >
                                                                                <img src="${src }" alt="${techStack}" style="width:35px; height:35px; ">
                                                                            </span>
                                                                            <span style="padding-right: 10px;"> ${techStack}</span>
                                                                    </div>    
										                        </button>
														    </c:forEach>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">프로젝트 가능 시간 <br>(단위 기간 : 24HR)</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="period">
                                                    
                                                    <!-- selectbox에서 value=0이면 시간미정이어서 분기처리해주기 -->
                                                    <c:choose>
                                                    	<c:when test="${pr.prTime eq 0 }">
                                                    		시간 미정
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    	  ${pr.prTime }시간
                                                    	</c:otherwise>
                                                    
                                                    </c:choose>
                                                  
                                                    
                                                    
                                                    </span>
                                                </div>
                                            </div>
                                          

                                       
                                            
                                            <div class="form-group col-12">
                                              
                                            </div>
                                           
                                            <br><br><br>
                                    
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                
                                                <h3>자기 소개</h3>
                                                <hr >
                                            </div>

                                            
                                               
                                            <!-- 프로젝트 내용 -->

                                           <!-- PR 내용 -->

                                                 
                                               <div style=" height: 600px;" id="UJ-summerDiv">
                                                   
                                                        ${pr.prContent }
                                                      
                                                </div>
                                    				
                                    				<script>
												    $('#summernote').summernote({
												          // 에디터 높이
												       
												     
												          // 에디터 한글 설정
                                                          maxHeight:600,
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
												                 
                                        
                                        <!-- <hr style=" margin-left:23;"> -->

                            


											

                                           <!-- 제출하기 버튼 -->
                                           <!-- 작성한 사람만 보이게 하기 -->
                                            <div class="col-12 d-flex justify-content-end" style="margin-top:40px;">
                                               
                                                <button type="button" class="btn btn-primary me-1 mb-1" onclick="location.href='updatePrForm.pr?pno='+ ${pr.prNo}">수정하기</button>
                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='deletePr.pr?pno='+${pr.prNo}">삭제하기</button>
                                                 <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='personalList.pr'">뒤로가기</button>
                                            </div>
                                        </div>
                                    </form>

                                   
                    
                                    <!-- <hr style="width: 810px;" > -->

                                    <hr>
                                   <!------------------------------댓글------------------------------->
                                    <div id="UJ-reply">


                                        <table class="replyTable" >

                                            <!-- 로그인 한 회원이 볼 화면  -->
                                        
                                        <thead>
                                            <tr >
                                                <th colspan="3"  >
                                                 
                                                    <p>&nbsp;</p>
                                                </th>
                                               
                                            </tr>
                        
                                              <tr >
                                        
                                                <th colspan="3"  >
                                                  <input type="text" placeholder="댓글을 입력하세요" style="padding-left: 10px;  width: 600px;" id="UJreply">
                                                
                                                  
                                                </th>
                                                
                                                <td>
                                                    <button style="width: 90px;" class="btn btn-primary" onclick="UJinsertReply();">작성</button>
                                                  
                                                </td> 
                                                
                                              
                                              </tr>  
                        
                        
                                                <tr >
                                            
                                                    <th colspan="3"  >
                                                     
                                                        <p>&nbsp;</p>
                                                    </th>
                                                   
                                                  
                                                </tr>

                                            </thead>


                                            <tbody id="UJ-courseTbody">
                                                <!-- 작성한 댓글을 ajax로 여기다가 그릴 예정   -->
                                                
                            
                            
                                                </tbody>
                            
                                                <th colspan="3"  >
                                                         
                                                    <p>&nbsp;</p>
                                                </th>
                                              
                                            </table>
                            
                                        </div> 
                                        
                                        
                                        <!-- 댓글 작성하는 script -->
                                        <script>
                                        	function UJinsertReply(){
                                        		// 댓글 작성하는 함수
                                        		$.ajax({
                                        			
                                        			url:"insertReply.pr",
                                        			data:{
                                        				replyNo:${pr.prNo},
                                        				replyWriter:${pr.}
                                        				
                                        		
                                        			},
                                        			success:function(){
                                        				
                                        			},
                                        			
                                        			error:function(){
                                        				console.log("pr 댓글 작성용 ajax실패ㅠㅠ");
                                        			}
                                        			
                                        		})
                                        	}
                                        
                                        </script>
                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

         

        </div>

		<!--
         <div class="col-12 col-lg-3">
            
            
        </div>
        -->
        
        
       <!-- 친구 및 팀원 시작 -->
         <jsp:include page="../common/rightSide.jsp"></jsp:include>
       <!-- 친구 및 팀원 끝 -->
    </section>
</div>

	
 		<jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    
    
	<!-- 글 작성을 위해 필요함 -->
     <!-- 썸머노트 이용하려면 필요함 -->
	<script src="resources/assets/extensions/jquery/jquery.min.js"></script>	
	<script src="resources/assets/extensions/summernote/summernote-lite.min.js"></script>
	<script src="resources/assets/static/js/pages/summernote.js"></script>
     


</body>
</html>