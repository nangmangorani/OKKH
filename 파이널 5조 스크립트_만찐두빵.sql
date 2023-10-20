-----------------»èÁ¦------------------
--Á¢¼ÓÀ¯ÀúÀÇ ¸ðµçÅ×ÀÌºí ¹× Á¦¾àÁ¶°Ç »èÁ¦
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--Á¢¼ÓÀ¯ÀúÀÇ ¸ðµç ½ÃÄö½º »èÁ¦
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--Á¢¼ÓÀ¯ÀúÀÇ ¸ðµç ºä »èÁ¦
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--Á¢¼ÓÀ¯ÀúÀÇ ¸ðµç Æ®¸®°Å »èÁ¦
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-----------------½ÃÄö½º »ý¼º------------------
-- Ä¶¸°´õ ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_CAL
NOCACHE;
-- ·¹ÆÄÁöÅä¸® ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_REPO
NOCACHE;
-- Ä¿¹Ô ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_COMM
NOCACHE;
-- ¸â¹ö ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_MEM
NOCACHE;
-- ÇÁ·ÎÁ§Æ® ¸ðÁý ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_PRO
NOCACHE;
-- ¿Ï·áµÈ ÇÁ·ÎÁ§Æ® ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_FPRO
NOCACHE;
--³» ÇÁ·ÎÁ§Æ® ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_MYPRO
NOCACHE;
-- ¾Ë¸²Ã¢ ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_NOTI
NOCACHE;
-- »çÁø ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_ATTA
NOCACHE;
-- ±â¼ú½ºÅÃ ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_STA
NOCACHE;
-- ÀÚ±âPR ½ÃÄö½º »ý¼º
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
CREATE SEQUENCE SEQ_PRNO
========
CREATE SEQUENCE SEQ_PR
START WITH 1000
INCREMENT BY 1
NOCYCLE
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
NOCACHE;
-- ¸¶ÀÏ½ºÅæ ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_MIL
NOCACHE;
-- ÀÌ½´ ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_ISS
NOCACHE;
-- ÀÌ½´¶óº§ ½ÃÄö½º »ý¼º
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
CREATE SEQUENCE SEQ_LAB 
========
CREATE SEQUENCE SEQ_LAB
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
NOCACHE;
-- ´ñ±Û ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_REP
NOCACHE;
-- Ç®¸®Äù½ºÆ® ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_PREQ
NOCACHE;
-- Ç®¸®Äù½ºÆ® ¸®ºä ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_REV
NOCACHE;
-- Ã¤ÆÃ¹æ ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_CHAT
NOCACHE;
-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö ½ÃÄö½º »ý¼º
CREATE SEQUENCE SEQ_MSG
NOCACHE;

-----------------Å×ÀÌºí »ý¼º------------------
-- ±â¼ú ½ºÅÃ Å×ÀÌºí
CREATE TABLE STACK(
    STACK_NO NUMBER PRIMARY KEY,
    STACK_TYPE VARCHAR2(100),
    STACK_NAME VARCHAR2(100),
    STACK_IMG VARCHAR2(100)
)
;

-- ±â¼ú ½ºÅÃ ÄÚ¸àÆ® ´Þ±â 
COMMENT ON COLUMN STACK.STACK_NO IS '±â¼ú½ºÅÃ ¹øÈ£';
COMMENT ON COLUMN STACK.STACK_NAME IS '±â¼ú½ºÅÃ ÀÌ¸§';
COMMENT ON COLUMN STACK.STACK_TYPE IS '±â¼ú ½ºÅÃ ºÐ·ù';
COMMENT ON COLUMN STACK.STACK_IMG IS '±â¼ú ½ºÅÃ ÀÌ¹ÌÁö';

-- ±â¼ú ½ºÅÃ »ùÇÃ µ¥ÀÌÅÍ
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','javascript','https://holaworld.io/images/languages/javascript.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','typescript','https://holaworld.io/images/languages/typescript.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','react','https://holaworld.io/images/languages/react.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','vue','https://holaworld.io/images/languages/vue.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','svelte','https://holaworld.io/images/languages/svelte.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','nextjs','https://holaworld.io/images/languages/nextjs.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','java','https://holaworld.io/images/languages/java.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','spring','https://holaworld.io/images/languages/spring.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','nodejs','https://holaworld.io/images/languages/nodejs.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','nestjs','https://holaworld.io/images/languages/nestjs.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','go','https://holaworld.io/images/languages/go.svg');
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','kotlin','https://holaworld.io/images/languages/kotlin.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','express','https://holaworld.io/images/languages/express.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','mysql','https://holaworld.io/images/languages/mysql.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','mongodb','https://holaworld.io/images/languages/mongodb.svg');
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','python','https://holaworld.io/images/languages/python.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','django','https://holaworld.io/images/languages/django.svg');
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','php','https://holaworld.io/images/languages/php.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','graphql','https://holaworld.io/images/languages/graphql.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¹é¿£µå','firebase','https://holaworld.io/images/languages/firebase.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¸ð¹ÙÀÏ','flutter','https://holaworld.io/images/languages/flutter.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¸ð¹ÙÀÏ','swift','https://holaworld.io/images/languages/swift.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¸ð¹ÙÀÏ','reactnative','https://holaworld.io/images/languages/reactnative.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '¸ð¹ÙÀÏ','unity','https://holaworld.io/images/languages/unity.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','aws','https://holaworld.io/images/languages/aws.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','kubernetes','https://holaworld.io/images/languages/kubernetes.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','docker','https://holaworld.io/images/languages/docker.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','git','https://holaworld.io/images/languages/git.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','figma','https://holaworld.io/images/languages/figma.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','zeplin','https://holaworld.io/images/languages/zeplin.svg'); 
INSERT INTO STACK VALUES (SEQ_TNO.NEXTVAL, '±âÅ¸','jest','https://holaworld.io/images/languages/jest.svg'); 
========
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','javascript','https://holaworld.io/images/languages/javascript.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','typescript','https://holaworld.io/images/languages/typescript.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','react','https://holaworld.io/images/languages/react.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','vue','https://holaworld.io/images/languages/vue.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','svelte','https://holaworld.io/images/languages/svelte.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, 'ÇÁ·ÐÆ®¿£µå','nextjs','https://holaworld.io/images/languages/nextjs.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','java','https://holaworld.io/images/languages/java.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','spring','https://holaworld.io/images/languages/spring.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','nodejs','https://holaworld.io/images/languages/nodejs.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','nestjs','https://holaworld.io/images/languages/nestjs.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','go','https://holaworld.io/images/languages/go.svg');
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','kotlin','https://holaworld.io/images/languages/kotlin.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','express','https://holaworld.io/images/languages/express.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','mysql','https://holaworld.io/images/languages/mysql.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','mongodb','https://holaworld.io/images/languages/mongodb.svg');
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','python','https://holaworld.io/images/languages/python.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','django','https://holaworld.io/images/languages/django.svg');
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','php','https://holaworld.io/images/languages/php.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','graphql','https://holaworld.io/images/languages/graphql.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¹é¿£µå','firebase','https://holaworld.io/images/languages/firebase.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¸ð¹ÙÀÏ','flutter','https://holaworld.io/images/languages/flutter.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¸ð¹ÙÀÏ','swift','https://holaworld.io/images/languages/swift.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¸ð¹ÙÀÏ','reactnative','https://holaworld.io/images/languages/reactnative.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '¸ð¹ÙÀÏ','unity','https://holaworld.io/images/languages/unity.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','aws','https://holaworld.io/images/languages/aws.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','kubernetes','https://holaworld.io/images/languages/kubernetes.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','docker','https://holaworld.io/images/languages/docker.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','git','https://holaworld.io/images/languages/git.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','figma','https://holaworld.io/images/languages/figma.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','zeplin','https://holaworld.io/images/languages/zeplin.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '±âÅ¸','jest','https://holaworld.io/images/languages/jest.svg'); 
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql


 ---»çÁø Å×ÀÌºí 
 -- È¸¿øÅ×ÀÌºí¿¡¼­ FILE_NO¸¦ ÂüÁ¶ÇØ¼­
 -- »çÁø Å×ÀÌºíÀ» È¸¿øÅ×ÀÌºí º¸´Ùµµ ´õ ¸ÕÀú »ý¼ºÇØ¾ßÇÒµíÇØ¿ä
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
    
