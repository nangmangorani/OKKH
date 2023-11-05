<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    
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

#prList{
	width: 100%;
	height: 1500px !important;
}

#card-id{
	margin-bottom: 15px !important;
}
 
.bx-bookmark::before{
	/* width: 30px;
	height: 30px; */
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
            

            <div class="page-content" > 
                <section class="row">
                
                  
            
                
                <div class="UJ-col-12 col-lg-9" >
                    
                    <!-- 전체보기/ 모집중 / 모집 완료만 보기  -->
                    <div class="UJ-header" >

                
                        

                    </div>
            
            <!-- 메뉴 바 (기술 스택 등 선택하는 곳) -->
            <div class="UJ-menu" >
                <!-- <select name="" id="" > 
                    <option value="1">기술 스택</option>
                    
                </select> -->
                <!-- <div class="col-md-6 mb-1">
                    <div class="input-group mb-3">xd
                        <span class="input-group-text" id="basic-addon1"><i
                                class="bi bi-search"></i></span>
                        <input type="text" class="form-control" placeholder="제목, 내용으로 검색하세요"
                            aria-label="Recipient's username" aria-describedby="button-addon2" style="display: inline;">
                        <button class="btn btn-outline-secondary" type="button"
                            id="button-addon2">Button</button>
                    </div>
                </div> -->



                <button id="toggleButton" style="background-color: white; border-radius:20px;">기술 스택 ↓</button>
                <div id="targetDiv" style="background-color: #fff; width: 1100px; height: 700px; display: none; border: 1px solid gray; border-radius: 20px;">
                 
                    <ul class="nav nav-tabs nav-fill" role="tablist" style="margin-bottom: 0; " >
                        <li class="nav-item" style="margin: 0;">
                              
                              
                              
                            <!-- 버튼들을 누르면 data-bs-target에 작성된 곳으로 이동됨-->
                              <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="true">
                                <i class="tf-icons bx bx-home"></i>  &nbsp; <b style="font-size: 17px;">모두보기</b>
                                <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-danger"></span>
                              </button>
                            </li>

                            <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="false">
                                  <i class='bx bx-desktop'></i> &nbsp; 프론트엔드  
                                </button>
                              </li>
                              <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-messages" aria-controls="navs-justified-messages" aria-selected="false">
                                  <i class='bx bxs-server'></i>  &nbsp; 백엔드
                                </button>
                              </li>
                                <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-mobile" aria-controls="navs-justified-messages" aria-selected="false">
                                 <i class='bx bx-mobile-alt' ></i>  &nbsp; 모바일
                                </button>
                              </li>
                                <li class="nav-item">
                                <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-etc" aria-controls="navs-justified-messages" aria-selected="false">
                                  <i class='bx bxs-guitar-amp'></i>  &nbsp; 기타
                                </button>
                              </li>

         

                    </ul>


                    <div class="tab-content" style="overflow: auto; width: 100%;">
                        <div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
                          <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box; ">
                          
                          <!-- 기술 스택 모두 보기 -->
                              <ul class="LanguageBar_languages__2Ilqf" >
                              <li value="JavaScript" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/javascript.svg" alt="JavaScript"><span>JavaScript</span></li>
                              <li value="TypeScript" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/typescript.svg" alt="TypeScript"><span>TypeScript</span></li>
                              <li value="React" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/react.svg" alt="React"><span>React</span></li>
                              <li value="Vue" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/vue.svg" alt="Vue"><span>Vue</span></li>
                              <li value="Svelte" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/svelte.svg" alt="Svelte"><span>Svelte</span></li>
                              <li value="Nextjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
                              <li value="Nodejs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
                              <li value="Java" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/java.svg" alt="Java"><span>Java</span></li>
                              <li value="Spring" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/spring.svg" alt="Spring"><span>Spring</span></li>
                              <li value="Go" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/go.svg" alt="Go"><span>Go</span></li>
                              <li value="Nestjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nestjs.svg" alt="Nestjs"><span>Nestjs</span></li>
                              <li value="Kotlin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
                              <li value="Express" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/express.svg" alt="Express"><span>Express</span></li>
                              <li value="MySQL" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mysql.svg" alt="MySQL"><span>MySQL</span></li>
                              <li value="MongoDB" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mongodb.svg" alt="MongoDB"><span>MongoDB</span></li>
                              <li value="Python" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/python.svg" alt="Python"><span>Python</span></li>
                              <li value="Django" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/django.svg" alt="Django"><span>Django</span></li>
                              <li value="php" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/php.svg" alt="php"><span>php</span></li>
                              <li value="GraphQL" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/graphql.svg" alt="GraphQL"><span>GraphQL</span></li>
                              <li value="Firebase" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/firebase.svg" alt="Firebase"><span>Firebase</span></li>
                              <li value="Flutter" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/flutter.svg" alt="Flutter"><span>Flutter</span></li>
                              <li value="Swift" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/swift.svg" alt="Swift"><span>Swift</span></li>
                              <li value="ReactNative" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/reactnative.svg" alt="ReactNative"><span>ReactNative</span></li>
                              <li value="Unity" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/unity.svg" alt="Unity"><span>Unity</span></li>
                              <li value="AWS" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/aws.svg" alt="AWS"><span>AWS</span></li>
                              <li value="Kubernetes" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kubernetes.svg" alt="Kubernetes"><span>Kubernetes</span></li>
                              <li value="Docker" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/docker.svg" alt="Docker"><span>Docker</span></li>
                              <li value="Git" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/git.svg" alt="Git"><span>Git</span></li>
                              <li value="Figma" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/figma.svg" alt="Figma"><span>Figma</span></li>
                              <li value="Zeplin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/zeplin.svg" alt="Zeplin"><span>Zeplin</span></li>
                              <li value="Jest" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/jest.svg" alt="Jest"><span>Jest</span></li>
                              </ul>
                          </section>
                        </div>
                        </div>



                          <!-- 프론트엔드 보기 -->
                          <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel" >
                            <section class="desktopFilter_filterWrapper__1gwsT">
                          <ul class="LanguageBar_languages__2Ilqf" >
                          <li value="JavaScript" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/javascript.svg" alt="JavaScript" ><span>JavaScript</span></li>
                          <li value="TypeScript" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/typescript.svg" alt="TypeScript"><span>TypeScript</span></li>
                          <li value="React" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/react.svg" alt="React"><span>React</span></li>
                          <li value="Vue" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/vue.svg" alt="Vue"><span>Vue</span></li>
                          <li value="Svelte" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/svelte.svg" alt="Svelte"><span>Svelte</span></li>
                          <li value="Nextjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
                          <li value="Nodejs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
                          </ul>
                        </section>
                        </div>
                    
                    
                     <!-- 백엔드 보기 -->
                    <div class="tab-pane fade" id="navs-justified-messages" role="tabpanel">
                       <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
                          <ul class="LanguageBar_languages__2Ilqf">
                          <li value="Firebase" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/firebase.svg" alt="Firebase"><span>Firebase</span></li>
                          <li value="Nestjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nestjs.svg" alt="Nestjs"><span>Nestjs</span></li>
                          <li value="Kotlin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
                          <li value="php" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/php.svg" alt="php"><span>php</span></li>
                          <li value="Django" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/django.svg" alt="Django"><span>Django</span></li>
                          <li value="GraphQL" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/graphql.svg" alt="GraphQL"><span>GraphQL</span></li>
                          <li value="Nextjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
                          <li value="Nodejs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
                          <li value="Java" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/java.svg" alt="Java"><span>Java</span></li>
                          <li value="Spring" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/spring.svg" alt="Spring"><span>Spring</span></li>
                          <li value="Go" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/go.svg" alt="Go"><span>Go</span></li>
                          <li value="Express" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/express.svg" alt="Express"><span>Express</span></li>
                          <li value="MySQL" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mysql.svg" alt="MySQL"><span>MySQL</span></li>
                          <li value="MongoDB" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mongodb.svg" alt="MongoDB"><span>MongoDB</span></li>
                          <li value="Python" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/python.svg" alt="Python"><span>Python</span></li>
                          </ul>
                      </section>
                    </div>
                    
                     <!-- 모바일 보기 -->
                    <div class="tab-pane fade" id="navs-justified-mobile" role="tabpanel">
                            <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
                          <ul class="LanguageBar_languages__2Ilqf">
                          <li value="Kotlin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
                          <li value="Flutter" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/flutter.svg" alt="Flutter"><span>Flutter</span></li>
                          <li value="Swift" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/swift.svg" alt="Swift"><span>Swift</span></li>
                          <li value="ReactNative" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/reactnative.svg" alt="ReactNative"><span>ReactNative</span></li>
                          <li value="Unity" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/unity.svg" alt="Unity"><span>Unity</span></li>
                          </ul>
                      </section>
                    </div>
                    
                     <!-- 기타 보기 -->
                    <div class="tab-pane fade" id="navs-justified-etc" role="tabpanel">
                            <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
                          <ul  class="LanguageBar_languages__2Ilqf">
                          <li value="AWS" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/aws.svg" alt="AWS"><span>AWS</span></li>
                          <li value="Kubernetes" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kubernetes.svg" alt="Kubernetes"><span>Kubernetes</span></li>
                          <li value="Docker" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/docker.svg" alt="Docker"><span>Docker</span></li>
                          <li value="Git" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/git.svg" alt="Git"><span>Git</span></li>
                          <li value="Figma" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/figma.svg" alt="Figma"><span>Figma</span></li>
                          <li value="Zeplin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/zeplin.svg" alt="Zeplin"><span>Zeplin</span></li>
                          <li value="Jest" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/jest.svg" alt="Jest"><span>Jest</span></li>
                          </ul>
                      </section>
                    </div>



                </div>
                





				<script>
					var val1 = "";
					
					// ul 태그(class =LanguageBar_languages__2Ilqf)의 후손 li태그를 누를때마다 해당 li의 value 값 + ' '을 
					// val1에다가 누적하는 코드
					$(document).on("click",".LanguageBar_languages__2Ilqf li", function(){
					     val1 += $(this).attr('value') + ' ';
					     console.log(val1);
					});
				
				</script>



				<!--테스트 끝 -->




                <!-- 
                
                    기술 스택 누르면 해당 기술 스택이 포함된 pr이 나오는 곳
	                	==> But! 저는 시간 관계상 하지 않았습니다. (프로젝트 포함)
	                	==> 혹시라도 이걸 참고할 분이 있다면 미리 죄송하다는 말씀을....ㅎㅎ 
	                	==> 저는 안했지만, 이걸 보시는 분은 꼭 도전해서 성공하길.... 화이팅!!
	                	==> from 유정(호빵)
                
                 -->
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
		
		        </script>
		        
		        <script>
		
		                const liItems = document.querySelectorAll('.LanguageBar_languages__2Ilqf li');
		                var val2 = [];
		        
		                liItems.forEach(li => {
		                  li.addEventListener('click', () => {
		                    if (li.classList.contains('selected')) {
		                      li.classList.remove('selected');
		                     val2 = val2.filter((element) => element !== li.getAttribute('value'));
		                    } else {
		                      li.classList.add('selected');
		                      val2.push(li.getAttribute('value'));
		                    }
		                       console.log(val2); // log value to console */
		
		                       let val3 = val2.join(",")  // val3은 val2를 ,로 나눠서 저장하겠다는 의미
		                       console.log(val3);  // 이건 값이 잘 넘어옴
		                       
		                       
		                       // 이건 스택 누를때마다 해당 기술이 포함된 리스트가 보이는 아작스
		                       $.ajax({
		                    	   
		                    	   url:"ajaxStackSelect.pr",
		                    	   data:{"stackList":val3},
		                    	   type:"post",
		                    	   success:function(data){
		                    		   
		                    		   var list = JSON.parse(data);
		                    		   
		                    		   console.log(data + " : 아아아ㄴ")
		                    		   
		                    		   
		                    		  
		                    		   
		                    		   
		                    		   
		                    	   },
		                    	   error:function(){
		                    		   console.log("기술 스택으로 목록 조회용 아작스 실패ㅠㅠㅠㅠ")
		                    	   }
		                    		   
		                    	 
		                    	   
		                       })
		                       
		                       
		
		                })
		                
		            })
                </script>






               
            <form id="searchForm" action="searchBar.pro" method="get" style="display:inline-flex;">     
                <div class="text" style="position: relative;">
			        <input placeholder="제목, 글 내용을 검색해보세요." style="padding-left: 20px;" name="keyword" type="text">
			     
			     <button type="submit" style=" width: 70px; border-radius: 10px; position: absolute; top: 52%; transform: translateY(-50%); right: 0px; border:none; background-color: transparent;">
			        <!-- background-color: transparent;는 버튼의 배경색 없애는 스타일 -->
			        
			        <img src="https://holaworld.io/images/info/search.png" style="width: 25px; height: 25px; " id="searchBar">
                	
                </button>
			    
			    </div>
                <!--  
               
                
                -->
            </form>
               
                    <select name="" id="" style="margin-left: 50px;">
                        <option value="0">조회수 순</option>
                        <option value="1">즐겨찾기 순</option>
                        <option value="2">최신 순</option>
                    </select>

		
				<c:if test="${not empty loginMember }">
                    <button class="btn btn-primary" style="margin-left: 50px; width: 170px; border-radius: 10px;" onclick="location.href='enrollPRFr.pr'" >PR 작성하기</button>
				
				</c:if>
				
				
                
                
            </div>

            <!-- 메인 내용 -->
            <!-- 첫번째 있는 div만 남기고 나머지는 다 지우기  -->
            <!-- 어차피 반복문으로 돌릴거임 -->

            <div class="UJ-content" >
            <c:forEach var="pr" items="${list }">
            	<input type="hidden" name="prNo" value="${pr.prNo }" >
            
             <c:choose>
               <c:when test="${not empty loginMember }">
                <div  class="UJ-ProjectContent" onclick="location.href='detailPr.pr?pno=' + ${pr.prNo}" >
                  
               
                  
                  
                    <!-- 마감일 , 북마크 -->
                    <div id="UJ-dateMark">
                        <div id="UJ-date">
                            작성일 : ${pr.createDate }
                        </div>
                        
                      <!--  
                        <div id="UJ-bookMark">
                            <img class="heartImage" src="https://holaworld.io/images/info/bookmark.png" style="width: 45px; height: 45px;">
                        </div>
                        
                       -->   
                    </div>

                    <!-- 제목 -->
                    <div id="UJ-title">
                       ${pr.prTitle }
                    </div>
                    
                    <!-- 기술 이미지 , 기술 스택을,로 구분지어서 자른다음에 이미지 주소에 넣음-->
                   <div id="UJ-techImg">
					    <c:set var="techStacks" value="${fn:split(pr.stackName, ',')}" />
					    <c:forEach items="${techStacks}" var="techStack">
					    <c:set var="src" value="https://holaworld.io/images/languages/${techStack}.svg"/>
					        <img src="${src }" alt="${src}">
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
                       
                     작성자 : ${pr.prWriter}
                    </div>

                    
                    
                    
                  </div>
                  </c:when>
                  
                  <c:otherwise>
                  <div  class="UJ-ProjectContent" onclick="notLogin();" >
                  
               
                  
                  
                    <!-- 마감일 , 북마크 -->
                    <div id="UJ-dateMark">
                        <div id="UJ-date">
                            작성일 : ${pr.createDate }
                        </div>
                        
                      <!--  
                        <div id="UJ-bookMark">
                            <img class="heartImage" src="https://holaworld.io/images/info/bookmark.png" style="width: 45px; height: 45px;">
                        </div>
                        
                       -->   
                    </div>

                    <!-- 제목 -->
                    <div id="UJ-title">
                       ${pr.prTitle }
                    </div>
                    
                    <!-- 기술 이미지 , 기술 스택을,로 구분지어서 자른다음에 이미지 주소에 넣음-->
                   <div id="UJ-techImg">
					    <c:set var="techStacks" value="${fn:split(pr.stackName, ',')}" />
					    <c:forEach items="${techStacks}" var="techStack">
					    <c:set var="src" value="https://holaworld.io/images/languages/${techStack}.svg"/>
					        <img src="${src }" alt="${src}">
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
                       
                     작성자 : ${pr.prWriter}
                    </div>

                    
                    
                    
                  </div>
                  
                  </c:otherwise>
                  
                  
                  
                 </c:choose> 
			</c:forEach>
                
          
        
                
                
            </div>

			
       

        </div>
        
           <!-- 사이드에 친구 목록 -->
       
     <!-- 친구 및 팀원 시작 -->
      <jsp:include page="../common/rightSide.jsp" />
      <!-- 친구 및 팀원 끝 -->
      
      
        </div>
              	
  
   
 		 
        
        
        

        <script>
            // 이미지 요소들을 가져옵니다.
            const heartImages = document.querySelectorAll(".heartImage");

            // 각 이미지에 대한 클릭 이벤트 핸들러를 추가합니다.
            heartImages.forEach((image) => {
            image.addEventListener("click", () => {
                // 이미지의 현재 src 속성 값을 확인합니다.
                const currentSrc = image.src;

                // 빈 하트 이미지의 경로와 현재 이미지의 경로를 비교하여 토글합니다.
                if (currentSrc.endsWith("https://holaworld.io/images/info/bookmark.png")) {
                image.src = "https://holaworld.io/images/info/bookmark_filled.png"; // 채워진 하트 이미지로 변경
                } else if (currentSrc.endsWith("https://holaworld.io/images/info/bookmark_filled.png")) {
                image.src = "https://holaworld.io/images/info/bookmark.png"; // 빈 하트 이미지로 변경
                }
            });
            });
            
            
           
            
        
            
            
     </script>
     
     <script>
     	function notLogin(){
     		alertify.alert("로그인 후에 이용가능한 서비스 입니다")
     	}
     </script>
    
	
    
    
        
    </section>

    
    
</div>




</div>
    
   


</body>
</html>