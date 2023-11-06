<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
	<!--멀티 select 박스위해서 이건 꼭 필요함... 지우면 안됨-->
	<link rel="stylesheet" href="resources/assets/extensions/choices.js/public/assets/styles/choices.css">
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
                                <form action="update.me" method="post">
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
                                        <label for="country-floating">기술 스택</label>
                                        <select class="choices form-select multiple-remove" multiple id="multiSelect" name="stackName">
                                            <c:forEach var="mem" items="${list }">
                                                <option value="${mem.stackName }">${mem.stackName }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <br>
                                    <div class="form-group mb-3">
                                        <label for="memIntro" class="form-label">Self-Introduction</label>
                                        <textarea class="form-control" name="memIntro" id="memIntro" rows="5" style="resize:none;" placeholder="자신을 소개해주세요~!">${loginMember.memIntro }</textarea>
                                    </div>
                                    
                                    <script>
							    		const stack = "${mem.stackName}";
							    		
									    $("#multiSelect option").each(function() {
									        const optionText = $(this).text();
									        const values = stack.split(',');
									        
									        if (values.includes(optionText.trim())) {
									            $(this).prop("selected", true);
									        }
									    });
								    </script>
								    
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <a type="button" class="btn btn-danger" href="/okkh/myPage.me">Cancel</a>
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