-- »çÁø Å×ÀÌºí ÄÚ¸àÆ®    
COMMENT ON COLUMN ATTACHMENT.FILE_NO IS 'ÆÄÀÏ¹øÈ£';   
COMMENT ON COLUMN ATTACHMENT.REF_BNO IS 'ÂüÁ¶°Ô½ÃÆÇ ¹øÈ£';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS 'ÆÄÀÏ¿øº»¸í'; 
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS 'ÆÄÀÏ¼öÁ¤¸í'; 
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS 'ÀúÀå°æ·Î'; 
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '¾÷·ÎµåÀÏ'; 
COMMENT ON COLUMN ATTACHMENT.STATUS IS '»óÅÂ'; 
COMMENT ON COLUMN ATTACHMENT.CATEGORY IS '°Ô½ÃÆÇ±¸ºÐ(C:Ã¤ÆÃ, P: ¿Ï·áµÈ ÇÁ·ÎÁ§Æ®, M:È¸¿ø )';

-- »çÁø Å×ÀÌºí »ùÇÃµ¥ÀÌÅÍ
INSERT INTO ATTACHMENT (FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, STATUS, CATEGORY) VALUES (SEQ_ATTA.NEXTVAL, 1, 'È£»§.jpg', '2023101610204578.jpg', 'resources/upfiles/', DEFAULT, DEFAULT, 'M');

-- ¸â¹ö Å×ÀÌºí
CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(50) NOT NULL,
    MEM_TOKEN VARCHAR2(100) NOT NULL,
    GIT_NICK VARCHAR2(30) NOT NULL,
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
    OKKH_NICK VARCHAR2(30),
    MEM_INTRO VARCHAR2(4000),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    FILE_NO NUMBER REFERENCES ATTACHMENT,
    STACK_NO NUMBER REFERENCES STACK
========
    AVATAR_URL VARCHAR2(1000),
    MEM_INTRO VARCHAR2(4000),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    STACK VARCHAR2(4000),
    TEAM NUMBER DEFAULT 0,
    TEAM_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(TEAM_STATUS IN ('Y', 'N'))
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
);

-- ¸â¹ö Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN MEMBER.MEM_NO IS 'È¸¿ø¹øÈ£';
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
COMMENT ON COLUMN MEMBER.GIT_NICK IS '±êÇãºê´Ð³×ÀÓ';
COMMENT ON COLUMN MEMBER.OKKH_NICK IS '´Ð³×ÀÓ';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS 'È¸¿ø°¡ÀÔÀÏ';
COMMENT ON COLUMN MEMBER.STATUS IS 'È¸¿ø»óÅÂ(Y/N)';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS 'ÀÚ±â¼Ò°³';
========
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
COMMENT ON COLUMN MEMBER.MEM_ID IS 'È¸¿ø¾ÆÀÌµð';
COMMENT ON COLUMN MEMBER.MEM_TOKEN IS 'È¸¿øÅäÅ«';
COMMENT ON COLUMN MEMBER.GIT_NICK IS '±êÇãºê´Ð³×ÀÓ';
COMMENT ON COLUMN MEMBER.AVATAR_URL IS '±êÇãºê ÇÁ·ÎÇÊ »çÁø';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS 'ÀÚ±â¼Ò°³';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS 'È¸¿ø°¡ÀÔÀÏ';
COMMENT ON COLUMN MEMBER.STATUS IS 'È¸¿ø»óÅÂ(Y/N)';
COMMENT ON COLUMN MEMBER.STACK IS '±â¼ú½ºÅÃ';
COMMENT ON COLUMN MEMBER.TEAM IS 'Âü¿© ÇÁ·ÎÁ§Æ® ÆÀ';
COMMENT ON COLUMN MEMBER.TEAM_STATUS IS 'Âü¿©»óÅÂ(Y:È®Á¤, N:ÀÓ½Ã)';

-- ¸â¹ö Å×ÀÌºí »ùÇÃµ¥ÀÌÅÍ 5°³
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '11111', '21451', '´Ð³×ÀÓ1', DEFAULT, 'ÀÚ±â¼Ò°³1', DEFAULT, DEFAULT, 1, 1);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '22222', '56436', '´Ð³×ÀÓ2', DEFAULT, 'ÀÚ±â¼Ò°³2', DEFAULT, DEFAULT, 1, 2);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '33333', '80600', '´Ð³×ÀÓ3', DEFAULT, 'ÀÚ±â¼Ò°³3', DEFAULT, DEFAULT, 1, 3);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '44444', '80685', '´Ð³×ÀÓ4', DEFAULT, 'ÀÚ±â¼Ò°³4', DEFAULT, DEFAULT, 1, 4);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, OKKH_NICK, MEM_INTRO, CREATE_DATE, STATUS, FILE_NO, STACK_NO) VALUES (SEQ_MNO.NEXTVAL, '55555', '68586', '´Ð³×ÀÓ5', DEFAULT, 'ÀÚ±â¼Ò°³5', DEFAULT, DEFAULT, 1, 5);
========
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '11111', '21451', '´Ð³×ÀÓ1', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfMjk1/MDAxNjcwMTM0MzQxODYy.-bwZuKUBCl5lStmN48I0agvEAunWWFYzcQb5AoLImhwg.yMoOCcK-zeiPGMCNuEjQRV51U9xTqOKqVDbmQdGns_Yg.JPEG.goms1101/IMG_3400.JPG?type=w800', 'ÀÚ±â¼Ò°³1', DEFAULT, DEFAULT, 'ÀÚ¹Ù, ÆÄÀÌ½ã', 1, 'Y');
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '22222', '56436', '´Ð³×ÀÓ2', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfMjAg/MDAxNjcwMTM0MzQ2MzI1.60eBNkj8BiFMZZ2TEjaNKfkQBMLbs9t-r-B5dt2kcusg.MpGfZY-SlIoDyTHS9haziKlNqXU616HKdSbG_gFUe1sg.JPEG.goms1101/IMG_3421.JPG?type=w800', 'ÀÚ±â¼Ò°³2', DEFAULT, DEFAULT, 'ÀÚ¹Ù½ºÅ©¸³Æ®, ¸®¾×Æ®', 1, 'Y');
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '33333', '80600', '´Ð³×ÀÓ3', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfNTEg/MDAxNjcwMTM0MzQyMzc2.hKZlLb7mpDBpn8uUKmIo4e-1LXmQ9w81iCAHbtj2sM0g.EdlEMutFjvEnxiJAak_oM6QgRWuusz-Uy1qoGAKpHKUg.JPEG.goms1101/IMG_3413.JPG?type=w400', 'ÀÚ±â¼Ò°³3', DEFAULT, DEFAULT, '¿À¶óÅ¬, ¸¶ÀÌ¹ÙÆ¼½º', 1, 'Y');
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '44444', '80685', '´Ð³×ÀÓ4', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfNjEg/MDAxNjcwMTM0MzQxOTYy.y_9OPghag6MUoqEcnAzLLV2ZNDSmej5SU3f1j5lM5g0g.KkMUYr0k9ql3TDqG2-SnsC66RVL0Lm7NZ2iSX6BRTuIg.JPEG.goms1101/IMG_3394.JPG?type=w800', 'ÀÚ±â¼Ò°³4', DEFAULT, DEFAULT, 'C++, C', DEFAULT, DEFAULT);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '55555', '68586', '´Ð³×ÀÓ5', 'https://image.fmkorea.com/files/attach/new/20191008/486616/2093167063/2261931734/953da8ce0874ea6f3d56a20747129b8f.jpg', 'ÀÚ±â¼Ò°³5', DEFAULT, DEFAULT, 'HTML, CSS', DEFAULT, DEFAULT);
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql


