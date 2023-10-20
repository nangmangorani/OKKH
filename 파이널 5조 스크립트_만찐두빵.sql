-----------------����------------------
--���������� ������̺� �� �������� ����
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--���������� ��� ������ ����
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--���������� ��� �� ����
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--���������� ��� Ʈ���� ����
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-----------------������ ����------------------
-- Ķ���� ������ ����
CREATE SEQUENCE SEQ_CAL
NOCACHE;
-- �������丮 ������ ����
CREATE SEQUENCE SEQ_REPO
NOCACHE;
-- Ŀ�� ������ ����
CREATE SEQUENCE SEQ_COMM
NOCACHE;
-- ��� ������ ����
CREATE SEQUENCE SEQ_MEM
NOCACHE;
-- ������Ʈ ���� ������ ����
CREATE SEQUENCE SEQ_PRO
NOCACHE;
-- �Ϸ�� ������Ʈ ������ ����
CREATE SEQUENCE SEQ_FPRO
NOCACHE;
--�� ������Ʈ ������ ����
CREATE SEQUENCE SEQ_MYPRO
NOCACHE;
-- �˸�â ������ ����
CREATE SEQUENCE SEQ_NOTI
NOCACHE;
-- ���� ������ ����
CREATE SEQUENCE SEQ_ATTA
NOCACHE;
-- ������� ������ ����
CREATE SEQUENCE SEQ_STA
NOCACHE;
-- �ڱ�PR ������ ����
CREATE SEQUENCE SEQ_PR
START WITH 1000
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- ���Ͻ��� ������ ����
CREATE SEQUENCE SEQ_MIL
NOCACHE;
-- �̽� ������ ����
CREATE SEQUENCE SEQ_ISS
NOCACHE;
-- �̽��� ������ ����
CREATE SEQUENCE SEQ_LAB
NOCACHE;
-- ��� ������ ����
CREATE SEQUENCE SEQ_REP
NOCACHE;
-- Ǯ������Ʈ ������ ����
CREATE SEQUENCE SEQ_PREQ
NOCACHE;
-- Ǯ������Ʈ ���� ������ ����
CREATE SEQUENCE SEQ_REV
NOCACHE;
-- ä�ù� ������ ����
CREATE SEQUENCE SEQ_CHAT
NOCACHE;
-- ä�ù� �޼��� ������ ����
CREATE SEQUENCE SEQ_MSG
NOCACHE;

-----------------���̺� ����------------------
-- ��� ���� ���̺�
CREATE TABLE STACK(
    STACK_NO NUMBER PRIMARY KEY,
    STACK_TYPE VARCHAR2(100),
    STACK_NAME VARCHAR2(100),
    STACK_IMG VARCHAR2(100)
)
;

-- ��� ���� �ڸ�Ʈ �ޱ� 
COMMENT ON COLUMN STACK.STACK_NO IS '������� ��ȣ';
COMMENT ON COLUMN STACK.STACK_NAME IS '������� �̸�';
COMMENT ON COLUMN STACK.STACK_TYPE IS '��� ���� �з�';
COMMENT ON COLUMN STACK.STACK_IMG IS '��� ���� �̹���';

-- ��� ���� ���� ������
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '����Ʈ����','javascript','https://holaworld.io/images/languages/javascript.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '����Ʈ����','typescript','https://holaworld.io/images/languages/typescript.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '����Ʈ����','react','https://holaworld.io/images/languages/react.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '����Ʈ����','vue','https://holaworld.io/images/languages/vue.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '����Ʈ����','svelte','https://holaworld.io/images/languages/svelte.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '����Ʈ����','nextjs','https://holaworld.io/images/languages/nextjs.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','java','https://holaworld.io/images/languages/java.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','spring','https://holaworld.io/images/languages/spring.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','nodejs','https://holaworld.io/images/languages/nodejs.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','nestjs','https://holaworld.io/images/languages/nestjs.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','go','https://holaworld.io/images/languages/go.svg');
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','kotlin','https://holaworld.io/images/languages/kotlin.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','express','https://holaworld.io/images/languages/express.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','mysql','https://holaworld.io/images/languages/mysql.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','mongodb','https://holaworld.io/images/languages/mongodb.svg');
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','python','https://holaworld.io/images/languages/python.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','django','https://holaworld.io/images/languages/django.svg');
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','php','https://holaworld.io/images/languages/php.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','graphql','https://holaworld.io/images/languages/graphql.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�鿣��','firebase','https://holaworld.io/images/languages/firebase.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�����','flutter','https://holaworld.io/images/languages/flutter.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�����','swift','https://holaworld.io/images/languages/swift.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�����','reactnative','https://holaworld.io/images/languages/reactnative.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '�����','unity','https://holaworld.io/images/languages/unity.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','aws','https://holaworld.io/images/languages/aws.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','kubernetes','https://holaworld.io/images/languages/kubernetes.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','docker','https://holaworld.io/images/languages/docker.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','git','https://holaworld.io/images/languages/git.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','figma','https://holaworld.io/images/languages/figma.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','zeplin','https://holaworld.io/images/languages/zeplin.svg'); 
INSERT INTO STACK VALUES (SEQ_STA.NEXTVAL, '��Ÿ','jest','https://holaworld.io/images/languages/jest.svg'); 


 ---���� ���̺� 
 -- ȸ�����̺��� FILE_NO�� �����ؼ�
 -- ���� ���̺��� ȸ�����̺� ���ٵ� �� ���� �����ؾ��ҵ��ؿ�
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
    
