

![header](https://capsule-render.vercel.app/api?type=waving&color=timeGradient&text=Welcome%20To%20OKKH%20👋&animation=twinkling&fontSize=35&fontAlignY=40&fontAlign=70&height=250)

<!--
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;    <img src="okkh/src/main/webapp/resources/images/logo/okkh1.png" >
-->
# OKKH

<br><br>
## 📢프로젝트 소개
GitHub API 연동을 통한 팀 프로젝트 구성 및 협업 사이트 

<br><br>
## 📆 개발 기간 
2023.09.19 - 2023. 11.07


<br><br>
## 👨‍👩‍👧‍👦 멤버 구성 
- 윤정묵 (https://github.com/JMOOK0816)
  
   &nbsp;&nbsp;&nbsp; - Oauth를 통한 GitHub 로그인 연동
  
   &nbsp;&nbsp;&nbsp; -  WebSocket을 통한 채팅 기능

   &nbsp;&nbsp;&nbsp; - 메인페이지

   &nbsp;&nbsp;&nbsp; - 마이페이지
  
- 김유정 (https://github.com/HoBBang1004)
  
   &nbsp;&nbsp;&nbsp; - 프로젝트 모집

   &nbsp;&nbsp;&nbsp; - 나의PR
  
   &nbsp;&nbsp;&nbsp; - 친구 추가 및 관리

   &nbsp;&nbsp;&nbsp; -  WebSocket을 통한 실시간 알림

   &nbsp;&nbsp;&nbsp; -  GitHub rest API를 통한 PullRequest 관리
 
   &nbsp;&nbsp;&nbsp; -  GitHub rest API를 통한 PullRequest commit List

   &nbsp;&nbsp;&nbsp; -  GitHub rest API를 통한 PullRequest branch List

   &nbsp;&nbsp;&nbsp; -  GitHub rest API를 통한 PullRequest Review List

  
- 윤관현 (https://github.com/YoonTarget)

   &nbsp;&nbsp;&nbsp; - 나의 프로젝트
  
    &nbsp;&nbsp;&nbsp; - 완료된 프로젝트

    &nbsp;&nbsp;&nbsp; - 캘린더 관리

    &nbsp;&nbsp;&nbsp; -  GitHub rest API를 통한 Repository

    &nbsp;&nbsp;&nbsp; -  Commit List

    &nbsp;&nbsp;&nbsp; -  Branch

    &nbsp;&nbsp;&nbsp; -  Merge 관리
  
- 이승준 (https://github.com/nangmangorani)
  
  &nbsp;&nbsp;&nbsp; - 팀장

  &nbsp;&nbsp;&nbsp; - Web-Client 예외 처리

  &nbsp;&nbsp;&nbsp; - GitHub rest API를 통한 label
  
  &nbsp;&nbsp;&nbsp; - issue 관리

  &nbsp;&nbsp;&nbsp; - mileStone 관리


<br><br>
## ⚙️개발 환경 

- 개발 툴 : STS(Spring Tool Suite) , VScode
- Server : Apach Tomcat 9.0 
- DB : Oracle DB
- 형상 관리 : Git, GitHub, SourceTree



### 🌈 기술 스택 
- FrontEnd : HTML5, JavaScript, JQuery , AJax , CSS3 , Json
- BackEnd : Java 11, Spring, PostMan, MyBatis , Maven 
  

<br><br>
## 📖 프로젝트 설명 
 #### ❓ 왜 이 프로젝트를 기획했나요?
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  GitHub는 협업을 위한 웹 기반 플랫폼입니다. 하지만 처음 접하는 개발자들에게는 사용법이 다소 복잡하고 어렵게 느껴질 수 있습니다. 
  
  &nbsp;&nbsp;저희 OKKH를 통해 손쉽게 프로젝트를 모집하고, GitHub rest API 연동을 통해 효율적인 협업이 가능합니다.

 <br><br>
 #### ❓ 이 프로젝트는 어떤 문제를 해결하나요?
  &nbsp;&nbsp;&nbsp; 1. OKKH의 직관적인 UI로 다루기 어려운 GitHub 내의 주요 기능들을 쉽게 사용할 수 있습니다. 
  
   &nbsp;&nbsp;&nbsp;  2. OKKH에서 프로젝트 모집과 더불어 프로젝트 진행 상황을 팀원들과 쉽게 공유할 수 있습니다.
   
   &nbsp;&nbsp;&nbsp;  3. OKKH에서 채팅 기능을 통해 팀원과 쉽게 소통이 가능합니다.

  <br><br>
 #### ❓ 이 프로젝트를 통해 무엇을 배우셨나요?

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 그 전부터 GitHub를 이용했지만 주요 기능들 Issue, MileStone, Pull-Request나 Repository 등의 사용법을 잘 알지 못했습니다.

  
  &nbsp;&nbsp;&nbsp;  이번 프로젝트를 계기로 GitHub를 활용한 프로젝트 협업 방식에 대해 더 배우게 되었습니다.

  
  &nbsp;&nbsp;&nbsp; 이 경험을 토대로 GitHub를 활용한 현업에서도 잘 적응할 수 있는 자신감을 얻었습니다.
  

 <br><br>
 #### ❓ 여러분이 당면했던 문제나 나중에 추가하고 싶은 기능이 무엇인가요?

- 윤정묵

- 김유정
  
&nbsp;GitHub의 Pull-Request를 보면 Reviewer를 따로 지정해서 Review를 요청하고,  Merge 여부를 동의를 받은 후 Merge도 진행합니다. 하지만 OKKH에서 Merge는 다른 팀원들의 결과물에 영향을 줄 수 있다고 판단하여 구현하지 않았습니다. 또한, Reviewer도 따로 지정하지 않고, 조직에 속한 팀원들 전체를 Reviewer라고 임의로 지정한 후, 코드에 대한 Review만 진행하도록 구현했습니다. 

&nbsp; GitHub의 Pull-Request에서 제공하는 서비스처럼 OKKH의 Pull-Request에서도 Reviewer를 따로 지정한 후 동의를 받아 Merge까지 할 수 있는 기능을 추가하고 싶습니다.


- 윤관현

&nbsp;&nbsp;레파지토리 내의 컨텐츠를 불러오는 작업에 시간을 많이 할애했습니다. 최종적인 소스코드가 담긴 파일에 접근할 때까지는 List로 값을 불러오고, 최종 파일은 객체로 값을 불러옴으로써 문제를 해결할 수 있었습니다. 또한, 소스코드를 불러오는 일도 관련 API가 제공되지 않아 GitHub 내의 소스코드를 볼 수 있는 URL을 활용해 해결했습니다.

&nbsp;&nbsp;현재는 레파지토리 내의 컨텐츠를 조회하는 기능이 주를 이루지만 추후에는 새로운 코드를 Commit 하거나 수정하는 기능과 코드에 리뷰를 달 수 있는 기능을 구현하고 싶습니다.

- 이승준

 
<br><br>
## 🎞프로젝트 구현

<br><br>
### 🐶윤정묵


#### 😊 메인 페이지 😊 
&nbsp;&nbsp;&nbsp; - Oauth를 통한 로그인

&nbsp;&nbsp;&nbsp; - 조회수 기준 Top4 게시글 노출 및 조회

<br><br>
#### 😊 마이 페이지 😊
&nbsp;&nbsp;&nbsp; - 나의 정보 수정 

&nbsp;&nbsp;&nbsp; - 내가 작성한 게시글 조회

<br><br>
#### 😊 채팅 (1:1 / 1:n) 😊
&nbsp;&nbsp;&nbsp; - 채팅방 초대

&nbsp;&nbsp;&nbsp; - 채팅

<br><br>
### 🐯김유정


#### 😊 친구 관리 😊

&nbsp;&nbsp;&nbsp; - 친구 조회 


<img src="https://github.com/nangmangorani/OKKH/assets/134485591/fe0511d7-883d-4d5e-aec1-29e85fcfb1dc">


&nbsp;&nbsp;&nbsp; - 친구 추가

&nbsp;&nbsp;&nbsp; - 친구 차단

<br><br>
### 😊 나의 PR 😊
&nbsp;&nbsp;&nbsp; - PR 작성

&nbsp;&nbsp;&nbsp; - PR 수정 및 삭제


<br><br>
#### 😊 프로젝트 모집 😊

&nbsp;&nbsp;&nbsp; - 프로젝트 모집글 작성

&nbsp;&nbsp;&nbsp; - 프로젝트 참여하기(작성자에게 실시간 알림)

&nbsp;&nbsp;&nbsp; - 프로젝트 팀원 추가 및 확정

<br><br>

<br><br>
#### 😊 Pull-Request 😊
&nbsp;&nbsp;&nbsp; - Repository 별 Pull-Request 조회

&nbsp;&nbsp;&nbsp; - Pull-Request 작성 

&nbsp;&nbsp;&nbsp; - Pull-Request review 작성 및 조회

&nbsp;&nbsp;&nbsp; - Pull-Request 진행 상태 관리

<br><br>
### 🐷윤관현


#### 😊 나의 프로젝트 😊
&nbsp;&nbsp;&nbsp; - 모집된 팀원으로 프로젝트 생성 및 조회

<img src="https://user-images.githubusercontent.com/126389803/282291341-73443f50-6cd4-4d4f-ab8f-e6a8f6c5f452.png">
<img src="https://user-images.githubusercontent.com/126389803/282291342-378ee231-4efb-4595-8278-d1273580df81.png">
<img src="https://user-images.githubusercontent.com/126389803/282291344-17a68b32-c1b6-4bf6-a10e-4104292d8738.png">
<img src="https://user-images.githubusercontent.com/126389803/282291345-aee0550d-4529-44ff-88f0-a68304af6809.png">

<br><br>
#### 😊 Repository 😊

&nbsp;&nbsp;&nbsp; - Repository 생성 및 관리

<img src="https://user-images.githubusercontent.com/126389803/282291346-641cc35a-7b28-46a2-918e-9911de2d386e.png">
<img src="https://user-images.githubusercontent.com/126389803/282291349-96d83ce4-7fbb-4d74-a495-6ca7925f093f.png">
<img src="https://user-images.githubusercontent.com/126389803/282291352-bc19fcbb-4aef-41a4-a200-0fe36994a926.png">

<br><br>
&nbsp;&nbsp;&nbsp; - Branch 별 최근 commit 조회

<img src="https://user-images.githubusercontent.com/126389803/282291358-6992bb99-e04c-4111-813e-60aafb55200e.png">

<br><br>
&nbsp;&nbsp;&nbsp; - Repository 전체 Commit 조회

<img src="https://user-images.githubusercontent.com/126389803/282291357-7f4843d8-1c26-491d-8502-87dafa92f055.png">

<br><br>
&nbsp;&nbsp;&nbsp; - Repository 컨텐츠 및 코드 조회

<img src="https://user-images.githubusercontent.com/126389803/282291353-f59c319d-6a7a-432a-92d4-afe7c2151e12.png">
<img src="https://user-images.githubusercontent.com/126389803/282291356-0008707f-e4f4-40bf-babb-61bef45c1982.png">

<br><br>
#### 😊 Calendar 😊
&nbsp;&nbsp;&nbsp; - 일정관리

<img src="https://user-images.githubusercontent.com/126389803/282291360-fe49f405-6518-4c56-bdcb-72cea1810cb8.png">

<br><br>
### 🐮이승준


#### 😊 Issue 😊

&nbsp;&nbsp;&nbsp; - Repository 별 Issue 목록 조회

&nbsp;&nbsp;&nbsp; - Issue 내 label 및 상태 조회

&nbsp;&nbsp;&nbsp; - Issue 작성


<br><br>
#### 😊 MileStone 😊
&nbsp;&nbsp;&nbsp; - MileStone 생성 및 관리

&nbsp;&nbsp;&nbsp; - MileStone 내 Issue 진행 상태로 진척도 관리

