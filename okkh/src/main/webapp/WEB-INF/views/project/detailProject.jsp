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

                                    <div class="UJ-WriteHeader" >
                                    
                                    	<!-- 북마크 -->
                                        <c:choose >
	                                         <c:when test="${not empty book and book.memNo eq loginMember.memNo}">
	                                        	<img src="https://holaworld.io/images/info/bookmark_filled.png" style="float:right; padding-right: 40px; " onclick="bookmark(event);" class="bookmark"> 
											 </c:when>	
											 
											 <c:otherwise>
												 <img src="https://holaworld.io/images/info/bookmark.png" style="float:right; padding-right: 40px; " onclick="bookmark(event);" class="bookmark"> 
											 </c:otherwise>
										
										</c:choose>
                                        <br>
                                        <!-- 제목 -->
                                     
                                   
                                           	
                                          <div > 	
                                           <h3> ${pro.proTitle } </h3>
                                           
                                          </div>
                                          
                                          
                                         
                                         
                                     
                                        <br>
                                        
                                        
                                        	
                                        

                                        <!-- 작성자/ 작성일 -->
                                        <div style="font-size: 17px; " id="buttonArea">
                                            작성자 : ${pro.proWriter } &nbsp; | &nbsp; 마감일 : ${pro.proDeadLine } 
                                            
                                            
                                            <script>
                                            	console.log(${loginMember.team} + "팀@@@")
                                            </script>
                                            
                                            
                                            <c:choose>
                                            
                                            	<c:when test="${empty loginMember }">
                                            		<!-- 아직 로그인을 안했을 경우 -->
                                            		<button style="float: right; border: 0; height: 60px; " class="btn btn-primary" disabled >프로젝트 신청하기(로그인 후 신청가능)</button>
                                            	</c:when>
                                            
                                            	<c:when test="${pro.memNo ne loginMember.memNo and pro.proStatus == 'N'  }">
		                                             <!-- 프로젝트 모집이 마감이 되었을 경우 -->
		                                             
		                                             <button style="float: right; border: 0; height: 50px; " class="btn btn-primary" disabled>프로젝트 모집마감</button>
                                            	
                                            	</c:when>
                                            	
                                            	<c:when test="${pro.memNo eq loginMember.memNo and pro.proStatus == 'Y'}">
                                            		<!-- 작성자고, 프로젝트 아직 모집 미완료일때 -->
                                            		
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-primary" onclick="location.href='recruitDone.pro?pno=' + ${pro.proNo }" >모집 완료하기</button>
                                            	</c:when>
                                            	
                                            	<c:when test="${pro.memNo eq loginMember.memNo and pro.proStatus == 'N'}">
                                            		<!-- 작성자고, 모집이 완료되었을 경우 재모집버튼이 보임 -->
                                            	
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-light-secondary" onclick="location.href='recruitReturn.pro?pno=' + ${pro.proNo }" >다시 모집하기</button>
                                            	</c:when>
                                            	
                                            	<c:when test="${ loginMember.team eq 0 and loginMember.memNo ne pro.memNo}">
                                            	<!-- 신청한 프로젝트가 아직 없는데 로그인 회원이 게시글 작성자가 아닌 경우 -->
                                            	
                                            		<button style="float: right; border: 0; height: 50px; " class="btn btn-primary"  id="enrollProject" >프로젝트 신청하기</button>
                                            	</c:when>
                                            	
                                            
                                            	<c:when test="${ loginMember.team ne 0 and  loginMember.team ne pro.proNo  and loginMember.memNo ne pro.memNo}">
                                             	<!-- 신청한 프로젝트가 있고, 로그인 멤버의 팀과 게시글 번호가 같고(즉, 회원이 신청한 프로젝트 게시물인 경우), 로그인 회원이 게시글 작성자가 아닌 경우 -->
                                            	
                                            	    <button style='float: right; border: 0; height: 50px;' class='btn btn-light-secondary'  disabled > 이미 참여한 다른 프로젝트가 있습니다</button>
                                            		
                                            		
                                            	</c:when>
                                            	
                                            	
                                              <c:when test="${ loginMember.team ne 0 and loginMember.team == pro.proNo  and loginMember.memNo ne pro.memNo}">
                                            	 <!--  프로젝트 게시글 작성자가 아니고, 프로젝트에 참여한 회원인 경우 -->
                                            	
                                             
                                            	    <button style='float: right; border: 0; height: 50px;' class='btn btn-light-secondary'  onclick="deleteProject();" >프로젝트 신청완료(취소하기)</button>
                                            	</c:when>
                                            	
                                            	
                                            	
                                            	
                                            </c:choose>
                                        </div>
                                        
                                        
                                      
                                        
                                        
                                        
                                        <div style="font-size: 17px;">
                                        
                                        	
                                            조회수 : ${pro.count }  &nbsp; | &nbsp; 
                                            
                                          
                                            <img  style="width: 20px; height: 20px;" src="https://holaworld.io/images/info/bookmark_filled.png" alt=""> : <span id="bookmarkCount">${count }</span>
                                        </div>
                                        <br>
                                        <hr>
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


                                        <table class="replyTable" align="center"  width=900>

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
	                                        
		                                                <th colspan="4"  >
		                                                  <input type="text" placeholder="댓글을 입력하세요" style="padding-left: 10px;  width: 600px;" id="UJreply" >
		                                                
			                                                    <button type="button"  style="width: 90px;" class="btn btn-primary" onclick="UJinsertReply();">작성</button>
		                                                  
		                                                </th>
		                                                
		                                               
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
                                        	
                                        	
                                        	
                                        	// 북마크 클릭했을 때 
                                        	function bookmark(event){
                                        		
	
                                        		$.ajax({
                                        			url:"projectBookmark.pro",
                                        			data:{pno:${pro.proNo}},
                                        			success:function(data){
                                        				
                                        				console.log(data)
                                        				
                                        				
                                        				if(data == "success"){
                                        					
                                        					const bookmark = $(event.target);
                                                            const bookmarkUrl = bookmark.attr("src");
                                        					
                                        					
                                                            
                                        					if( bookmarkUrl.endsWith("https://holaworld.io/images/info/bookmark.png")){
                                        						bookmark.attr("src", "https://holaworld.io/images/info/bookmark_filled.png") ;
                                        						
                                        						
                                        						$("#bookmarkCount").text(parseInt($("#bookmarkCount").text())+1);
                                        						
                                        						
                                                            }else{
                                                            	bookmark.attr("src", "https://holaworld.io/images/info/bookmark.png");
                                                            	$("#bookmarkCount").text(parseInt($("#bookmarkCount").text())-1) ;
                                                            }
                                        					
                                        				}else{
                                        					console.log("북마크 작동 실패!!")
                                        				}
                                        				
                                        				
                                        			},
                                        			error:function(){
                                        				console.log("북마크용 아작스 실패ㅠㅠ")
                                        			}
                                        			
                                        		})
                                        		
                                        		
                                        	};
                                                                                	
                                        	
                                        	// 프로젝트 참여하기 눌렀을 때 실시간으로 게시글 작성자에게 알림가게 하기
                                        	// member에 team컬럼들에 update치기
                                        	
                                        	
                                        	

											function enrollProject(){
                                         
                                        	  $.ajax({
    												
                                      			url:"alarmProject.pro",
                                      			data:{
                                      				refProNo:${pro.proNo},
                                      				owner:${pro.memNo}
                                      			
                                      				
                                      			},
                                      			success:function(data){
                                      				console.log(data + "프로젝트 참가버튼 용 ajax 결과!@!")
                                      				if(data == 1){
                                      					
                                      					
                                      				
                                      					
                                      					alert("프로젝트 신청이 완료되었습니다!!!")
                                      					
                                      					
                                      					let value="";
                                      					
                                      					value += "작성자 :  ${pro.proWriter}   &nbsp; | &nbsp; 마감일 : ${pro.proDeadLine }"
                                      					      + " <button style='float: right; border: 0; height: 50px;' class='btn btn-light-secondary'  id='deleteProject' >프로젝트 신청완료(취소하기)</button>";
                                      					
                                      					$(".card-body #buttonArea").html(value);
                                      					
                                      					
                                      					console.log(data + " : 프로젝트 참가용")
                                      					
                                      					
                                      					
                                      					
                                      					if(${loginMember.memNo ne pro.memNo}){
                                      				
                                      					// 만약 게시글 작성자와 현재 로그인한 회원의 번호가 다르다면?
                                      					if(socket.readyState==1){
                                      						// 소켓
                                      						// 메세지 보낼 때 , 무조건 포함시키고 String형은 무조건 ""안에다가 작성하기 
                                      						let socketMsg = "project"+ ","+ ${loginMember.memNo}+","+${pro.memNo}+","+ ${pro.proNo}+",${pro.proTitle},${loginMember.gitNick},"+ ${loginMember.team} + ", 프로젝트에 참여를 희망합니다!"; 
                                      						console.log(socketMsg );
                                      						socket.send(socketMsg);  // 찐으로 소켓에게 메시지 보내기
                                      					}
                                      		          }
                                      							
                                      				}else{
                                      					console.log(" fail 프로젝트 참가용 ajax 결과 : " + data)
                                      					
                                      				}
                                      			},
                                      				
                                      				
                                      				
                                      				
                                      				
                                      			
                                      			error:function(){
                                      				console.log("프로젝트 참여용 아작스 실패용")
                                      			}
                                      			
                                      		})
                                      		
                                      		
											};
                                 	
                                        		
                                         
                                         function deleteProject(){
                                        	
                                        	  $.ajax({
                                        		
                                        		  url:"deleteEnrollProject.pro",
                                        		// data:{memNo:${loginMember.memNo}},
                                        		  success:function(data){
                                        			   
                                        			  if(data == 1){
                                        				  alert("프로젝트 참여가 취소되었습니다!")
                                        				  
                                        				
                                        				  let value = "";
                                        				  
                                        				  value += "안녕"
                                        				        + "<button style='float: right; border: 0; height: 50px' class='btn btn-primary'  id='enrollProject' >프로젝트 신청하기</button>"
                                        					  
                                        				  $(".card-body #buttonArea").html(value);
                                        				

                                        				
                                        					if(${loginMember.memNo ne pro.memNo}){
                                        				
                                        					// 만약 게시글 작성자와 현재 로그인한 회원의 번호가 다르다면?
                                        					if(socket.readyState==1){
                                        						// 소켓
                                        						let socketMsg = "project"+ ","+ ${loginMember.memNo}+","+${pro.memNo}+","+ ${pro.proNo}+",${pro.proTitle}" + ",${loginMember.gitNick}," + 0 + ", 프로젝트에 참여를 취소했습니다!"; 
                                        						
                                        						console.log(socketMsg + "소켓메시지!!!!!!");
                                        						socket.send(socketMsg);  // 찐으로 소켓에게 메시지 보내기
                                        					}
                                        		          }
                                        			  }
                                        			  
                                        			  
                                        		  },
                                        		  error:function(){
                                        			  console.log("프로젝트 참여 취소용 아작스 실패ㅠㅠ")
                                        		  }
                                        		  
                                        	  })
                                        	  
                                         };
                                         
                                         
                                         
                                         
                                         
                                         // 위에서 만든 enrollProject 함수와 deleteProject 함수를 재 사용하는 부분 
                                         
                                         // 원래 있던 프로젝트 신청하기 버튼을 눌렀을 경우 enrollProject 함수 호출
                                         $("#enrollProject").click(function(){
                                       	  enrollProject();
                                         })
                                        	
                                          // 동적으로 만든 프로젝트 신청 버튼을 눌렀을 때 enrollProject함수 호출 
                                          $("#buttonArea").on("click","#enrollProject", function(){
                                        	  
                                        	  enrollProject();
                                        	  
                                          })
                                          
                                          
                                          // 동적으로 만든 프로젝트 참여 취소 버튼을 눌렀을 경우 deleteProject 함수 호출
                                          $("#buttonArea").on("click","#deleteProject", function(){
                                        	  deleteProject();
                                          })
                                         
                                          
                                         
                                          
                                      
                                        </script>
                                
                                </div>
                                
                            </div>
                            
                        </div>
                        
                        
                    </div>
                    
                </div>
                
				
			</div>
					
					<!-- 오른쪽에 위에는 친구/프로젝트 팀원들 모아놓는 card 이고 하단에는 프로젝트 참여신청한 임시 회원들 목록이 있는 card임-->
					<jsp:include page="../common/projectRightSide.jsp"></jsp:include>
            	
					
   
            
            </section>
	
	

            <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>


       

        </div>
         
    </div>

    
 
    

</body>
</html>