----- Ä£±¸ Å×ÀÌºí -----
CREATE TABLE FRIEND(
    BF_GIVER NUMBER REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE NOT NULL,
    BF_TAKER NUMBER REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'A' CHECK(STATUS IN('Y','A','B','D')) NOT NULL,
    REQUEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY(BF_GIVER,BF_TAKER)

);

-- Ä£±¸ Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN FRIEND.BF_GIVER IS 'Ä£±¸ ¿äÃ»ÀÚ';
COMMENT ON COLUMN FRIEND.BF_TAKER IS 'Ä£±¸ ¿äÃ»¹Þ´ÂÀÚ';
COMMENT ON COLUMN FRIEND.STATUS IS 'Ä£±¸»óÅÂ(Y:Ä£±¸,A:Ä£±¸¿äÃ»,B:Ä£±¸°ÅÀý,D:Â÷´Ü)';
COMMENT ON COLUMN FRIEND.REQUEST_DATE IS 'Ä£±¸ ¿äÃ»ÀÏ';

-- Ä£±¸ Å×ÀÌºí »ùÇÃ µ¥ÀÌÅÍ
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

-------- ÀÚ±â PR Å×ÀÌºí -----
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

-- ÀÚ±âPR ÄÚ¸àÆ®
COMMENT ON COLUMN MY_PR.PR_NO IS 'PR ¹øÈ£';
COMMENT ON COLUMN MY_PR.PR_TITLE IS 'PR Á¦¸ñ';
COMMENT ON COLUMN MY_PR.PR_CONTENT IS 'PR ³»¿ë';
COMMENT ON COLUMN MY_PR.CREATE_DATE IS 'PR ÀÛ¼ºÀÏ';
COMMENT ON COLUMN MY_PR.STATUS IS '»óÅÂ';
COMMENT ON COLUMN MY_PR.STACK_NAME IS '±â¼ú½ºÅÃ';
COMMENT ON COLUMN MY_PR.MEM_NO IS 'È¸¿ø¹øÈ£';
COMMENT ON COLUMN MY_PR.COUNT IS 'Á¶È¸¼ö';
COMMENT ON COLUMN MY_PR.PR_TIME IS 'ÇÁ·ÎÁ§Æ® °¡´É½Ã°£';


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PRNO.NEXTVAL
     , '¼º½ÇÇÑ °³¹ßÀÚÀÔ´Ï´Ù'  
     , 'Àú¸¦ »ÌÀ¸¸é Àý´ë ÈÄÈ¸ÇÏÁö ¾Ê½À´Ï´Ù.'
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
     , '¾Æ... ÇÁ·ÎÁ§Æ® ÇÏ°í½Í´Ù'  
     , 'ÇÁ·ÎÁ§Æ® ÇÏ°í ½Í¾î ¹ÌÄ¡°ÚÀ¾´Ï´Ù. µ¥·Á°¡ÁÖ½Ê½Ã¿À'
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
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_PRNO.NEXTVAL
========
       SEQ_PR.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 'Ãë¾÷ÇÏ°í½Í´Ù¸é?'  
     , 'Àú¿Í ÇÔ²² ³×Ä«¶óÄí¹è·Î Ãë¾÷ÇÏ½Ç·¡¿ä?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     )
;

--- ÇÁ·ÎÁ§Æ® ¸ðÁý Å×ÀÌºí 
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
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
    STACK_NO NUMBER REFERENCES STACK(STACK_NO),
========
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
    COUNT NUMBER DEFAULT 0
    
    
);

-- ÇÁ·ÎÁ§Æ® ¸ðÁý Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN PROJECT.PRO_NO IS 'ÇÁ·ÎÁ§Æ® ¸ðÁý¹øÈ£';
COMMENT ON COLUMN PROJECT.PRO_WRITER IS 'ÇÁ·ÎÁ§Æ® ÀÛ¼ºÀÚ';
COMMENT ON COLUMN PROJECT.PRO_STACK IS 'ÇÁ·ÎÁ§Æ® »ç¿ë ±â¼ú½ºÅÃ';
COMMENT ON COLUMN PROJECT.PRO_TITLE IS 'ÇÁ·ÎÁ§Æ® ¸ðÁýÁ¦¸ñ';
COMMENT ON COLUMN PROJECT.PRO_CONTENT IS 'ÇÁ·ÎÁ§Æ® ¸ðÁý³»¿ë';
COMMENT ON COLUMN PROJECT.PRO_MEMBER IS 'ÇÁ·ÎÁ§Æ® ¸ðÁýÀÎ¿ø';
COMMENT ON COLUMN PROJECT.PRO_PERIOD IS 'ÇÁ·ÎÁ§Æ® ÁøÇà±â°£';
COMMENT ON COLUMN PROJECT.PRO_DEADLINE IS 'ÇÁ·ÎÁ§Æ® ¸ðÁý¸¶°¨ÀÏ';
COMMENT ON COLUMN PROJECT.PRO_START_DATE IS 'ÇÁ·ÎÁ§Æ® ½ÃÀÛ¿¹Á¤ÀÏ';
COMMENT ON COLUMN PROJECT.PRO_POSITION IS 'ÇÁ·ÎÁ§Æ® ¸ðÁýÆ÷Áö¼Ç';
COMMENT ON COLUMN PROJECT.PRO_STATUS IS 'ÇÁ·ÎÁ§Æ® ¸ðÁý»óÅÂ';
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
COMMENT ON COLUMN PROJECT.STATUS IS 'ÇÁ·ÎÁ§Æ® °Ô½Ã±Û »óÅÂ';
COMMENT ON COLUMN PROJECT.STATUS IS '±â¼ú½ºÅÃ(±â¼ú½ºÅÃ°ú ¿¬°á¿ë)';
========
COMMENT ON COLUMN PROJECT.STATUS IS 'ÇÁ·ÎÁ§Æ® »èÁ¦¿©ºÎ';
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
COMMENT ON COLUMN PROJECT.COUNT IS 'Á¶È¸¼ö';

-- ÇÁ·ÎÁ§Æ® ¸ðÁý Å×ÀÌºí »ùÇÃµ¥ÀÌÅÍ
INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PRO.NEXTVAL
     , 1
     , 'JavaScript,VSCode,Java,Spring,AJAX'
     , '¹é¿£µå °³¹ßÀÚ ±¸ÇÕ´Ï´Ù'
     , '³»°¡ ¹é¿£µå Á» ÇÑ´Ù? ¸ð½Ê´Ï´Ù'
     , 1
     , '3°³¿ù'
     , '2023-10-20'
     , '2023-10-22'
     , '¹é¿£µå'
     , 'Y'
     , 'Y'
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
     , NULL
========
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , DEFAULT
     );
     
     
INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PRO.NEXTVAL
     , 2
     , 'JavaScript,VSCode,Java,Spring,AJAX'
     , '¾Æ~ È­¸é Àß ¸¸µå´Â ÇÁ·ÐÆ® °³¹ßÀÚ ¾îµð ¾øÀ»±î~?'
     , 'È­¸éÀ» ±â±ò³ª°Ô ¸¸µé ¼ö ÀÖ´Â ÇÁ·ÐÆ® °³¹ßÀÚ ºÐ ±Þ±¸ÇÕ´Ï´Ù!!!!!'
     , 1
     , '4°³¿ù'
     , '2023-10-28'
     , '2023-10-30'
     , 'ÇÁ·ÐÆ®¿£µå'
     , 'Y'
     , 'Y'
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
     , NULL
========
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , DEFAULT
     );
        

INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PRO.NEXTVAL
     , 3
     , 'Java, MySQL, Spring,JavaScript, VSCode'
     , '¾ß! ³Ê µé¾î¿Í!!'
     , '°°ÀÌ ÇÁ·ÎÁ§Æ® ÇÏÀÚ?'
     , 1
     , '5°³¿ù'
     , '2023-10-18'
     , '2023-10-20'
     , '¹é¿£µå'
     , 'Y'
     , 'Y'
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
     , NULL
========
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , DEFAULT 
     );
     
