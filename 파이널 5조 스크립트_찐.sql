-----------------삭제------------------
--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-----------------시퀀스 생성------------------
-- 캘린더 시퀀스 생성
CREATE SEQUENCE SEQ_CALNO
NOCACHE;
-- 레파지토리 시퀀스 생성
CREATE SEQUENCE SEQ_REPO
NOCACHE;
-- 커밋 시퀀스 생성
CREATE SEQUENCE SEQ_CNO
NOCACHE;
-- 멤버 시퀀스 생성
CREATE SEQUENCE SEQ_MNO
NOCACHE;
-- 프로젝트 시퀀스 생성
CREATE SEQUENCE SEQ_PNO
NOCACHE;
-- 알림창 시퀀스 생성
CREATE SEQUENCE SEQ_NNO
NOCACHE;
-- 사진 시퀀스 생성
CREATE SEQUENCE SEQ_FNO
NOCACHE;
-- 기술스택 시퀀스 생성
CREATE SEQUENCE SEQ_TNO
NOCACHE;
-- 완료된 프로젝트 시퀀스 생성
CREATE SEQUENCE SEQ_FPNO
NOCACHE;
-- 자기PR 시퀀스 생성
CREATE SEQUENCE SEQ_PRNO
NOCACHE;
-- 마일스톤 시퀀스 생성
CREATE SEQUENCE SEQ_MIL
NOCACHE;
-- 이슈 시퀀스 생성
CREATE SEQUENCE SEQ_ISS
NOCACHE;
-- 이슈라벨 시퀀스 생성
CREATE SEQUENCE SEQ_LAB 
NOCACHE;
-- 댓글 시퀀스 생성
CREATE SEQUENCE SEQ_RNO
NOCACHE;
-- 풀리퀘스트 시퀀스 생성
CREATE SEQUENCE SEQ_PREQ
NOCACHE;
-- 풀리퀘스트 리뷰 시퀀스 생성
CREATE SEQUENCE SEQ_REV
NOCACHE;
-- 채팅방 시퀀스 생성
CREATE SEQUENCE SEQ_CHATNO
NOCACHE;
-- 채팅방 메세지 시퀀스 생성
CREATE SEQUENCE SEQ_MSGNO 
NOCACHE;

-----------------테이블 생성------------------
-- 기술 스택 테이블
CREATE TABLE STACK(
    STACK_NO NUMBER PRIMARY KEY,
    STACK_TYPE VARCHAR2(100),
    STACK_NAME VARCHAR2(100),
    STACK_IMG VARCHAR2(100)
)
;

-- 기술 스택 코멘트 달기 
COMMENT ON COLUMN STACK.STACK_NO IS '기술스택 번호';
COMMENT ON COLUMN STACK.STACK_NAME IS '기술스택 이름';
COMMENT ON COLUMN STACK.STACK_TYPE IS '기술 스택 분류';
COMMENT ON COLUMN STACK.STACK_IMG IS '기술 스택 이미지';

-- 기술 스택 샘플 데이터
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '프론트엔드','javascript','https://holaworld.io/images/languages/javascript.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '프론트엔드','typescript','https://holaworld.io/images/languages/typescript.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '프론트엔드','react','https://holaworld.io/images/languages/react.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '프론트엔드','vue','https://holaworld.io/images/languages/vue.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '프론트엔드','svelte','https://holaworld.io/images/languages/svelte.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '프론트엔드','nextjs','https://holaworld.io/images/languages/nextjs.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','java','https://holaworld.io/images/languages/java.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','spring','https://holaworld.io/images/languages/spring.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','nodejs','https://holaworld.io/images/languages/nodejs.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','nestjs','https://holaworld.io/images/languages/nestjs.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','go','https://holaworld.io/images/languages/go.svg');
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','kotlin','https://holaworld.io/images/languages/kotlin.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','express','https://holaworld.io/images/languages/express.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','mysql','https://holaworld.io/images/languages/mysql.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','mongodb','https://holaworld.io/images/languages/mongodb.svg');
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','python','https://holaworld.io/images/languages/python.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','django','https://holaworld.io/images/languages/django.svg');
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','php','https://holaworld.io/images/languages/php.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','graphql','https://holaworld.io/images/languages/graphql.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '백엔드','firebase','https://holaworld.io/images/languages/firebase.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '모바일','flutter','https://holaworld.io/images/languages/flutter.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '모바일','swift','https://holaworld.io/images/languages/swift.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '모바일','reactnative','https://holaworld.io/images/languages/reactnative.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '모바일','unity','https://holaworld.io/images/languages/unity.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','aws','https://holaworld.io/images/languages/aws.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','kubernetes','https://holaworld.io/images/languages/kubernetes.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','docker','https://holaworld.io/images/languages/docker.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','git','https://holaworld.io/images/languages/git.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','figma','https://holaworld.io/images/languages/figma.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','zeplin','https://holaworld.io/images/languages/zeplin.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '기타','jest','https://holaworld.io/images/languages/jest.svg'); 


 ---사진 테이블 
 -- 회원테이블에서 FILE_NO를 참조해서
 -- 사진 테이블을 회원테이블 보다도 더 먼저 생성해야할듯해요
 CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER PRIMARY KEY,
    REF_BNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(1000) NOT NULL,
    CHANGE_NAME VARCHAR2(1000) NOT NULL,
    FILE_PATH VARCHAR2(1000) NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    CATEGORY VARCHAR2(1000) CHECK(CATEGORY IN('C','M','P')) NOT NULL
 );
    
