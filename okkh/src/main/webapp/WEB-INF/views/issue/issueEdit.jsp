<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

			<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
			<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

			<style>
			.labelSpan{
				font-size: 13px;
				font-weight: 600;
				padding : 3px 5px;
				border-radius: 5px;
				color: black;
        	}
			</style>
		</head>

		<body>
			<div id="app">
				<jsp:include page="../common/leftSide.jsp"></jsp:include>
				<div id="main">
					<!-- 상단바 시작 -->
					<jsp:include page="../common/header.jsp"></jsp:include>
					<!-- 상단바 끝 -->

					<section class="section">
						<form action="enroll.iss" method="post" id="issueEnrollForm">
							<div class="row">
								<div class="col-12 col-md-8">
									<div class="card" style="height: 600px;">
										<div class="card-header">
											<h4 class="card-title">이슈 수정하기</h4>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="basicInput">Title</label>
												<input type="text" class="form-control" id="basicInput" name="title">
											</div>
											<span>Content</span>
											<div id="editor"></div>
               								<input type="hidden" name="body" value="">
										</div>
									</div>
								</div>
								<div class="col-12 col-md-4">
									<div class="card" style="height: 600px;">
										<div class="card-header">
											<h4 class="card-title">이슈 등록하기</h4>
										</div>
										<div class="card-body">
											<h6>이슈 담당자</h6>
											<fieldset class="form-group">
												<select class="form-select" name="assignee">
													<option value="nangmangorani" checked>nangmangorani</option>
												</select>
												
											</fieldset>

											<br>
											<h6>라벨</h6>
											<fieldset class="form-group">
												<select class="form-select" id="basicSelect" name="label" onchange="selectLabel();">
													<option value="">선택안함</option>
													<c:forEach var="l" items="${ lList }">
														<option>${ l.name }</option>
													</c:forEach>
													<input type="hidden" name="labelSet" id="labelSet" value="">
												</select>
											</fieldset>
											<div class="labelSpan"></div>
											<br>
											<h6>마일스톤</h6>
											<fieldset class="form-group">
												<select class="form-select" id="milestoneSelect" name="milestone">
													<option value="">선택안함</option>
													<c:forEach var="m" items="${ mListkkkk }">
														<option value="${ m.number }">${ m.title }</option>
													</c:forEach>
													<option value="direct">직접입력</option>
												</select>
											</fieldset>
											<div class="form-group">
												<input type="text" class="form-control" id="mileInput"
													style="display: none;" placeholder="직접 입력해주세요">
												<br>
												<button id="mileInputBtn" style="display: none; float:right" class="btn btn-primary">생성하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="btn btn-primary" style="float: right">등록하기</button>
						</form>
					</section>

					<input type="hidden" id="labList" value="${ lList }">
					<input type="hidden" id="issist" value="${ iList }">
					<jsp:include page="../common/footer.jsp"></jsp:include>
				</div>
			</div>
				<script>
			        const Editor = toastui.Editor;
			
				      const editor = new Editor({
				            el: document.querySelector('#editor'),
				            height: '400px',
				            initialEditType: 'markdown',
				         });
				
				      editor.getMarkdown();
			    </script>
			
			
				<script>
			        var labelSet = null;
					
			        function selectLabel() {
			            var basicSelect = document.getElementById("basicSelect");
			            var label = basicSelect.options[basicSelect.selectedIndex].value;
			            console.log(label);

			            if (labelSet !== null && labelSet !== undefined) {
			                labelSet += "," + label;
			            } else {
			                labelSet = label;
			            }
			            document.getElementById("labelSet").value = labelSet;
			            
			            let str = createLabel(label);
			        }
			        
			        function createLabel(label) {
			            let labelSpan = document.querySelector(".labelSpan");
			            let spacer = document.createElement("span");
			            spacer.style.margin = "5px";
			            let span = document.createElement("span");
			            span.className = "label-badge";
			            span.style.backgroundColor = "yellow"; 
			            span.innerText = label;
			           	
			            labelSpan.appendChild(span);
			            labelSpan.appendChild(spacer);
			            
			        }
			       	

			        
					
					$(function () {
						$("#milestoneSelect").change(function () {
							var selectedOption = $(this).find(":selected").val();
							console.log("선택된 옵션: " + selectedOption);

							if (selectedOption === "direct") {
								$("#mileInput").show();
								$("#mileInputBtn").show();
								$(this).removeAttr("name");
							} else {
								$("#mileInput").hide();
								$("#mileInputBtn").hide();
							}
						});
						
						$('#issueEnrollForm').submit(function() {
					         var markdown = editor.getMarkdown();
					         $("input[name='body']").val(markdown);
						});
						

						
						
						
					});
				</script>

				<script src="../../resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
				<script src="../../resources/js/bootstrap.bundle.min.js"></script>

				<script src="../../resources/vendors/apexcharts/apexcharts.js"></script>
				<script src="../../resources/js/pages/dashboard.js"></script>

				<script src="../../resources/js/main.js"></script>
				<script src="../../resources/vendors/choices.js/choices.min.js"></script>

				<script src="../../resources/js/main.js"></script>

				<script src="../../resources/vendors/quill/quill.min.js"></script>
				<script src="../../resources/js/pages/form-editor.js"></script>



				<!-- 썸머노트 이용하려면 필요함 -->
<!-- 				<script src="resources/assets/extensions/jquery/jquery.min.js"></script> -->
<!-- 				<script src="resources/assets/extensions/summernote/summernote-lite.min.js"></script> -->
<!-- 				<script src="resources/assets/static/js/pages/summernote.js"></script> -->

		</body>

		</html>