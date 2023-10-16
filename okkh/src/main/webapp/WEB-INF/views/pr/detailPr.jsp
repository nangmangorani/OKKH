<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

		<!-- 글 작성을 위해 필요함 -->
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
                                           <h3>참한 대한 건아 </h3> 
                                        </div>

                                        <br>

                                        <!-- 작성자/ 작성일 -->
                                        <div style="font-size: 17px;">
                                            작성자 : 호빵맨여친세균맨 &nbsp; | &nbsp; 2023-10-04 
                                        </div>
                                        
                                        <div style="font-size: 17px;">
                                            조회수 : 5  &nbsp; | &nbsp; <img  style="width: 20px; height: 20px;" src="https://holaworld.io/images/info/bookmark_filled.png" alt=""> : 2
                                        </div>
                                        
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form">
                                        <div class="row">
                                            
                                            
                                            <div class="col-md-6 col-12">
                                                <!-- 사용언어는 기술 스택임 -->
                                                <div class="form-group">
                                                    <label for="city-column">사용 언어</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="tech-stack">자바,스프링,VSCode</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">프로젝트 가능 시간 <br>(단위 기간 : 24HR)</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="period">5시간</span>
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

                                           <div style="font-size: 15px; height: 150px;">
                                           안녕하세요 저는 아주 참하고 성실한 대한의 건아입니다.
                                           저를 데려가시면 후회하지 않을 겁니다 후후
                                            


                                          
                                            
                                        </div>
                                        
                                        <!-- <hr style=" margin-left:23;"> -->

                            




                                           <!-- 제출하기 버튼 -->
                                           <!-- 작성한 사람만 보이게 하기 -->
                                            <div class="col-12 d-flex justify-content-end">
                                               
                                                <button type="submit" class="btn btn-primary me-1 mb-1">수정하기</button>
                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="#">삭제하기</button>
                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="#">뒤로가기</button>
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
      <script src="resources/assets/extensions/quill/quill.min.js"></script>
      <script src="resources/assets/static/js/pages/quill.js"></script> 
     


</body>
</html>