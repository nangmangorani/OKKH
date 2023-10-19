<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



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
    <h3>Detail Project</h3>
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
                                           <h3> ${pro.proTitle } </h3> 
                                        </div>

                                        <br>

                                        <!-- 작성자/ 작성일 -->
                                        <div style="font-size: 17px;">
                                            작성자 : ${pro.proWriter } &nbsp; | &nbsp; 마감일 : ${pro.proDeadLine } 
                                            
                                            <c:choose>
                                            
                                            	<c:when test="${empty loginMember }">
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-primary" disabled >프로젝트 신청하기</button>
                                            	</c:when>
                                            
                                            	<c:when test="${pro.proStatus eq 'N'  }">
		                                             <button style="float: right; border: 0; height: 50px; " class="btn btn-primary" disabled>프로젝트 모집마감</button>
                                            	
                                            	</c:when>
                                            	
                                            	<c:when test="${pro.memNo eq loginMember.memNo }">
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-primary" onclick="#" >모집 완료하기</button>
                                            	</c:when>
                                            	
                                            	<c:otherwise>
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-primary" onclick="location.href='insertProForm.pro" >프로젝트 신청하기</button>
                                            	</c:otherwise>
                                            </c:choose>
                                        </div>
                                        
                                        
                                      
                                        
                                        
                                        
                                        <div style="font-size: 17px;">
                                            조회수 : ${pro.count }  &nbsp; | &nbsp; <img  style="width: 20px; height: 20px;" src="https://holaworld.io/images/info/bookmark_filled.png" alt=""> : 2
                                        </div>
                                        
                                        <hr >
                                        <br>
                        
                                    </div>
                                    <form class="form">
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">모집 인원</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="peoNo">${pro.proMember }명</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <!-- 시작 예정은 모집 마감일부터 시작 예정일임  -->
                                                <div class="form-group">
                                                    <label for="last-name-column">시작 예정</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="endDate">${pro.proStartDate }</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <!-- 사용언어는 기술 스택임 -->
                                                <div class="form-group">
                                                    <label for="city-column">사용 언어</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    
                                                        <!-- 기술 스택을 이미지와 글씨로 표현하는 	부분  -->
                                                    <c:set var="techStacks" value="${fn:split(pro.proStack, ',')}" />
														    <c:forEach items="${techStacks}" var="techStack">
														    <c:set var="src" value="https://holaworld.io/images/languages/${techStack}.svg"/>
														        
														         <button type="button" class="btn" style="border:1px solid lightgray; border-radius: 50px; height: 52px;padding-left: 0; margin-right: 10px; ">
										                           <div style=" border-radius:50px; ">
                                                                    
                                                                        <span class="badge bg-transparent"   >
                                                                                <img src="${src }" alt="${techStack}" style="width:35px; height:35px; ">
                                                                            </span>
                                                                            <span style="padding-right: 10px;"> ${techStack}</span>
                                                                    </div>    
										                        </button>
														    </c:forEach>


                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">예상 기간</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="period">${pro.proPeriod }</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="company-column">모집 포지션</label>
                                                    &nbsp;&nbsp; 

														<!-- 모집 기술분야는 ,로 구분지어서 하나씩 값을 버튼 사이 text에 넣어주기 -->
								                    	<c:set var="position" value="${fn:split(pro.proPosition,',') }"/>
								                    	
								                    	<c:forEach var="po" items="${position }">
								                        	<button style="border:0; border-radius:50px; width:100px; height:40px;">${po}</button>
								                        </c:forEach>
                                                </div>
                                            </div>

                                       
                                            
                                            <div class="form-group col-12">
                                              
                                            </div>
                                           
                                            <br><br><br>
                                    
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                
                                                <h3>프로젝트 소개</h3>
                                                <hr >
                                            </div>

                                            
                                               
                                            <!-- 프로젝트 내용 -->

                                           <div style="font-size: 15px; height: 150px;">
                                            ${pro.proContent }
                                            


                                          
                                            
                                        </div>
                                        
                                        <!-- <hr style=" margin-left:23;"> -->

                            




                                           <!-- 제출하기 버튼 -->
                                           <!-- 작성한 사람만 보이게 하기 -->
                                            <div class="col-12 d-flex justify-content-end">
                                            <c:choose>
                                            	<c:when test="${loginMember.memNo == pro.memNo}">
                                            	<!--  
	                                                <button type="button" class="btn btn-primary me-1 mb-1" onclick="#">모집완료</button>
	                                               --> 
	                                                
	                                                <button type="submit" class="btn btn-primary me-1 mb-1 ">수정하기</button>
	                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="#">삭제하기</button>
	                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='recruitList.pro'">뒤로가기</button>
                                            	
                                            	</c:when>
                                            	
                                            	<c:otherwise>
                                            			<button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='recruitList.pro'">뒤로가기</button>
                                            	</c:otherwise>
                                                
                                            </c:choose>
                                                
                                                
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

			</div>

					<jsp:include page="../common/rightSide.jsp"></jsp:include>
            
            
            </section>

         
			

        </div>


       
        
   
            <jsp:include page="../common/footer.jsp"></jsp:include>
   
		</section>
        </div>
    </div>

    
   
    <!-- 내용 작성을 위해 필요한 부분이라 삭제하면 안됨 -->
            <script src="resources/assets/extensions/quill/quill.min.js"></script>
            <script src="resources/assets/static/js/pages/quill.js"></script> 

    

</body>
</html>