-- ¿Ï·áµÈ ÇÁ·ÎÁ§Æ® 
-- ÂüÁ¶ ÇÁ·ÎÁ§Æ® ¹øÈ£(REF_PNO)´Â ³ªÁß¿¡ ¸ðÁý ÇÁ·ÎÁ§Æ®¿Í ¿¬°áÇÒ ¶§ ÇÊ¿äÇÒ ¼öµµ ÀÖÀ» °Í °°¾Æ¼­ ¸¸µé¾ú½À´Ï´Ù.
-- ÇÊ¿ä¾øÀ»±îºÁ ÀÏ´Ü NULL·Î Çß¾î¿ä
CREATE TABLE FINPROJECT(
    FPRO_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER REFERENCES PROJECT(PRO_NO),
    FPRO_TITLE VARCHAR2(1000) NOT NULL,
    FPRO_CONTENT VARCHAR2(4000) NOT NULL,
    FILE_NO NUMBER REFERENCES ATTACHMENT(FILE_NO),
    FPRO_README VARCHAR2(1000),
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')) NOT NULL
    

);

-- ¿Ï·áµÈ ÇÁ·ÎÁ§Æ® ÄÚ¸àÆ®
COMMENT ON COLUMN FINPROJECT.FPRO_NO IS '¿Ï·áµÈ ÇÁ·ÎÁ§Æ® ¹øÈ£';
COMMENT ON COLUMN FINPROJECT.REF_PNO IS 'ÂüÁ¶ ÇÁ·ÎÁ§Æ® ¹øÈ£';  -- È¤½Ã ¸ô¶ó ¸¸µç ÄÃ·³
COMMENT ON COLUMN FINPROJECT.FPRO_TITLE IS '¿Ï·áµÈ ÇÁ·ÎÁ§Æ® Á¦¸ñ';
COMMENT ON COLUMN FINPROJECT.FPRO_README IS '¸®µå¹ÌÆÄÀÏ';
COMMENT ON COLUMN FINPROJECT.FPRO_CONTENT IS '¿Ï·áµÈ ÇÁ·ÎÁ§Æ® ³»¿ë';
COMMENT ON COLUMN FINPROJECT.CREATE_DATE IS 'ÀÛ¼ºÀÏ';
COMMENT ON COLUMN FINPROJECT.STATUS IS '»óÅÂ';
COMMENT ON COLUMN FINPROJECT.FILE_NO IS 'ÆÄÀÏ¹øÈ£';

-- ¿Ï·áµÈ ÇÁ·ÎÁ§Æ® »ùÇÃ µ¥ÀÌÅÍ
INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 1
     , '¿Ï·áÁ¦¸ñ1'
     , '¿Ï·á ³»¿ë1'
     , NULL
     , '¸®µå¹Ì'
     , SYSDATE
     , 'Y'
     );


INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 2
     , '¿Ï·áÁ¦¸ñ2'
     , '¿Ï·á ³»¿ë2'
     , NULL
     , '¸®µå¹Ì'
     , SYSDATE
     , 'Y'
     );
     
     INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 2
     , '¿Ï·áÁ¦¸ñ3'
     , '¿Ï·á ³»¿ë3'
     , NULL
     , '¸®µå¹Ì'
     , SYSDATE
     , 'Y'
     );

INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 1
     , '¿Ï·áÁ¦¸ñ4'
     , '¿Ï·á ³»¿ë4'
     , NULL
     , '¸®µå¹Ì'
     , SYSDATE
     , 'Y'
     );

-- Ä¶¸°´õ Å×ÀÌºí »ý¼º
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

-- Ä¶¸°´õ ÄÚ¸àÆ® ÀÛ¼º
COMMENT ON COLUMN CALENDAR.CAL_NO IS 'ÀÏÁ¤ ¹øÈ£';
COMMENT ON COLUMN CALENDAR.CAL_TITLE IS 'ÀÏÁ¤ Á¦¸ñ';
COMMENT ON COLUMN CALENDAR.CAL_CONTENT IS 'ÀÏÁ¤ ³»¿ë';
COMMENT ON COLUMN CALENDAR.START_DATE IS 'ÀÏÁ¤ ½ÃÀÛÀÏ';
COMMENT ON COLUMN CALENDAR.END_DATE IS 'ÀÏÁ¤ Á¾·áÀÏ';
COMMENT ON COLUMN CALENDAR.CAL_CATEGORY IS 'ÀÏÁ¤ Ä«Å×°í¸®';
COMMENT ON COLUMN CALENDAR.CAL_STATUS IS 'ÀÏÁ¤ ÁøÇà¿©ºÎ(ÃÊ·Ï»ö, È¸»ö)';
COMMENT ON COLUMN CALENDAR.STATUS IS 'ÀÏÁ¤ »èÁ¦¿©ºÎ';

-- Ä¶¸°´õ »ùÇÃ µ¥ÀÌÅÍ 5°³
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, 'ÁÖÁ¦¼±Á¤', 'ÇÁ·ÎÁ§Æ® ÁÖÁ¦ ¼±Á¤ ¹× ¿ªÇÒ ºÐ´ã', '2023-10-16', '2023-10-16', '¾÷¹«', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, 'ÆÀ È¸½Ä', '´ÜÇÕÀ» À§ÇÑ È¸½Ä', '2023-10-21', '2023-10-21', '¼Ò¼È', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, 'ÆÀ ¼±Á¤', 'ÆÀ ¼±Á¤ ¹× ÀÎ»ç', '2023-10-4', '2023-10-4', '¾÷¹«', 'N', DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, '°¡Á·°ú Àú³á½Ä»ç', '°¡Á·°ú ±è¹äÃµ±¹¿¡¼­ Àú³á½Ä»ç', '2023-10-17', '2023-10-17', '°³ÀÎ', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CALNO.NEXTVAL, 'ÆäÀÌÁö Á¦ÀÛ', 'ÆäÀÌÁö Á¦ÀÛ ¹× ÇÇµå¹é', '2023-10-17', '2023-10-30', '¾÷¹«', DEFAULT, DEFAULT);

-- ·¹ÆÄÁöÅä¸® Å×ÀÌºí »ý¼º
CREATE TABLE REPO(
    REPO_NO NUMBER CONSTRAINT REPO_PK PRIMARY KEY,
    REPO_TITLE VARCHAR2(100) NOT NULL,
    REPO_STATUS VARCHAR2(10) DEFAULT 'PUBLIC' CHECK (REPO_STATUS IN ('PUBLIC', 'PRIVATE')),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

-- ·¹ÆÄÁöÅä¸® ÄÚ¸àÆ® ÀÛ¼º
COMMENT ON COLUMN REPO.REPO_NO IS '·¹ÆÄÁöÅä¸® ¹øÈ£';
COMMENT ON COLUMN REPO.REPO_TITLE IS '·¹ÆÄÁöÅä¸® ÀÌ¸§';
COMMENT ON COLUMN REPO.REPO_STATUS IS '·¹ÆÄÁöÅä¸® °ø°³¿©ºÎ';
COMMENT ON COLUMN REPO.CREATE_DATE IS '·¹ÆÄÁöÅä¸® »ý¼ºÀÏ';
COMMENT ON COLUMN REPO.STATUS IS '·¹ÆÄÁöÅä¸® »èÁ¦¿©ºÎ';

-- ·¹ÆÄÁöÅä¸® »ùÇÃ µ¥ÀÌÅÍ 5°³
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_HTML', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_JSP', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEST', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEMPLATE', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_STATUS, CREATE_DATE, STATUS) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_REAL', DEFAULT, DEFAULT, DEFAULT);
========
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, 'ÁÖÁ¦¼±Á¤', 'ÇÁ·ÎÁ§Æ® ÁÖÁ¦ ¼±Á¤ ¹× ¿ªÇÒ ºÐ´ã', '2023-10-16', '2023-10-16', '¾÷¹«', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, 'ÆÀ È¸½Ä', '´ÜÇÕÀ» À§ÇÑ È¸½Ä', '2023-10-21', '2023-10-21', '¼Ò¼È', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, 'ÆÀ ¼±Á¤', 'ÆÀ ¼±Á¤ ¹× ÀÎ»ç', '2023-10-4', '2023-10-4', '¾÷¹«', 'N', DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, '°¡Á·°ú Àú³á½Ä»ç', '°¡Á·°ú ±è¹äÃµ±¹¿¡¼­ Àú³á½Ä»ç', '2023-10-17', '2023-10-17', '°³ÀÎ', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, 'ÆäÀÌÁö Á¦ÀÛ', 'ÆäÀÌÁö Á¦ÀÛ ¹× ÇÇµå¹é', '2023-10-17', '2023-10-30', '¾÷¹«', DEFAULT, DEFAULT);
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql

---¶óº§ Å×ÀÌºí »ý¼º
CREATE TABLE LABELS (
   LAB_NO NUMBER PRIMARY KEY,
   LAB_NAME VARCHAR2(20)
);

-- ¶óº§ Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN LABELS.LAB_NO IS '¶óº§¹øÈ£';
COMMENT ON COLUMN LABELS.LAB_NAME IS '¶óº§ÀÌ¸§';

-- ¶óº§ INSERT¹®
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
     
----Ã¤ÆÃ¹æ Å×ÀÌºí »ý¼º--------------------------------
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

-- Ã¤ÆÃ¹æ Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN CHAT_ROOM.ROOM_NO IS 'Ã¤ÆÃ¹æ ¹øÈ£';
COMMENT ON COLUMN CHAT_ROOM.ROOM_TITLE IS 'Ã¤ÆÃ¹æ Á¦¸ñ';
COMMENT ON COLUMN CHAT_ROOM.ROOM_MEM IS 'Ã¤ÆÃ¹æ Âü¿©ÀÚ¸ñ·Ï';
COMMENT ON COLUMN CHAT_ROOM.CREATE_DATE IS 'Ã¤ÆÃ¹æ »ý¼ºÀÏ';
COMMENT ON COLUMN CHAT_ROOM.STATUS IS 'Ã¤ÆÃ¹æ »óÅÂ(Y/N)';
COMMENT ON COLUMN CHAT_ROOM.LAST_CHAT IS '¸¶Áö¸· Ã¤ÆÃ';
COMMENT ON COLUMN CHAT_ROOM.LAST_DATE IS '¸¶Áö¸· Ã¤ÆÃ ½Ã°£';
COMMENT ON COLUMN CHAT_ROOM.FILE_NO IS 'ÆÄÀÏ¹øÈ£';

-- Ã¤ÆÃ¹æ INSERT
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
       SEQ_CHAT.NEXTVAL
     , 'Ã¤ÆÃ¹æÁ¦¸ñ2'
     , 'À¯Á¤,Á¤¹¬'
     , DEFAULT
     , DEFAULT
     , '¸¶Áö¸·Ãª2'
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
       SEQ_CHAT.NEXTVAL
     , 'Ã¤ÆÃ¹æÁ¦¸ñ3'
     , '½ÂÁØ,°üÇö'
     , DEFAULT
     , DEFAULT
     , '¸¶Áö¸·Ãª3'
     , '2023-11-12'
     , NULL
     );

-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö Å×ÀÌºí »ý¼º
CREATE TABLE CHAT_MESSAGE (
   MSG_NO NUMBER PRIMARY KEY,
   CHAT_CONTENT VARCHAR2(3000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   INVITE VARCHAR2(100) NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   ROOM_NO NUMBER NOT NULL
);

-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö ÄÚ¸àÆ®
COMMENT ON COLUMN CHAT_MESSAGE.MSG_NO IS '¸Þ¼¼Áö ¹øÈ£';
COMMENT ON COLUMN CHAT_MESSAGE.CHAT_CONTENT IS 'Ã¤ÆÃ¹æ ¸Þ¼¼Áö';
COMMENT ON COLUMN CHAT_MESSAGE.CREATE_DATE IS 'Ã¤ÆÃ»ý¼ºÀÏ';
COMMENT ON COLUMN CHAT_MESSAGE.INVITE IS 'ÃÊ´ë';
COMMENT ON COLUMN CHAT_MESSAGE.STATUS IS 'Ã¤ÆÃ¸Þ¼¼Áö »óÅÂ(Y/N)';
COMMENT ON COLUMN CHAT_MESSAGE.ROOM_NO IS 'Ã¤ÆÃ¹æ ¹øÈ£';

-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö INSERT¹®
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
       SEQ_MSG.NEXTVAL
     , '¸Þ¼¼Áö1'
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
       SEQ_MSG.NEXTVAL
     , '¸Þ¼¼Áö2'
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
       SEQ_MSG.NEXTVAL
     , '¸Þ¼¼Áö3'
     , DEFAULT
     , 'INVITEMEM3'
     , DEFAULT
     , 1
     );

-- ³ªÀÇ ÇÁ·ÎÁ§Æ® Å×ÀÌºí
CREATE TABLE MY_PROJECT(
    MYPRO_NO NUMBER PRIMARY KEY,
    REF_PRO_NO NUMBER REFERENCES PROJECT,
    MYPRO_TITLE VARCHAR2(100),
    MYPRO_TYPE VARCHAR2(100),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MYPRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MYPRO_STATUS IN('Y','N'))
);
-- ³ªÀÇ ÇÁ·ÎÁ§Æ® ÄÚ¸àÆ®
COMMENT ON COLUMN MY_PROJECT.MYPRO_NO IS 'ÇÁ·ÎÁ§Æ® ¹øÈ£';
COMMENT ON COLUMN MY_PROJECT.REF_PRO_NO IS 'ÇÁ·ÎÁ§Æ® ¸ðÁý¹øÈ£';
COMMENT ON COLUMN MY_PROJECT.MYPRO_TITLE IS 'ÇÁ·ÎÁ§Æ®¸í';
COMMENT ON COLUMN MY_PROJECT.MYPRO_TYPE IS 'ÇÁ·ÎÁ§Æ® Á¾·ù';
COMMENT ON COLUMN MY_PROJECT.CREATE_DATE IS 'ÇÁ·ÎÁ§Æ® »ý¼ºÀÏ';
COMMENT ON COLUMN MY_PROJECT.STATUS IS 'ÇÁ·ÎÁ§Æ® »óÅÂ';
COMMENT ON COLUMN MY_PROJECT.MYPRO_STATUS IS 'ÇÁ·ÎÁ§Æ® ÁøÇà/¿Ï·á';

-- ³ªÀÇ ÇÁ·ÎÁ§Æ® »ùÇÃµ¥ÀÌÅÍ
INSERT INTO MY_PROJECT (MYPRO_NO, REF_PRO_NO, MYPRO_TITLE, MYPRO_TYPE, CREATE_DATE, STATUS, MYPRO_STATUS) VALUES (SEQ_MYPRO.NEXTVAL, 1, 'OKKY', 'ÆÄÀÌ³Î ÇÁ·ÎÁ§Æ®', SYSDATE, DEFAULT, DEFAULT);
INSERT INTO MY_PROJECT (MYPRO_NO, REF_PRO_NO, MYPRO_TITLE, MYPRO_TYPE, CREATE_DATE, STATUS, MYPRO_STATUS) VALUES (SEQ_MYPRO.NEXTVAL, 2, '°è»ê±â ¸¸µé±â', '°³ÀÎ ÇÁ·ÎÁ§Æ®', SYSDATE, DEFAULT, DEFAULT);
INSERT INTO MY_PROJECT (MYPRO_NO, REF_PRO_NO, MYPRO_TITLE, MYPRO_TYPE, CREATE_DATE, STATUS, MYPRO_STATUS) VALUES (SEQ_MYPRO.NEXTVAL, 3, 'Æ¼ÄÏµü´ë', '¼¼¹Ì ÇÁ·ÎÁ§Æ®', SYSDATE, DEFAULT, DEFAULT);

-- ·¹ÆÄÁöÅä¸® Å×ÀÌºí »ý¼º
CREATE TABLE REPO(
    REPO_NO NUMBER CONSTRAINT REPO_PK PRIMARY KEY,
    REPO_TITLE VARCHAR2(100) NOT NULL,
    REPO_CONTENT VARCHAR2(1000),
    REPO_STATUS VARCHAR2(10) DEFAULT 'PUBLIC' CHECK (REPO_STATUS IN ('PUBLIC', 'PRIVATE')),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    REF_PNO NUMBER REFERENCES MY_PROJECT
);

