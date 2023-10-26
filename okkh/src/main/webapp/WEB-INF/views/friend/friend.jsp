<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	  /* 돋보기 사진 감싸는 div */
	  /* .UJ-menu> .UJ-searchImg{
	      background-color: #fff; 
	      width: 60px;
	     height: 80px;
	     border-radius: 20px 0 0 20px; 
	     display: inline;
	  } */
	
	  /* 돋보기 사진 */
	  /* .UJ-search_searchImg{
	    width: 30px; 
	    height: 30px;
	    margin-left: 20px;
	    margin-top: 2px;
	
	 } */
	
	
	/* 리스트 부분 */
	 .UJ-content{
	    height: 700px;
	    /* border: 1px solid blue; */
	    
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
		
		
		
		  /* 넥서스 스타일 긁어옴 */
		
		  #mainBody{
			height: auto; 
			width: 100%;
			margin:auto;
			margin-top: 10px !important;
			margin-bottom: 0px !important;
		}
		#stacks{
			width:100%;
			margin:auto;
			padding-top:25px;
			padding-bottom:50px;
			padding-left:20px;
			padding-right:20px;
		}
		#prs{
			width:100%;
			height:2.5%;
			/* margin:auto; */
			padding-top:10px;
		}
		#stackCategory>li{
			display:flex;
			float:left;
		}
		
		.Category_categoryItem__1ko8V {
		    display: flex;
		    font-weight: 700;
		    font-size: 26px;
		    line-height: 126.5%;
		    color: #848484;
		    cursor: pointer;
		    position: relative;
		}
		
		.Category_categories__3bwPA {
		    display: flex;
		    grid-gap: 50px;
		    gap: 50px;
		    border-bottom: 3px solid #f2f2f2;
		    padding-bottom: 20px;
		    padding-left: 16px;
		    margin-bottom: 30px
		}
		
		.Category_categoryItem__1ko8V {
		    display: flex;
		    font-weight: 700;
		    font-size: 26px;
		    line-height: 126.5%;
		    color: #848484;
		    cursor: pointer;
		    position: relative
		}
		
		.Category_selectedCategory__1J7es {
		    color: #333
		}
		
		.Category_selectedCategory__1J7es:after {
		    content: "";
		    position: absolute;
		    height: 5px;
		    width: calc(100% + 26px);
		    background: #ffe579;
		    left: -13px;
		    bottom: -22px
		}
		
		.LanguageBar_languages__2Ilqf {
		    display: flex;
		    flex-wrap: wrap;
		    width: 100%;
		    grid-gap: 15px;
		    gap: 15px;
		    margin-bottom: 40px
		}
		
		.LanguageBar_languageIcon__Um7GQ {
		    display: flex;
		    grid-gap: 10px;
		    gap: 10px;
		    align-items: center;
		    border: 1px solid #d0d0d0;
		    border-radius: 100px;
		    padding: 12px 20px 12px 15px;
		    transition: all .1s ease-in;
		    cursor: pointer
		}
		
		.LanguageBar_logo__332tN {
		    width: 36px;
		    height: 36px
		}
		
		.LanguageBar_languageIcon__Um7GQ:hover {
		    -webkit-transform: scale(1.05);
		    transform: scale(1.05)
		}
		
		.LanguageBar_full__3qQet {
		    opacity: 1;
		    -webkit-transform: scale(1.02);
		    transform: scale(1.02)
		}
		
		.LanguageBar_transparent__3wlZf {
		    opacity: .3
		}
		
		.SelectedLanguage_selectedLanguages__DYJjl,.SelectedLanguage_selectedWrapper__2StUQ {
		    display: flex;
		    flex-wrap: wrap;
		    align-items: center;
		    grid-gap: 30px;
		    gap: 30px
		}
		
		.SelectedLanguage_selectedLanguage__3AUIy {
		    display: flex;
		    grid-gap: 10px;
		    gap: 10px;
		    background: #f2f2f2;
		    padding: 8px 15px;
		    height: 41px;
		    border-radius: 10px;
		    font-weight: 500;
		    font-size: 20px;
		    color: #313131;
		    justify-content: center;
		    align-items: center;
		    cursor: pointer;
		    transition: all .1s ease-in
		}
		
		.SelectedLanguage_selectedLanguage__3AUIy:hover {
		    -webkit-transform: scale(1.02);
		    transform: scale(1.02)
		}
		
		.SelectedLanguage_resetFilter__2EZuH {
		    font-size: 20px;
		    color: #333;
		    cursor: pointer
		}
		.LanguageBar_languages__2Ilqf{
			padding-left:0;
		}
		* {
		  margin: 0;
		  padding: 0;
		}
		
		
		.position {
		  margin-left: auto;
		  margin-right: auto;
		  text-align: center;
		  margin-top: 15%;
		}
		
		#workarea {
		  position: absolute;
		  width: 100%;
		  height: 100%;
		  background-color: #1e1a3e;
		  font-family: Raleway;
		}
		
		#personal {
		  color:white;
		  text-decoration:none;
		  position:absolute;
		  bottom:15px;
		  right:2%;
		}
		.spot {
		  position: absolute;
		  width: 100%;
		  height: 100%;
		  top: 0;
		  left: 0;
		}
		/*
		    This is the outer svg wrapper that the SVG itself will 
		    fill. Multiple svg-wrapper classes can be put side by side.
		*/
		
		.svg-wrapper {
		  margin-top: 0;
		  position: relative;
		  width: 150px;
		  /*make sure to use same height/width as in the html*/
		  height: 40px;
		  display: inline-block;
		  border-radius: 3px;
		  margin-left: 5px;
		  margin-right: 5px
		}
		/*
		  This is where we define the fill, color, thickness,
		  and stroke pattern of the SVG when there is no hover.
		  The dasharray and offset together define the line position
		  under the words. Here's also where the transition speed is set.
		*/
		
		#shape {
		  stroke-width: 6px;
		  fill: transparent;
		  stroke: #009FFD;
		  stroke-dasharray: 85 400;
		  stroke-dashoffset: -220;
		  transition: 1s all ease;
		}
		/* 
		    Pushing the text up into the SVG. Without this the
		    text would be below the div's.
		*/
		
		#text {
		  margin-top: -35px;
		  text-align: center;
		}
		
		#text a {
		  color: white;
		  text-decoration: none;
		  font-weight: 100;
		  font-size: 1.1em;
		}
		.svg-wrapper:hover #shape {
		  stroke-dasharray: 50 0;
		  stroke-width: 3px;
		  stroke-dashoffset: 0;
		  stroke: #06D6A0;
		}
		
		#stacks>button{
			margin-right:20px;
			margin-bottom:3px;
			border:none;
			background-color: #f5f5f9;;
			color: lightgray;
			font-size:25px;
			font-weight: 900;
			box-sizing:border-box;
		}
		#stacks>button:hover{
		  font-size:25px;
		  font-weight: bolder;
		  color: #706482;
		}
		hr{
			margin-top:0px;
			margin-bottom:0px;
		}
		.card{
			margin: 10px;
			float: left;
			width: 15.9rem;
		}
		#prList{
			width: 100%;
			height: 1500px !important;
		}
		.card{
			width: 15.8rem;;
			/* height: 229.984px; */
			height: 280px;
		}
		.card-body{
			display: block;
			padding-top: 15px !important;
			padding-right:10px !important;
			padding-left: 10px !important;
			padding-bottom:25px !important;
			height: 241px;
		}
		.card-text{
			width: 216px;
			/* height: 103px; */
			overflow: hidden;
		  text-overflow: ellipsis;
		  display: -webkit-box; 
		  -webkit-line-clamp: 5;
		  -webkit-box-orient: vertical;
		  margin-bottom: 35px !important;
		   float: left; 
		   font-size: 13px; 
		   width: 240px; 
		   height: 99.375px;
			
		}
		.card-category{
			float:left; width: 50%;
		}
		.card-category1{
			float: right;
		}
		.card-title{
			 overflow: hidden;
		  text-overflow: ellipsis;
		  display: -webkit-box; 
		  -webkit-line-clamp: 2;
		  -webkit-box-orient: vertical;
		   margin-right: 0px; 
		   width: 235px; 
		   height: 39.794px;
		}
		#card-id{
			margin-bottom: 15px !important;
		}
		 .card-body:hover{
			cursor: pointer;
			box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
		} 
		.card-image{
			width: 25px;
			border-radius: 100%;
		}
		.card-name{
		margin-bottom: 5px;
		}
		.bx-bookmark::before{
			/* width: 30px;
			height: 30px; */
		}
		.prCount{
			width: 0px; 
			height: 0px;
			hidden="";
		}
		.pCount{
			display: inline-block; 
			font-size: 1.1rem;
		}
		.bx{
			/* font-size: 1.8rem !important; */
		}
		#prs{
			width: 83%; 
			height: 50px;
			margin-bottom: 0.8rem;
			float: right;
			margin-right: 1.5rem;
		}
		#newBtn{
			float: right;
			margin-right: 0rem !important;
		}
		.pagination{
			width: 100%;
			text-align: center;
			float: left;
		}
		.card-category{
			font-size: 12px;
		}
		.LanguageBar_languages__2Ilqf li{
		 transition: all 0.2s ease-in-out;
		}
		.LanguageBar_languages__2Ilqf li:not(.selected) {
		  opacity: 0.5;
		}
		.LanguageBar_languages__2Ilqf li.selected {
		border: 1px solid dray !important;
		 filter: blur(0);
		transform: scale(1.1);
		}
		.bx-show{
			/* margin-bottom: 5px; */
		}
		.bx-bookmark{
			float: right; 
		}
		.countDiv{
			float: right;
		}
		.flex-grow-1{
			margin-bottom: 15rem;
		}
		 #pagingArea {
		            width: fit-content;
		            margin: auto;
		            margin-top: 5rem;
		}
		.pagination li{
			border: 1px solid lightgray;
		}
		.pagination{
			width: 100%;
			text-align: center;
			float: left;
			margin-top: 3rem;
			margin-right: 3rem;
		}
		.page-link{
			background-clip: border-box !important;
			background-color: white !important;
			color: #0d6efd !important;
		}



  </style>