-- 사진 테이블 코멘트    
COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '파일번호';   
COMMENT ON COLUMN ATTACHMENT.REF_BNO IS '참조게시판 번호';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '파일원본명'; 
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '파일수정명'; 
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '저장경로'; 
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '업로드일'; 
COMMENT ON COLUMN ATTACHMENT.STATUS IS '상태'; 
COMMENT ON COLUMN ATTACHMENT.CATEGORY IS '게시판구분(C:채팅, P: 완료된 프로젝트, M:회원 )';

-- 사진 테이블 샘플데이터
INSERT INTO ATTACHMENT (FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, STATUS, CATEGORY) VALUES (SEQ_FNO.NEXTVAL, 1, '호빵.jpg', '2023101610204578.jpg', 'resources/upfiles/', DEFAULT, DEFAULT, 'M');

-- 멤버 테이블
CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(50) NOT NULL,
    MEM_TOKEN VARCHAR2(100) NOT NULL,
    GIT_NICK VARCHAR2(30) NOT NULL,
    OKKH_NICK VARCHAR2(30),
    MEM_INTRO VARCHAR2(4000),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    FILE_NO NUMBER REFERENCES ATTACHMENT,
    STACK_NO NUMBER REFERENCES STACK
);

-- 멤버 테이블 코멘트
COMMENT ON COLUMN MEMBER.MEM_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.GIT_NICK IS '깃허브닉네임';
COMMENT ON COLUMN MEMBER.OKKH_NICK IS '닉네임';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.STATUS IS '회원상태(Y/N)';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '자기소개';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_TOKEN IS '회원토큰';
COMMENT ON COLUMN MEMBER.FILE_NO IS '파일번호';
COMMENT ON COLUMN MEMBER.STACK_NO IS '기술스택번호';

-- 멤버 테이블 샘플데이터 5개
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '11111', '21451', '닉네임1', DEFAULT, '자기소개1', DEFAULT, DEFAULT, 1, 1);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '22222', '56436', '닉네임2', DEFAULT, '자기소개2', DEFAULT, DEFAULT, 1, 2);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '33333', '80600', '닉네임3', DEFAULT, '자기소개3', DEFAULT, DEFAULT, 1, 3);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '44444', '80685', '닉네임4', DEFAULT, '자기소개4', DEFAULT, DEFAULT, 1, 4);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '55555', '68586', '닉네임5', DEFAULT, '자기소개5', DEFAULT, DEFAULT, 1, 5);


----- 친구 테이블 -----
CREATE TABLE FRIEND(
    BF_GIVER NUMBER REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE NOT NULL,
    BF_TAKER NUMBER REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'A' CHECK(STATUS IN('Y','A','B','D')) NOT NULL,
    REQUEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY(BF_GIVER,BF_TAKER)

);

-- 친구 테이블 코멘트
COMMENT ON COLUMN FRIEND.BF_GIVER IS '친구 요청자';
COMMENT ON COLUMN FRIEND.BF_TAKER IS '친구 요청받는자';
COMMENT ON COLUMN FRIEND.STATUS IS '친구상태(Y:친구,A:친구요청,B:친구거절,D:차단)';
COMMENT ON COLUMN FRIEND.REQUEST_DATE IS '친구 요청일';

-- 친구 테이블 샘플 데이터
INSERT INTO 
            FRIEND
     VALUES      
     (
       1
     , 2
     , DEFAULT
     , DEFAULT
     );


INSERT INTO 
            FRIEND
     VALUES      
     (
       1
     , 3
     , DEFAULT
     , DEFAULT
     );


INSERT INTO 
            FRIEND
     VALUES      
     (
       2
     , 3
     , DEFAULT
     , DEFAULT
     );

-------- 자기 PR 테이블 -----
CREATE TABLE MY_PR(
    PR_NO NUMBER PRIMARY KEY,
    PR_TITLE VARCHAR2(1000) NOT NULL,
    PR_CONTENT VARCHAR2(4000) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE,
    PR_TIME NUMBER ,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')) NOT NULL,
    STACK_NAME VARCHAR2(4000) NOT NULL,
    MEM_NO NUMBER REFERENCES MEMBER,
    COUNT NUMBER DEFAULT 0
);

-- 자기PR 코멘트
COMMENT ON COLUMN MY_PR.PR_NO IS 'PR 번호';
COMMENT ON COLUMN MY_PR.PR_TITLE IS 'PR 제목';
COMMENT ON COLUMN MY_PR.PR_CONTENT IS 'PR 내용';
COMMENT ON COLUMN MY_PR.CREATE_DATE IS 'PR 작성일';
COMMENT ON COLUMN MY_PR.STATUS IS '상태';
COMMENT ON COLUMN MY_PR.STACK_NAME IS '기술스택';
COMMENT ON COLUMN MY_PR.MEM_NO IS '회원번호';
COMMENT ON COLUMN MY_PR.COUNT IS '조회수';
COMMENT ON COLUMN MY_PR.PR_TIME IS '프로젝트 가능시간';


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '성실한 개발자입니다'  
     , '저를 뽑으면 절대 후회하지 않습니다.'
     , '2023-09-25'
     , 1
     , 'Y'
     , 'java,spring,mysql,kotlin,vue'
     , 1
     , DEFAULT
     
     );
     
     commit;
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '아... 프로젝트 하고싶다'  
     , '프로젝트 하고 싶어 미치겠읍니다. 데려가주십시오'
     , '2023-09-28'
     , 2
     , 'Y'
     , 'java,spring,mysql,react'  
     , 2
     , DEFAULT
     );


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );



INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     );
     
INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '취업하고싶다면?'  
     , '저와 함께 네카라쿠배로 취업하실래요?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     )
;

--- 프로젝트 모집 테이블 
CREATE TABLE PROJECT(
    PRO_NO NUMBER PRIMARY KEY,
    PRO_WRITER NUMBER REFERENCES MEMBER(MEM_NO) NOT NULL,
    PRO_STACK VARCHAR2(4000) NOT NULL,
    PRO_TITLE VARCHAR2(1000) NOT NULL,
    PRO_CONTENT VARCHAR2(4000) NOT NULL,  
    PRO_MEMBER NUMBER NOT NULL,
    PRO_PERIOD VARCHAR2(30) NOT NULL,
    PRO_DEADLINE DATE NOT NULL,
    PRO_START_DATE DATE NOT NULL,
    PRO_POSITION VARCHAR2(500) NOT NULL,
    PRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(PRO_STATUS IN('Y','N')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    STACK_NO NUMBER REFERENCES STACK(STACK_NO),
    COUNT NUMBER DEFAULT 0
    
    
);

-- 프로젝트 모집 테이블 코멘트
COMMENT ON COLUMN PROJECT.PRO_NO IS '프로젝트 모집번호';
COMMENT ON COLUMN PROJECT.PRO_WRITER IS '프로젝트 작성자';
COMMENT ON COLUMN PROJECT.PRO_STACK IS '프로젝트 사용 기술스택';
COMMENT ON COLUMN PROJECT.PRO_TITLE IS '프로젝트 모집제목';
COMMENT ON COLUMN PROJECT.PRO_CONTENT IS '프로젝트 모집내용';
COMMENT ON COLUMN PROJECT.PRO_MEMBER IS '프로젝트 모집인원';
COMMENT ON COLUMN PROJECT.PRO_PERIOD IS '프로젝트 진행기간';
COMMENT ON COLUMN PROJECT.PRO_DEADLINE IS '프로젝트 모집마감일';
COMMENT ON COLUMN PROJECT.PRO_START_DATE IS '프로젝트 시작예정일';
COMMENT ON COLUMN PROJECT.PRO_POSITION IS '프로젝트 모집포지션';
COMMENT ON COLUMN PROJECT.PRO_STATUS IS '프로젝트 모집상태';
COMMENT ON COLUMN PROJECT.STATUS IS '프로젝트 게시글 상태';
COMMENT ON COLUMN PROJECT.STATUS IS '기술스택(기술스택과 연결용)';
COMMENT ON COLUMN PROJECT.COUNT IS '조회수';

-- 프로젝트 모집 테이블 샘플데이터
INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PNO.NEXTVAL
     , 1
     , 'JavaScript,VSCode,Java,Spring,AJAX'
     , '백엔드 개발자 구합니다'
     , '내가 백엔드 좀 한다? 모십니다'
     , 1
     , '3개월'
     , '2023-10-20'
     , '2023-10-22'
     , '백엔드'
     , 'Y'
     , 'Y'
     , NULL
     , DEFAULT
     );
     
     
INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PNO.NEXTVAL
     , 2
     , 'JavaScript,VSCode,Java,Spring,AJAX'
     , '아~ 화면 잘 만드는 프론트 개발자 어디 없을까~?'
     , '화면을 기깔나게 만들 수 있는 프론트 개발자 분 급구합니다!!!!!'
     , 1
     , '4개월'
     , '2023-10-28'
     , '2023-10-30'
     , '프론트엔드'
     , 'Y'
     , 'Y'
     , NULL
     , DEFAULT
     );
        

INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PNO.NEXTVAL
     , 3
     , 'Java, MySQL, Spring,JavaScript, VSCode'
     , '야! 너 들어와!!'
     , '같이 프로젝트 하자?'
     , 1
     , '5개월'
     , '2023-10-18'
     , '2023-10-20'
     , '백엔드'
     , 'Y'
     , 'Y'
     , NULL
     , DEFAULT 
     );
     
-- 완료된 프로젝트 
-- 참조 프로젝트 번호(REF_PNO)는 나중에 모집 프로젝트와 연결할 때 필요할 수도 있을 것 같아서 만들었습니다.
-- 필요없을까봐 일단 NULL로 했어요
CREATE TABLE FINPROJECT(
    PRO_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER REFERENCES PROJECT(PRO_NO),
    PRO_TITLE VARCHAR2(1000) NOT NULL,
    PRO_CONTENT VARCHAR2(4000) NOT NULL,
    FILE_NO NUMBER REFERENCES ATTACHMENT(FILE_NO),
    PRO_README VARCHAR2(1000),
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')) NOT NULL
    

);