-- ���� ���̺� �ڸ�Ʈ    
COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '���Ϲ�ȣ';   
COMMENT ON COLUMN ATTACHMENT.REF_BNO IS '�����Խ��� ��ȣ';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '���Ͽ�����'; 
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '���ϼ�����'; 
COMMENT ON COLUMN ATTACHMENT.FILE_PATH IS '������'; 
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '���ε���'; 
COMMENT ON COLUMN ATTACHMENT.STATUS IS '����'; 
COMMENT ON COLUMN ATTACHMENT.CATEGORY IS '�Խ��Ǳ���(C:ä��, P: �Ϸ�� ������Ʈ, M:ȸ�� )';

-- ���� ���̺� ���õ�����
INSERT INTO ATTACHMENT (FILE_NO, REF_BNO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, UPLOAD_DATE, STATUS, CATEGORY) VALUES (SEQ_ATTA.NEXTVAL, 1, 'ȣ��.jpg', '2023101610204578.jpg', 'resources/upfiles/', DEFAULT, DEFAULT, 'M');

-- ��� ���̺�
CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(50) NOT NULL,
    MEM_TOKEN VARCHAR2(100) NOT NULL,
    GIT_NICK VARCHAR2(30) NOT NULL,
    AVATAR_URL VARCHAR2(1000),
    MEM_INTRO VARCHAR2(4000),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    STACK VARCHAR2(4000),
    TEAM NUMBER DEFAULT 0,
    TEAM_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(TEAM_STATUS IN ('Y', 'N'))
);

-- ��� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN MEMBER.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_TOKEN IS 'ȸ����ū';
COMMENT ON COLUMN MEMBER.GIT_NICK IS '�����г���';
COMMENT ON COLUMN MEMBER.AVATAR_URL IS '����� ������ ����';
COMMENT ON COLUMN MEMBER.MEM_INTRO IS '�ڱ�Ұ�';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS 'ȸ��������';
COMMENT ON COLUMN MEMBER.STATUS IS 'ȸ������(Y/N)';
COMMENT ON COLUMN MEMBER.STACK IS '�������';
COMMENT ON COLUMN MEMBER.TEAM IS '���� ������Ʈ ��';
COMMENT ON COLUMN MEMBER.TEAM_STATUS IS '��������(Y:Ȯ��, N:�ӽ�)';

-- ��� ���̺� ���õ����� 5��
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '11111', '21451', '�г���1', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfMjk1/MDAxNjcwMTM0MzQxODYy.-bwZuKUBCl5lStmN48I0agvEAunWWFYzcQb5AoLImhwg.yMoOCcK-zeiPGMCNuEjQRV51U9xTqOKqVDbmQdGns_Yg.JPEG.goms1101/IMG_3400.JPG?type=w800', '�ڱ�Ұ�1', DEFAULT, DEFAULT, '�ڹ�, ���̽�', 1, 'Y');
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '22222', '56436', '�г���2', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfMjAg/MDAxNjcwMTM0MzQ2MzI1.60eBNkj8BiFMZZ2TEjaNKfkQBMLbs9t-r-B5dt2kcusg.MpGfZY-SlIoDyTHS9haziKlNqXU616HKdSbG_gFUe1sg.JPEG.goms1101/IMG_3421.JPG?type=w800', '�ڱ�Ұ�2', DEFAULT, DEFAULT, '�ڹٽ�ũ��Ʈ, ����Ʈ', 1, 'Y');
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '33333', '80600', '�г���3', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfNTEg/MDAxNjcwMTM0MzQyMzc2.hKZlLb7mpDBpn8uUKmIo4e-1LXmQ9w81iCAHbtj2sM0g.EdlEMutFjvEnxiJAak_oM6QgRWuusz-Uy1qoGAKpHKUg.JPEG.goms1101/IMG_3413.JPG?type=w400', '�ڱ�Ұ�3', DEFAULT, DEFAULT, '����Ŭ, ���̹�Ƽ��', 1, 'Y');
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '44444', '80685', '�г���4', 'https://mblogthumb-phinf.pstatic.net/MjAyMjEyMDRfNjEg/MDAxNjcwMTM0MzQxOTYy.y_9OPghag6MUoqEcnAzLLV2ZNDSmej5SU3f1j5lM5g0g.KkMUYr0k9ql3TDqG2-SnsC66RVL0Lm7NZ2iSX6BRTuIg.JPEG.goms1101/IMG_3394.JPG?type=w800', '�ڱ�Ұ�4', DEFAULT, DEFAULT, 'C++, C', DEFAULT, DEFAULT);
INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_TOKEN, GIT_NICK, AVATAR_URL, MEM_INTRO, CREATE_DATE, STATUS, STACK, TEAM, TEAM_STATUS) VALUES (SEQ_MEM.NEXTVAL, '55555', '68586', '�г���5', 'https://image.fmkorea.com/files/attach/new/20191008/486616/2093167063/2261931734/953da8ce0874ea6f3d56a20747129b8f.jpg', '�ڱ�Ұ�5', DEFAULT, DEFAULT, 'HTML, CSS', DEFAULT, DEFAULT);