</head>
<body>

<div id="app">

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
                <section class="row">

                    <!-- 친구 목록 -->
                    <div class="UJ-col-12 col-lg-9" style="background-color: white;">

                        <!--            
            <div class="UJ-header" >
                
              
            </div>
             -->


                        <!-- 친구 목록 테이블 -->
                        <div class="UJ-menu">


                            <br><br>
                            <!-- table hover -->
                            <div class="table-responsive">

                                친구 목록
                                <script src="resources/assets/static/js/initTheme.js"></script>

                                <!-- Button trigger for login form modal -->
                                <button type="button"
                                    style="border-radius: 10px; background-color: #435ebe; margin-left: 700px; margin-bottom: 20px; color: white;"
                                    data-bs-toggle="modal" data-bs-target="#inlineForm">
                                    친구 찾기
                                </button>

                                <!--login form Modal -->
                                <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog"
                                    aria-labelledby="myModalLabel33" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                        role="document">
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


                                                                        <!-- <td class="friend-menu" id="toggleButton" > -->

                                                                        <!-- <div id="targetDiv" style="background-color: #fff; width: 150px; height: 80px; display: none; border: 1px solid gray; border-radius: 10px; padding-top: 20px;">
                                                                    
                                                                    <ul style="list-style: none;">
                                                                        <li>친구 추가</li>
                                                                        <li>친구 차단</li>
                                                                    </ul>
                                                                </div> -->



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

                                                                    <tr>
                                                                        <td class="text-bold-500">user01</td>
                                                                        <td>김뫄뫄</td>
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

                                                                    <tr>
                                                                        <td class="text-bold-500">user01</td>
                                                                        <td>김뫄뫄</td>
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

                                                                    <tr>
                                                                        <td class="text-bold-500">user01</td>
                                                                        <td>김뫄뫄</td>
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

                                                                </tbody>


                                                            </table>
                                                        </div>
                                                        
                                                        

                                                        <br><br>
                                                        
                                                        
                                                        <div>
                                                        
                                                        
                                                        </div>


                                                    </div>


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
                                <table class="table mb-0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status</th>
                                            <th>Chat</th>
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

                                            <td><a href="#"><i
                                                        class="badge-circle badge-circle-light-secondary font-medium-1"
                                                        data-feather="mail"></i></a>
                                            </td>

                                            <!-- <td class="friend-menu" id="toggleButton" >⁝
                                          
                                            <div id="targetDiv" style="background-color: #fff; width: 150px; height: 80px; display: none; border: 1px solid gray; border-radius: 10px; padding-top: 20px;">
                                                
                                                <ul style="list-style: none;">
                                                    <li>친구 추가</li>
                                                    <li>친구 차단</li>
                                                </ul>
                                            </div> -->







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

                                            <td><a href="#"><i
                                                        class="badge-circle badge-circle-light-secondary font-medium-1"
                                                        data-feather="mail"></i></a>
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

                                            <td><a href="#"><i
                                                        class="badge-circle badge-circle-light-secondary font-medium-1"
                                                        data-feather="mail"></i></a>
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

                                            <td><a href="#"><i
                                                        class="badge-circle badge-circle-light-secondary font-medium-1"
                                                        data-feather="mail"></i></a>
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
            <jsp:include page="../common/footer.jsp"></jsp:include>
            </div>

        </div>
    </div>


    <script src="resources/assets/js/main.js"></script>
    <script src="resources/vendors/choices.js/choices.min.js"></script>



</body>
</html>