-- 완료된 프로젝트 코멘트
COMMENT ON COLUMN FINPROJECT.PRO_NO IS '완료된 프로젝트 번호';
COMMENT ON COLUMN FINPROJECT.REF_PNO IS '참조 프로젝트 번호';  -- 혹시 몰라 만든 컬럼
COMMENT ON COLUMN FINPROJECT.PRO_TITLE IS '완료된 프로젝트 제목';
COMMENT ON COLUMN FINPROJECT.PRO_README IS '리드미파일';
COMMENT ON COLUMN FINPROJECT.PRO_CONTENT IS '완료된 프로젝트 내용';
COMMENT ON COLUMN FINPROJECT.CREATE_DATE IS '작성일';
COMMENT ON COLUMN FINPROJECT.STATUS IS '상태';
COMMENT ON COLUMN FINPROJECT.FILE_NO IS '파일번호';

-- 완료된 프로젝트 샘플 데이터
INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 1
     , '완료제목1'
     , '완료 내용1'
     , NULL
     , '리드미'
     , SYSDATE
     , 'Y'
     );


INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 2
     , '완료제목2'
     , '완료 내용2'
     , NULL
     , '리드미'
     , SYSDATE
     , 'Y'
     );
     
     INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 2
     , '완료제목3'
     , '완료 내용3'
     , NULL
     , '리드미'
     , SYSDATE
     , 'Y'
     );

INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPNO.NEXTVAL
     , 1
     , '완료제목4'
     , '완료 내용4'
     , NULL
     , '리드미'
     , SYSDATE
     , 'Y'
     );