----- ģ�� ���̺� -----
CREATE TABLE FRIEND(
    BF_GIVER NUMBER REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE NOT NULL,
    BF_TAKER NUMBER REFERENCES MEMBER(MEM_NO) ON DELETE CASCADE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'A' CHECK(STATUS IN('Y','A','B','D')) NOT NULL,
    REQUEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY(BF_GIVER,BF_TAKER)

);

-- ģ�� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN FRIEND.BF_GIVER IS 'ģ�� ��û��';
COMMENT ON COLUMN FRIEND.BF_TAKER IS 'ģ�� ��û�޴���';
COMMENT ON COLUMN FRIEND.STATUS IS 'ģ������(Y:ģ��,A:ģ����û,B:ģ������,D:����)';
COMMENT ON COLUMN FRIEND.REQUEST_DATE IS 'ģ�� ��û��';

-- ģ�� ���̺� ���� ������
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

-------- �ڱ� PR ���̺� -----
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

-- �ڱ�PR �ڸ�Ʈ
COMMENT ON COLUMN MY_PR.PR_NO IS 'PR ��ȣ';
COMMENT ON COLUMN MY_PR.PR_TITLE IS 'PR ����';
COMMENT ON COLUMN MY_PR.PR_CONTENT IS 'PR ����';
COMMENT ON COLUMN MY_PR.CREATE_DATE IS 'PR �ۼ���';
COMMENT ON COLUMN MY_PR.STATUS IS '����';
COMMENT ON COLUMN MY_PR.STACK_NAME IS '�������';
COMMENT ON COLUMN MY_PR.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MY_PR.COUNT IS '��ȸ��';
COMMENT ON COLUMN MY_PR.PR_TIME IS '������Ʈ ���ɽð�';


INSERT INTO MY_PR 
     VALUES
     (
       SEQ_PR.NEXTVAL
     , '������ �������Դϴ�'  
     , '���� ������ ���� ��ȸ���� �ʽ��ϴ�.'
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
       SEQ_PR.NEXTVAL
     , '��... ������Ʈ �ϰ�ʹ�'  
     , '������Ʈ �ϰ� �;� ��ġ�����ϴ�. �������ֽʽÿ�'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
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
       SEQ_PR.NEXTVAL
     , '����ϰ�ʹٸ�?'  
     , '���� �Բ� ��ī������ ����ϽǷ���?'
     , '2023-09-25'
     , 5
     , 'Y'
     , 'typescript,javascript,spring,java'
     , 3  
     , DEFAULT
     )
;

--- ������Ʈ ���� ���̺� 
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
    COUNT NUMBER DEFAULT 0
    
    
);

-- ������Ʈ ���� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN PROJECT.PRO_NO IS '������Ʈ ������ȣ';
COMMENT ON COLUMN PROJECT.PRO_WRITER IS '������Ʈ �ۼ���';
COMMENT ON COLUMN PROJECT.PRO_STACK IS '������Ʈ ��� �������';
COMMENT ON COLUMN PROJECT.PRO_TITLE IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.PRO_CONTENT IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.PRO_MEMBER IS '������Ʈ �����ο�';
COMMENT ON COLUMN PROJECT.PRO_PERIOD IS '������Ʈ ����Ⱓ';
COMMENT ON COLUMN PROJECT.PRO_DEADLINE IS '������Ʈ ����������';
COMMENT ON COLUMN PROJECT.PRO_START_DATE IS '������Ʈ ���ۿ�����';
COMMENT ON COLUMN PROJECT.PRO_POSITION IS '������Ʈ ����������';
COMMENT ON COLUMN PROJECT.PRO_STATUS IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.STATUS IS '������Ʈ ��������';
COMMENT ON COLUMN PROJECT.COUNT IS '��ȸ��';