-- ·¹ÆÄÁöÅä¸® ÄÚ¸àÆ® ÀÛ¼º
COMMENT ON COLUMN REPO.REPO_NO IS '·¹ÆÄÁöÅä¸® ¹øÈ£';
COMMENT ON COLUMN REPO.REPO_TITLE IS '·¹ÆÄÁöÅä¸® ÀÌ¸§';
COMMENT ON COLUMN REPO.REPO_CONTENT IS '·¹ÆÄÁöÅä¸® ³»¿ë';
COMMENT ON COLUMN REPO.REPO_STATUS IS '·¹ÆÄÁöÅä¸® °ø°³¿©ºÎ';
COMMENT ON COLUMN REPO.CREATE_DATE IS '·¹ÆÄÁöÅä¸® »ý¼ºÀÏ';
COMMENT ON COLUMN REPO.STATUS IS '·¹ÆÄÁöÅä¸® »èÁ¦¿©ºÎ';
COMMENT ON COLUMN REPO.REF_PNO IS 'ÂüÁ¶ ÇÁ·ÎÁ§Æ® ¹øÈ£';

-- ·¹ÆÄÁöÅä¸® »ùÇÃ µ¥ÀÌÅÍ 5°³
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_HTML', '·¹ÆÄÁö ³»¿ëÀÓµÂ', DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_JSP', '·¹ÆÄÁö ³»¿ëÀÓµÂ', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEST', '·¹ÆÄÁö ³»¿ëÀÓµÂ', DEFAULT, DEFAULT, DEFAULT, 3);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEMPLATE', '·¹ÆÄÁö ³»¿ëÀÓµÂ', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_REAL', '·¹ÆÄÁö ³»¿ëÀÓµÂ', DEFAULT, DEFAULT, DEFAULT, 1);

----¸¶ÀÏ½ºÅæ Å×ÀÌºí »ý¼º--------------------------------
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

-- ¸¶ÀÏ½ºÅæ Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN MILESTONE.MIL_NO IS '¸¶ÀÏ½ºÅæ ¹øÈ£';
COMMENT ON COLUMN MILESTONE.MIL_TITLE IS '¸¶ÀÏ½ºÅæ Á¦¸ñ';
COMMENT ON COLUMN MILESTONE.CREATE_DATE IS '¸¶ÀÏ½ºÅæ »ý¼ºÀÏ';
COMMENT ON COLUMN MILESTONE.MODIFY_DATE IS '¸¶ÀÏ½ºÅæ Á¾·áÀÏ';
COMMENT ON COLUMN MILESTONE.END_DATE IS 'ÃÖ±Ù ¼öÁ¤ÀÏ';
COMMENT ON COLUMN MILESTONE.ISSUING IS 'ÁøÇàÁßÀÎ ÀÌ½´';
COMMENT ON COLUMN MILESTONE.PROGRESS IS 'ÁøÃ´µµ';
COMMENT ON COLUMN MILESTONE.STATUS IS '¸¶ÀÏ½ºÅæ »óÅÂ';
COMMENT ON COLUMN MILESTONE.MEM_NO IS '¸¶ÀÏ½ºÅæ ÀÛ¼ºÀÚ';
COMMENT ON COLUMN MILESTONE.REPO_NO IS '·¹ÆÛÁöÅä¸® ¹øÈ£';

-- ¸¶ÀÏ½ºÅæ INSERT¹®
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
     , '¸¶ÀÏ1'
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
     , '¸¶ÀÏ2'
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
     , '¸¶ÀÏ3'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , 1
     , 1
     );
     
----ÀÌ½´ Å×ÀÌºí »ý¼º--------------------------------
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

-- ÀÌ½´ Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN ISSUE.ISS_NO IS 'ÀÌ½´¹øÈ£';
COMMENT ON COLUMN ISSUE.ISS_TITLE IS 'ÀÌ½´Á¦¸ñ';
COMMENT ON COLUMN ISSUE.ISS_CONTENT IS 'ÀÌ½´³»¿ë';
COMMENT ON COLUMN ISSUE.CREATE_DATE IS 'ÀÌ½´ »ý¼ºÀÏ';
COMMENT ON COLUMN ISSUE.MODIFY_DATE IS 'ÀÌ½´ ¼öÁ¤ÀÏ';
COMMENT ON COLUMN ISSUE.END_DATE IS 'ÀÌ½´ Á¾·áÀÏ';
COMMENT ON COLUMN ISSUE.ISS_ASSIGNEE IS 'ÀÌ½´ ÇÒ´ç¹ÞÀº »ç¶÷';
COMMENT ON COLUMN ISSUE.ISS_STATUS IS 'ÀÌ½´ ÁøÇà»óÅÂ(Y/N)';
COMMENT ON COLUMN ISSUE.STATUS IS 'ÀÌ½´»óÅÂ(Y/N)';
COMMENT ON COLUMN ISSUE.MEM_NO IS 'ÀÌ½´ ÀÛ¼ºÀÚ';
COMMENT ON COLUMN ISSUE.LAB_NAME IS 'ÀÌ½´°¡ ¼ÓÇÑ ¶óº§(,·Î ±¸ºÐ)';
COMMENT ON COLUMN ISSUE.MIL_NO IS 'ÀÌ½´°¡ ¼ÓÇÑ ¸¶ÀÏ½ºÅæ';
COMMENT ON COLUMN ISSUE.REPO_NO IS 'ÀÌ½´°¡ ¼ÓÇÑ ·¹ÆÛÁöÅä¸® ¹øÈ£';

-- ÀÌ½´ INSERT¹®
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
     , 'Á¦¸ñ1'
     , '³»¿ë1'
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
     , 'Á¦¸ñ2'
     , '³»¿ë2'
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
     , 'Á¦¸ñ1'
     , '³»¿ë1'
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
     
---- Ç®¸®Äù Å×ÀÌºí ---
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

-- Ç®¸®Äù ÄÚ¸àÆ®
COMMENT ON COLUMN PULL_REQUEST.PULL_NO IS 'Ç®¸®Äù ¹øÈ£';
COMMENT ON COLUMN PULL_REQUEST.PULL_TITLE IS 'Ç®¸®Äù Á¦¸ñ';
COMMENT ON COLUMN PULL_REQUEST.PULL_CONTENT IS 'Ç®¸®Äù ³»¿ë';
COMMENT ON COLUMN PULL_REQUEST.PULL_WRITER IS 'Ç®¸®Äù ÀÛ¼ºÀÚ';
COMMENT ON COLUMN PULL_REQUEST.PULL_MANAGER IS 'Ç®¸®Äù ´ã´çÀÚ';
COMMENT ON COLUMN PULL_REQUEST.REPO_NO IS '·¹ÆÄÁöÅä¸® ¹øÈ£';
COMMENT ON COLUMN PULL_REQUEST.ISS_NO IS 'ÀÌ½´ ¹øÈ£';
COMMENT ON COLUMN PULL_REQUEST.MIL_NO IS '¸¶ÀÏ½ºÅæ ¹øÈ£';
COMMENT ON COLUMN PULL_REQUEST.STATUS IS '»óÅÂ(M:¸ÓÁö,C:ÁøÇàÁß,N:°ÅÀý)';

-- Ç®¸®Äù »ùÇÃµ¥ÀÌÅÍ
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , 'Ç®¸®Äù¹Þ¾Æ¶ù!'
     , 'Ç®¸®Äù È®ÀÎÇØº¸½ÃÁö?'
     , 1
     , 'È£»§¸Ç,¼¼±Õ¸Ç'
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
     , 'Ç®¸®Äù¹Þ¾Æ¶ù1!'
     , 'Ç®¸®Äù È®ÀÎÇØº¸½ÃÁö1?'
     , 2
     , 'È£»§¸Ç,¼¼±Õ¸Ç'
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
     , 'Ç®¸®Äù¹Þ¾Æ¶ù3!'
     , 'Ç®¸®Äù È®ÀÎÇØº¸½ÃÁö3?'
     , 2
     , 'È£»§¸Ç,¼¼±Õ¸Ç'
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
     , 'Ç®¸®Äù¹Þ¾Æ¶ù4!'
     , 'Ç®¸®Äù È®ÀÎÇØº¸½ÃÁö4?'
     , 2
     , 'È£»§¸Ç,¼¼±Õ¸Ç'
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
     , 'Ç®¸®Äù¹Þ¾Æ¶ù5!'
     , 'Ç®¸®Äù È®ÀÎÇØº¸½ÃÁö5?'
     , 2
     , 'È£»§¸Ç,¼¼±Õ¸Ç'
     , 2
     , 2
     , 2
     , DEFAULT
     );    
     
