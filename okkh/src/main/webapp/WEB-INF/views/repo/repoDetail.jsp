<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<a href="list.iss" class="btn btn-outline-primary"><i class="bi bi-stack"> Issues</i></a>
				<a href="#" class="btn btn-outline-info"><i class="bi bi-puzzle"></i> Milestones</a>
				<a href="myPullRequest.pu" class="btn btn-outline-success"><i class="fa-solid fa-code-pull-request"></i> Pull Requests</a>
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
                                        	<img src="https://avatars.githubusercontent.com/u/126389803?s=40&amp;v=4" height="20" width="20" style="border-radius: 15px;"> YoonTarget
                                        </h4>
                                    </div>
                                    <div class="card-body">
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table mb-0" id="repo">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>NAME</th>
                                                        <th>COMMIT</th>
                                                        <th>WHEN</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<!--  
                                                    <tr>
                                                        <td class="text-bold-500">
                                                   			<i class="fa-regular fa-folder-open fa-bounce"></i> okkh
                                                        </td>
                                                        <td class="text-bold-500">로그인 기능 수정</td>
                                                        <td class="text-bold-500">2시간 전</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold-500">
                                                        	<i class="fa-regular fa-file fa-bounce"></i> README.md
                                                        </td>
                                                        <td class="text-bold-500">리드미 수정</td>
                                                        <td class="text-bold-500">3일 전</td>
                                                    </tr>
                                                    -->
                                                    
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
                    					
              							for(let i in response) {
              								value += "<tr>"
			                                          + "<td class='text-bold-500'><i class='fa-regular fa-folder-open fa-bounce'></i>" 
			                                          +		response[i].name
				                                      +  "</td>"
				                                      +  "<td class='text-bold-500'>로그인 기능 수정</td>"
				                                      +  "<td class='text-bold-500'>2시간 전</td>"
				                                   + "</tr>"
              							}
              							
              							$("#repo tbody").html(value);
              							
              							$("#repo tbody>tr").click(() => {
                                			
                                			//selectRepoContents();
                                			
                                			console.log($(this));
                                			
                                			$("#source").toggle();
                                			
                                			$("#source h6").text("hihi");
                                			
                                		})
              
                    				},
                    				error:() => {
                    					console.log("ㅠㅠ");
                    				}
                    			})
                    		
                    		}
                    		
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
				                		hihi
					                		/**
											 * 레포지토리에 속한 컨텐츠 조회용 Controller
											 * 
											 * @return
											 * @throws IOException
											 */
				                			@RequestMapping(value = "selectRepoContents.re", produces = "application/json; charset=UTF-8")
											public String selectRepoContents(int mpno, String rnm, HttpSession session, Model model) throws IOException {
												
												MyProject mypro = rService.selectMyProjectTitle(mpno);
												
												String token = (String)session.getAttribute("token");
												
												GitHub g = new GitHub();
												
												g.setMethod("GET");
												g.setToken(token);
												g.setUri("/repos/" + mypro.getMyproTitle() + "/" + rnm + "/contents");
												
												String response = getGitHubAPIValue(g);
												
												System.out.println(token);
												System.out.println(response);
										
												return response;
												
											}
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