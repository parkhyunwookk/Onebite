--시퀀스----
CREATE SEQUENCE SC_BD_IDX;  --게시판

CREATE SEQUENCE SC_EVENT_IDX; --이벤트

CREATE SEQUENCE SC_NOTICE_IDX; --공지사항

CREATE SEQUENCE SC_CART_IDX; --장바구니

CREATE SEQUENCE SC_RCP_IDX; --레시피

-- 레시피 등록
INSERT INTO TB_RECIPE(RCP_IDX ,TITLE ,RCP_CNT, PRICE) 
VALUES(SC_RCP_IDX.NEXTVAL,'소금,후추그라인더 4종',10,20000);
INSERT INTO TB_RECIPE(RCP_IDX ,TITLE ,RCP_CNT, PRICE) 
VALUES(SC_RCP_IDX.NEXTVAL,'한우 채끝 스테이크 250g(냉장)',10,55000);

-- 데이터 삭제 기능 
DELETE FROM TB_RECIPE WHERE rcp_idx = 1;

COMMIT;

CREATE  TABLE "TB_MEMBER"(
   "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL ,
   "PASSWORD"   VARCHAR2(60 CHAR)      NOT NULL ,
    "USER_NAME"    VARCHAR2(10 CHAR)   NULL,
    "BIRTH"  DATE  DEFAULT NULL ,
    "TELL"   VARCHAR2(14 CHAR) NOT NULL, 
    "GRADE"   CHAR(4 CHAR)  DEFAULT  'SC00' NULL,
    "EMAIL" VARCHAR2(50 CHAR) NOT NULL,
    "GENDER"   CHAR(1 CHAR) NOT NULL,
    "IS_LEAVE"  NUMBER DEFAULT 0 NULL
);
COMMENT ON COLUMN "TB_MEMBER"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_MEMBER"."PASSWORD" IS '비밀번호';
COMMENT ON COLUMN "TB_MEMBER"."USER_NAME" IS '회원이름';
COMMENT ON COLUMN "TB_MEMBER"."BIRTH" IS '생년월일';
COMMENT ON COLUMN "TB_MEMBER"."TELL" IS '전화번호';
COMMENT ON COLUMN "TB_MEMBER"."GRADE" IS '회원등급';
COMMENT ON COLUMN "TB_MEMBER"."EMAIL" IS '이메일';
COMMENT ON COLUMN "TB_MEMBER"."GENDER" IS '성별';
COMMENT ON COLUMN "TB_MEMBER"."IS_LEAVE" IS '회원탈퇴여부';

---------------------------------------------------------------------------------------

CREATE TABLE "TB_BOARD" (
    "BD_IDX"   VARCHAR2(30 CHAR) NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "REG_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "TITLE"  VARCHAR2(50 CHAR) NULL,
    "CONTENT" VARCHAR2(2000 CHAR) NULL,
    "IS_DEL" NUMBER DEFAULT 0 NULL
);
COMMENT ON COLUMN "TB_BOARD"."BD_IDX" IS '게시글번호';
COMMENT ON COLUMN "TB_BOARD"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_BOARD"."REG_DATE" IS '등록일자';
COMMENT ON COLUMN "TB_BOARD"."TITLE" IS '제목';
COMMENT ON COLUMN "TB_BOARD"."CONTENT" IS '내용';
COMMENT ON COLUMN "TB_BOARD"."IS_DEL" IS '삭제여부';

------------------------------------------------------------------------------------------

CREATE TABLE "TB_CART"(
    "C_IDX" VARCHAR2(30 CHAR) DEFAULT 0 NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "ITEM_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "ITEM_NAME" VARCHAR2(30 CHAR)  NULL,
    "ITEM_CNT" NUMBER DEFAULT 0  NULL
);
COMMENT ON COLUMN "TB_CART"."C_IDX" IS '장바구니번호';
COMMENT ON COLUMN "TB_CART"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_CART"."ITEM_DATE" IS '물품등록일자';
COMMENT ON COLUMN "TB_CART"."ITEM_NAME" IS '물품명';
COMMENT ON COLUMN "TB_CART"."ITEM_CNT" IS '수량';

------------------------------------------------------------------------------------------

CREATE TABLE  "TB_NOTICE"(
    "BD_IDX"   VARCHAR2(30 CHAR) NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "GRADE"   CHAR(4 CHAR)  DEFAULT  'SC00' NULL,
    "NOTICE_REG_DATE" DATE DEFAULT SYSDATE NOT NULL,   --게시날짜
    "IS_DEL" NUMBER DEFAULT 0 NULL,
    "NOTICE_CONTENT" VARCHAR2(2000 CHAR) NULL
    
);
COMMENT ON COLUMN "TB_NOTICE"."BD_IDX" IS '게시글번호';
COMMENT ON COLUMN "TB_NOTICE"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_NOTICE"."GRADE" IS '회원등급';
COMMENT ON COLUMN "TB_NOTICE"."NOTICE_REG_DATE" IS '게시날짜';
COMMENT ON COLUMN "TB_NOTICE"."IS_DEL" IS '삭제여부';
COMMENT ON COLUMN "TB_NOTICE"."NOTICE_CONTENT" IS '공지내용';

