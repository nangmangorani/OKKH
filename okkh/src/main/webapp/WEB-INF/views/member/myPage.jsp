<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
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
            <section class="section">
                <div class="row">
                    <!-- 회원정보 시작 -->
                    <div class="col-8">
                        <div class="card">
                            <div class="card-body">
                                <form action="update.me" method="post">
                                    <input type="hidden" name="memId" id="memId" value="${ loginMember.memId }">
                                    <div class="form-group">
                                        <label for="Avatar" class="form-label">Profile picture</label>
                                        <div class="d-flex justify-content-center flex-column">
                                            <div class="avatar avatar-xl">
                                                <img src="${ git.profile }" alt="Avatar">
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label for="gitNick" class="form-label">NickName</label>
                                        <input type="text" name="gitNick" id="gitNick" class="form-control"
                                            placeholder="Your Name" value="${ git.gitNick }" disabled>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label for="gitNick" class="form-label">Stack</label>
                                        <br>
                                        <div class="form-control" onchange="stackList()">
                                            <multi-input id="multi-input" style="border: none; box-shadow: none;">
                                                <input list="speakers" style="width: 100%;" placeholder="자신의 기술 스택을 검색, 선택하세요">
                                                <datalist id="speakers">
                                                    <option value="AWS" class="stackItem"></option>
                                                    <option value="Django" class="stackItem"></option>
                                                    <option value="Docker" class="stackItem"></option>
                                                    <option value="Express" class="stackItem"></option>
                                                    <option value="Figma" class="stackItem"></option>
                                                    <option value="Firebase" class="stackItem"></option>
                                                    <option value="Flutter" class="stackItem"></option>
                                                    <option value="Git" class="stackItem"></option>
                                                    <option value="Go" class="stackItem"></option>
                                                    <option value="GraphQL" class="stackItem"></option>
                                                    <option value="Java" class="stackItem"></option>
                                                    <option value="JavaScript" class="stackItem"></option>
                                                    <option value="Kotlin" class="stackItem"></option>
                                                    <option value="Kubernetes" class="stackItem"></option>
                                                    <option value="MongoDB" class="stackItem"></option>
                                                    <option value="MySQL" class="stackItem"></option>
                                                    <option value="Nestjs" class="stackItem"></option>
                                                    <option value="Nextjs" class="stackItem"></option>
                                                    <option value="NodeJs" class="stackItem"></option>
                                                    <option value="php"class="stackItem"></option>
                                                    <option value="Python" class="stackItem"></option>
                                                    <option value="TypeScript" class="stackItem"></option>
                                                    <option value="React" class="stackItem"></option>
                                                    <option value="ReactNative" class="stackItem"></option>
                                                    <option value="Spring" class="stackItem"></option>
                                                    <option value="Svelte" class="stackItem"></option>
                                                    <option value="Swift" class="stackItem"></option>
                                                    <option value="Unity" class="stackItem"></option>
                                                    <option value="Vue" class="stackItem"></option>
                                                    <option value="Zeplin" class="stackItem"></option>
                                                    <option value="Zest" class="stackItem"></option>
                                                </datalist>
                                            </multi-input>
                                        </div>
                                        <input type="hidden" name="stack" id="selected">
                                        <script src="${pageContext.request.contextPath}/resources/js/multi-input.js"></script>
                                    </div>
                                    <script>
										const multiInput= document.getElementById('multi-input'); 
										var selected = document.getElementById('selected'); 
										
										function stackList(){
											console.log(multiInput.getValues());
											selected.value = multiInput.getValues();
										}
                                    </script>
                                    
                                    <br>
                                    <div class="form-group mb-3">
                                        <label for="memIntro" class="form-label">Self-Introduction</label>
                                        <textarea class="form-control" name="memIntro" id="memIntro"
                                            rows="5">${ loginMember.memIntro }</textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
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
    
</body>

</html>