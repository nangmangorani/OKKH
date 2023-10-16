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
            
            <div class="page-heading" style="margin-left: 20px; margin-top: 15px;">

                <!-- 페이지 제목 시작 -->
                <h3 style="float: left; margin-right: 10px;">okkh</h3>
                <span class="badge bg-light-secondary">Public</span>
                <!-- /페이지 제목 끝 -->

                
            </div>
            <!-- /페이지 제목 및 추가 버튼 끝 -->

            <!-- 내용 시작 -->
            <div class="page-content"> 
                <section class="row">
                    <!-- 왼쪽 내용 시작 -->
                    <!-- 소스 리스트 시작 -->
                    <section class="section">
                        <div class="row" id="table-head">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">
                                        	<img src="https://avatars.githubusercontent.com/u/126389803?s=40&amp;v=4" height="20" width="20" style="border-radius: 15px;"> YoonTarget
                                        </h4>
                                    </div>
                                    <div class="card-content">
                                        <!-- table head dark -->
                                        <div class="table-responsive">
                                            <table class="table mb-0">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>NAME</th>
                                                        <th>COMMIT</th>
                                                        <th>WHEN</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold-500"><i class="fa-solid fa-folder"></i> okkh</td>
                                                        <td class="text-bold-500">로그인 기능 수정</td>
                                                        <td class="text-bold-500">2시간 전</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold-500"><i class="fa-regular fa-file"></i> README.md</td>
                                                        <td class="text-bold-500">리드미 수정</td>
                                                        <td class="text-bold-500">3일 전</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- /소스 리스트 끝 -->
                    <!-- /왼쪽 내용 끝 -->

                </section>
            </div>
            <!-- /내용 끝 -->

			<!-- 푸터바 시작 -->
            <jsp:include page="../common/footer.jsp"/>
			<!-- /푸터바 끝 -->
            
        </div>
        <!-- /메인 끝 -->
    </div>
	<!-- /전체 div 끝 -->
</body>

</html>