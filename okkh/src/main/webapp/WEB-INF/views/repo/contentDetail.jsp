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
	                                                <tr>
					                                    <td class='text-bold-500'>
					                                    	<i class='fa-regular fa-file fa-shake'></i>
						                                    <span>${ content.name }</span>
						                                </td>
						                                <td class='text-bold-500'>${ recentCommit.commit.message }</td>
						                                <td class='text-bold-500'>
						                                	<img src="${ recentCommit.author.avatar_url }" height="20" width="20" style="border-radius: 15px;">
						                                	${ recentCommit.author.login }
						                                </td>
						                                <td class='text-bold-500'>${ fn:replace(fn:replace(recentCommit.commit.author.date, "T", " "), "Z", "") }</td>
					                                </tr>
					                                <tr>
					                                </tr>
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
                    
                    	$("#repo>tbody>tr").click(() => {
                    		
                    		$.ajax({
                				url:"selectCode.re",
                				data:{
                					mpno:${ mypro.myproNo },
                					rnm:"${ repoName }",
                					path:"${ content.path }"
                				},
                				success:(response) => {
                					
                					console.log(response);
                					
                					$("#code").text(response);
                					
                					$("#source").toggle();
                					
                				},
                				error:() => {
                					console.log("ㅠㅠ");
                				}
                			})
                    		
                    	})
                    </script>
                    <!-- /소스코드 호출 js 끝 -->
                    
                    <!-- 소스코드 호출 부분 시작 -->
				    <section class="section" id="source">
				        <div class="row">
				            <div class="col">
				                <div class="card">
				                    <div class="card-header">
				                        ${ content.name }
				                    </div>
				                    <div class="card-body">
				                        <div class="form-group with-title mb-3">
				                        	<pre id="code">
				                        		
				                        	</pre>
				                            <label>💻 Your Code</label>
				                        </div>
				                    </div>
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