------------------------------------------------------------------------------------------

CREATE TABLE "TB_SPRING"(
    "SPRING_EVENT_IDX"  VARCHAR2(30 CHAR) NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "SPRING_TITLE"  VARCHAR2(30 CHAR)  NULL,
    "START_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "END_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "SPRING_REG_DATE" DATE DEFAULT SYSDATE NOT NULL
);
COMMENT ON COLUMN "TB_SPRING"."SPRING_EVENT_IDX" IS '이벤트번호';
COMMENT ON COLUMN "TB_SPRING"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_SPRING"."SPRING_TITLE" IS '제목';
COMMENT ON COLUMN "TB_SPRING"."START_DATE" IS '시작날짜';
COMMENT ON COLUMN "TB_SPRING"."END_DATE" IS '종료날짜';
COMMENT ON COLUMN "TB_SPRING"."SPRING_REG_DATE" IS '등록날짜';
------------------------------------------------------------------------------------------

CREATE TABLE "TB_SUMMER"(
    "SUMMER_EVENT_IDX"  VARCHAR2(30 CHAR) NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "SUMMER_TITLE"  VARCHAR2(30 CHAR)  NULL,
    "START_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "END_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "SUMMER_REG_DATE" DATE DEFAULT SYSDATE NOT NULL
);

COMMENT ON COLUMN "TB_SUMMER"."SUMMER_EVENT_IDX" IS '이벤트번호';
COMMENT ON COLUMN "TB_SUMMER"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_SUMMER"."SUMMER_TITLE" IS '제목';
COMMENT ON COLUMN "TB_SUMMER"."START_DATE" IS '시작날짜';
COMMENT ON COLUMN "TB_SUMMER"."END_DATE" IS '종료날짜';
COMMENT ON COLUMN "TB_SUMMER"."SUMMER_REG_DATE" IS '등록날짜';
------------------------------------------------------------------------------------------

CREATE TABLE "TB_FALL"(
    "FALL_EVENT_IDX"  VARCHAR2(30 CHAR) NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "FALL_TITLE"  VARCHAR2(30 CHAR)  NULL,
    "START_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "END_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "FALL_REG_DATE" DATE DEFAULT SYSDATE NOT NULL
);
COMMENT ON COLUMN "TB_FALL"."FALL_EVENT_IDX" IS '이벤트번호';
COMMENT ON COLUMN "TB_FALL"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_FALL"."FALL_TITLE" IS '제목';
COMMENT ON COLUMN "TB_FALL"."START_DATE" IS '시작날짜';
COMMENT ON COLUMN "TB_FALL"."END_DATE" IS '종료날짜';
COMMENT ON COLUMN "TB_FALL"."FALL_REG_DATE" IS '등록날짜';
------------------------------------------------------------------------------------------

CREATE TABLE "TB_WINTER"(
    "WINTER_EVENT_IDX"  VARCHAR2(30 CHAR) NOT NULL,
    "USER_ID"   VARCHAR2(30 CHAR)  NOT NULL,
    "WINTER_TITLE"  VARCHAR2(30 CHAR)  NULL,
    "START_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "END_DATE" DATE DEFAULT SYSDATE NOT NULL,
    "WINTER_REG_DATE" DATE DEFAULT SYSDATE NOT NULL
);
COMMENT ON COLUMN "TB_WINTER"."WINTER_EVENT_IDX" IS '이벤트번호';
COMMENT ON COLUMN "TB_WINTER"."USER_ID" IS '회원아이디';
COMMENT ON COLUMN "TB_WINTER"."WINTER_TITLE" IS '제목';
COMMENT ON COLUMN "TB_WINTER"."START_DATE" IS '시작날짜';
COMMENT ON COLUMN "TB_WINTER"."END_DATE" IS '종료날짜';
COMMENT ON COLUMN "TB_WINTER"."WINTER_REG_DATE" IS '등록날짜';
-------------------------------------------------------------------------------------------

CREATE TABLE "TB_CODE" (
   "CODE"   VARCHAR2(4 CHAR)      NOT NULL, --회원코드
   "INFO"   VARCHAR2(300 CHAR)      NOT NULL   --코드 설명
);
COMMENT ON COLUMN "TB_CODE"."CODE" IS '회원코드';
COMMENT ON COLUMN "TB_CODE"."INFO" IS '코드정보';

-- 레시피 재료 테이블
CREATE TABLE "TB_RECIPE"(
    "RCP_IDX" VARCHAR2(30 CHAR) NOT NULL,
    "TITLE" VARCHAR2(30 CHAR) NOT NULL,
    "RCP_CNT" NUMBER DEFAULT 0 NULL,
    "PRICE" NUMBER DEFAULT 0 NULL
);

COMMENT ON COLUMN "TB_RECIPE"."RCP_IDX" IS '레시피번호';
COMMENT ON COLUMN "TB_RECIPE"."TITLE" IS '제목';
COMMENT ON COLUMN "TB_RECIPE"."RCP_CNT" IS '재고갯수';
COMMENT ON COLUMN "TB_RECIPE"."PRICE" IS '가격';


COMMIT;