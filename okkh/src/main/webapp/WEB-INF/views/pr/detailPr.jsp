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

                                                 
                                               <div style=" height: 400px;" id="UJ-summerDiv">
                                                   
                                                        ${pr.prContent }
                                                      
                                                </div>
                                    				
                                    				
												                 
                                        
                                        <!-- <hr style=" margin-left:23;"> -->

                            


											

                                           <!-- 제출하기 버튼 -->
                                           <!-- 작성한 사람만 보이게 하기 -->
                                            <div class="col-12 d-flex justify-content-end" style="margin-top:40px;">
                                               
                                              <c:choose>
                                              	<c:when test="${loginMember.memNo eq pr.memNo }">
                                              	         
	                                                <button type="button" class="btn btn-primary me-1 mb-1" onclick="location.href='updatePrForm.pr?pno='+ ${pr.prNo}">수정하기</button>
	                                                <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='deletePr.pr?pno='+${pr.prNo}">삭제하기</button>
	                                                 <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='personalList.pr'">뒤로가기</button>
                                              	</c:when>
                                             
                                               
                                               <c:otherwise>
                                                 <button type="button" class="btn btn-light-secondary me-1 mb-1" onclick="location.href='personalList.pr'">뒤로가기</button>
                         						</c:otherwise>
                         						
                         					</c:choose> 
                                            </div>
                                        </div>
                                    </form>

                                   
                    
                                    <!-- <hr style="width: 810px;" > -->

                                    <hr>
                                   <!------------------------------댓글------------------------------->
                                    <div id="UJ-reply">


                                    <table class="replyTable" align="center"  width=900 >

                                            <!-- 로그인 한 회원이 볼 화면  -->
                                        
                                        <thead style="width:100%; ">
                                            <tr >
                                                <th colspan="3"  >
                                                 
                                                    <p>&nbsp;</p>
                                                </th>
                                               
                                            </tr>
                        
                        
                        				<c:choose>
                        					<c:when test="${not empty loginMember }">
                        				
                                              <tr >
                                        
                                                <th colspan="4"  >
                                                  <input type="text" placeholder="댓글을 입력하세요" style=" padding-left:10px; width: 600px;" id="UJreply" name="replyContent">
                                                
                                                    <button style="width: 90px;" class="btn btn-primary" onclick="UJinsertReply();">작성</button>
                                                  
                                                </th>
                                                
                                               </tr> 
                                                
                                          	</c:when>
                                          	
                                          	<c:otherwise>
                                          	
                                          	 <th colspan="4"  >
                                                  <input type="text" placeholder="로그인 후 이용가능한 서비스입니다." style=" padding-left:10px; width: 600px;" id="UJreply" readonly>
                                                
                                                    <button style="width: 90px;" class="btn btn-primary" onclick="UJinsertReply();" disabled>작성</button>
                                                  
                                                </th>
                                                
                                               </tr> 
                                          	
                                          	</c:otherwise>
                                          	
                                         </c:choose>     
                                                
                                              
                                               
                        
                        
                                                <tr >
                                            
                                                    <th colspan="3"  >
                                                     
                                                        <p>&nbsp;</p>
                                                    </th>
                                                   
                                                  
                                                </tr>
                                                
                                                <tr >
                                               		<td  style="padding-left:10px; padding-bottom:20px; font-size:18px; font-weight:900;">댓글 (<span id="rcount">0</span>) </td>
                                                </tr>

                                            </thead>


                                            <tbody id="UJ-PRTbody"  >
                                                <!-- 작성한 댓글을 ajax로 여기다가 그릴 예정   -->
                                               
                            
                            
                                             </tbody>
                            				
                            					<tfoot>
                            					
		                                                <th colspan="3"  >
		                                                         
		                                                    <p>&nbsp;</p>
		                                                </th>
                            					
                            					</tfoot>
                            	
                                              
                                            </table>
                            
                                        </div> 
                                        
                                         <!-- 댓글 작성하는 script -->
                                        <script>
                                        
                                        // 상세페이지 로딩되자마자 실행할 함수 
                                        // 실행되자마자 댓글 조회해오기
                                        $(function(){
                                        	selectPrReplyList();
                                        	
                                        	
                                        })
                                        
                                        
                                        // 댓글 작성하는 함수
                                        	function UJinsertReply(){
                                        		
                                        if($("#UJreply").val().trim().length != 0){
                                        	$.ajax({
                                    			
                                    			url:"insertReply.pr",
                                    			data:{
                                    				refPno:${pr.prNo},
                                    				replyWriter:'${loginMember.memNo}',
                                    				replyContent: $("#UJreply").val(),
                                    				memNo : ${loginMember.memNo}

                                    			},
                                    			success:function(result){
                                    				
                                    				if(result =="success"){
                                    					// 댓글 작성성공하면 다시 댓글 리스트 조회해오는 함수 호출
                                    					// alert("댓글 작성 성공!")
                                    					$("#UJreply").val("")
                                    					selectPrReplyList();
                                    					
                                    				}
                                    			},
                                    			
                                    			error:function(){
                                    				console.log("pr 댓글 작성용 ajax실패ㅠㅠ");
                                    			}
                                    			
                                    		})
                                        }else{
                                        	// 만약 댓글에 공백만 있다면 
                                        	alert("댓글 작성 후 등록해주세요")
                                        }	
                                        	
                                      };
                                        	
                                        
                                        // 댓글 조회하는 ajax
                                        function selectPrReplyList(){
                                        	$.ajax({
                                        		url:"prReplyList.pr",
                                        		data:{pno:${pr.prNo}},
                                        		success:function(list){
                                        			
                                        			let value = "";
                                        			
                                        			for(var i in list){
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
                                        			
                                        			$(".replyTable tbody").html(value)
                                        			$("#rcount").text(list.length)
                                        			
                                        		},
                                        		error:function(){
                                        			console.log()
                                        		}
                                        	})
                                        };
                                    
                                     
                                          
                                        // 삭제하는 함수
                                       function deleteReplyBtn(num){
                                        	
                                        	// 댓글 삭제 버튼을 누르면 댓글 삭제하는 ajax 실행하기 
                                        		$.ajax({
                                        			url:"deletePrReply.pr",
                                        			data:{
                                        				pno:num
                                        			},
                                        			success:function(result){
                                        				
                                        				if(result === "success"){
                                        					// 댓글 삭제 성공하면 alert띄우고
                                        					// 댓글 조회 함수 호출
                                        					
                                        					alert("댓글 삭제 성공!")
                                        					selectPrReplyList();
                                        				}else{
                                        					alert("댓글 삭제 실패ㅠㅠ")
                                        				}
                                        				
                                        			},
                                        			error:function(){
                                        				console.log("댓글 삭제용 ajax 실패ㅠㅠ")
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