-- Ç®¸®Äù½ºÆ® ¸®ºä Å×ÀÌºí »ý¼º
CREATE TABLE PULL_REVIEW(
    PULL_REVIEW_NO NUMBER PRIMARY KEY,
    REF_PULL NUMBER REFERENCES PULL_REQUEST,
    MEM_NO NUMBER REFERENCES MEMBER,
    PULL_REVIEW_CONTENT VARCHAR2(1000),
    CREATE_DATE DATE DEFAULT SYSDATE
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
);

-- Ç®¸®Äù½ºÆ® ¸®ºä Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_NO IS 'Ç®¸®Äù½ºÆ® ¸®ºä ¹øÈ£';
COMMENT ON COLUMN PULL_REVIEW.REF_PULL IS 'ÂüÁ¶ÇÒ Ç®¸®Äù½ºÆ® ¹øÈ£';
COMMENT ON COLUMN PULL_REVIEW.MEM_NO IS 'ÀÛ¼ºÇÑ È¸¿ø ¹øÈ£';
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_CONTENT IS '¸®ºä ³»¿ë';
COMMENT ON COLUMN PULL_REVIEW.CREATE_DATE IS 'ÀÛ¼ºÀÏ';

-- Ç®¸®Äù½ºÆ® ¸®ºä Å×ÀÌºí »ùÇÃµ¥ÀÌÅÍ
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 1, 1, 'ÀÌ»ó¹«', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 2, 3, 'À¯»ó¹«', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 3, 2, 'È«´ç¹«', DEFAULT);
     
----Ã¤ÆÃ¹æ Å×ÀÌºí »ý¼º--------------------------------
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

-- Ã¤ÆÃ¹æ Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN CHAT_ROOM.ROOM_NO IS 'Ã¤ÆÃ¹æ ¹øÈ£';
COMMENT ON COLUMN CHAT_ROOM.ROOM_TITLE IS 'Ã¤ÆÃ¹æ Á¦¸ñ';
COMMENT ON COLUMN CHAT_ROOM.ROOM_MEM IS 'Ã¤ÆÃ¹æ Âü¿©ÀÚ¸ñ·Ï';
COMMENT ON COLUMN CHAT_ROOM.CREATE_DATE IS 'Ã¤ÆÃ¹æ »ý¼ºÀÏ';
COMMENT ON COLUMN CHAT_ROOM.STATUS IS 'Ã¤ÆÃ¹æ »óÅÂ(Y/N)';
COMMENT ON COLUMN CHAT_ROOM.LAST_CHAT IS '¸¶Áö¸· Ã¤ÆÃ';
COMMENT ON COLUMN CHAT_ROOM.LAST_DATE IS '¸¶Áö¸· Ã¤ÆÃ ½Ã°£';
COMMENT ON COLUMN CHAT_ROOM.FILE_NO IS 'ÆÄÀÏ¹øÈ£';

-- Ã¤ÆÃ¹æ INSERT
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
     , 'Ã¤ÆÃ¹æÁ¦¸ñ2'
     , 'À¯Á¤,Á¤¹¬'
     , DEFAULT
     , DEFAULT
     , '¸¶Áö¸·Ãª2'
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
     , 'Ã¤ÆÃ¹æÁ¦¸ñ3'
     , '½ÂÁØ,°üÇö'
     , DEFAULT
     , DEFAULT
     , '¸¶Áö¸·Ãª3'
     , '2023-11-12'
     , NULL
     );

-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö Å×ÀÌºí »ý¼º
CREATE TABLE CHAT_MESSAGE (
   MSG_NO NUMBER PRIMARY KEY,
   CHAT_CONTENT VARCHAR2(3000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   INVITE VARCHAR2(100) NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   ROOM_NO NUMBER NOT NULL
);

-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö ÄÚ¸àÆ®
COMMENT ON COLUMN CHAT_MESSAGE.MSG_NO IS '¸Þ¼¼Áö ¹øÈ£';
COMMENT ON COLUMN CHAT_MESSAGE.CHAT_CONTENT IS 'Ã¤ÆÃ¹æ ¸Þ¼¼Áö';
COMMENT ON COLUMN CHAT_MESSAGE.CREATE_DATE IS 'Ã¤ÆÃ»ý¼ºÀÏ';
COMMENT ON COLUMN CHAT_MESSAGE.INVITE IS 'ÃÊ´ë';
COMMENT ON COLUMN CHAT_MESSAGE.STATUS IS 'Ã¤ÆÃ¸Þ¼¼Áö »óÅÂ(Y/N)';
COMMENT ON COLUMN CHAT_MESSAGE.ROOM_NO IS 'Ã¤ÆÃ¹æ ¹øÈ£';

-- Ã¤ÆÃ¹æ ¸Þ¼¼Áö INSERT¹®
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
     , '¸Þ¼¼Áö1'
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
     , '¸Þ¼¼Áö2'
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
     , '¸Þ¼¼Áö3'
     , DEFAULT
     , 'INVITEMEM3'
     , DEFAULT
     , 1
     );

-- ³ªÀÇ ÇÁ·ÎÁ§Æ® Å×ÀÌºí
CREATE TABLE MY_PROJECT(
    PRO_NO NUMBER PRIMARY KEY,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MYPRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MYPRO_STATUS IN('Y','N')),
    REPO_NO NUMBER NOT NULL,
    MEM_NO NUMBER REFERENCES MEMBER
);
-- ³ªÀÇ ÇÁ·ÎÁ§Æ® ÄÚ¸àÆ®
COMMENT ON COLUMN MY_PROJECT.PRO_NO IS 'ÇÁ·ÎÁ§Æ® ¸ðÁý¹øÈ£';
COMMENT ON COLUMN MY_PROJECT.CREATE_DATE IS 'ÇÁ·ÎÁ§Æ® »ý¼ºÀÏ';
COMMENT ON COLUMN MY_PROJECT.STATUS IS 'ÇÁ·ÎÁ§Æ® »óÅÂ';
COMMENT ON COLUMN MY_PROJECT.REPO_NO IS '·¹ÆÛÁöÅä¸® ¹øÈ£';
COMMENT ON COLUMN MY_PROJECT.MEM_NO IS 'È¸¿ø¹øÈ£';

-- ³ªÀÇ ÇÁ·ÎÁ§Æ® »ùÇÃµ¥ÀÌÅÍ
INSERT INTO MY_PROJECT (PRO_NO, CREATE_DATE, STATUS, MYPRO_STATUS, REPO_NO, MEM_NO) VALUES (SEQ_PNO.NEXTVAL, SYSDATE, DEFAULT, DEFAULT, 1, 1);
INSERT INTO MY_PROJECT (PRO_NO, CREATE_DATE, STATUS, MYPRO_STATUS, REPO_NO, MEM_NO) VALUES (SEQ_PNO.NEXTVAL, SYSDATE, DEFAULT, DEFAULT, 2, 3);
INSERT INTO MY_PROJECT (PRO_NO, CREATE_DATE, STATUS, MYPRO_STATUS, REPO_NO, MEM_NO) VALUES (SEQ_PNO.NEXTVAL, SYSDATE, DEFAULT, DEFAULT, 3, 2);
========
);

