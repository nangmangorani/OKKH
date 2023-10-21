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
                                            		<button style="float: right; border: 0; height: 60px; " class="btn btn-primary" disabled >프로젝트 신청하기(로그인 후 신청가능)</button>
                                            	</c:when>
                                            
                                            	<c:when test="${pro.memNo ne loginMember.memNo and pro.proStatus == 'N'  }">
		                                             <button style="float: right; border: 0; height: 50px; " class="btn btn-primary" disabled>프로젝트 모집마감</button>
                                            	
                                            	</c:when>
                                            	
                                            	<c:when test="${pro.memNo eq loginMember.memNo and pro.proStatus == 'Y'}">
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-primary" onclick="location.href='recruitDone.pro?pno=' + ${pro.proNo }" >모집 완료하기</button>
                                            	</c:when>
                                            	
                                            	<c:when test="${pro.memNo eq loginMember.memNo and pro.proStatus == 'N'}">
                                            	
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-light-secondary" onclick="location.href='recruitReturn.pro?pno=' + ${pro.proNo }" >다시 모집하기</button>
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
                                    
                                        <div class="row">
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="first-name-column">모집 인원</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="peoNo">${pro.proMember }명</span>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-12">
                                              
                                                
                                                <div class="form-group">
                                                    <label for="country-floating">모집 마감</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="proDeadLine">${pro.proDeadLine}</span>
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
                                            
                                            
                                            <div class="col-md-6 col-12" style="margin-top:10px;">
                                                 <!-- 시작 예정은 모집 마감일부터 시작 예정일임  -->
                                                <div class="form-group">
                                                    <label for="last-name-column">시작 예정</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="endDate">${pro.proStartDate }</span>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="company-column">모집 포지션</label>
                                                    &nbsp;&nbsp; 

														<!-- 모집 기술분야는 ,로 구분지어서 하나씩 값을 버튼 사이 text에 넣어주기 -->
								                    	<c:set var="position" value="${fn:split(pro.proPosition,',') }"/>
								                    	
								                    	<c:forEach var="po" items="${position }">
								                        	<button style="border:0; border-radius:50px; width:100px; height:40px; box-sixing:border">${po}</button>
								                        </c:forEach>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6 col-12">
                                                <div class="form-group">
                                                    <label for="country-floating">예상 기간</label>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span name="period">${pro.proPeriod }</span>
                                                </div>
                                            </div>

                                       
                                            
                                           
                                           
                                            <br><br><br> <br><br><br> <br><br> 
                                    
                    
                                           
                                            <div class="UJ-WriteHeader">
                                                
                                                <h3>프로젝트 소개</h3>
                                                <hr >
                                            </div>

                                            
                                               
                                            <!-- 프로젝트 내용 -->

                                           <div style="font-size: 15px; height: 500px;">
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
	                                                
	                                                <button type="button" class="btn btn-primary me-1 mb-1 " onclick="location.href='updateFormProject.pro?pno='+ ${pro.proNo}">수정하기</button>
	                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='deleteProject.pro?pno='+ ${pro.proNo}">삭제하기</button>
	                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='recruitList.pro'">뒤로가기</button>
                                            	
                                            	</c:when>
                                            	
                                            	<c:otherwise>
                                            			<button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='recruitList.pro'">뒤로가기</button>
                                            	</c:otherwise>
                                                
                                            </c:choose>
                                                
                                                
                                            </div>
                                        </div>
                                    

                                   
                    
                                    <!-- <hr style="width: 810px;" > -->

                                    <hr>
                                   <!------------------------------댓글------------------------------->
                                    <div id="UJ-reply">


                                        <table class="replyTable" align="center" >

                                            <!-- 로그인 한 회원이 볼 화면  -->
                                        
                                        <thead>
                                            <tr >
                                                <th colspan="3"  >
                                                 
                                                    <p>&nbsp;</p>
                                                </th>
                                               
                                            </tr>
                        
                                              <tr >
                                              
                                              <c:choose>
	                                              	<c:when test="${not empty loginMember }">
	                                        
		                                                <th colspan="3"  >
		                                                  <input type="text" placeholder="댓글을 입력하세요" style="padding-left: 10px;  width: 600px;" id="UJreply" >
		                                                
		                                                  
		                                                </th>
		                                                
		                                                <td>
			                                                    <button type="button"  style="width: 90px;" class="btn btn-primary" onclick="UJinsertReply();">작성</button>
			                                                  
			                                            </td>
	                                                </c:when>
	                                                
	                                                <c:otherwise>
	                                                
	                                                
		                                                <th colspan="4"  >
		                                                  <input type="text" placeholder="로그인 후 이용가능한 서비스입니다." style="padding-left: 10px;  width: 600px;" id="UJreply" readonly >
		                                                
		                                                  
		                                                </th>
	                                                
			                                                <td>
			                                                    <button type="button"  style="width: 90px;" class="btn btn-primary" disabled>작성</button>
			                                                  
			                                                </td> 
	                                                </c:otherwise>
                                                
                                                </c:choose>
                                                
                                                
                                                
                                                
                                              
                                              </tr>  
                        
                        
                                                <tr >
                                            
                                                    <th colspan="3"  >
                                                     
                                                        <p>&nbsp;</p>
                                                    </th>
                                                   
                                                  
                                                </tr>
                                                
                                                <tr >
                                               		<td  style="padding-left:10px; padding-bottom:20px; font-size:18px; font-weight:900;">댓글 (<span id="rcount">0</span>) </td>
                                                </tr>

                                            </thead>


                                            <tbody id="UJ-projectReply">
                                                <!-- 작성한 댓글을 ajax로 여기다가 그릴 예정   -->
                                                
                            
                            
                                                </tbody>
                            
                                                <th colspan="3"  >
                                                         
                                                    <p>&nbsp;</p>
                                                </th>
                                              
                                            </table>
                            
                                        </div> 
                                        
                                        
                                        <script>
                                        
                                        // 댓글 용 스크립트 
                                        
                                        $(function(){
                                        	// 상세화면 열리자마자 댓글 리스트부터 조회하는 함수
                                        	selectProjectReply();
                                        });
                                        
                                        
                                        
                                        
                                        // 댓글 작성하는 함수
                                      function UJinsertReply(){
                                        		
                                        if($("#UJreply").val().trim().length != 0){
                                        		$.ajax({
													
                                        			url:"insertReply.pro",
                                        			data:{
                                        				replyContent:$("#UJreply").val(),
                                        				replyWriter: "${loginMember.memNo}",
                                        				refPno : ${pro.proNo}
                                        				
                                        			},
                                        			success:(data)=>{
                                        				
                                        				console.log(data + " 화면단 돌아온 값!!!!!")
                                        				
                                        				if(data == "success"){
                                        					selectProjectReply();
                                        					$("#UJreply").val("");
                                        					//alert("댓글 작성을 성공했습니다.")
                                        				}
                                        				
                                        			},
                                        			
                                        			error:()=>{
                                        				
                                        				console.log("프로젝트 댓글 작성용 ajax 실패ㅠㅠ")
                                        			}
                                        			
                                        		})
                                        		
                                        	  
                                        		
                                        	  }else{
                                        		alert("댓글 작성 후 등록해주세요")
                                        	
                                        	  }
                                        	  
                                        }; 
                                        
                                        
                                        	// 댓글 조회하는 함수
                                        	function selectProjectReply(){
                                        		$.ajax({
                                        			url:"selectProReplyList.pro",
                                        			data : {pno:${pro.proNo}},
                                        			success:function(list){
                                        				
                                        				
                                        				let value = "";
                                        				
                                        				for(let i in list){
                                        					value += "<tr style='border-bottom:1px solid lightgray; height:50px;'>"
                                          					  + "<input type='hidden' name='replyNo' value='list[i].replyNo' id='replyNo'>"
                                          				      + "<td style='padding-left:10px; width:20%;'>" + list[i].replyWriter + "</td>"
                                          				      + "<td style='width:50%'>" + list[i].replyContent + "</td>"
                                          				      + "<td style='width:15%'>" + list[i].repDate + "</td>";
                                          				      
                                          				      if(list[i].memNo == ${loginMember.memNo}){
                                          				    	  value += "<td style='width:15%'> <button style='border:0' class='btn btn-primary' onclick='deleteReplyBtn(" + list[i].replyNo + ");'>댓글 삭제</button></td>";
                                          				      }
                                          				     
                                          				     value += "</tr>";
                                          			      }
                                        				
                                        					$("#UJ-projectReply").html(value);
                                        					$("#rcount").text(list.length)
                                        				
                                        				
                                        			},
                                        			
                                        			error:() => {
                                        				console.log("프로젝트 댓글 조회용 아작스 실패ㅠㅠ");
                                        			}
                                        		
                                        		})
                                        	};
                                        	
                                        	
                                        	
                                        	// 댓글 삭제하는 함수
                                        	function deleteReplyBtn(num){
                                        		
                                        		$.ajax({
                                        			
                                        			url:"deleteProReply.pro",
                                        			data:{pno:num},
                                        			success:function(result){
                                        				console.log(result + " 댓글 삭제제제")
                                        				
                                        				if(result == "success"){
                                        					
                                        					alert("댓글 삭제를 성공했습니다.")
                                        					selectProjectReply();
                                        					
                                        				}else{
                                        					alert("댓글 삭제를 실패했습니다.")
                                        				}
                                        			},
                                        			error:function(){
                                        				console.log("프로젝트 댓글 삭제용 아작스 실패");
                                        			}
                                        			
                                        		})
                                        		
                                        	}
                                        	
                                        	
                                        	
                                        
                                        </script>
                                
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

        </div>
    </div>

    
 
    

</body>
</html>