-- 캘린더 테이블 생성
CREATE TABLE CALENDAR(
    CAL_NO NUMBER CONSTRAINT CAL_PK PRIMARY KEY,
    CAL_TITLE VARCHAR2(100),
    CAL_CONTENT VARCHAR2(1000),
    START_DATE VARCHAR2(50),
    END_DATE VARCHAR2(50),
    CAL_CATEGORY VARCHAR2(50),
    CAL_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (CAL_STATUS IN ('Y', 'N')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

-- 캘린더 코멘트 작성
COMMENT ON COLUMN CALENDAR.CAL_NO IS '일정 번호';
COMMENT ON COLUMN CALENDAR.CAL_TITLE IS '일정 제목';
COMMENT ON COLUMN CALENDAR.CAL_CONTENT IS '일정 내용';
COMMENT ON COLUMN CALENDAR.START_DATE IS '일정 시작일';
COMMENT ON COLUMN CALENDAR.END_DATE IS '일정 종료일';
COMMENT ON COLUMN CALENDAR.CAL_CATEGORY IS '일정 카테고리';
COMMENT ON COLUMN CALENDAR.CAL_STATUS IS '일정 진행여부(초록색, 회색)';
COMMENT ON COLUMN CALENDAR.STATUS IS '일정 삭제여부';

-- 캘린더 샘플 데이터 5개
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, '주제선정', '프로젝트 주제 선정 및 역할 분담', '2023-10-16', '2023-10-16', '업무', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, '팀 회식', '단합을 위한 회식', '2023-10-21', '2023-10-21', '소셜', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, '팀 선정', '팀 선정 및 인사', '2023-10-4', '2023-10-4', '업무', 'N', DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, '가족과 저녁식사', '가족과 김밥천국에서 저녁식사', '2023-10-17', '2023-10-17', '개인', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, '페이지 제작', '페이지 제작 및 피드백', '2023-10-17', '2023-10-30', '업무', DEFAULT, DEFAULT);

-- 레파지토리 테이블 생성
CREATE TABLE REPO(
    REPO_NO NUMBER CONSTRAINT REPO_PK PRIMARY KEY,
    REPO_TITLE VARCHAR2(100) NOT NULL,
    REPO_STATUS VARCHAR2(10) DEFAULT 'PUBLIC' CHECK (REPO_STATUS IN ('PUBLIC', 'PRIVATE')),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

-- 레파지토리 코멘트 작성
COMMENT ON COLUMN REPO.REPO_NO IS '레파지토리 번호';
COMMENT ON COLUMN REPO.REPO_TITLE IS '레파지토리 이름';
COMMENT ON COLUMN REPO.REPO_STATUS IS '레파지토리 공개여부';
COMMENT ON COLUMN REPO.CREATE_DATE IS '레파지토리 생성일';
COMMENT ON COLUMN REPO.STATUS IS '레파지토리 삭제여부';

-- 레파지토리 샘플 데이터 5개
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_HTML', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_JSP', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEST', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEMPLATE', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_REAL', DEFAULT, DEFAULT, DEFAULT);

---라벨 테이블 생성
CREATE TABLE LABELS (
   LAB_NO NUMBER PRIMARY KEY,
   LAB_NAME VARCHAR2(20)
);

-- 라벨 테이블 코멘트
COMMENT ON COLUMN LABELS.LAB_NO IS '라벨번호';
COMMENT ON COLUMN LABELS.LAB_NAME IS '라벨이름';

-- 라벨 INSERT문
INSERT 
  INTO LABELS
     (
       LAB_NO
     , LAB_NAME
     )
VALUES
     (
       SEQ_LAB.NEXTVAL
     , 'BUG'
     );
INSERT 
  INTO LABELS
     (
       LAB_NO
     , LAB_NAME
     )
VALUES
     (
       SEQ_LAB.NEXTVAL
     , 'DOCUMENTATION'
     );
INSERT 
  INTO LABELS
     (
       LAB_NO
     , LAB_NAME
     )
VALUES
     (
       SEQ_LAB.NEXTVAL
     , 'DUPLICATE'
     );

----마일스톤 테이블 생성--------------------------------
CREATE TABLE MILESTONE (
   MIL_NO NUMBER PRIMARY KEY,
   MIL_TITLE VARCHAR2(100) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   MODIFY_DATE DATE,
   END_DATE DATE,
   ISSUING VARCHAR2(1) DEFAULT 'Y' NOT NULL ,
   PROGRESS NUMBER DEFAULT 0 NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y',
   MEM_NO NUMBER REFERENCES MEMBER,
   REPO_NO NUMBER REFERENCES REPO
);

-- 마일스톤 테이블 코멘트
COMMENT ON COLUMN MILESTONE.MIL_NO IS '마일스톤 번호';
COMMENT ON COLUMN MILESTONE.MIL_TITLE IS '마일스톤 제목';
COMMENT ON COLUMN MILESTONE.CREATE_DATE IS '마일스톤 생성일';
COMMENT ON COLUMN MILESTONE.MODIFY_DATE IS '마일스톤 종료일';
COMMENT ON COLUMN MILESTONE.END_DATE IS '최근 수정일';
COMMENT ON COLUMN MILESTONE.ISSUING IS '진행중인 이슈';
COMMENT ON COLUMN MILESTONE.PROGRESS IS '진척도';
COMMENT ON COLUMN MILESTONE.STATUS IS '마일스톤 상태';
COMMENT ON COLUMN MILESTONE.MEM_NO IS '마일스톤 작성자';
COMMENT ON COLUMN MILESTONE.REPO_NO IS '레퍼지토리 번호';

-- 마일스톤 INSERT문
INSERT
  INTO MILESTONE
     (
       MIL_NO
     , MIL_TITLE
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISSUING
     , PROGRESS
     , STATUS
     , MEM_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_MIL.NEXTVAL
     , '마일1'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , 1
     , 1
     );
     
INSERT
  INTO MILESTONE
     (
       MIL_NO
     , MIL_TITLE
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISSUING
     , PROGRESS
     , STATUS
     , MEM_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_MIL.NEXTVAL
     , '마일2'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , 1
     , 1
     );
     
INSERT
  INTO MILESTONE
     (
       MIL_NO
     , MIL_TITLE
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISSUING
     , PROGRESS
     , STATUS
     , MEM_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_MIL.NEXTVAL
     , '마일3'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , 1
     , 1
     );
     
----이슈 테이블 생성--------------------------------
CREATE TABLE ISSUE (
   ISS_NO NUMBER PRIMARY KEY,
   ISS_TITLE VARCHAR2(100) NOT NULL,
   ISS_CONTENT VARCHAR2(4000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   MODIFY_DATE DATE,
   END_DATE DATE,
   ISS_ASSIGNEE VARCHAR2(100),
   ISS_STATUS VARCHAR2(1) DEFAULT 'Y',
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   MEM_NO NUMBER REFERENCES MEMBER,
   LAB_NAME VARCHAR2(300),
   MIL_NO NUMBER REFERENCES MILESTONE,
   REPO_NO NUMBER REFERENCES REPO
);

-- 이슈 테이블 코멘트
COMMENT ON COLUMN ISSUE.ISS_NO IS '이슈번호';
COMMENT ON COLUMN ISSUE.ISS_TITLE IS '이슈제목';
COMMENT ON COLUMN ISSUE.ISS_CONTENT IS '이슈내용';
COMMENT ON COLUMN ISSUE.CREATE_DATE IS '이슈 생성일';
COMMENT ON COLUMN ISSUE.MODIFY_DATE IS '이슈 수정일';
COMMENT ON COLUMN ISSUE.END_DATE IS '이슈 종료일';
COMMENT ON COLUMN ISSUE.ISS_ASSIGNEE IS '이슈 할당받은 사람';
COMMENT ON COLUMN ISSUE.ISS_STATUS IS '이슈 진행상태(Y/N)';
COMMENT ON COLUMN ISSUE.STATUS IS '이슈상태(Y/N)';
COMMENT ON COLUMN ISSUE.MEM_NO IS '이슈 작성자';
COMMENT ON COLUMN ISSUE.LAB_NAME IS '이슈가 속한 라벨(,로 구분)';
COMMENT ON COLUMN ISSUE.MIL_NO IS '이슈가 속한 마일스톤';
COMMENT ON COLUMN ISSUE.REPO_NO IS '이슈가 속한 레퍼지토리 번호';

-- 이슈 INSERT문
INSERT
  INTO ISSUE
     (
       ISS_NO
     , ISS_TITLE
     , ISS_CONTENT
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISS_ASSIGNEE
     , ISS_STATUS
     , STATUS
     , MEM_NO
     , LAB_NAME
     , MIL_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_ISS.NEXTVAL
     , '제목1'
     , '내용1'
     , DEFAULT
     , NULL
     , NULL
     , 'nangmangorani'
     , DEFAULT
     , DEFAULT
     , 1
     , 'bug,duplicate'
     , 1
     , 1
     );
     
INSERT
  INTO ISSUE
     (
       ISS_NO
     , ISS_TITLE
     , ISS_CONTENT
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISS_ASSIGNEE
     , ISS_STATUS
     , STATUS
     , MEM_NO
     , LAB_NAME
     , MIL_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_ISS.NEXTVAL
     , '제목2'
     , '내용2'
     , DEFAULT
     , NULL
     , NULL
     , 'BBBBB'
     , DEFAULT
     , DEFAULT
     , 2
     , 'bug,duplicate'
     , 1
     , 1
     );
     
INSERT
  INTO ISSUE
     (
       ISS_NO
     , ISS_TITLE
     , ISS_CONTENT
     , CREATE_DATE
     , MODIFY_DATE
     , END_DATE
     , ISS_ASSIGNEE
     , ISS_STATUS
     , STATUS
     , MEM_NO
     , LAB_NAME
     , MIL_NO
     , REPO_NO
     )
VALUES
     (
       SEQ_ISS.NEXTVAL
     , '제목1'
     , '내용1'
     , DEFAULT
     , NULL
     , NULL
     , 'nangmangorani'
     , DEFAULT
     , DEFAULT
     , 1
     , 'bug,duplicate,documentation'
     , 1
     , 1
     );
     
---- 풀리퀘 테이블 ---
CREATE TABLE PULL_REQUEST(
    PULL_NO NUMBER PRIMARY KEY,
    PULL_TITLE VARCHAR2(1000) NOT NULL,
    PULL_CONTENT VARCHAR2(4000) NOT NULL,
    PULL_WRITER NUMBER REFERENCES MEMBER(MEM_NO) NOT NULL,
    PULL_MANAGER VARCHAR2(1000) NOT NULL,
    REPO_NO NUMBER  REFERENCES REPO(REPO_NO) ON DELETE CASCADE NOT NULL,
    ISS_NO NUMBER REFERENCES ISSUE(ISS_NO) ON DELETE CASCADE NOT NULL,
    MIL_NO NUMBER REFERENCES MILESTONE(MIL_NO) ON DELETE CASCADE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'M' CHECK(STATUS IN ('M','C','N')) NOT NULL
);

-- 풀리퀘 코멘트
COMMENT ON COLUMN PULL_REQUEST.PULL_NO IS '풀리퀘 번호';
COMMENT ON COLUMN PULL_REQUEST.PULL_TITLE IS '풀리퀘 제목';
COMMENT ON COLUMN PULL_REQUEST.PULL_CONTENT IS '풀리퀘 내용';
COMMENT ON COLUMN PULL_REQUEST.PULL_WRITER IS '풀리퀘 작성자';
COMMENT ON COLUMN PULL_REQUEST.PULL_MANAGER IS '풀리퀘 담당자';
COMMENT ON COLUMN PULL_REQUEST.REPO_NO IS '레파지토리 번호';
COMMENT ON COLUMN PULL_REQUEST.ISS_NO IS '이슈 번호';
COMMENT ON COLUMN PULL_REQUEST.MIL_NO IS '마일스톤 번호';
COMMENT ON COLUMN PULL_REQUEST.STATUS IS '상태(M:머지,C:진행중,N:거절)';

-- 풀리퀘 샘플데이터
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , '풀리퀘받아랏!'
     , '풀리퀘 확인해보시지?'
     , 1
     , '호빵맨,세균맨'
     , 1
     , 1
     , 1
     , DEFAULT
     );

INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , '풀리퀘받아랏1!'
     , '풀리퀘 확인해보시지1?'
     , 2
     , '호빵맨,세균맨'
     , 2
     , 2
     , 2
     , DEFAULT
     );
     
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , '풀리퀘받아랏3!'
     , '풀리퀘 확인해보시지3?'
     , 2
     , '호빵맨,세균맨'
     , 2
     , 2
     , 2
     , DEFAULT
     ); 
     
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , '풀리퀘받아랏4!'
     , '풀리퀘 확인해보시지4?'
     , 2
     , '호빵맨,세균맨'
     , 2
     , 2
     , 2
     , DEFAULT
     );     
     
 INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , '풀리퀘받아랏5!'
     , '풀리퀘 확인해보시지5?'
     , 2
     , '호빵맨,세균맨'
     , 2
     , 2
     , 2
     , DEFAULT
     );    
     