-- Ç®¸®Äù½ºÆ® ¸®ºä Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_NO IS 'Ç®¸®Äù½ºÆ® ¸®ºä ¹øÈ£';
COMMENT ON COLUMN PULL_REVIEW.REF_PULL IS 'ÂüÁ¶ÇÒ Ç®¸®Äù½ºÆ® ¹øÈ£';
COMMENT ON COLUMN PULL_REVIEW.MEM_NO IS 'ÀÛ¼ºÇÑ È¸¿ø ¹øÈ£';
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_CONTENT IS '¸®ºä ³»¿ë';
COMMENT ON COLUMN PULL_REVIEW.CREATE_DATE IS 'ÀÛ¼ºÀÏ';

-- Ç®¸®Äù½ºÆ® ¸®ºä Å×ÀÌºí »ùÇÃµ¥ÀÌÅÍ
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 1, 1, 'ÀÌ»ó¹«', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 2, 3, 'À¯»ó¹«', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 3, 2, 'È«´ç¹«', DEFAULT);
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql

-- ¾Ë¸² Å×ÀÌºí
CREATE TABLE NOTICE(
    NOTI_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50) NOT NULL,
    NOTI_CONTENT VARCHAR2(1000) NOT NULL,
    OCU_TIME DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MEM_NO NUMBER REFERENCES MEMBER
);

-- ¾Ë¸² Å×ÀÌºí ÄÚ¸àÆ®
COMMENT ON COLUMN NOTICE.NOTI_NO IS '¾Ë¸²¹øÈ£';
COMMENT ON COLUMN NOTICE.CATEGORY_NAME IS 'Ä«Å×°í¸®¸í';
COMMENT ON COLUMN NOTICE.NOTI_CONTENT IS '¾Ë¸²³»¿ë';
COMMENT ON COLUMN NOTICE.OCU_TIME IS '¾Ë¸²¹ß»ý½Ã°£';
COMMENT ON COLUMN NOTICE.STATUS IS '¾Ë¸²»óÅÂ';
COMMENT ON COLUMN NOTICE.MEM_NO IS 'È¸¿ø¹øÈ£';

-- ¾Ë¸² Å×ÀÌºí »ùÇÃµ¥ÀÌÅÍ
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NOTI.NEXTVAL, 'ÀÌ½´', '00_java-workspace¿¡ »õ·Î¿î ÀÌ½´°¡ ¹ß»ýÇß½À´Ï´Ù.', DEFAULT, DEFAULT, 2);
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NOTI.NEXTVAL, 'Ä£±¸', 'USER03 ´ÔÀÌ Ä£±¸¿äÃ»À» ¼ö¶ôÇÏ¼Ì½À´Ï´Ù.', DEFAULT, DEFAULT, 3);
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NOTI.NEXTVAL, '°³ÀÎÈ«º¸', 'USER02 ´ÔÀÌ °í°´´ÔÀÇ ÀÚ±âPR¿¡ ÁÁ¾Æ¿ä¸¦ ´­·¶½À´Ï´Ù.', DEFAULT, DEFAULT, 1);

-- Ä¿¹Ô Å×ÀÌºí »ý¼º
CREATE TABLE PRO_COMMIT(
    COMM_NO NUMBER CONSTRAINT PRO_COMMIT_PK PRIMARY KEY,
    COMM_WRITER NUMBER CONSTRAINT COMM_WRITER_FK REFERENCES MEMBER ON DELETE CASCADE,
    COMM_DATE DATE DEFAULT SYSDATE,
    COMM_MSG VARCHAR2(1000) NOT NULL,
    REPO_NO NUMBER CONSTRAINT REPO_NO_FK REFERENCES REPO ON DELETE CASCADE
);

-- Ä¿¹Ô ÄÚ¸àÆ® ÀÛ¼º
COMMENT ON COLUMN PRO_COMMIT.COMM_NO IS 'Ä¿¹Ô ¹øÈ£';
COMMENT ON COLUMN PRO_COMMIT.COMM_WRITER IS 'Ä¿¹Ô ÀÛ¼ºÀÚ';
COMMENT ON COLUMN PRO_COMMIT.COMM_DATE IS 'Ä¿¹Ô ³¯Â¥';
COMMENT ON COLUMN PRO_COMMIT.COMM_MSG IS 'Ä¿¹Ô ¸Þ¼¼Áö';
COMMENT ON COLUMN PRO_COMMIT.REPO_NO IS '·¹ÆÄÁöÅä¸® ¹øÈ£';

-- Ä¿¹Ô »ùÇÃ µ¥ÀÌÅÍ 5°³
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '·Î±×ÀÎ ±â´É ¼öÁ¤', 1);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, 'ÁÁ¾Æ¿ä ±â´É ¹ö±× ¼öÁ¤', 2);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '·¹ÆÄÁöÅä¸® µî·Ï ±â´É Ãß°¡', 3);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '½Å°í ±â´É »èÁ¦', 4);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '¸¶ÀÌÆäÀÌÁö ±â´É ÄÚµå ¼öÁ¤', 5);



--- ºÏ¸¶Å© Å×ÀÌºí 
CREATE TABLE BOOKMARK(
    MEM_NO NUMBER REFERENCES MEMBER,
    PRO_NO NUMBER REFERENCES PROJECT,
    PRIMARY KEY(MEM_NO, PRO_NO)
    
);

COMMENT ON COLUMN BOOKMARK.MEM_NO IS 'ºÏ¸¶Å© È¸¿ø¹øÈ£';
COMMENT ON COLUMN BOOKMARK.PRO_NO IS 'ºÏ¸¶Å© °Ô½ÃÆÇ ¹øÈ£';

<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql

========
-- ´ñ±Û Å×ÀÌºí
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER REFERENCES MEMBER(MEM_NO) NOT NULL,
    REP_CONTENT VARCHAR2(4000) NOT NULL,
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
    REF_PNO NUMBER NOT NULL,
    REP_DATE DATE NOT NULL
    
);

CREATE SEQUENCE SEQ_RENO
NOCACHE;

COMMENT ON COLUMN REPLY.REPLY_NO IS '´ñ±Û ¹øÈ£';
COMMENT ON COLUMN REPLY.MEM_NO IS '´ñ±Û ÀÛ¼ºÀÚ';           
COMMENT ON COLUMN REPLY.REP_CONTENT IS '´ñ±Û ³»¿ë';
COMMENT ON COLUMN REPLY.REF_PNO IS 'ÂüÁ¶ °Ô½Ã¹°';   
COMMENT ON COLUMN REPLY.REP_DATE IS '´ñ±Û ÀÛ¼ºÀÏ';     
========
    REF_PRO NUMBER NOT NULL,
    REP_DATE DATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '´ñ±Û ¹øÈ£';
COMMENT ON COLUMN REPLY.MEM_NO IS '´ñ±Û ÀÛ¼ºÀÚ';           
COMMENT ON COLUMN REPLY.REP_CONTENT IS '´ñ±Û ³»¿ë';
COMMENT ON COLUMN REPLY.REF_PRO IS 'ÂüÁ¶ °Ô½Ã¹°';   
COMMENT ON COLUMN REPLY.REP_DATE IS '´ñ±Û ÀÛ¼ºÀÏ';     
COMMENT ON COLUMN REPLY.STATUS IS '´ñ±Û »èÁ¦¿©ºÎ';     
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql

INSERT INTO 
            REPLY
     VALUES
     (
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_RENO.NEXTVAL
========
       SEQ_REP.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 1
     , 'Àúµµ Âü¿©ÇÏ°í ½Í¾î¿ä'
     , 1
     , SYSDATE
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
========
     , DEFAULT
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     );
    
    
INSERT INTO 
            REPLY
     VALUES
     (
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
       SEQ_RENO.NEXTVAL
========
       SEQ_REP.NEXTVAL
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     , 2
     , '´ëÇÑÀÇ °Ç¾Æ!! ¼º½ÇÇÑ Á¦°¡ ÇÑ¹ø Âü¿©ÇØº¸°ÚÀ¾´Ï´Ù.'
     , 1
     , SYSDATE
<<<<<<<< HEAD:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ì°.sql
     );     
========
     , DEFAULT
     );
>>>>>>>> target_calendar:íŒŒì´ë„ 5ì¡° ìŠ¤í¬ë¦½íŠ¸_ë§Œì°ë‘ë¹µ.sql
     


COMMIT;