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
			<!-- 호버하면 각 기능에 대한 설명 나옴 -->
			<div class="buttons" >
				<a href="list.iss?repository=${ mypro.myproTitle }/${ repoName }" class="btn btn-outline-primary  " data-bs-toggle="tooltip" data-bs-placement="top"
				title="Issues는 작업, 개선 사항, 버그 및 기타 프로젝트 관련 활동을 Label을 통해 관리할 수 있는 기능입니다. (Label은 버그, 개선 사항, 문서화 등의 성격을 기준으로 문제를 분류하고 필터링하는 데 사용합니다.)"><i class="bi bi-stack"> Issues</i></a>
				<a href="list.mile?repository=${ mypro.myproTitle }/${ repoName }" class="btn btn-outline-info " data-bs-toggle="tooltip" data-bs-placement="top"
				title="MileStones는 Issue에 대한 진행 상황을 확인 및 관리할 수 있는 프로젝트 관리 도구입니다."><i class="bi bi-puzzle"></i> Milestones</a>
				<a href="myPullRequest.pu?repository=${ mypro.myproTitle }/${ repoName }" class="btn btn-outline-success" data-bs-toggle="tooltip" data-bs-placement="top"
				title="Pull-Request는 작업한 코드에 대한 검토를 용이하게 하는 기능입니다. Pull-Request를 생성하기 위해서는 새 브랜치를 생성 및 커밋한 기록이 있어야 합니다."><i class="fa-solid fa-code-pull-request"></i> Pull Requests</a>
				<a href="commitList.re?owner=${ mypro.myproTitle }&repo=${ repoName }&vis=${ visibility }&avatar=${ avatar_url }" class="btn btn-outline-warning" data-bs-toggle="tooltip" data-bs-placement="top"
				title="Commit List에서는 모든 팀원이 Commit한 기록을 확인할 수 있습니다."><i class="fa-solid fa-code-commit"></i> Commit List</a>
			</div>
			<!-- /이슈, 마일스톤, 풀리퀘 버튼 끝 -->



			
	   <!-- 각 기능들 호버 했을 때 나오는 메세지에 대한 스크립트 -->
		<script>
		
			document.addEventListener('DOMContentLoaded', function () {
				var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
				var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
					return new bootstrap.Tooltip(tooltipTriggerEl)
				})
			}, false);
		</script>




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
                                    	<!-- 프로젝트명 시작 -->
                                        <h4 class="card-title" style="float: left;">
                                        	<img src="${ avatar_url }" height="20" width="20" style="border-radius: 15px;"> ${ mypro.myproTitle }
                                        </h4>
                                        <!-- /프로젝트명 끝 -->
                                        <!-- Merge 버튼 시작 -->
                                        <form action="merge.re" method="post">
                                        	<input type="hidden" name="owner" value="${ mypro.myproTitle }">
                                        	<input type="hidden" name="repo" value="${ repoName }">
                                        	<input type="hidden" name="branch" value="">
		                                    <button onclick="return mergeCheck();" class="btn btn-primary" style="float: right;">Merge</button>
                                        </form>
	                                    <!-- /Merge 버튼 끝 -->
	                                    
	                                    <script>
	                                    
	                                    	function mergeCheck() {
	                                    		
	                                    		return confirm("머지 하시겠습니까?");
	                                    		
	                                    	}
	                                    	
	                                    	function branch(str) {
	                                    		
	                                    		$("input[name=branch]").val(str);
	                                    		
	                                    	}
	                                    
	                                    </script>
	                                    
	                                    <!-- branch list 시작 -->
                                        <fieldset class="form-group" style="float: right;">
	                                        <select class="form-select" id="branch" onchange="branch(this.value);">
	                                        	<c:forEach var="b" items="${ bList }">
		                                            <option value="${ b.name }">${ b.name }</option>
	                                        	</c:forEach>
	                                        </select>
	                                    </fieldset>
	                                    <!-- /branch list 끝 -->
	                                    
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
					                                    	<!-- 아이콘 시작 -->
						                                    <c:choose>
						                                    	<c:when test="${ fn:contains(c.name, '.') }">
						                                    		<i class='fa-regular fa-file fa-shake'></i>
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
						                                    <!-- /아이콘 끝 -->
						                                    <span>${ c.name }</span>
						                                    <input type="hidden" name="path" value="${ c.path }">
						                                </td>
						                                <td class='text-bold-500'>${ recentCommit.commit.message }</td>
						                                <td class='text-bold-500'>
						                                	<img src="${ recentCommit.author.avatar_url }" height="20" width="20" style="border-radius: 15px;">
						                                	${ recentCommit.author.login }
						                                </td>
						                                <td class='text-bold-500'>${ fn:substring(recentCommit.commit.author.date, 0, fn:indexOf(recentCommit.commit.author.date, "T")) }</td>
					                                </tr>
					                                <tr>
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
                    		
                    		let $path = $(this).children().eq(0).children("input").val();
                    		
                    		if($path.includes(".")) {
                    			location.href = "contentDetail.re?pno=${ mypro.myproNo }&rnm=${ repoName }&vis=${ visibility }&ava=${ avatar_url }&path=" + $path;
                    		}
                    		else {
                    			location.href = "repoDetail.re?pno=${ mypro.myproNo }&rnm=${ repoName }&vis=${ visibility }&ava=${ avatar_url }&path=" + $path;
                    		}
                    		
                    	})
                    	
                    </script>
                    <!-- /소스코드 호출 js 끝 -->
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