-- 풀리퀘스트 리뷰 테이블 생성
CREATE TABLE PULL_REVIEW(
    PULL_REVIEW_NO NUMBER PRIMARY KEY,
    REF_PULL NUMBER REFERENCES PULL_REQUEST,
    MEM_NO NUMBER REFERENCES MEMBER,
    PULL_REVIEW_CONTENT VARCHAR2(1000),
    CREATE_DATE DATE DEFAULT SYSDATE
);

-- 풀리퀘스트 리뷰 테이블 코멘트
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_NO IS '풀리퀘스트 리뷰 번호';
COMMENT ON COLUMN PULL_REVIEW.REF_PULL IS '참조할 풀리퀘스트 번호';
COMMENT ON COLUMN PULL_REVIEW.MEM_NO IS '작성한 회원 번호';
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_CONTENT IS '리뷰 내용';
COMMENT ON COLUMN PULL_REVIEW.CREATE_DATE IS '작성일';

-- 풀리퀘스트 리뷰 테이블 샘플데이터
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 1, 1, '이상무', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 2, 3, '유상무', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 3, 2, '홍당무', DEFAULT);
     
----채팅방 테이블 생성--------------------------------
CREATE TABLE CHAT_ROOM (
   ROOM_NO NUMBER PRIMARY KEY,
   ROOM_TITLE VARCHAR2(100) NOT NULL,
   ROOM_MEM VARCHAR2(4000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL, 
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   LAST_CHAT VARCHAR2(3000),
   LAST_DATE VARCHAR2(50),
   FILE_NO NUMBER REFERENCES ATTACHMENT
);

-- 채팅방 테이블 코멘트
COMMENT ON COLUMN CHAT_ROOM.ROOM_NO IS '채팅방 번호';
COMMENT ON COLUMN CHAT_ROOM.ROOM_TITLE IS '채팅방 제목';
COMMENT ON COLUMN CHAT_ROOM.ROOM_MEM IS '채팅방 참여자목록';
COMMENT ON COLUMN CHAT_ROOM.CREATE_DATE IS '채팅방 생성일';
COMMENT ON COLUMN CHAT_ROOM.STATUS IS '채팅방 상태(Y/N)';
COMMENT ON COLUMN CHAT_ROOM.LAST_CHAT IS '마지막 채팅';
COMMENT ON COLUMN CHAT_ROOM.LAST_DATE IS '마지막 채팅 시간';
COMMENT ON COLUMN CHAT_ROOM.FILE_NO IS '파일번호';

-- 채팅방 INSERT
INSERT 
  INTO CHAT_ROOM
     (
       ROOM_NO
     , ROOM_TITLE
     , ROOM_MEM
     , CREATE_DATE
     , STATUS
     , LAST_CHAT
     , LAST_DATE
     , FILE_NO
     )
VALUES
     (
       SEQ_CHATNO.NEXTVAL
     , '채팅방제목2'
     , '유정,정묵'
     , DEFAULT
     , DEFAULT
     , '마지막챗2'
     , '2023-11-12'
     , NULL
     );

INSERT 
  INTO CHAT_ROOM
     (
       ROOM_NO
     , ROOM_TITLE
     , ROOM_MEM
     , CREATE_DATE
     , STATUS
     , LAST_CHAT
     , LAST_DATE
     , FILE_NO
     )
VALUES
     (
       SEQ_CHATNO.NEXTVAL
     , '채팅방제목3'
     , '승준,관현'
     , DEFAULT
     , DEFAULT
     , '마지막챗3'
     , '2023-11-12'
     , NULL
     );

-- 채팅방 메세지 테이블 생성
CREATE TABLE CHAT_MESSAGE (
   MSG_NO NUMBER PRIMARY KEY,
   CHAT_CONTENT VARCHAR2(3000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   INVITE VARCHAR2(100) NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   ROOM_NO NUMBER NOT NULL
);

-- 채팅방 메세지 코멘트
COMMENT ON COLUMN CHAT_MESSAGE.MSG_NO IS '메세지 번호';
COMMENT ON COLUMN CHAT_MESSAGE.CHAT_CONTENT IS '채팅방 메세지';
COMMENT ON COLUMN CHAT_MESSAGE.CREATE_DATE IS '채팅생성일';
COMMENT ON COLUMN CHAT_MESSAGE.INVITE IS '초대';
COMMENT ON COLUMN CHAT_MESSAGE.STATUS IS '채팅메세지 상태(Y/N)';
COMMENT ON COLUMN CHAT_MESSAGE.ROOM_NO IS '채팅방 번호';

-- 채팅방 메세지 INSERT문
INSERT
  INTO CHAT_MESSAGE
     (
       MSG_NO
     , CHAT_CONTENT
     , CREATE_DATE
     , INVITE
     , STATUS
     , ROOM_NO
     )
VALUES
     (
       SEQ_MSGNO.NEXTVAL
     , '메세지1'
     , DEFAULT
     , 'INVITEMEM1'
     , DEFAULT
     , 1
     );


INSERT
  INTO CHAT_MESSAGE
     (
       MSG_NO
     , CHAT_CONTENT
     , CREATE_DATE
     , INVITE
     , STATUS
     , ROOM_NO
     )
VALUES
     (
       SEQ_MSGNO.NEXTVAL
     , '메세지2'
     , DEFAULT
     , 'INVITEMEM2'
     , DEFAULT
     , 1
     );


INSERT
  INTO CHAT_MESSAGE
     (
       MSG_NO
     , CHAT_CONTENT
     , CREATE_DATE
     , INVITE
     , STATUS
     , ROOM_NO
     )
VALUES
     (
       SEQ_MSGNO.NEXTVAL
     , '메세지3'
     , DEFAULT
     , 'INVITEMEM3'
     , DEFAULT
     , 1
     );

-- 나의 프로젝트 테이블
CREATE TABLE MY_PROJECT(
    PRO_NO NUMBER PRIMARY KEY,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MYPRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MYPRO_STATUS IN('Y','N')),
    REPO_NO NUMBER NOT NULL,
    MEM_NO NUMBER REFERENCES MEMBER
);
-- 나의 프로젝트 코멘트
COMMENT ON COLUMN MY_PROJECT.PRO_NO IS '프로젝트 모집번호';
COMMENT ON COLUMN MY_PROJECT.CREATE_DATE IS '프로젝트 생성일';
COMMENT ON COLUMN MY_PROJECT.STATUS IS '프로젝트 상태';
COMMENT ON COLUMN MY_PROJECT.REPO_NO IS '레퍼지토리 번호';
COMMENT ON COLUMN MY_PROJECT.MEM_NO IS '회원번호';

-- 나의 프로젝트 샘플데이터
INSERT INTO MY_PROJECT (PRO_NO, CREATE_DATE, STATUS, MYPRO_STATUS, REPO_NO, MEM_NO) VALUES (SEQ_PNO.NEXTVAL, SYSDATE, DEFAULT, DEFAULT, 1, 1);
INSERT INTO MY_PROJECT (PRO_NO, CREATE_DATE, STATUS, MYPRO_STATUS, REPO_NO, MEM_NO) VALUES (SEQ_PNO.NEXTVAL, SYSDATE, DEFAULT, DEFAULT, 2, 3);
INSERT INTO MY_PROJECT (PRO_NO, CREATE_DATE, STATUS, MYPRO_STATUS, REPO_NO, MEM_NO) VALUES (SEQ_PNO.NEXTVAL, SYSDATE, DEFAULT, DEFAULT, 3, 2);

-- 알림 테이블
CREATE TABLE NOTICE(
    NOTI_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50) NOT NULL,
    NOTI_CONTENT VARCHAR2(1000) NOT NULL,
    OCU_TIME DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MEM_NO NUMBER REFERENCES MEMBER
);

