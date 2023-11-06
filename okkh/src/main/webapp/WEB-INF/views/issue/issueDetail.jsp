s<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이슈상세페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


	<style>
        .iss-wrap{
            border: 1px solid #e9ecef;
            height: 200px;
            overflow: auto;
        }

        .iss-wrap2{
            border: 1px solid #e9ecef;
            height: 130px;
            overflow: auto;
        }

        .iss-time{
            border: 1px solid #e9ecef;
            background-color: #e9ecef;
            font-size: 13px;
            height: 30px;
            line-height: 28px;
        }
        
        .labelSpan {
            font-size: 13px;
            font-weight: 600;
            padding: 3px 5px;
            border-radius: 5px;
            color: white;
        }
        
        .pull-up {
            transition: all 0.25s ease;
        }

        .pull-up:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 0.25rem 1rem rgba(161, 172, 184, 0.45);
            z-index: 30;
            border-radius: 50%;
        }
        
        #mileImg {
		    width: 25px;
		    height: 25px;
		}
        
    </style>
    
</head>
<body>
<!-- 주야간모드 버튼 js 시작 -->
    <script src="../../resources/assets/static/js/initTheme.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/marked@3.0.7/marked.min.js"></script>    
    
    <!-- /주야간모드 버튼 js 끝 -->
    <div id="app">
        <!-- 사이드바! -->
        <jsp:include page="../common/leftSide.jsp"/>
        
        <div id="main">
    		<jsp:include page="../common/header.jsp"/>
	            <section class="section">
	                <div class="row">
	                    <div class="col">
	                        <div class="card">
	                            <div class="card-header" style="font-size: 30px;">
	                                <span>${ title }</span>
	                                <span>#${ ino }</span> 
                                    <c:choose>
									    <c:when test="${state eq 'open'}">
									        <span class="badge bg-success"
		                                    style="height: 50px; width: 100px; font-size: 20px; line-height: 35px;">Open</span>
									    </c:when>
									    <c:otherwise>
									        <span class="badge bg-danger"
		                                    style="height: 50px; width: 100px; font-size: 20px; line-height: 35px;">Closed</span>
									    </c:otherwise>
									</c:choose>
	                                
	                                <form action="editForm.iss?ino=${ino}" method="post" style="display:inline">
									   <input type="hidden" name="state" value="${ state }"> 
                     		           <button class="btn btn-primary" style="float:right" id="editBtn">이슈 수정</button>
	                                </form>
                                    
                                    <button type="button" class="btn btn-danger" onclick="javascript:history.back();" style="float: right; margin-right: 5px;">이전으로</button>
	                                <br>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </section>
            <section class="section">
                    <div class="row">
                        <div class="col-12 col-md-9">
                            <div class="card" style="height: auto;">
                                <div class="card-body">
                                    <div id="full" style="height: 300px;">
                                        <div class="card-body">
                                            <h5>내용</h5>
			                                <div class="iss-wrap">
			                                    <div class="iss-time">
			                                        <span style="padding-left: 5px;">${ userLogin } comments</span>
			                                    </div>
			                                    <span style="padding-left: 7px;" id="exampleFormControlTextarea1"></span>
			                                </div>
		                            		<input type="hidden" id="bodyChangePlease" value="${ bodyMain }">
                                            <hr>
                                            <h5>커멘트</h5>
                                            <c:forEach var="c" items="${ cList }">
                                                <div class="iss-wrap2">
                                                    <div class="iss-time">
                                                        <span style="padding-left: 5px;">${ c.login } comments</span>
                                                        <form action="deleteComments.iss" style="display:inline">
                                                        	<button class="btn btn-danger btn-sm" style="float:right; margin-right:5px;">삭제하기</button>
                                                        	<input type="hidden" value="${ c.id }" name="id">
                                                        	<input type="hidden" value="${ ino }" name="ino">
                                                        </form>
                                                    </div>
                                                    <span style="padding-left: 7px;" name="commentsDiv">${ c.body }</span>
                                                </div>
                                                <br>
                                            </c:forEach>

                                            <script>
                                            	const markdownGo = document.getElementById("bodyChangePlease").value;
                                            	const markedHtml = marked(markdownGo);
                                            	document.getElementById("exampleFormControlTextarea1").innerHTML = markedHtml;
                                            </script>


                                            
			                            </div>
			                            <div class="card-body">
                                        <div id="editor"></div>
                                        <br>
                                        <form action="commentEnroll.iss?ino=${ ino }" method="post" style="display: inline;">
                                            <button class="btn btn-primary" style="float: right;" onclick="enrollAjax();">등록하기</button>
                                            <input type="hidden" name="body" value="" id="bodyComment">
                                        </form>
		                            	<!-- <input type="hidden" name="inoHere" id="inoHere" value="${ ino }"> -->
                                    
                                    
                                    
			                            </div>
                                    </div> <br>
                                </div>
                            </div>
                        </div>
                                    <script>
                                        
                                        const Editor = toastui.Editor;
                                            
                                        const editor = new Editor({
                                            el: document.querySelector('#editor'),
                                            height: '160px',
                                            initialEditType: 'markdown',
                                            breaks: true
                                            });
                                            
                                        function enrollAjax() {
                                            var markdown = editor.getMarkdown();
                                            $("input[name='body']").val(markdown);
                                            console.log($("input[name='body']").val())

                                        }
                                
                                
                                    </script>
                        <div class="col-12 col-md-3">
                            <div class="card" style="height: 513px;">
                                <div class="card-body">
                                    <h6>이슈 담당자</h6>
                                    <c:forEach var="a" items="${ assignees }">
                                            <span title="${ a.gitNick }"
                                                class="avatar avatar-bg pull-up">
                                                <img alt="avatar" src="${ a.profile }"
                                                    class="rounded-circle writerAvatar">
                                            </span> &nbsp;&nbsp;&nbsp;
                                    </c:forEach>
                                    <br><br><br><br><br>
                                    <h6>라벨</h6>
                                    <c:forEach var="l" items="${ labels }">
                                    	<span class="labelSpan" 
                                    	style="background-color:#${l.color}; display: inline-block;">${ l.name }</span>
                                    </c:forEach>
                                    <br><br><br><br><br>
                                    <h6>마일스톤</h6>
                                    <div>
                                    <img src="resources/icons/milestone.png" id="mileImg">
                                    	<span style="font-weight:600; margin-top:5px; font-size:20px;">${ milestoneOne.title }</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>

            <jsp:include page="../common/footer.jsp"/>
        </div>
    </div>
   

    


    <!-- <script src="../../resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../resources/js/bootstrap.bundle.min.js"></script>

    <script src="../../resources/vendors/apexcharts/apexcharts.js"></script>
    <script src="../../resources/js/pages/dashboard.js"></script>

    <script src="../../resources/js/main.js"></script>


    <script src="../../resources/vendors/choices.js/choices.min.js"></script>

    <script src="../../resources/vendors/quill/quill.min.js"></script>
    <script src="../../resources/js/pages/form-editor.js"></script> -->


    <!-- 템플릿 js 시작 -->
    <script src="../../resources/assets/static/js/components/dark.js"></script>
    <script src="../../resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../resources/assets/compiled/js/app.js"></script>

    <!-- Need: Apexcharts -->
    <script src="../../resources/assets/extensions/apexcharts/apexcharts.min.js"></script>
    <script src="../../resources/assets/static/js/pages/dashboard.js"></script>
    <!-- /템플릿 js 끝 -->

    <!-- fontawesome 이미지 -->
    <script src="https://kit.fontawesome.com/d3dccd5748.js" crossorigin="anonymous"></script>
    <script src="../../resources/js/pages/form-editor.js"></script>

</body>
</html>