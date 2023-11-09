

![header](https://capsule-render.vercel.app/api?type=waving&color=timeGradient&text=Welcome%20to%20OKKH%20Project%20👋&animation=twinkling&fontSize=35&fontAlignY=40&fontAlign=70&height=250)

<!--
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;    <img src="okkh/src/main/webapp/resources/images/logo/okkh1.png" >
-->
# OKKH

<br><br>
## 🖥️ 프로젝트 소개 
GitHub API를 활용한 팀 프로젝트 구성 및 관리 사이트 

<br><br>
## 📆 개발 기간 
2023.09.19 - 2023. 11.07


<br><br>
## 👨‍👩‍👧‍👦 멤버 구성 
- 윤정묵 : Oauth를 통한 GitHub 로그인 연동, WebSocket을 통한 채팅 기능, 메인페이지, 마이페이지
- 김유정 : 프로젝트 모집, 나의PR, 친구 추가 및 관리 / GitHub rest API를 통한 PullRequest 관리
- 윤관현 : 나의 프로젝트 , 완료된 프로젝트, 캘린더 관리 /  GitHub rest API를 통한 Repository , Commit List, Branch, Merge 관리
- 이승준 : 팀장!  / Web-Client 예외 처리 / GitHub rest API를 통한 label, issue, mileStone 관리


<br><br>
## ⚙️개발 환경 

- 개발 툴 : STS(Spring Tool Suite) , VScode
- Server : Apach Tomcat 9.0 
- DB : Oracle DB
- 형상 관리 : GIt, GitHub, SourceTree



### 기술 스택 
- FrontEnd : HTML5, JavaScript, JQuery , AJax , CSS3 , Json
- BackEnd : Java 11, Spring, PostMan, MyBatis , Maven 
  

<br><br>
## 📖 프로젝트 설명 
 #### ❓ 왜 이 프로젝트를 기획했나요?
  &nbsp;&nbsp;&nbsp; - GitHub은 협업을 위한 웹 기반 플랫폼입니다. 하지만 GitHub를 처음 접하는 개발자들에게는 사용법이 다소 복잡하고 어렵게 느껴질 수 있습니다. 저희 OKKH를 통해 손쉽게 프로젝트를 모집하고, GitHub 기능을 통해 효율적인 협업이 가능합니다.
 #### ❓ 이 프로젝트의 특징은 무엇인가요?
   &nbsp;&nbsp;&nbsp; - 프로젝트 모집과 더불어 프로젝트 진행 상황을 팀원들과 쉽게 공유할 수 있습니다.
 #### ❓ 이 프로젝트는 어떤 문제를 해결하나요?
  &nbsp;&nbsp;&nbsp; - GitHub은 협업을 위한 웹 기반 플랫폼입니다. 하지만 GitHub를 처음 접하는 개발자들에게는 사용법이 다소 복잡하고 어렵게 느껴질 수 있습니다. 저희 OKKH를 통해 손쉽게 프로젝트를 모집하고, GitHub 기능을 통해 효율적인 협업이 가능합니다.
 #### ❓ 이 프로젝트를 통해 무엇을 배우셨나요?
 #### ❓ 여러분이 당면했던 문제나 나중에 추가하고 싶은 기능이 무엇인가요?

 
<br><br>
## 프로젝트 구현
### 😊 메인 페이지 😊 <!--윤정묵-->
&nbsp;&nbsp;&nbsp; - Oauth를 통한 로그인

&nbsp;&nbsp;&nbsp; - 조회수 기준 Top4 게시글 노출 및 조회

<br><br>
### 😊 마이 페이지 😊
&nbsp;&nbsp;&nbsp; - 나의 정보 수정 

&nbsp;&nbsp;&nbsp; - 내가 작성한 게시글 조회

<br><br>
### 😊 친구 관리 😊
&nbsp;&nbsp;&nbsp; - 친구 조회 

&nbsp;&nbsp;&nbsp; - 친구 추가

&nbsp;&nbsp;&nbsp; - 친구 차단

<br><br>
### 😊 채팅 (1:1 / 1:n) 😊
&nbsp;&nbsp;&nbsp; - 채팅방 초대

&nbsp;&nbsp;&nbsp; - 채팅


<br><br>
### 😊 나의 PR 😊
&nbsp;&nbsp;&nbsp; - PR 작성

&nbsp;&nbsp;&nbsp; - PR 수정 및 삭제


<br><br>
### 😊 프로젝트 모집 😊

&nbsp;&nbsp;&nbsp; - 프로젝트 모집글 작성

&nbsp;&nbsp;&nbsp; - 프로젝트 참여하기(작성자에게 실시간 알림)

&nbsp;&nbsp;&nbsp; - 프로젝트 팀원 추가 및 확정

<br><br>
### 😊 나의 프로젝트 😊
&nbsp;&nbsp;&nbsp; - 모집된 팀원으로 프로젝트 생성

&nbsp;&nbsp;&nbsp; - 프로젝트 완료 처리

<br><br>
### 😊 Repository 😊

&nbsp;&nbsp;&nbsp; - Repository 생성 및 관리

&nbsp;&nbsp;&nbsp; - Branch 별 최근 commit 조회

&nbsp;&nbsp;&nbsp; - Repository 전체 Commit 조회

&nbsp;&nbsp;&nbsp; - Repository 코드 조회

&nbsp;&nbsp;&nbsp; - Repository Branch 별 Merge


<br><br>
### 😊 Issue 😊

&nbsp;&nbsp;&nbsp; - Repository 별 Issue 목록 조회

&nbsp;&nbsp;&nbsp; - Issue 내 label 및 상태 조회

&nbsp;&nbsp;&nbsp; - Issue 작성


<br><br>
### 😊 MileStone 😊
&nbsp;&nbsp;&nbsp; - MileStone 생성 및 관리

&nbsp;&nbsp;&nbsp; - MileStone 내 Issue 진행 상태로 진척도 관리


<br><br>
### 😊 Pull-Request 😊
&nbsp;&nbsp;&nbsp; - Repository 별 Pull-Request 조회

&nbsp;&nbsp;&nbsp; - Pull-Request 작성 

&nbsp;&nbsp;&nbsp; - Pull-Request review 작성 및 조회

&nbsp;&nbsp;&nbsp; - Pull-Request 진행 상태 관리