-- ������Ʈ ���� ���̺� ���õ�����
INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PRO.NEXTVAL
     , 1
     , 'JavaScript,VSCode,Java,Spring,AJAX'
     , '�鿣�� ������ ���մϴ�'
     , '���� �鿣�� �� �Ѵ�? ��ʴϴ�'
     , 1
     , '3����'
     , '2023-10-20'
     , '2023-10-22'
     , '�鿣��'
     , 'Y'
     , 'Y'
     , DEFAULT
     );
     
     
INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PRO.NEXTVAL
     , 2
     , 'JavaScript,VSCode,Java,Spring,AJAX'
     , '��~ ȭ�� �� ����� ����Ʈ ������ ��� ������~?'
     , 'ȭ���� ��򳪰� ���� �� �ִ� ����Ʈ ������ �� �ޱ��մϴ�!!!!!'
     , 1
     , '4����'
     , '2023-10-28'
     , '2023-10-30'
     , '����Ʈ����'
     , 'Y'
     , 'Y'
     , DEFAULT
     );
        

INSERT INTO 
    PROJECT
     VALUES  
     (
       SEQ_PRO.NEXTVAL
     , 3
     , 'Java, MySQL, Spring,JavaScript, VSCode'
     , '��! �� ����!!'
     , '���� ������Ʈ ����?'
     , 1
     , '5����'
     , '2023-10-18'
     , '2023-10-20'
     , '�鿣��'
     , 'Y'
     , 'Y'
     , DEFAULT 
     );
     
-- �Ϸ�� ������Ʈ 
-- ���� ������Ʈ ��ȣ(REF_PNO)�� ���߿� ���� ������Ʈ�� ������ �� �ʿ��� ���� ���� �� ���Ƽ� ��������ϴ�.
-- �ʿ������� �ϴ� NULL�� �߾��
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

-- �Ϸ�� ������Ʈ �ڸ�Ʈ
COMMENT ON COLUMN FINPROJECT.FPRO_NO IS '�Ϸ�� ������Ʈ ��ȣ';
COMMENT ON COLUMN FINPROJECT.REF_PNO IS '���� ������Ʈ ��ȣ';  -- Ȥ�� ���� ���� �÷�
COMMENT ON COLUMN FINPROJECT.FPRO_TITLE IS '�Ϸ�� ������Ʈ ����';
COMMENT ON COLUMN FINPROJECT.FPRO_README IS '���������';
COMMENT ON COLUMN FINPROJECT.FPRO_CONTENT IS '�Ϸ�� ������Ʈ ����';
COMMENT ON COLUMN FINPROJECT.CREATE_DATE IS '�ۼ���';
COMMENT ON COLUMN FINPROJECT.STATUS IS '����';
COMMENT ON COLUMN FINPROJECT.FILE_NO IS '���Ϲ�ȣ';

-- �Ϸ�� ������Ʈ ���� ������
INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 1
     , '�Ϸ�����1'
     , '�Ϸ� ����1'
     , NULL
     , '�����'
     , SYSDATE
     , 'Y'
     );


INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 2
     , '�Ϸ�����2'
     , '�Ϸ� ����2'
     , NULL
     , '�����'
     , SYSDATE
     , 'Y'
     );
     
     INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 2
     , '�Ϸ�����3'
     , '�Ϸ� ����3'
     , NULL
     , '�����'
     , SYSDATE
     , 'Y'
     );

INSERT INTO 
            FINPROJECT 
     VALUES     
     (
       SEQ_FPRO.NEXTVAL
     , 1
     , '�Ϸ�����4'
     , '�Ϸ� ����4'
     , NULL
     , '�����'
     , SYSDATE
     , 'Y'
     );

-- Ķ���� ���̺� ����
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

-- Ķ���� �ڸ�Ʈ �ۼ�
COMMENT ON COLUMN CALENDAR.CAL_NO IS '���� ��ȣ';
COMMENT ON COLUMN CALENDAR.CAL_TITLE IS '���� ����';
COMMENT ON COLUMN CALENDAR.CAL_CONTENT IS '���� ����';
COMMENT ON COLUMN CALENDAR.START_DATE IS '���� ������';
COMMENT ON COLUMN CALENDAR.END_DATE IS '���� ������';
COMMENT ON COLUMN CALENDAR.CAL_CATEGORY IS '���� ī�װ�';
COMMENT ON COLUMN CALENDAR.CAL_STATUS IS '���� ���࿩��(�ʷϻ�, ȸ��)';
COMMENT ON COLUMN CALENDAR.STATUS IS '���� ��������';

