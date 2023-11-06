<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
<!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->
<link rel="stylesheet" href="resources/assets/extensions/choices.js/public/assets/styles/choices.css">
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

.UJ-menu input{
	margin-left: 60px;
	margin-top: 5px;
	border-radius: 20px;
	width: 300px; 
	height: 40px;
	border:  1px solid lightgrey;
}

/* 리스트 부분 */
.UJ-content{
	height: 1500px;
	/* border: 1px solid black; */
}

.UJ-content>div{
	display: inline-block;
}

/* 목록들 스타일 */
.UJ-content>.UJ-ProjectContent{
    width: 330px;
    height: 320px;
    border: 3px solid lightgrey;
    margin-top: 20px;
    margin-left: 10px;
    background-color: #fff;
    border-radius: 30px;
}

/* 프로젝트 리스트 날짜/ 북마크 */
.UJ-ProjectContent #UJ-dateMark{
    width: 330px;
    height: 64px;
    /* border: 1px solid red; */
}

/* 날짜 div */
#UJ-dateMark>div{
    float: left;
    box-sizing: border-boxs;
}

/* 날짜 */
#UJ-dateMark>#UJ-date{
	width: 231px;
	height: 64px;
	padding-left: 20px;
	padding-top: 20px;
	font-weight: 900;
	/* border: 1px solid black; */
}

/* 북마크 */
#UJ-dateMark>#UJ-bookMark{
	width: 99px;
	height: 64px;
	/* border: 1px solid black; */
	padding-top: 20px;
}

/* 프로젝트 제목 */
.UJ-ProjectContent>#UJ-title{
	width: 330px;
	height: 96px;
	/* border: 1px solid red; */
	padding-left: 20px;
	padding-top: 20px;
	font-weight: 900;
}

/* 프로젝트 기술 */
.UJ-ProjectContent>#UJ-tech{
	width: 330px;
	height: 48px;
	/* border: 1px solid red; */
	padding-left: 20px;
}

/* 기술 작성되있는 버튼들 */
#UJ-tech>button{
    border-radius: 20px;
    background-color: #f2f4f8;
    color: blue;
    border: 0;
    width: 80px;
    height: 30px;
    font-weight: 900;
}


/* 프로젝트 기술 호버했을 때  */
.UJ-ProjectContent:hover{
    cursor: pointer;
    /* background-color: #f7f7f7; */
    transform: scale(1.02); /* 10% 확대 */
    transition: transform 0.3s ease; /* 변화를 부드럽게 적용 */
}

/* 프로젝트 기술 이미지 */

.UJ-ProjectContent>#UJ-techImg{
	width: 330px;
	height: 64px;
	/* border: 1px solid red; */
	padding-left: 20px;
}

/* 프로젝트 기술이미지에 첨부 이미지 */
#UJ-techImg>img{
    width: 45px;
    height: 45px;
}

#UJ-techImg>hr{
    width: 300px;
}

/* 프로젝트 작성자 */
.UJ-ProjectContent>#UJ-writer{
	width: 330px;
	height: 48px;
	/* border: 1px solid red; */
	padding-left: 20px;
	padding-top: 8px;
	font-weight: 900;
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

/* 돋보기 사진 */
#searchBar:hover{
	cursor:pointer;
}
</style>

</head>

