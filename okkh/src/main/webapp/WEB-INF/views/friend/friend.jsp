<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
	
		/* 전체 / 모집 중 / 모집 완료 헤더 부분 */
	  .UJ-header{
	    height: 80px;
	    /* border: 1px solid red; */
	  }
	
	  /* 전체 / 모집 중 / 모집 완료 헤더의 a태그 스타일*/
	  .UJ-header>a{
	     margin-right: 20px;
	     margin-left: 20px;
	     line-height: 90px;
	     font-weight: 900;
	     font-size: 25px;
	
	  }
	
	  .UJ-menu{
	    height: 50px;
	    /* border: 1px solid red; */
	  }
	
	  .UJ-menu>select, button{
	    margin-left: 10px;
	    margin-top: 5px;
	    border-radius: 20px;
	    width: 150px; 
	    height: 40px;
	    text-align: center;
	    border: 1px solid lightgrey;
	  }
	
	
	  .UJ-menu>input{
	    margin-left: 60px;
	    margin-top: 5px;
	    border-radius: 20px;
	    width: 300px; 
	    height: 40px;
	    border:  1px solid lightgrey;
	    
	    
	  }
	
	 
	
	
		/* div 맨 앞으로 옮기는 스타일 */
		#targetDiv {
		    position: absolute;
		    z-index: 999;
		  }
		
		  /* ul{
		    list-style: none;
		    display: inline-flex;
		  } */
		
		
		  .friendBTN{
		    width: 80px;
		    height: 30px;
		    font-size: 12px;
		    background-color: lightskyblue;
		    color: white;
		    border: 0;
		   
		  }
		
		
		  .friend-menu:hover{
		    cursor: pointer;
		  
		    
		  }
		
		
		  .friend-menu button:hover{
		    cursor: pointer;
		  
		    
		  }
		 
		
		  .table:hover{
		    cursor: pointer;
		  }
		
		
		
		

  </style>

</head>
<body>

