<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OKKH - 이곳에서 꿈을</title>
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
            
            <div class="page-heading" style="margin-left: 10px;">

                <!-- 페이지 제목 시작 -->
                <!-- <h3 style="float: left; width: 65%;">My Repositories</h3> -->
                <!-- /페이지 제목 끝 -->

                <!-- Button trigger for 레파지 추가 form modal -->
                <br>
                <h3>My Repository</h3>
            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 컨텐츠 시작 -->
            <div class="page-content">
            	<!-- 본문 시작 -->
                <section class="row">
                	<!-- 프로젝트 상세페이지 시작 -->
             		<div class="col-12 col-lg-9">
		                <div class="card">
		                    <div class="card-body">
		                    	<!-- 프로젝트명 시작 -->
		                        <ul class="nav nav-tabs" id="myTab" role="tablist" style="float: left; width: 50%;">
		                            <li class="nav-item" role="presentation">
		                                <a class="nav-link active" id="ing-tab" data-bs-toggle="tab" href="#ing" role="tab" aria-controls="home" aria-selected="true">
		                                    <c:choose>
		                                    	<c:when test="${ not empty mypro }">
		                                    		${ mypro.myproTitle }
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		New Project
		                                    	</c:otherwise>
		                                    </c:choose>
	                                  	</a>
		                            </li>
		                        </ul>
		                        <!-- /프로젝트명 끝 -->
		                        <!-- 레파지 추가 버튼 시작 -->
		                        <button id="newRepo" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inlineForm" style="float: right;">
				                    New Repository
				                </button>
				                <!-- /레파지 추가 버튼 끝 -->
				                <br>
				                <!--레파지 추가 form Modal 시작 -->
				                <div class="modal fade text-left" id="inlineForm" tabindex="-1"
				                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
				                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				                        role="document">
				                        <div class="modal-content">
				                            <div class="modal-header bg-primary">
				                                <h5 class="modal-title white" id="myModalLabel160">
				                                    New Repository
				                                </h5>
				                                <button type="button" class="close"
				                                    data-bs-dismiss="modal" aria-label="Close">
				                                    <i data-feather="x"></i>
				                                </button>
				                            </div>
				                            <form action="insertRepo.re" id="enrollForm">
				                            	<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
				                                <div class="modal-body">
				                                    <label>Repository Name*:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="레파지토리 이름을 입력해주세요."
				                                            class="form-control" name="repoTitle">
				                                        <br>
				                                    	<div id="checkResult" style="font-size:0.8em; display: none;">
                    										<!-- 레포 이름 유효성 검사 결과가 출력될 자리 -->
                    									</div>
				                                    </div>
				                                    <label>Description:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="레파지토리에 대한 설명을 입력해주세요."
				                                            class="form-control" name="repoContent">
				                                    </div>
				                                    <label>Public or Private:</label>
				                                    <div class="form-group">	
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="public" id="Public" checked>
								                            <label class="form-check-label" for="Public">
								                                Public
								                            </label>
								                        </div>
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="private" id="Private">
								                            <label class="form-check-label" for="Private">
								                                Private
								                            </label>
								                        </div>
				                                    </div>
				                                    <label>ReadMe:</label>
				                                    <div class="form-group">
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="ReadMe"
								                                id="ReadMe" checked disabled>
								                            <label class="form-check-label" for="ReadMe">
								                                ReadMe
								                            </label>
								                        </div>
				                                    </div>
				                                </div>
				                                <div class="modal-footer">
				                                    <button type="button" class="btn btn-light-secondary"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-x d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Cancel</span>
				                                    </button>
				                                    <button type="submit" class="btn btn-primary ml-1"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-check d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Create</span>
				                                    </button>
				                                </div>
				                            </form>
				                        </div>
				                    </div>
				                </div>
				                <!--/레파지 추가 form Modal 끝 -->
				                
				                <!-- 레포명 유효성 검사 시작 -->
				                <script>
							    	$(function() {
							    		// 레포명을 입력하는 input 요소객체 변수에 담아두기
							    		const $titleInput = $("#enrollForm input[name=repoTitle]");
							    		
							    		$titleInput.keyup(function() {
							    			//console.log($titleInput.val());
							    			
							    			// 최소 5글자 이상으로 입력이 되어있을 때만 ajax를 요청해서 중복체크 하도록
							    			if($titleInput.val().length >= 1) {
								    			$.ajax({
								    				url:"repoTitleCheck.re",
								    				data:{
								    					checkTitle:$titleInput.val(),
								    					myproTitle:"${ mypro.myproTitle }"
								    				},
								    				success:function(result) {
								    					
								    					console.log(result);
								    					
								    					// => 빨간색 메세지 (사용불가능) 출력
							    						$("#checkResult").show();
							    						$("#checkResult").css("color", "#dc3545").text("같은 이름의 레파지토리가 존재합니다. 다른 이름을 사용해 주세요.");    						
							    						
							    						// => 버튼 비활성화
							    						$("#enrollForm :submit").attr("disabled", true);
								    					
								    				},
								    				error:function() {
								    					
								    					// => 초록색 메세지 (사용가능) 출력
							    						$("#checkResult").show();
							    						$("#checkResult").css("color", "#198754").text("레파지토리명으로 사용 가능합니다!!");	  
							    						
							    						// => 버튼 활성화
							    						$("#enrollForm :submit").removeAttr("disabled");
								    					
								    				}
								    			});
							    			}
							    			else { // 5글자 미만일 경우 => 메시지 숨기기, 버튼 비활성화
							    				$("#checkResult").hide();
							    			
							    				$("#enrollForm :submit").attr("disabled", true);
							    			}
							    		});
							    	})
							    </script>
							    <!-- /프로젝트명 유효성 검사 끝 -->
				                
				                <c:choose>
				                	<c:when test="${ not empty repoList }">
				                		<!-- 레파지토리 리스트 시작 -->
				                        <div class="tab-content" id="myTabContent">
				                            <div class="tab-pane fade show active" id="ing" role="tabpanel" aria-labelledby="ing-tab">
				                            	<br><br>
							                    <div class="col-12">
							                        <div class="row">
							                        	<c:forEach var="r" items="${ repoList }">
								                            <!-- 레파지토리 시작 -->
								                            <div class="col-6 col-lg-3 col-md-6">
								                                <div class="card" style="border: 1px solid #cecece; height: 150px;">
							                                    	<div class="card-body px-3 py-4-5">
								                                    	<a href="repoDetail.re?pno=${ mypro.myproNo }&rnm=${ r.name }&vis=${ r.visibility }&ava=${ r.owner.avatar_url }">
									                                        <div class="row">
									                                            <div class="col-md-4">
									                                                <!-- <div class="stats-icon blue">
									                                                    <i class="iconly-boldShow"></i>
									                                                </div> -->
									                                                <img src="${ r.owner.avatar_url }" width="50" height="50" style="border-radius: 50px; border: 1px solid #cecece;">
									                                            </div>
									                                            <div class="col-md-8">
									                                                <h6 class="text-muted font-semibold">${ r.visibility }</h6>
									                                                <h5 class="font-extrabold mb-0">${ r.name }</h5>
									                                            </div>
									                                        </div>
							                                    		</a>
							                                    		<br>
						                                    			<form action="deleteRepo.re" method="post" style="float: right; margin-left: 8px;">
								                                			<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
										                                	<input type="hidden" name="myproTitle" value="${ mypro.myproTitle }">
										                                	<input type="hidden" name="repoTitle" value="${ r.name }">
								                                			<button class="btn btn-sm btn-outline-danger" onclick="return deleteBtn();">삭제</button>
						                                    			</form>
							                                    		<input onclick="getOriginRepo('${ r.name }', '${ r.description }', '${ r.visibility }');" type="button" value="수정" class="btn btn-sm btn-outline-warning" data-bs-toggle="modal" data-bs-target="#updateRepoForm" style="float: right; margin-left: 8px;">
							                                    		<button id="inviteMember" type="button" class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#inviteMemberForm" style="float: right;">초대</button>
								                                    </div>
								                                </div>
								                            </div>
								                            <!-- /레파지토리 끝 -->
							                           	</c:forEach>
							                        </div>
							                    </div>
				                            </div>
				                        </div>
				                        <!-- /레파지토리 리스트 끝 -->
				                	</c:when>
				                	<c:otherwise>
				                		<br><br>
				                		<div>레파지토리가 없습니다. 새로운 레파지토리를 생성해주세요.</div>
				                	</c:otherwise>
				                </c:choose>
				                
				                <script>
	
									function deleteBtn() {
										
										return confirm("정말로 삭제하시겠습니까?");
										
									};
									
									function getOriginRepo(name, des, vis) {
										
										$("#repoTitle").val(name);
										
										$("input[name=updateTitle]").val(name);
										$("input[name=repoContent]").val(des)
										$("input[value=" + vis + "]").attr("checked", true);
										
									};
									
									$(() => {
										
										// 초대 버튼을 눌렀을 때 실행되는 function
								   		$("#inviteMember").click(() => {
								   			
								   			$.ajax({
								   				url:"selectTeamMateList.re",
								   				success:(teamMate) => {
								   					
								   					console.log(teamMate);
								   					
								   					let value = "";
								   					
								   					let teamArr = [];
								   					
								   					if(teamMate.length == 1) {
								   						
								   						value = "팀원이 없습니다.";
								   						
								   					}
								   					else {
								   						
									   					for(let i in teamMate) {
									   						
									   						value +=  "<a href='#' class='btn btn-outline-primary'><img src='" + teamMate[i].profile + "' width='25' height='25' style='border-radius: 20px;'>"
								   								+ teamMate[i].gitNick
								   								+ "</a>";
								   								
								   							teamArr[i] = teamMate[i].gitNick;
								   								
									   					}
									   					
								   					$("#teamMate").html(value);
								   					
								   					console.log(teamArr);
								   					
								   					let members = teamArr.join();
								   					
								   					console.log(members);
								   					
								   					$("input[name=myproMember]").val("${ loginMember.gitNick }" + "," + members);
								   					
								   					}
								   					
								   				},
								   				error:() => {
								   					console.log("new Project ajax failed");
								   				}
								   			})
								   			
								   		})
										
									})
							
								</script>
				                
				                <!--레파지 수정 form Modal 시작 -->
				                <div class="modal fade text-left" id="updateRepoForm" tabindex="-1"
				                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
				                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				                        role="document">
				                        <div class="modal-content">
				                            <div class="modal-header bg-primary">
				                                <h5 class="modal-title white" id="myModalLabel160">
				                                    Update Repository
				                                </h5>
				                                <button type="button" class="close"
				                                    data-bs-dismiss="modal" aria-label="Close">
				                                    <i data-feather="x"></i>
				                                </button>
				                            </div>
				                            <form action="updateRepo.re">
				                            	<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
				                            	<input type="hidden" id="repoTitle" name="repoTitle" value="">
				                                <div class="modal-body">
				                                    <label>Repository Name*:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="수정할 레파지토리명을 입력해주세요."
				                                            class="form-control" name="updateTitle">
				                                    </div>
				                                    <label>Description:</label>
				                                    <div class="form-group">
				                                        <input type="text" placeholder="수정할 설명을 입력해주세요."
				                                            class="form-control" name="repoContent">
				                                    </div>
				                                    <label>Public or Private:</label>
				                                    <div class="form-group">	
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="public" id="Public" checked>
								                            <label class="form-check-label" for="Public">
								                                Public
								                            </label>
								                        </div>
				                                        <div class="form-check">
								                            <input class="form-check-input" type="radio" name="repoStatus" value="private" id="Private">
								                            <label class="form-check-label" for="Private">
								                                Private
								                            </label>
								                        </div>
				                                    </div>
				                                </div>
				                                <div class="modal-footer">
				                                    <button type="button" class="btn btn-light-secondary"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-x d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Cancel</span>
				                                    </button>
				                                    <button type="submit" class="btn btn-primary ml-1"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-check d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Update</span>
				                                    </button>
				                                </div>
				                            </form>
				                        </div>
				                    </div>
				                </div>
				                <!--/레파지 수정 form Modal 끝 -->
				                
				                <!--친구 초대 form Modal 시작 -->
				                <div class="modal fade text-left" id="inviteMemberForm" tabindex="-1"
				                    role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
				                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				                        role="document">
				                        <div class="modal-content">
				                            <div class="modal-header bg-primary">
				                                <h5 class="modal-title white" id="myModalLabel160">
				                                    Invite Member
				                                </h5>
				                                <button type="button" class="close"
				                                    data-bs-dismiss="modal" aria-label="Close">
				                                    <i data-feather="x"></i>
				                                </button>
				                            </div>
				                            <form action="inviteMember.re">
				                            	<input type="hidden" name="myproNo" value="${ mypro.myproNo }">
				                                <div class="modal-body">
				                                    <label class="forTeam">Project Member:</label>
				                                    <div id="teamMate" class="form-group forTeam">
								                    	<!-- 팀원 목록이 노출될 자리 -->
				                                    </div>
				                                </div>
				                                <div class="modal-footer">
				                                    <button type="button" class="btn btn-light-secondary"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-x d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Cancel</span>
				                                    </button>
				                                    <button type="submit" class="btn btn-primary ml-1"
				                                        data-bs-dismiss="modal">
				                                        <i class="bx bx-check d-block d-sm-none"></i>
				                                        <span class="d-none d-sm-block">Invite</span>
				                                    </button>
				                                </div>
				                            </form>
				                        </div>
				                    </div>
				                </div>
				                <!--/친구 초대 form Modal 끝 -->
				                
		                    </div>
		                </div>
		            </div>
		            <!-- /프로젝트 상세페이지 끝 -->
		            
                    <!-- 친구 및 팀원 시작 -->
                    <jsp:include page="../common/rightSide.jsp"/>
                    <!-- 친구 및 팀원 끝 -->
                    
                </section>
                <!-- /본문 끝 -->
            </div>
            <!-- /컨텐츠 끝 -->

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
	
</body>

</html>