-- Ķ���� ���� ������ 5��
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, '��������', '������Ʈ ���� ���� �� ���� �д�', '2023-10-16', '2023-10-16', '����', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, '�� ȸ��', '������ ���� ȸ��', '2023-10-21', '2023-10-21', '�Ҽ�', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, '�� ����', '�� ���� �� �λ�', '2023-10-4', '2023-10-4', '����', 'N', DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, '������ ����Ļ�', '������ ���õ������ ����Ļ�', '2023-10-17', '2023-10-17', '����', DEFAULT, DEFAULT);
INSERT INTO CALENDAR (CAL_NO, CAL_TITLE, CAL_CONTENT, START_DATE, END_DATE, CAL_CATEGORY, CAL_STATUS, STATUS) VALUES (SEQ_CAL.NEXTVAL, '������ ����', '������ ���� �� �ǵ��', '2023-10-17', '2023-10-30', '����', DEFAULT, DEFAULT);

---�� ���̺� ����
CREATE TABLE LABELS (
   LAB_NO NUMBER PRIMARY KEY,
   LAB_NAME VARCHAR2(20)
);

-- �� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN LABELS.LAB_NO IS '�󺧹�ȣ';
COMMENT ON COLUMN LABELS.LAB_NAME IS '���̸�';

-- �� INSERT��
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
     
----ä�ù� ���̺� ����--------------------------------
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

-- ä�ù� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN CHAT_ROOM.ROOM_NO IS 'ä�ù� ��ȣ';
COMMENT ON COLUMN CHAT_ROOM.ROOM_TITLE IS 'ä�ù� ����';
COMMENT ON COLUMN CHAT_ROOM.ROOM_MEM IS 'ä�ù� �����ڸ��';
COMMENT ON COLUMN CHAT_ROOM.CREATE_DATE IS 'ä�ù� ������';
COMMENT ON COLUMN CHAT_ROOM.STATUS IS 'ä�ù� ����(Y/N)';
COMMENT ON COLUMN CHAT_ROOM.LAST_CHAT IS '������ ä��';
COMMENT ON COLUMN CHAT_ROOM.LAST_DATE IS '������ ä�� �ð�';
COMMENT ON COLUMN CHAT_ROOM.FILE_NO IS '���Ϲ�ȣ';

-- ä�ù� INSERT
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
     , 'ä�ù�����2'
     , '����,����'
     , DEFAULT
     , DEFAULT
     , '������ê2'
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
     , 'ä�ù�����3'
     , '����,����'
     , DEFAULT
     , DEFAULT
     , '������ê3'
     , '2023-11-12'
     , NULL
     );

-- ä�ù� �޼��� ���̺� ����
CREATE TABLE CHAT_MESSAGE (
   MSG_NO NUMBER PRIMARY KEY,
   CHAT_CONTENT VARCHAR2(3000) NOT NULL,
   CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
   INVITE VARCHAR2(100) NOT NULL,
   STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
   ROOM_NO NUMBER NOT NULL
);

-- ä�ù� �޼��� �ڸ�Ʈ
COMMENT ON COLUMN CHAT_MESSAGE.MSG_NO IS '�޼��� ��ȣ';
COMMENT ON COLUMN CHAT_MESSAGE.CHAT_CONTENT IS 'ä�ù� �޼���';
COMMENT ON COLUMN CHAT_MESSAGE.CREATE_DATE IS 'ä�û�����';
COMMENT ON COLUMN CHAT_MESSAGE.INVITE IS '�ʴ�';
COMMENT ON COLUMN CHAT_MESSAGE.STATUS IS 'ä�ø޼��� ����(Y/N)';
COMMENT ON COLUMN CHAT_MESSAGE.ROOM_NO IS 'ä�ù� ��ȣ';

-- ä�ù� �޼��� INSERT��
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
     , '�޼���1'
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
     , '�޼���2'
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
     , '�޼���3'
     , DEFAULT
     , 'INVITEMEM3'
     , DEFAULT
     , 1
     );

-- ���� ������Ʈ ���̺�
CREATE TABLE MY_PROJECT(
    MYPRO_NO NUMBER PRIMARY KEY,
    REF_PRO_NO NUMBER REFERENCES PROJECT,
    MYPRO_TITLE VARCHAR2(100),
    MYPRO_TYPE VARCHAR2(100),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MYPRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MYPRO_STATUS IN('Y','N'))
);
-- ���� ������Ʈ �ڸ�Ʈ
COMMENT ON COLUMN MY_PROJECT.MYPRO_NO IS '������Ʈ ��ȣ';
COMMENT ON COLUMN MY_PROJECT.REF_PRO_NO IS '������Ʈ ������ȣ';
COMMENT ON COLUMN MY_PROJECT.MYPRO_TITLE IS '������Ʈ��';
COMMENT ON COLUMN MY_PROJECT.MYPRO_TYPE IS '������Ʈ ����';
COMMENT ON COLUMN MY_PROJECT.CREATE_DATE IS '������Ʈ ������';
COMMENT ON COLUMN MY_PROJECT.STATUS IS '������Ʈ ����';
COMMENT ON COLUMN MY_PROJECT.MYPRO_STATUS IS '������Ʈ ����/�Ϸ�';