-- 알림 테이블 코멘트
COMMENT ON COLUMN NOTICE.NOTI_NO IS '알림번호';
COMMENT ON COLUMN NOTICE.CATEGORY_NAME IS '카테고리명';
COMMENT ON COLUMN NOTICE.NOTI_CONTENT IS '알림내용';
COMMENT ON COLUMN NOTICE.OCU_TIME IS '알림발생시간';
COMMENT ON COLUMN NOTICE.STATUS IS '알림상태';
COMMENT ON COLUMN NOTICE.MEM_NO IS '회원번호';

-- 알림 테이블 샘플데이터
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NNO.NEXTVAL, '이슈', '00_java-workspace에 새로운 이슈가 발생했습니다.', DEFAULT, DEFAULT, 2);
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NNO.NEXTVAL, '친구', 'USER03 님이 친구요청을 수락하셨습니다.', DEFAULT, DEFAULT, 3);
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NNO.NEXTVAL, '개인홍보', 'USER02 님이 고객님의 자기PR에 좋아요를 눌렀습니다.', DEFAULT, DEFAULT, 1);

-- 커밋 테이블 생성
CREATE TABLE PRO_COMMIT(
    COMM_NO NUMBER CONSTRAINT PRO_COMMIT_PK PRIMARY KEY,
    COMM_WRITER NUMBER CONSTRAINT COMM_WRITER_FK REFERENCES MEMBER ON DELETE CASCADE,
    COMM_DATE DATE DEFAULT SYSDATE,
    COMM_MSG VARCHAR2(1000) NOT NULL,
    REPO_NO NUMBER CONSTRAINT REPO_NO_FK REFERENCES REPO ON DELETE CASCADE
);