<div id="app">


		<!-- 
		 	***뽑아온 값 
			1. 나의 친구 목록은 세션에 담음 -> myBfList
			2. 나의 친구 아님 목록 -> noneBfList
			3. 모든 회원 조회 -> allMemberList
			
			
			-----------------
			pi1 == 내 친구 페이징 
			pi2 == 내 친구 아님 페이징 
			pi3 == 모든 회원 페이징
		
		 -->


		<!-- 사이드바 시작 -->
		<jsp:include page="../common/leftSide.jsp"></jsp:include>
		<!-- 사이드바 끝 -->
        
        <div id="main">
           <!-- 상단바 시작 -->
			<jsp:include page="../common/header.jsp"></jsp:include>
			<!-- 상단바 끝 -->

            <div class="page-heading">
                <h3>친구 관리</h3>
            </div>
            <div class="page-content">
                <class class="row">

                    <!-- 친구 목록 -->
                    <div class="UJ-col-12 col-lg-9 card" style="height: 1200px;" >

                        <!--            
            <div class="UJ-header" >
                
              
            </div>
             -->


                        <!-- 친구 목록 테이블 -->
                        <div class="UJ-menu" >

								
                            <br><br>
                            <!-- table hover -->
                            <div class="table-responsive">

                                <h4 style="margin-left: 65px; margin-bottom: 20px;">친구 목록</h4>
                                <script src="resources/assets/static/js/initTheme.js"></script>

                                <!-- Button trigger for login form modal -->
                                <button type="button"
                                    style="border-radius: 10px; background-color: #435ebe; margin-bottom: 20px; color: white; float: right; margin-right: 70px;"
                                    data-bs-toggle="modal" data-bs-target="#inlineForm">
                                    친구 찾기
                                </button>

								<!--===================== 모달모달모달모달 =======================-->
                                <!--login form Modal -->
                                <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog"
                                    aria-labelledby="myModalLabel33" aria-hidden="true" >
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                        role="document" >
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel33">친구 찾기 </h4>
                                                <button type="button" class="close" data-bs-dismiss="modal"
                                                    aria-label="Close" style="border: 0; background-color: white;">
                                                    <i data-feather="x"></i>
                                                </button>
                                            </div>
                                            
                                            
                                            <!-- 모달 폼!!!! -->
                                            <form action="#">

                                                <!-- 모달 내용 작성하는 부분 -->
                                                <div class="modal-body">
                                                    <div class="col-md-6 mb-1" style="width: 100%;">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1"><i
                                                                    class="bi bi-search"></i></span>
                                                            <input type="text" class="form-control"
                                                                style="width: 200px;" placeholder="친구 이름을 검색하세요."
                                                                aria-label="Recipient's username"
                                                                aria-describedby="button-addon2">
                                                            <button class="btn btn-outline-secondary" type="button"
                                                                style="width: 70px; " id="button-addon2">검색</button>
                                                        </div>

                                                        <div>


                                                            <table class="table mb-0">
                                                                <thead>
                                                                    <tr>
                                                                        <th>No</th>
                                                                        <th>Name</th>
                                                                        <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status</th>

                                                                        <th></th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                
                                                                
                                                              <c:forEach var="member" items="${allMemberList}">
                                                                    <tr>
                                                                        <td >${member.memNo}</td>
                                                                        <td>${member.gitNick}</td>
                                                                        <td class="text-bold-500">
                                                                            <button class="friendBTN">친구 신청</button>
                                                                        </td>


                                                                        <td class="friend-menu">

                                                                            <button class="dropdown-toggle"
                                                                                type="button" class="dropdownMenuButton"
                                                                                data-bs-toggle="dropdown"
                                                                                aria-haspopup="true"
                                                                                aria-expanded="false"
                                                                                style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                                                ⁝
                                                                            </button>
                                                                            <div class="dropdown-menu"
                                                                                aria-labelledby="dropdownMenuButton">
                                                                                <a class="dropdown-item" href="#">친구
                                                                                    수락</a>
                                                                                <a class="dropdown-item" href="#">친구
                                                                                    차단</a>

                                                                            </div>


                                                                        </td>
                                                                    </tr>
															</c:forEach>
                                                                  

                                                                </tbody>


                                                            </table>

                                                        </div>
                                                        
														
                                                     
														<br>

                                                    </div>

													
													 <!-- 페이징바 
														<nav aria-label="Page navigation example">
															<ul class="pagination pagination-primary  justify-content-center ">
															
															<c:choose>
															
																<c:when test="${pi3.currentPage eq 1}">
																    <li class="page-item disabled"><a class="page-link" href="#">
																		<span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
																	</a></li>
		
																</c:when>
																
																<c:otherwise>
																    <li class="page-item"><a class="page-link" href="${pi3.currentPage -1 }">
																		<span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
																	</a></li>
																</c:otherwise>
																
																
															</c:choose>
																	
																<c:forEach var="i" begin="${pi3.startPage }" end="${pi3.endPage }" >
																		<li class="page-item "><a class="page-link" href="${i }">${i }</a></li>
																
																</c:forEach>
		
																		
																		
																		
																		
															<c:choose>
															    <c:when test="${pi3.currentPage eq pi3.maxPage }">	
																	<li class="page-item disabled"><a class="page-link" href="#">
																		<span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
																	</a></li>
																</c:when>	
																
																<c:otherwise>
															        <li class="page-item"><a class="page-link" href="${pi3.currentPage +1 }">
																		<span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
																	</a></li>
																</c:otherwise>
															</c:choose>		
														</ul>
													</nav>
											-->
												

                                                </div>
                                                <!--모달 내용 작성하는 부분 끝-->


                                                <div class="modal-footer">
											


                                                    <button type="button" class="btn btn-primary"
                                                        data-bs-dismiss="modal">
                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                        <span class="d-none d-sm-block">Close</span>
                                                    </button>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <br>


								<!--===================== 찐 친구 목록 =======================-->
                                <table class="table mb-0" style="width: 90%;" align="center">
									
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status</th>
                                          
											<th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>

                                           


                                            <td>
                                                <!--                                            
                                            <button class="dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false" style="border: 0; background-color: white;">
                                            ⁝
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">친구 수락</a>
                                            <a class="dropdown-item" href="#">친구 차단</a>

                                            </div> -->

                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>


                                            </td>


                                        </tr>

                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>

                                            <td class="friend-menu">
                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>

                                            <td class="friend-menu">

                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>


                                            <td class="friend-menu">

                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>


								<br><br>
								
													 <!-- 페이징바 -->
													 <nav aria-label="Page navigation example">
														<ul class="pagination pagination-primary  justify-content-center ">
															<li class="page-item"><a class="page-link" href="#">
																<span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
															</a></li>



															<li class="page-item "><a class="page-link" href="#">1</a></li>
															<li class="page-item active" ><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															
															
															
															
															<li class="page-item"><a class="page-link" href="#">
																<span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
															</a></li>
														</ul>
													</nav>
							
                            </div>

							<div style="margin-top: 120px;">

								<h4 style="margin-left: 65px; margin-bottom: 20px;">친구 요청 상태</h4>
								<!-- 나에게 친구를 신청한 사람들 목록 -->
                                <table class="table mb-0" style="width: 90%;" align="center">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status</th>
                                          
											<th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>

                                           


                                            <td>
                                                <!--                                            
                                            <button class="dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false" style="border: 0; background-color: white;">
                                            ⁝
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">친구 수락</a>
                                            <a class="dropdown-item" href="#">친구 차단</a>

                                            </div> -->

                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>


                                            </td>


                                        </tr>

                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>

                                            <td class="friend-menu">
                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>

                                            <td class="friend-menu">

                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="text-bold-500">user01</td>
                                            <td>김뫄뫄</td>
                                            <td class="text-bold-500">
                                                <button class="friendBTN">친구 신청</button>
                                            </td>


                                            <td class="friend-menu">

                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
                                                    ⁝
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">친구 수락</a>
                                                    <a class="dropdown-item" href="#">친구 차단</a>

                                                </div>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>

								<br><br>
								
													 <!-- 페이징바 -->
													 <nav aria-label="Page navigation example">
														<ul class="pagination pagination-primary  justify-content-center ">
															<li class="page-item"><a class="page-link" href="#">
																<span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
															</a></li>



															<li class="page-item "><a class="page-link" href="#">1</a></li>
															<li class="page-item active" ><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															
															
															
															
															<li class="page-item"><a class="page-link" href="#">
																<span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
															</a></li>
														</ul>
													</nav>

								<br><br><br><br><br><br><br><br>
										
										
										
										
							</div>













                            <script>
                                // 버튼 요소와 대상 div 요소를 가져옵니다.
                                const button = document.getElementById("toggleButton");
                                const targetDiv = document.getElementById("targetDiv");

                                // 버튼 클릭 이벤트 핸들러를 추가합니다.
                                button.addEventListener("click", () => {
                                    // 현재 div 요소의 표시 상태를 확인하고 토글합니다.
                                    if (targetDiv.style.display === "none" || targetDiv.style.display === "") {
                                        targetDiv.style.display = "block"; // div를 엽니다.
                                    } else {
                                        targetDiv.style.display = "none"; // div를 닫습니다.
                                    }
                                });






                                // 모든 toggleButton 클래스를 가진 td 요소를 선택합니다.
                                // const toggleButtons = document.querySelectorAll(".toggleButton");

                                // // 각 td에 대한 클릭 이벤트 핸들러를 추가합니다.
                                // toggleButtons.forEach((button) => {
                                //     button.addEventListener("click", () => {
                                //         // 클릭된 td 요소의 다음 형제 요소인 div를 찾아서 토글합니다.
                                //         const targetDiv = button.querySelector(".targetDiv");
                                //         if (targetDiv.style.display === "none" || targetDiv.style.display === "") {
                                //             targetDiv.style.display = "block"; // div를 엽니다.
                                //         } else {
                                //             targetDiv.style.display = "none"; // div를 닫습니다.
                                //         }
                                //     });
                                // });
                            </script>

                        </div>

                    </div>
				
					
					<!-- 오른쪽에 위에는 친구/프로젝트 팀원들 모아놓는 card 이고 하단에는 프로젝트 참여신청한 임시 회원들 목록이 있는 card임-->
					<jsp:include page="../common/rightSide.jsp"></jsp:include>
					
					
                </section>
            </div>
			
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"></jsp:include>


    <script src="resources/assets/js/main.js"></script>
    <script src="resources/vendors/choices.js/choices.min.js"></script>



</body>
</html>