-- ���� ������Ʈ ���õ�����
INSERT INTO MY_PROJECT (MYPRO_NO, REF_PRO_NO, MYPRO_TITLE, MYPRO_TYPE, CREATE_DATE, STATUS, MYPRO_STATUS) VALUES (SEQ_MYPRO.NEXTVAL, 1, 'OKKY', '���̳� ������Ʈ', SYSDATE, DEFAULT, DEFAULT);
INSERT INTO MY_PROJECT (MYPRO_NO, REF_PRO_NO, MYPRO_TITLE, MYPRO_TYPE, CREATE_DATE, STATUS, MYPRO_STATUS) VALUES (SEQ_MYPRO.NEXTVAL, 2, '���� �����', '���� ������Ʈ', SYSDATE, DEFAULT, DEFAULT);
INSERT INTO MY_PROJECT (MYPRO_NO, REF_PRO_NO, MYPRO_TITLE, MYPRO_TYPE, CREATE_DATE, STATUS, MYPRO_STATUS) VALUES (SEQ_MYPRO.NEXTVAL, 3, 'Ƽ�ϵ���', '���� ������Ʈ', SYSDATE, DEFAULT, DEFAULT);

-- �������丮 ���̺� ����
CREATE TABLE REPO(
    REPO_NO NUMBER CONSTRAINT REPO_PK PRIMARY KEY,
    REPO_TITLE VARCHAR2(100) NOT NULL,
    REPO_CONTENT VARCHAR2(1000),
    REPO_STATUS VARCHAR2(10) DEFAULT 'PUBLIC' CHECK (REPO_STATUS IN ('PUBLIC', 'PRIVATE')),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    REF_PNO NUMBER REFERENCES MY_PROJECT
);

-- �������丮 �ڸ�Ʈ �ۼ�
COMMENT ON COLUMN REPO.REPO_NO IS '�������丮 ��ȣ';
COMMENT ON COLUMN REPO.REPO_TITLE IS '�������丮 �̸�';
COMMENT ON COLUMN REPO.REPO_CONTENT IS '�������丮 ����';
COMMENT ON COLUMN REPO.REPO_STATUS IS '�������丮 ��������';
COMMENT ON COLUMN REPO.CREATE_DATE IS '�������丮 ������';
COMMENT ON COLUMN REPO.STATUS IS '�������丮 ��������';
COMMENT ON COLUMN REPO.REF_PNO IS '���� ������Ʈ ��ȣ';

-- �������丮 ���� ������ 5��
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_HTML', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_JSP', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEST', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, 3);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_TEMPLATE', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO REPO (REPO_NO, REPO_TITLE, REPO_CONTENT, REPO_STATUS, CREATE_DATE, STATUS, REF_PNO) VALUES (SEQ_REPO.NEXTVAL, 'FINAL_REAL', '������ �����ӵ�', DEFAULT, DEFAULT, DEFAULT, 1);

----���Ͻ��� ���̺� ����--------------------------------
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

-- ���Ͻ��� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN MILESTONE.MIL_NO IS '���Ͻ��� ��ȣ';
COMMENT ON COLUMN MILESTONE.MIL_TITLE IS '���Ͻ��� ����';
COMMENT ON COLUMN MILESTONE.CREATE_DATE IS '���Ͻ��� ������';
COMMENT ON COLUMN MILESTONE.MODIFY_DATE IS '���Ͻ��� ������';
COMMENT ON COLUMN MILESTONE.END_DATE IS '�ֱ� ������';
COMMENT ON COLUMN MILESTONE.ISSUING IS '�������� �̽�';
COMMENT ON COLUMN MILESTONE.PROGRESS IS '��ô��';
COMMENT ON COLUMN MILESTONE.STATUS IS '���Ͻ��� ����';
COMMENT ON COLUMN MILESTONE.MEM_NO IS '���Ͻ��� �ۼ���';
COMMENT ON COLUMN MILESTONE.REPO_NO IS '�������丮 ��ȣ';

-- ���Ͻ��� INSERT��
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
     , '����1'
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
     , '����2'
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
     , '����3'
     , DEFAULT
     , NULL
     , NULL
     , DEFAULT
     , DEFAULT
     , DEFAULT
     , 1
     , 1
     );
     
----�̽� ���̺� ����--------------------------------
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

