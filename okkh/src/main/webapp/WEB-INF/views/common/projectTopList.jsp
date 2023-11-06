<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<c:forEach var="p" items="${list }">
               <c:choose>
            		<c:when test="${not empty loginMember }">
	                <div  class="UJ-ProjectContent" onclick="location.href='selectDetailPro.pro?pno=' + ${p.proNo}" >
	
						<input type="hidden" value="${p.proNo }" id="proNo">
	
	                    <div style="padding-top: 7px; padding-left: 10px;">
	                    
	                      <!-- 모집중/ 모집완료표시 -->
	                      <c:choose>
		                      	<c:when test="${p.proStatus eq 'Y' }">
		                        	<button style="border:0; width: 80px; height: 35px; border-radius: 50px; margin-left:10px" class="btn btn-primary">모집중</button>
		                      	
		                      	</c:when>
		                      	
		                      	<c:otherwise>
		                      		<button style="border:0; width: 100px; height: 35px; border-radius: 50px; margin-left:10px" class="btn btn-light-secondary">모집 완료</button>
		                      	</c:otherwise>
	                      
						 </c:choose>
	                    </div>
	                    <!-- 마감일 , 북마크 -->
	                    <div id="UJ-dateMark">
	                        <div id="UJ-date">
	                            마감일 : ${p.proDeadLine }
	                        </div>
	                    </div>
	
	                    <!-- 제목 -->
	                    <div id="UJ-title">
	                        ${p.proTitle }
	                    </div>
	                    
	                    <!-- 기술 -->
	                    <div id="UJ-tech">
	                   		<!-- 모집 기술분야는 ,로 구분지어서 하나씩 값을 버튼 사이 text에 넣어주기 -->
	                    	<c:set var="position" value="${fn:split(p.proPosition,',') }"/>
	                    	
	                    	<c:forEach var="po" items="${position }">
	                        	<button style="width: 65px; font-size: 12px;">${po}</button>
	                        </c:forEach>
	                    </div>
	
	                    <!-- 기술 이미지 -->
	                    <div id="UJ-techImg">
	                    	<c:set var="stacks" value="${fn:split(p.proStack,',') }"/>
	                    	<c:forEach var="stack" items="${stacks }">
	                    		<c:set var="src" value="https://holaworld.io/images/languages/${stack}.svg" />
		                        	<img src="${src }" alt="${src }">
	                    	</c:forEach>
	                        <br>
	                        <hr>
	                    </div>
	                    
	                    <!-- 작성자 -->
	                    <div id="UJ-writer" style="padding-top: 10px;">
	                     조회수 : ${p.count } <br>
	                     작성자 : ${p.proWriter }
	                    </div>
	
	                </div>
	                </c:when>
	                
	                <c:otherwise>
	                 <div  class="UJ-ProjectContent" onclick="notLogin();">
	
						<input type="hidden" value="${p.proNo }" id="proNo">
	
	                    <div style="padding-top: 7px; padding-left: 10px;">
	                    
	                      <!-- 모집중/ 모집완료표시 -->
	                      <c:choose>
		                      	<c:when test="${p.proStatus eq 'Y' }">
		                        	<button style="border:0; width: 80px; height: 35px; border-radius: 50px; margin-left:10px" class="btn btn-primary">모집중</button>
		                      	
		                      	</c:when>
		                      	
		                      	<c:otherwise>
		                      		<button style="border:0; width: 100px; height: 35px; border-radius: 50px; margin-left:10px" class="btn btn-light-secondary">모집 완료</button>
		                      	</c:otherwise>
	                      
						 </c:choose>
	            
	                    </div>
	                    <!-- 마감일 , 북마크 -->
	                    <div id="UJ-dateMark">
	                        <div id="UJ-date">
	                            마감일 : ${p.proDeadLine }
	                            
	                        </div>
	                       
	                    </div>
	
	                    <!-- 제목 -->
	                    <div id="UJ-title">
	                        ${p.proTitle }
	                    </div>
	                    
	                    <!-- 기술 -->
	                    <div id="UJ-tech">
	                    	<!-- 모집 기술분야는 ,로 구분지어서 하나씩 값을 버튼 사이 text에 넣어주기 -->
	                    	<c:set var="position" value="${fn:split(p.proPosition,',') }"/>
	                    	
	                    	<c:forEach var="po" items="${position }">
	                        	<button style="width: 65px; font-size: 12px;">${po}</button>
	                        </c:forEach>
	                    </div>
	
	                    <!-- 기술 이미지 -->
	                    <div id="UJ-techImg">
	                    
	                    	<c:set var="stacks" value="${fn:split(p.proStack,',') }"/>
	                    	<c:forEach var="stack" items="${stacks }">
	                    		<c:set var="src" value="https://holaworld.io/images/languages/${stack}.svg" />
	                    	
			                        <img src="${src }" alt="${src }">
	                    	
	                    	</c:forEach>
	                    
	                     
	                        <br>
	                        <hr>
	
	                    </div>
	                    
	                    <!-- 작성자 -->
	                    <div id="UJ-writer" style="padding-top: 10px;">
	                     조회수 : ${p.count } <br>
	                     작성자 : ${p.proWriter }
	                    </div>
	
	                </div>
	                
	                </c:otherwise>
	            </c:choose>
	            
	                

			</c:forEach>
			</div>
</body>
</html>