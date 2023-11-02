<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>
<!-- 에디터 css -->
<link rel="stylesheet" href="resources/assets/extensions/quill/quill.snow.css">
<link rel="stylesheet" href="resources/assets/extensions/quill/quill.bubble.css">
<style>
	#source {
		display: none;
	}
	#repo tbody>tr:hover {
		cursor: pointer;
		background-color: #f8f8f8;
	}
</style>
</head>

<body>

    <!-- 전체 div 시작 -->
    <div id="app">
        <!-- 사이드바 시작 -->
        <jsp:include page="../common/leftSide.jsp"/>
        <!-- 사이드바 끝 -->

        <!-- 메인 시작 -->
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="../common/header.jsp"/>
            <!-- 상단바 끝 -->
            
            <div class="page-heading" style="margin-left: 20px; margin-top: 15px;">

                <!-- 페이지 제목 시작 -->
                <h3 style="float: left; margin-right: 10px;">${ repoName }</h3>
                <span class="badge bg-light-secondary">${ visibility }</span>
                <!-- /페이지 제목 끝 -->

            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->
            
			<!-- 이슈, 마일스톤, 풀리퀘 버튼 시작 -->
			<div class="buttons">
				<a href="list.iss?owner=${ mypro.myproTitle }&repo=${ repoName }" class="btn btn-outline-primary"><i class="bi bi-stack"> Issues</i></a>
				<a href="list.mile?owner=${ mypro.myproTitle }&repo=${ repoName }" class="btn btn-outline-info"><i class="bi bi-puzzle"></i> Milestones</a>
				<a href="myPullRequest.pu?owner=${ mypro.myproTitle }&repo=${ repoName }" class="btn btn-outline-success"><i class="fa-solid fa-code-pull-request"></i> Pull Requests</a>
			</div>
			<!-- /이슈, 마일스톤, 풀리퀘 버튼 끝 -->
			
            <!-- 내용 시작 -->
            <div class="page-content"> 
                <section class="row">
                    <!-- 왼쪽 내용 시작 -->
                    <!-- 소스 리스트 시작 -->
                    <section class="section">
                        <div class="row" id="table-head">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">
                                        	<img src="${ avatar_url }" height="20" width="20" style="border-radius: 15px;"> ${ mypro.myproTitle }
                                        </h4>
                                    </div>
                                    <div class="card-body">
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table mb-0" id="repo">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>NAME</th>
                                                        <th>RECENT COMMIT</th>
                                                        <th>AUTHOR</th>
                                                        <th>DATE</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="c" items="${ list }">
	                                                <tr>
					                                    <td class='text-bold-500'>
						                                    <c:choose>
						                                    	<c:when test="${ fn:contains(c.name, '.') }">
						                                    		<i class='fa-regular fa-file fa-bounce'></i>
						                                    	</c:when>
						                                    	<c:otherwise>
						                                    		<c:choose>
							                                    		<c:when test="${ c.name eq c.path }">
								                                    		<i class='fa-solid fa-folder fa-bounce'></i>
							                                    		</c:when>
							                                    		<c:otherwise>
								                                    		<i class='fa-solid fa-folder-open fa-bounce'></i>
							                                    		</c:otherwise>
						                                    		</c:choose>
						                                    	</c:otherwise>
						                                    </c:choose>
						                                    <span>${ c.name }</span>
						                                </td>
						                                <td class='text-bold-500'>${ recentCommit.commit.message }</td>
						                                <td class='text-bold-500'>
						                                	<img src="${ recentCommit.author.avatar_url }" height="20" width="20" style="border-radius: 15px;">
						                                	${ recentCommit.author.login }
						                                </td>
						                                <td class='text-bold-500'>${ fn:replace(fn:replace(recentCommit.commit.author.date, "T", " "), "Z", "") }</td>
					                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- /소스 리스트 끝 -->
                    
                    <!-- 소스코드 호출 js 시작 -->
                    <script>
                    
                    	/* repo contents ajax 호출 방식
                    	$(() => {
                    		
                    		let str = "";
                    		
                    		selectRepoContents(str);	
                    		
                    		function selectRepoContents(str) {
                    				
                    			$.ajax({
                    				url:"selectRepoContents.re",
                    				data:{
                    					mpno:${ myproNo },
                    					rnm:"${ repoName }",
                    					path:str
                    				},
                    				success:(response) => {
                    					console.log(response);
                    					
                    					let value = "";
                    					
                    					let name = "";
                    					
              							for(let i in response) {
              								value += "<tr>"
			                                          + "<td class='text-bold-500'><i class='fa-regular fa-file fa-bounce'></i>" 
			                                          +		response[i].name
				                                      +  "</td>"
				                                      +  "<td class='text-bold-500'>로그인 기능 수정</td>"
				                                      +  "<td class='text-bold-500'>2시간 전</td>"
				                                   + "</tr>"
              							}
              							
              							$("#repo>tbody").html(value);
              							
              							$("#repo>tbody>tr").click(() => {
                                			
                                			console.log($(this).html());
                                			
                                			//$("#source").toggle();
                                			
                                			//$("#source h6").text("hihi");
                                			
                                		})
              
                    				},
                    				error:() => {
                    					console.log("ㅠㅠ");
                    				}
                    			})
                    		
                    		}
                    		
                    	})
                    	*/
                    	
                    	$("#repo>tbody>tr").click(function() {
                    		
                    		console.log($(this).children().eq(0).children("span").text());
                    		
                    	})
                    
                    </script>
                    <!-- /소스코드 호출 js 끝 -->
                    
                    <!-- 소스코드 호출 부분 시작 -->
                    <section class="section" id="source">
				        <div class="card">
				            <div class="card-header">
				                <h6 class="card-title"></h6>
				            </div>
				            <div class="card-body">
				                <div id="full">
				                	<pre>
				                		<code>
									 		<div style="display:flex; flex-direction:row;"></div>
									    	<div style="display:flex; flex-direction:row;"></div>
											
											
											![header](https://capsule-render.vercel.app/api?type=waving&color=timeGradient&text=Welcome%20to%20NEXUS%20Project%20👋&animation=twinkling&fontSize=35&fontAlignY=40&fontAlign=70&height=250)
											
											
											# 프로젝트명 NEXUS
											
											
											NEXUS는 **연결, 관계, 집합체**를 뜻하는 단어로 여러 다른 것들과 이어져 있다는 의미를 가지고 있습니다.
											세상엔 아주 다양한 사람들이 존재하고 각자의 능력과 역할이 다르지만  NEXUS를 통해 서로 협업하여 프로젝트를 성공적으로 완수할 수 있는 결합점을 형성하고자 하는 의도로 ‘NEXUS’를  프로젝트명으로 선택했습니다.
											
											<br><br>
											# 프로젝트 설명
											
											**NEXUS - 협업을 위한 실시간 소통 플랫폼**
											 
											<br>
											깃허브를 기반으로 한 실시간 소통 플랫폼으로, 팀원들 간의 원활한 소통과 협업을 돕는 서비스입니다. 
											
											깃허브의 코드, 이슈, 프로젝트와 결합하여 실시간 채팅, 알림, 커뮤니티 기능을 제공하여 팀의 협업 효율성을 향상시킵니다.
											
											 
											 
											  <div style="display:flex; flex-direction:row;">
											
											 - 프로젝트 관리
											 - 챗봇
											 - 이슈 트래킹
											 - 커뮤니티 기능
											 - 뉴스
											 - 실시간 채팅
											 - 프로젝트 일정 관리
											 - 친구 
											 
											</div>
											<br><br>
											
											
											# 개발배경
											 <div style="display:flex; flex-direction:row;">
											
											현재 많은 사람들이 깃허브를 이용해 협업을 진행하고 있습니다. 협업에서 가장 중요한 것은 팀원들 간의 소통이라고 생각합니다. 
											 그러나 깃허브에서는 협업하고 있는 repository에 어떤 이벤트가 발생했다는 것을 실시간으로 알려주지 않습니다.
											 그래서 카카오톡과 같은 여러 메신저 플랫폼을 이용해 자신이 어떤 이벤트를 발생시켰는지 알려줘야 합니다. 
											 이러한 문제를 해결하기 위해 깃허브에서 제공하는 기능 일부(코드,이슈,프로젝트)와 실시간 채팅, 실시간 알림, 커뮤니티 기능들을 활용하여 팀원들 간의 소통 기능을 향상시킬 수 있는 서비스를 기획하였습니다.
											
											</div>

				                		</code>
				                	</pre>
				                </div>
				            </div>
				        </div>
				    </section>
                    <!-- /소스코드 호출 부분 끝 -->
                    <!-- /왼쪽 내용 끝 -->
                </section>
            </div>
            <!-- /내용 끝 -->

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
	
	<!-- 에디터 js -->
	<script src="resources/assets/extensions/quill/quill.min.js"></script>
	<script src="resources/assets/static/js/pages/quill.js"></script>
</body>

</html>