-- �̽� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN ISSUE.ISS_NO IS '�̽���ȣ';
COMMENT ON COLUMN ISSUE.ISS_TITLE IS '�̽�����';
COMMENT ON COLUMN ISSUE.ISS_CONTENT IS '�̽�����';
COMMENT ON COLUMN ISSUE.CREATE_DATE IS '�̽� ������';
COMMENT ON COLUMN ISSUE.MODIFY_DATE IS '�̽� ������';
COMMENT ON COLUMN ISSUE.END_DATE IS '�̽� ������';
COMMENT ON COLUMN ISSUE.ISS_ASSIGNEE IS '�̽� �Ҵ���� ���';
COMMENT ON COLUMN ISSUE.ISS_STATUS IS '�̽� �������(Y/N)';
COMMENT ON COLUMN ISSUE.STATUS IS '�̽�����(Y/N)';
COMMENT ON COLUMN ISSUE.MEM_NO IS '�̽� �ۼ���';
COMMENT ON COLUMN ISSUE.LAB_NAME IS '�̽��� ���� ��(,�� ����)';
COMMENT ON COLUMN ISSUE.MIL_NO IS '�̽��� ���� ���Ͻ���';
COMMENT ON COLUMN ISSUE.REPO_NO IS '�̽��� ���� �������丮 ��ȣ';

-- �̽� INSERT��
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
     , '����1'
     , '����1'
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
     , '����2'
     , '����2'
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
     , '����1'
     , '����1'
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
     
---- Ǯ���� ���̺� ---
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

-- Ǯ���� �ڸ�Ʈ
COMMENT ON COLUMN PULL_REQUEST.PULL_NO IS 'Ǯ���� ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.PULL_TITLE IS 'Ǯ���� ����';
COMMENT ON COLUMN PULL_REQUEST.PULL_CONTENT IS 'Ǯ���� ����';
COMMENT ON COLUMN PULL_REQUEST.PULL_WRITER IS 'Ǯ���� �ۼ���';
COMMENT ON COLUMN PULL_REQUEST.PULL_MANAGER IS 'Ǯ���� �����';
COMMENT ON COLUMN PULL_REQUEST.REPO_NO IS '�������丮 ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.ISS_NO IS '�̽� ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.MIL_NO IS '���Ͻ��� ��ȣ';
COMMENT ON COLUMN PULL_REQUEST.STATUS IS '����(M:����,C:������,N:����)';

-- Ǯ���� ���õ�����
INSERT INTO 
            PULL_REQUEST
     VALUES 
     (
       SEQ_PREQ.NEXTVAL
     , 'Ǯ�����޾ƶ�!'
     , 'Ǯ���� Ȯ���غ�����?'
     , 1
     , 'ȣ����,���ո�'
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
     , 'Ǯ�����޾ƶ�1!'
     , 'Ǯ���� Ȯ���غ�����1?'
     , 2
     , 'ȣ����,���ո�'
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
     , 'Ǯ�����޾ƶ�3!'
     , 'Ǯ���� Ȯ���غ�����3?'
     , 2
     , 'ȣ����,���ո�'
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
     , 'Ǯ�����޾ƶ�4!'
     , 'Ǯ���� Ȯ���غ�����4?'
     , 2
     , 'ȣ����,���ո�'
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
     , 'Ǯ�����޾ƶ�5!'
     , 'Ǯ���� Ȯ���غ�����5?'
     , 2
     , 'ȣ����,���ո�'
     , 2
     , 2
     , 2
     , DEFAULT
     );    
     
-- Ǯ������Ʈ ���� ���̺� ����
CREATE TABLE PULL_REVIEW(
    PULL_REVIEW_NO NUMBER PRIMARY KEY,
    REF_PULL NUMBER REFERENCES PULL_REQUEST,
    MEM_NO NUMBER REFERENCES MEMBER,
    PULL_REVIEW_CONTENT VARCHAR2(1000),
    CREATE_DATE DATE DEFAULT SYSDATE
);

-- Ǯ������Ʈ ���� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_NO IS 'Ǯ������Ʈ ���� ��ȣ';
COMMENT ON COLUMN PULL_REVIEW.REF_PULL IS '������ Ǯ������Ʈ ��ȣ';
COMMENT ON COLUMN PULL_REVIEW.MEM_NO IS '�ۼ��� ȸ�� ��ȣ';
COMMENT ON COLUMN PULL_REVIEW.PULL_REVIEW_CONTENT IS '���� ����';
COMMENT ON COLUMN PULL_REVIEW.CREATE_DATE IS '�ۼ���';

-- Ǯ������Ʈ ���� ���̺� ���õ�����
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 1, 1, '�̻�', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 2, 3, '����', DEFAULT);
INSERT INTO PULL_REVIEW (PULL_REVIEW_NO, REF_PULL, MEM_NO, PULL_REVIEW_CONTENT, CREATE_DATE) VALUES (SEQ_REV.NEXTVAL, 3, 2, 'ȫ�繫', DEFAULT);

-- �˸� ���̺�
CREATE TABLE NOTICE(
    NOTI_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50) NOT NULL,
    NOTI_CONTENT VARCHAR2(1000) NOT NULL,
    OCU_TIME DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y','N')),
    MEM_NO NUMBER REFERENCES MEMBER
);