-- 커밋 코멘트 작성
COMMENT ON COLUMN PRO_COMMIT.COMM_NO IS '커밋 번호';
COMMENT ON COLUMN PRO_COMMIT.COMM_WRITER IS '커밋 작성자';
COMMENT ON COLUMN PRO_COMMIT.COMM_DATE IS '커밋 날짜';
COMMENT ON COLUMN PRO_COMMIT.COMM_MSG IS '커밋 메세지';
COMMENT ON COLUMN PRO_COMMIT.REPO_NO IS '레파지토리 번호';

-- 커밋 샘플 데이터 5개
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, 1, DEFAULT, '로그인 기능 수정', 1);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, 1, DEFAULT, '좋아요 기능 버그 수정', 2);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, 1, DEFAULT, '레파지토리 등록 기능 추가', 3);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, 1, DEFAULT, '신고 기능 삭제', 4);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_CNO.NEXTVAL, 1, DEFAULT, '마이페이지 기능 코드 수정', 5);



--- 북마크 테이블 
CREATE TABLE BOOKMARK(
    MEM_NO NUMBER REFERENCES MEMBER,
    PRO_NO NUMBER REFERENCES PROJECT,
    PRIMARY KEY(MEM_NO, PRO_NO)
    
);

COMMENT ON COLUMN BOOKMARK.MEM_NO IS '북마크 회원번호';
COMMENT ON COLUMN BOOKMARK.PRO_NO IS '북마크 게시판 번호';


CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER REFERENCES MEMBER(MEM_NO) NOT NULL,
    REP_CONTENT VARCHAR2(4000) NOT NULL,
    REF_PNO NUMBER NOT NULL,
    REP_DATE DATE NOT NULL
    
);

CREATE SEQUENCE SEQ_RENO
NOCACHE;

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY.MEM_NO IS '댓글 작성자';           
COMMENT ON COLUMN REPLY.REP_CONTENT IS '댓글 내용';
COMMENT ON COLUMN REPLY.REF_PNO IS '참조 게시물';   
COMMENT ON COLUMN REPLY.REP_DATE IS '댓글 작성일';     

INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_RENO.NEXTVAL
     , 1
     , '저도 참여하고 싶어요'
     , 1
     , SYSDATE
     );
    
    
INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_RENO.NEXTVAL
     , 2
     , '대한의 건아!! 성실한 제가 한번 참여해보겠읍니다.'
     , 1
     , SYSDATE
     );     
     


COMMIT;