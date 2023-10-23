<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>

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
											<h4 class="card-title">이슈 등록하기</h4>
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
												<select class="form-select" id="basicSelect" name="label">
													<c:forEach var="l" items="${ lList }">
														<option>${ l.name }</option>
													</c:forEach>
												</select>
											</fieldset>
											<br>
											<h6>마일스톤</h6>
											<fieldset class="form-group">
												<select class="form-select" id="milestoneSelect" name="milestone">
													<c:forEach var="m" items="${ mList }">
														<option value="${ m.number }">${ m.title }</option>
													</c:forEach>
													<option value="direct">직접 입력</option>
												</select>
											</fieldset>
											<div class="form-group">
												<input type="text" class="form-control" id="mileInput"
													style="display: none;" placeholder="직접 입력해주세요">
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="btn btn-primary" style="float: right">등록하기</button>
						</form>
					</section>


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
					$(function () {
						$("#milestoneSelect").change(function () {
							var selectedOption = $(this).find(":selected").val();
							console.log("선택된 옵션: " + selectedOption);

							if (selectedOption === "direct") {
								$("#mileInput").show();
								$(this).removeAttr("name");
								console.log("directInput 표시");
							} else {
								$("#mileInput").hide();
								console.log("directInput 숨김");
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