-- �˸� ���̺� �ڸ�Ʈ
COMMENT ON COLUMN NOTICE.NOTI_NO IS '�˸���ȣ';
COMMENT ON COLUMN NOTICE.CATEGORY_NAME IS 'ī�װ���';
COMMENT ON COLUMN NOTICE.NOTI_CONTENT IS '�˸�����';
COMMENT ON COLUMN NOTICE.OCU_TIME IS '�˸��߻��ð�';
COMMENT ON COLUMN NOTICE.STATUS IS '�˸�����';
COMMENT ON COLUMN NOTICE.MEM_NO IS 'ȸ����ȣ';

-- �˸� ���̺� ���õ�����
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NOTI.NEXTVAL, '�̽�', '00_java-workspace�� ���ο� �̽��� �߻��߽��ϴ�.', DEFAULT, DEFAULT, 2);
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NOTI.NEXTVAL, 'ģ��', 'USER03 ���� ģ����û�� �����ϼ̽��ϴ�.', DEFAULT, DEFAULT, 3);
INSERT INTO NOTICE (NOTI_NO, CATEGORY_NAME, NOTI_CONTENT, OCU_TIME, STATUS, MEM_NO) VALUES (SEQ_NOTI.NEXTVAL, '����ȫ��', 'USER02 ���� ������ �ڱ�PR�� ���ƿ並 �������ϴ�.', DEFAULT, DEFAULT, 1);

-- Ŀ�� ���̺� ����
CREATE TABLE PRO_COMMIT(
    COMM_NO NUMBER CONSTRAINT PRO_COMMIT_PK PRIMARY KEY,
    COMM_WRITER NUMBER CONSTRAINT COMM_WRITER_FK REFERENCES MEMBER ON DELETE CASCADE,
    COMM_DATE DATE DEFAULT SYSDATE,
    COMM_MSG VARCHAR2(1000) NOT NULL,
    REPO_NO NUMBER CONSTRAINT REPO_NO_FK REFERENCES REPO ON DELETE CASCADE
);

-- Ŀ�� �ڸ�Ʈ �ۼ�
COMMENT ON COLUMN PRO_COMMIT.COMM_NO IS 'Ŀ�� ��ȣ';
COMMENT ON COLUMN PRO_COMMIT.COMM_WRITER IS 'Ŀ�� �ۼ���';
COMMENT ON COLUMN PRO_COMMIT.COMM_DATE IS 'Ŀ�� ��¥';
COMMENT ON COLUMN PRO_COMMIT.COMM_MSG IS 'Ŀ�� �޼���';
COMMENT ON COLUMN PRO_COMMIT.REPO_NO IS '�������丮 ��ȣ';

-- Ŀ�� ���� ������ 5��
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '�α��� ��� ����', 1);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '���ƿ� ��� ���� ����', 2);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '�������丮 ��� ��� �߰�', 3);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '�Ű� ��� ����', 4);
INSERT INTO PRO_COMMIT (COMM_NO, COMM_WRITER, COMM_DATE, COMM_MSG, REPO_NO) VALUES (SEQ_COMM.NEXTVAL, 1, DEFAULT, '���������� ��� �ڵ� ����', 5);



--- �ϸ�ũ ���̺� 
CREATE TABLE BOOKMARK(
    MEM_NO NUMBER REFERENCES MEMBER,
    PRO_NO NUMBER REFERENCES PROJECT,
    PRIMARY KEY(MEM_NO, PRO_NO)
    
);

COMMENT ON COLUMN BOOKMARK.MEM_NO IS '�ϸ�ũ ȸ����ȣ';
COMMENT ON COLUMN BOOKMARK.PRO_NO IS '�ϸ�ũ �Խ��� ��ȣ';

-- ��� ���̺�
CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    MEM_NO NUMBER REFERENCES MEMBER(MEM_NO) NOT NULL,
    REP_CONTENT VARCHAR2(4000) NOT NULL,
    REF_PRO NUMBER NOT NULL,
    REP_DATE DATE NOT NULL,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '��� ��ȣ';
COMMENT ON COLUMN REPLY.MEM_NO IS '��� �ۼ���';           
COMMENT ON COLUMN REPLY.REP_CONTENT IS '��� ����';
COMMENT ON COLUMN REPLY.REF_PRO IS '���� �Խù�';   
COMMENT ON COLUMN REPLY.REP_DATE IS '��� �ۼ���';     
COMMENT ON COLUMN REPLY.STATUS IS '��� ��������';     

INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_REP.NEXTVAL
     , 1
     , '���� �����ϰ� �;��'
     , 1
     , SYSDATE
     , DEFAULT
     );
    
    
INSERT INTO 
            REPLY
     VALUES
     (
       SEQ_REP.NEXTVAL
     , 2
     , '������ �Ǿ�!! ������ ���� �ѹ� �����غ������ϴ�.'
     , 1
     , SYSDATE
     , DEFAULT
     );
     


COMMIT;