<body>
    <!-- 사이드바 시작 -->
    <jsp:include page="../common/leftSide.jsp"></jsp:include>
    <!-- 사이드바 끝 -->

    <!-- 메인 시작 -->
    <div id="main">
        <!-- 상단바 시작 -->
        <jsp:include page="../common/header.jsp"></jsp:include>
        <!-- 상단바 끝 -->

        <!-- 메인 시작 -->
        <div>
            <section class="section" id="multiple-column-form">
                <div class="row">
                    <!-- 회원정보 시작 -->
                    <div class="col-8">
                        <div class="card">
                            <div class="card-body">
                                <form action="updateForm.me" method="post">
                                	<div class="form-group" style="float:right;">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                    <input type="hidden" name="memId" id="memId" value="${loginMember.memId }">
                                    <div class="form-group">
                                        <label for="Avatar" class="form-label">Profile picture</label>
                                        <div class="d-flex justify-content-center flex-column">
                                            <div class="avatar avatar-xl">
                                                <img src="${git.profile }" style="width:150px; height:150px" alt="Avatar">
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label for="gitNick" class="form-label">NickName</label>
                                        <input type="text" name="gitNick" id="gitNick" class="form-control" value="${git.gitNick }" disabled>
                                    </div>
                                    <br>
                                    
                                    <div class="form-group">
                                        <label for="country-floating">My Stack</label>
                                        <input type="text" name="stackName" id="stackName" class="form-control" placeholder="자신의 기술을 소개해주세요~!" value="${loginMember.stackName }" disabled>
                                    </div>
                                    <br>
                                    
                                    <div class="form-group mb-3">
                                        <label for="memIntro" class="form-label">Self-Introduction</label>
                                        <textarea class="form-control" name="memIntro" id="memIntro" rows="5" style="resize:none;" placeholder="자신을 소개해주세요~!" disabled>${loginMember.memIntro }</textarea>
                                    </div>
                                    <br>
                                    
                                    <div class="form-group">
                                        <label for="country-floating">My PostList</label>
                                        <div class="col-12 col-lg-9">
							                <div class="card">
							                    <div class="card-body" style="padding:12px;">
							                        <ul class="nav nav-tabs" id="myTab" role="tablist">
							                            <li class="nav-item" role="presentation">
							                                <a class="nav-link active" id="ing-tab" data-bs-toggle="tab" href="#ing" role="tab"
							                                    aria-controls="home" aria-selected="true">Recruit List</a>
							                            </li>
							                            <li class="nav-item" role="presentation">
							                                <a class="nav-link" id="fin-tab" data-bs-toggle="tab" href="#fin" role="tab"
							                                    aria-controls="profile" aria-selected="false">Pr List</a>
							                            </li>
							                        </ul>
							                        <div class="tab-content" id="myTabContent">
							                        
						                                <!-- Recruit List 시작 -->
							                            <div class="tab-pane fade show active" id="ing" role="tabpanel" aria-labelledby="ing-tab">
							                                <input type="hidden" name="memNo" value="${loginMember.memNo }">
															<c:choose>
						                                		<c:when test="${ not empty pjList }">
						                                			<div class="UJ-content" >
															            <c:forEach var="pj" items="${pjList }">
															            	<input type="hidden" name="prNo" value="${pj.proNo }" >
															                <div  class="UJ-ProjectContent" onclick="location.href='selectDetailPro.pro?pno=' + ${pj.proNo }" >
															                    <!-- 마감일 , 북마크 -->
															                    <div id="UJ-dateMark">
															                        <div id="UJ-date">
															                            작성일 : ${pj.createDate }
															                        </div>
															                    </div>
															
															                    <!-- 제목 -->
															                    <div id="UJ-title">
															                       ${pj.proTitle }
															                    </div>
															                    
															                    <!-- 기술 이미지 , 기술 스택을,로 구분지어서 자른다음에 이미지 주소에 넣음-->
															                   <div id="UJ-techImg">
																				    <c:set var="techStacks" value="${fn:split(pj.proStack, ',') }" />
																				    <c:forEach items="${techStacks }" var="techStack">
																				    	<c:set var="src" value="https://holaworld.io/images/languages/${techStack }.svg"/>
																				        <img src="${src }" alt="${src }">
																				    </c:forEach>
																				    <hr>
																				</div>
																				
																				<br>
																				 <!-- 조회수 -->
															                    <div style="padding-left:20px; font-weight: 900;" >
															                        조회수 :  ${pj.count }
															                    </div>
															                    
															                    <!-- 작성자 -->
															                    <div id="UJ-writer">
															                    	작성자 : ${git.gitNick }
															                    </div>
													                    	</div>
																		</c:forEach>
														            </div>
						                                		</c:when>
						                                		<c:otherwise>
						                                			<div>작성한 게시글이 없습니다</div>
						                                		</c:otherwise>
						                                	</c:choose>
							                            </div>
						                            	<!-- /Recruit List 끝 -->
							                            
						                            	<!-- Pr List 시작 -->
							                            <div class="tab-pane fade" id="fin" role="tabpanel" aria-labelledby="fin-tab">
							                                <input type="hidden" name="memNo" value="${loginMember.memNo }">
															<c:choose>
						                                		<c:when test="${ not empty prList }">
						                                			<div class="UJ-content" >
															            <c:forEach var="pr" items="${prList }">
															            	<input type="hidden" name="prNo" value="${pr.prNo }" >
															                <div  class="UJ-ProjectContent" onclick="location.href='detailPr.pr?pno=' + ${pr.prNo }" >
															                    <!-- 마감일 , 북마크 -->
															                    <div id="UJ-dateMark">
															                        <div id="UJ-date">
															                            작성일 : ${pr.createDate }
															                        </div>
															                    </div>
															
															                    <!-- 제목 -->
															                    <div id="UJ-title">
															                       ${pr.prTitle }
															                    </div>
															                    
															                    <!-- 기술 이미지 , 기술 스택을,로 구분지어서 자른다음에 이미지 주소에 넣음-->
															                   <div id="UJ-techImg">
																				    <c:set var="techStacks" value="${fn:split(pr.stackName, ',') }" />
																				    <c:forEach items="${techStacks }" var="techStack">
																				    	<c:set var="src" value="https://holaworld.io/images/languages/${techStack }.svg"/>
																				        <img src="${src }" alt="${src }">
																				    </c:forEach>
																				    <hr>
																				</div>
																				
																				<br>
																				 <!-- 조회수 -->
															                    <div style="padding-left:20px; font-weight: 900;" >
															                        조회수 :  ${pr.count }
															                    </div>
															                    
															                    <!-- 작성자 -->
															                    <div id="UJ-writer">
															                    	작성자 : ${git.gitNick }
															                    </div>
													                    	</div>
																		</c:forEach>
														            </div>
						                                		</c:when>
						                                		<c:otherwise>
						                                			<div>작성한 게시글이 없습니다</div>
						                                		</c:otherwise>
						                                	</c:choose>
							                            </div>
						                           		<!-- /Pr List 끝 -->
						                           		
							                        </div>
							                    </div>
							                </div>
							            </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../common/rightSide.jsp"></jsp:include>
                    <!-- 회원정보 끝 -->
                </div>
            </section>
			
            <!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"></jsp:include>
            <!-- 푸터바 끝 -->
        </div>
        <!-- 메인 끝 -->
    </div>
    <!-- 전체 끝 -->
    
	<!--여기 두개가 다중 select박스인듯-->    
	<script src="resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
	<script src="resources/assets/static/js/pages/form-element-select.js"></script>
</body>

</html>