<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    
</head>

<body>
    <!-- 주야간모드 버튼 js 시작 -->
    <script src="resources/assets/static/js/initTheme.js"></script>
	<!-- /주야간모드 버튼 js 끝 -->

    <!-- alert 시작 -->
    <!-- <c:if test="${ not empty alertMsg }">
    	<script>
    		alert("${ alertMsg }");
    	</script>
    	
    	<c:remove var="alertMsg"/>
    </c:if> -->
    <!-- /alert 끝 -->
    
    <!-- 전체 -->
    <div id="app">
        <!-- 사이드바 시작 -->
        <jsp:include page="common/leftSide.jsp"></jsp:include>
        <!-- 사이드바 끝 -->

        <!-- 메인 시작 -->
        <div id="main">
            <!-- 상단바 시작 -->
            <jsp:include page="common/header.jsp"></jsp:include>
            <!-- 상단바 끝 -->

            <!-- 내용 시작 -->
            <div class="page-content">
                <section class="row">
                    <!-- 본문 시작 -->
                    <div class="col-12 col-lg-9">
                        <!-- 배너사진 시작 -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body" style="height: 350px;">
                                        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                                            <ol class="carousel-indicators">
                                                <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" style="opacity: 0%;"></li>
                                                <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" style="opacity: 0%;"></li>
                                                <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" style="opacity: 0%;"></li>
                                            </ol>
                                            <div class="carousel-inner" style="height: 300px;">
                                                <div class="carousel-item active" style="height: 300px;">
                                                    <img src="resources/images/banner/4 감청색 배경화면.jpg" class="d-block w-100" alt="...">
                                                    <div class="carousel-caption d-none d-md-block">
                                                        <img src="resources/images/banner/Clab.png" style="width: 30%;">
                                                        <h2 style="color: white;">OKKH 이용안내</h2>
                                                        <p>오케케이에치와 함께 팀원 만들고 프젝 관리하자👋</p>
                                                    </div>
                                                </div>
                                                <div class="carousel-item" style="height: 300px;">
                                                    <img src="resources/images/banner/6 어두운 하늘색 배경화면.jpg" class="d-block w-100" alt="...">
                                                    <div class="carousel-caption d-none d-md-block">
                                                        <img src="resources/images/banner/Truck.png" style="width: 35%;">
                                                        <h2 style="color: white;">OKKH 새단장!!</h2>
                                                        <p>더 편해진 오케케이에치! 모르는 사람 없게 해주세요🙏</p>
                                                    </div>
                                                </div>
                                                <div class="carousel-item" style="height: 300px;">
                                                    <img src="resources/images/banner/3 분홍보라색 배경화면.jpg" class="d-block w-100" alt="...">
                                                    <div class="carousel-caption d-none d-md-block">
                                                        <img src="resources/images/banner/Heart.png" style="width: 35%;">
                                                        <h2 style="color: white;">채용 정보들 뿌린다. 딱 대.</h2>
                                                        <p>돈 맛 보 러 가 야 제 ? 그 제 ?</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button"
                                                data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleCaptions" role="button"
                                                data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="visually-hidden">Next</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 배너사진 끝 -->

                        <!-- 플젝모집 및 PR글 모음 시작 -->
                        <div class="row">
                            <!-- 플젝모집 시작 -->
                            <div style="margin-bottom: 10px;">
                                <div class="card">
                                    <div style="height: 380px; border-radius: 15px; padding: 10px;">
                                        <div class="card-header" style="padding: 20px 0 0 20px;">
                                            <h4>TOP Recruit</h4>
                                        </div>
                                        <div style="width: 250px; float: left; margin: 15px;">
                                            <div class="card" style="border: 1px solid gray;">
                                                <div class="card" style="padding: 10px; margin: 0;">
                                                    <div>
                                                        <div>
                                                            <p>마감일  |  2023.11.07</p>
                                                            <h5 class="font-semibold">이곳은은 제목이 들어가는 자리입니다</h5>
                                                            <span class="badge bg-primary">프론트</span>
                                                            <span class="badge bg-primary">백엔드</span>
                                                            <br>
                                                            <br>
                                                            <div class="avatar avatar-lg me-3">
                                                                <img src="resources/stackImages/back/java.svg" alt="" srcset="">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="avatar avatar-sm" style="align-items: center;">
                                                            <img src="resources/compiled/jpg/4.jpg">
                                                            <span>작성자</span>
                                                        </div>
                                                        <div style="float: right;">
                                                            <i class="fa-regular fa-eye"></i> <span>6</span> /
                                                            <i class="fa-regular fa-comment"></i> <span>6</span> /
                                                            <i class="fa-regular fa-thumbs-up"></i>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 250px; float: left; margin: 15px;">
                                            <div class="card" style="border: 1px solid gray;">
                                                <div class="card" style="padding: 10px; margin: 0;">
                                                    <div>
                                                        <div>
                                                            <p>마감일  |  2023.11.07</p>
                                                            <h5 class="font-semibold">이곳은은 제목이 들어가는 자리입니다</h5>
                                                            <span class="badge bg-primary">프론트</span>
                                                            <span class="badge bg-primary">백엔드</span>
                                                            <br>
                                                            <br>
                                                            <div class="avatar avatar-lg me-3">
                                                                <img src="resources/stackImages/back/java.svg" alt="" srcset="">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="avatar avatar-sm" style="align-items: center;">
                                                            <img src="resources/compiled/jpg/4.jpg">
                                                            <span>작성자</span>
                                                        </div>
                                                        <div style="float: right;">
                                                            <i class="fa-regular fa-eye"></i> <span>6</span> /
                                                            <i class="fa-regular fa-comment"></i> <span>6</span> /
                                                            <i class="fa-regular fa-thumbs-up"></i>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 250px; float: left; margin: 15px;">
                                            <div class="card" style="border: 1px solid gray;">
                                                <div class="card" style="padding: 10px; margin: 0;">
                                                    <div>
                                                        <div>
                                                            <p>마감일  |  2023.11.07</p>
                                                            <h5 class="font-semibold">이곳은은 제목이 들어가는 자리입니다</h5>
                                                            <span class="badge bg-primary">프론트</span>
                                                            <span class="badge bg-primary">백엔드</span>
                                                            <br>
                                                            <br>
                                                            <div class="avatar avatar-lg me-3">
                                                                <img src="resources/stackImages/back/java.svg" alt="" srcset="">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="avatar avatar-sm" style="align-items: center;">
                                                            <img src="resources/compiled/jpg/4.jpg">
                                                            <span>작성자</span>
                                                        </div>
                                                        <div style="float: right;">
                                                            <i class="fa-regular fa-eye"></i> <span>6</span> /
                                                            <i class="fa-regular fa-comment"></i> <span>6</span> /
                                                            <i class="fa-regular fa-thumbs-up"></i>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>

                                        <div style="width: 250px; float: left; margin: 15px;">
                                            <div class="card" style="border: 1px solid gray;">
                                                <div class="card" style="padding: 10px; margin: 0;">
                                                    <div>
                                                        <div>
                                                            <p>마감일  |  2023.11.07</p>
                                                            <h5 class="font-semibold">이곳은은 제목이 들어가는 자리입니다</h5>
                                                            <span class="badge bg-primary">프론트</span>
                                                            <span class="badge bg-primary">백엔드</span>
                                                            <br>
                                                            <br>
                                                            <div class="avatar avatar-lg me-3">
                                                                <img src="resources/stackImages/back/java.svg" alt="" srcset="">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="avatar avatar-sm" style="align-items: center;">
                                                            <img src="resources/compiled/jpg/4.jpg">
                                                            <span>작성자</span>
                                                        </div>
                                                        <div style="float: right;">
                                                            <i class="fa-regular fa-eye"></i> <span>6</span> /
                                                            <i class="fa-regular fa-comment"></i> <span>6</span> /
                                                            <i class="fa-regular fa-thumbs-up"></i>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 플젝모집 끝 -->

                            <!-- PR글 시작 -->
                            <div style="margin-bottom: 30px;">
                                <div class="card">
                                    <div style="height: 380px; border-radius: 15px; padding: 10px;">
                                        <div class="card-header" style="padding: 20px 0 0 20px;">
                                            <h4>PR</h4>
                                        </div>
                                        <div style="width: 250px; float: left; margin: 15px;">
                                            <div class="card" style="border: 1px solid gray;">
                                                <div class="card" style="padding: 10px; margin: 0;">
                                                    <div>
                                                        <div>
                                                            <p>작성일  |  2023.11.07</p>
                                                            <h5 class="font-semibold">저 잘합니다~ 연락주세요! 캐리 가능.</h5>
                                                            <span class="badge bg-primary">프론트</span>
                                                            <span class="badge bg-primary">백엔드</span>
                                                            <br>
                                                            <br>
                                                            <div class="avatar avatar-lg me-3">
                                                                <img src="resources/stackImages/back/java.svg" alt="" srcset="">
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="avatar avatar-sm" style="align-items: center;">
                                                            <img src="resources/compiled/jpg/4.jpg">
                                                            <span>작성자</span>
                                                        </div>
                                                        <div style="float: right;">
                                                            <i class="fa-regular fa-eye"></i> <span>6</span> /
                                                            <i class="fa-regular fa-comment"></i> <span>6</span>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- PR글 끝 -->
                        </div>
                        <!-- 플젝모집 및 PR글 모음 끝 -->
                    </div>
                    <!-- 본문 끝 -->

                    <!-- 친구 및 팀원 시작 -->
                    <jsp:include page="common/rightSide.jsp"></jsp:include>
                    <!-- 친구 및 팀원 끝 -->
                </section>
            </div>
            <!-- 내용 끝 -->
		
            <jsp:include page="common/footer.jsp"></jsp:include>
        </div>
        <!-- 메인 끝 -->
    </div>

</body>

</html>