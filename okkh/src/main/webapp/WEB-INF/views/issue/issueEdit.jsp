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
				color: white;
        	}
			.label-badge {
				margin: 5px;
				display: inline-block;
				padding: 3px 5px;
				border-radius: 5px;
				color: white;
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
						<form action="edit.iss" method="post" id="issueEnrollForm">
							<input type="hidden" value="${ ino }" name="ino">
							<div class="row">
								<div class="col-12 col-md-8">
									<div class="card" style="height: 600px;">
										<div class="card-header">
											<h4 class="card-title">이슈 수정하기</h4>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label for="basicInput">Title</label>
												<input type="text" class="form-control" id="basicInput" name="title" value="${ title }">
											</div>
											<span>Content</span>
											<div id="editor">${ body }</div>
               								<input type="hidden" name="body" value="">
										</div>
									</div>
								</div>
								<div class="col-12 col-md-4">
									<div class="card" style="height: 600px;">
										<div class="card-header">
											<h4 class="card-title">이슈 수정하기</h4>
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
												<select class="form-select" id="basicSelect" name="label" onchange="createLabel();">
													<option value="">선택안함</option>
													<c:forEach var="l" items="${ lList }">
														<option data-color="#${l.color}">${ l.name }</option>
													</c:forEach>
													<input type="hidden" name="labelSet" id="labelSet" value="">
												</select>
											</fieldset>
											<div class="labelSpan">
												<c:forEach var="l" items="${ labels }">
													<span class="labelSpan" name="firstLabel"
													style="background-color:#${l.color}; display: inline-block;">${ l.name }</span>
												</c:forEach>
											</div>
											<br>
											<h6>마일스톤</h6>
											<fieldset class="form-group">
												<select class="form-select" id="milestoneSelect" name="milestone">
													<option value="">선택안함</option>
													<c:forEach var="m" items="${ mList }">
														<c:choose>
															<c:when test="${ m.title eq milestoneOne.title }">
																<option selected="selected" value="${ m.number }">${ m.title }</option>
															</c:when>
															<c:otherwise>
																<option value="${ m.number }">${m.title}</option>
															</c:otherwise>
														</c:choose>
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
							<button class="btn btn-primary" style="float: right">수정하기</button>
						</form>
						<form action="state.iss?ino=${ino}" method="post">
							<button class="btn btn-primary" style="float: right; margin-right: 5px;">종료하기</button>
							<input type="hidden" value="closed" name="state">
						</form>
					</section>

					<input type="hidden" id="labList" value="${ lList }">
					<input type="hidden" id="issList" value="${ iList }">
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
			        var labelSet = new Array();
			        
			        function createLabel() {
						var basicSelect = document.getElementById("basicSelect");
						var label = basicSelect.options[basicSelect.selectedIndex].value;
						var color = basicSelect.options[basicSelect.selectedIndex].getAttribute('data-color');

						var initialLabels = document.querySelectorAll('[name="firstLabel"]');

						initialLabels.forEach(function (initialLabel) {
							labelSet.push(initialLabel.textContent);
						});
						labelSet.push(label);

						console.log("ㅎㅎ")
						console.log(labelSet)

			            let labelSpan = document.querySelector(".labelSpan");
			            let spacer = document.createElement("span");
			            let span = document.createElement("span");
			            span.className = "label-badge";
			            span.style.backgroundColor = color;
			            span.innerText = label;
						span.style.cursor = "pointer";

						span.onclick = function() {
							$(this).remove();
							deleteLabel($(this).text());
						};
						
			            labelSpan.appendChild(span);
			            labelSpan.appendChild(spacer);
						var labelString = labelSet.join(',');
						document.getElementById("labelSet").value = labelString;
			            
			        }

					function deleteLabel(label) {
						console.log("됨?")
						labelSet.pop(label)
						var labelString = labelSet.join(',');
						document.getElementById("labelSet").value = labelString;
						console.log(labelString);
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