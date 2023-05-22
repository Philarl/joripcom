/*
작성자 : 박기동
편집일 : 2019-03-06
프로젝트명 : 쇼핑몰
*/
DROP TABLE MBSP_TBL CASCADE CONSTRAINTS;

--1.회원가입 테이블
CREATE TABLE MBSP_TBL(
        MBSP_ID             VARCHAR2(15)            CONSTRAINT PK_MBSP_ID PRIMARY KEY,
        MBSP_NAME           VARCHAR2(30)            NOT NULL,
        MBSP_EMAIL          VARCHAR2(50)            NOT NULL,
        MBSP_PASSWORD       CHAR(60)                NOT NULL,   -- 비밀번호 암호화 처리
        MBSP_ZIPCODE        CHAR(5)                 NOT NULL,
        MBSP_ADDR           VARCHAR2(50)            NOT NULL,
        MBSP_DEADDR         VARCHAR2(50)            NOT NULL,
        MBSP_PHONE          VARCHAR2(15)            NOT NULL,
        MBSP_NICK           VARCHAR2(20)            NOT NULL UNIQUE,
        MBSP_RECEIVE        CHAR(1) DEFAULT 'Y'                 NOT NULL,
        MBSP_POINT          NUMBER DEFAULT 0        NOT NULL,
        MBSP_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_LASTLOGIN      DATE DEFAULT SYSDATE    NOT NULL
);
SELECT * FROM MBSP_TBL;
DELETE FROM MBSP_TBL;

-- 회원기능

--1)회원가입
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user01','홍길동','user01@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무1','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user02','이승엽','user02@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무2','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user03','손흥민','user03@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무3','N');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user04','이정후','user04@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무4','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user05','박찬호','user05@abc.co.kr','1111','55555','서울시 종로구 창신동','그린아파트 100동100호','010-5555-5555','냉무5','N');   

COMMIT;

--2)아이디 중복체크
-- 데이타 존재 할 경우
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user01'; -- 아이디 사용불가능
-- 데이타 존재 안 할 경우
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user06'; -- 아이디 사용가능

--3)회원수정
--3.1)비밀번호확인
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.2) 회원정보 수정페이지
SELECT MBSP_ID, MBSP_NAME, MBSP_PASSWORD, MBSP_ZIPCODE, MBSP_ADDR, MBSP_DEADDR, MBSP_PHONE, MBSP_NICK, MBSP_RECEIVE, MBSP_POINT, MBSP_DATESUB, MBSP_UPDATEDATE, MBSP_LASTLOGIN
FROM MBSP_TBL
WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.3) 회원정보 수정하기
UPDATE MBSP_TBL
    SET MBSP_PASSWORD = ?, MBSP_ZIPCODE = ?, MBSP_ADDR = ?, MBSP_DEADDR = ?, MBSP_PHONE = ?, MBSP_RECEIVE = ?
WHERE MBSP_ID = ?;

--4) 회원정보 삭제하기
--4.1) 비밀번호 확인
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--4.2) 삭제하기
DELETE FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--5)아이디및비밀번호찾기
--5.1)아이디 찾기(메일 전송)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_NAME = '손흥민' AND MBSP_EMAIL = 'user03@abc.co.kr';
--5.2)비밀번호 찾기(메일 전송)
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = 'user03' AND MBSP_EMAIL = 'user03@abc.co.kr';


--6)로그인 기능(비밀번호가 암호화 처리 된 경우에는 문제 발생)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--비밀벟노 암호화 된 경우
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = ?;

--비번 컬럼명의 암호화 된 데이터를 읽어와서, 비교하는 메소드를 통하여 작업하게 된다.

--2.카테고리 테이블
-- 카테고리 계층
-- 2차 카테고리 - 참조코드(<- 1차 카테고리 코드)
CREATE TABLE CATEGORY_TBL(
        CAT_CODE            VARCHAR2(20)    PRIMARY KEY,
        CAT_PRTCODE         VARCHAR2(20)    NULL,
        CAT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CAT_PRTCODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);

-- / -> /

-- 1차 카테고리 : TOP(1) PANTS(2) SHIRTS(3) OUTER(4) SHOES(5) BAG(6) ACC(7)
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('1',NULL,'TOP');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('2',NULL,'PANTS');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('3',NULL,'SHIRTS');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('4',NULL,'OUTER');        
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('5',NULL,'SHOES');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('6',NULL,'BAG');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('7',NULL,'ACC');    

-- 1차카테고리 TOP : '1'
-- 2차 카테고리 : 긴팔티 니트 맨투맨/후드티 프린팅티 나시 반팔티/7부티
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('8','1','긴팔티');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('9','1','니트');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('10','1','맨투맨/후드티');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('11','1','프린팅티');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('12','1','나시');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('13','1','반팔티/7부티');

-- 1차카테고리 PANTS : '2'
-- 2차카테고리 : 밴딩팬츠 청바지 슬랙스 면바지 반바지
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('14','2','밴딩팬츠');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('15','2','청바지');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('16','2','슬랙스');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('17','2','면바지');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('18','2','반바지');
    
-- 1차카테고리 SHIRTS : '3'
-- 2차카테고리 : 헨리넥/차이나 베이직 체크/패턴 청남방 스트라이프 

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('19','3','헨리넥/차이나');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('20','3','베이직');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('21','3','체크/패턴');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('22','3','청남방');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('23','3','스트라이프'); 
    
    
-- 1차카테고리 OUTER : '4'
-- 2차카테고리 : 패딩 코트 수트/블레이져 자켓 블루종/MA-1 가디건/조끼 후드/집업

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('24','4','패딩');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('25','4','코트');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('26','4','수트/블레이져');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('27','4','자켓');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('28','4','블루종/MA-1');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('29','4','가디건/조끼');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('30','4','후드/집업');  
    
-- 1차카테고리 SHOES : '5'
-- 2차카테고리 : 스니커즈 로퍼/구두 키높이신발/깔창 슬리퍼/쪼리/샌들
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('31','5','스니커즈');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('32','5','로퍼/구두');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('33','5','키높이신발/깔창');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('34','5','슬리퍼/쪼리/샌들');
   
-- 1차카테고리 BAG : '6'
-- 2차카테고리 : 백팩 토트/숄더백 크로스백 클러치
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('35','6','백팩'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('36','6','토트/숄더백');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('37','6','크로스백');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('38','6','클러치');    
-- 1차카테고리 ACC : '7'
-- 2차카테고리 : 양말/넥타이 모자 머플러/장갑 아이웨어 벨트/시계 기타
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('39','7','양말/넥타이');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('40','7','모자');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('41','7','머플러/장갑');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('42','7','아이웨어');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('43','7','벨트/시계');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('44','7','기타');
    

SELECT * FROM category_tbl;
COMMIT;
ROLLBACK;

-- 0으로 시작하는 숫자 테이블을 만들고 싶을땐 number로 하면 안되고 varchar2로 해야됨
SELECT 055 FROM DUAL;
SELECT '055' FROM DUAL;

SELECT * FROM category_tbl WHERE cat_prtcode = 1;

SELECT * FROM category_tbl WHERE cat_prtcode IS NOT NULL;
    
--3.상품정보 테이블
DROP TABLE PRODUCT_TBL;

/*
데이타가 존재한다는 전제조건에서
테이블의 컬럼이 
    NOT NULL -> NUL 로 변경 가능
    NULL -> NOT NULL 로 변경 불가능

*/
-- CLOB : 내용 4000BYTE 초과 여부 판단
CREATE TABLE PRODUCT_TBL(
        PRO_NUM             NUMBER                  PRIMARY KEY,
        CAT_CODE            VARCHAR2(20)            NULL,
        PRO_NAME            VARCHAR2(50)            NOT NULL,
        PRO_PRICE           NUMBER                  NOT NULL,
        PRO_DISCOUNT        NUMBER                  NOT NULL,
        PRO_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PRO_CONTENT         CLOB                    NOT NULL,
        PRO_UP_FOLDER       VARCHAR2(50)            NOT NULL,
        PRO_IMG             VARCHAR(50)             NOT NULL,
        PRO_AMOUNT          NUMBER                  NOT NULL,
        PRO_BUY             CHAR(1)                 NOT NULL,
        PRO_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PRO_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);
DROP TABLE PRODUCT_TBL CASCADE CONSTRAINTS;

-- 상품등록작업
-- 1차카테고리 : TOP (코드 : 1)
-- 2차카테고리 : 긴팔티(코드 : 8)
-- 날짜 등에 \ 사용 (폴더 경로와 같은 구조)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (1,'8','A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (2,'8','A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (3,'8','A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (4,'8','A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (5,'8','A',10000,0.1,'동아','어쩌구저쩌구','\2023\04\06','abc.gif',10,'Y');

-- 2차카테고리 : 니트(코드 : 9)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (6,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (7,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (8,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (9,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (10,'9','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 2차카테고리 : 맨투맨&후드티(코드 : 10)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (11,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (12,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (13,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (14,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (15,'10','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 2차카테고리 : 프린팅티(코드 : 11)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (16,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (17,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (18,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (19,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (20,'11','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');


-- 2차카테고리 : 나시(코드 : 12)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (21,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (22,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (23,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (24,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (25,'12','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 2차카테고리 : 반팔티&7부티(코드 : 13)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (26,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (27,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (28,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (29,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (30,'13','A',10000,0.1,'동아','어쩌구저쩌구','abc.gif',10,'Y');

-- 상품테이블 리스트
SELECT * FROM product_tbl;

UPDATE product_tbl
    SET CAT_CODE = 8
WHERE PRO_NUM = 1;

COMMIT;

-- category_tbl(카테고리) CAT_CODE 컬럼에 8 데이타를 삭제

DELETE FROM category_tbl
WHERE CAT_CODE = 8;


/*********************************************************************
- 상품보기


**********************************************************************/
-- 1차카테고리 출력
SELECT * FROM category_tbl WHERE CAT_PRTCODE IS NULL;

-- 1차선택(TOP : 1)에 해당하는 2차카테고리 출력
SELECT * FROM category_tbl WHERE CAT_PRTCODE = 1;

-- 상품리스트 출력
SELECT * FROM product_tbl WHERE CAT_CODE = ?;

-- 1차카테고리 선택(TOP : 코드 1) : 상품리스트 출력
-- 1차카테고리 TOP 의 2차카테고리 코드를 조회하자.
-- 즉, TOP(1)를 1차카테고리로 가지고 있는 2차카테고리
SELECT CAT_CODE FROM category_tbl
WHERE CAT_PRTCODE = 1 ;

SELECT * FROM product_tbl
WHERE CAT_CODE IN (
                    SELECT CAT_CODE FROM category_tbl
                        WHERE CAT_PRTCODE = 1
                    );

-- 2차카테고리 긴팔티(코드 : 8) 에 해당하는 상품리스트 조회하라.
SELECT * FROM product_tbl WHERE CAT_CODE = 8;


-- 상품상세설명
/*
상품리스트에서 상품 하나를 선택하였을 때 나오는 페이지

*/
SELECT * FROM product_tbl WHERE PRO_NUM = 1;

-- 선택상품삭제
DELETE product_tbl
WHERE pro_num in (4, 2);

-- 선택상품수정
DECLARE
BEGIN
UPDATE product_tbl
SET pro_price = 10000, pro_buy = 'Y'
WHERE pro_num = 4;
UPDATE product_tbl
SET pro_price = 50000, pro_buy = 'N'
WHERE pro_num = 2;
END;

ALTER TABLE MBSP_TBL ADD CONSTRAINT PRIMARY KEY(MBSP_ID);

DROP TABLE CART_TBL;
--4.장바구니 테이블
CREATE TABLE CART_TBL(
        CART_CODE        NUMBER,
        PRO_NUM         NUMBER          NOT NULL,
        MBSP_ID         VARCHAR2(15)    NOT NULL,
        CART_AMOUNT      NUMBER          NOT NULL,
        FOREIGN KEY(PRO_NUM) REFERENCES PRODUCT_TBL(PRO_NUM),
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID),
        CONSTRAINT PK_CART_CODE PRIMARY KEY(CART_CODE)
);

CREATE SEQUENCE SEQ_CART_CODE;
--장바구니에 로그인 사용자가 상품을 추가시, 존재할 경우는 수량변경, 존재하지않는 경우는 상품추가

merge into cart_tbl
using dual
on (mbsp_id = 'id값' and pro_num = '상품코드')
when matched then
    update
        set cart_amount = cart_amount + 수량
when not matched then
    insert cart_code, pro_num, mbsp_id, cart_amount
    values (?, ?, ?, ?);

MERGE
    INTO CART_TBL C
USING DUAL
    ON (C.MBSP_ID = ?) AND (C.PRO_NUM = ?)
WHEN MATCHED THEN
    UPDATE
        SET C.CAT_AMOUNT = C.CAT_AMOUNT + ?
WHEN NOT MATCHED THEN
    INSERT (C.CAT_CODE, C.PRO_NUM, C.MBSP_ID, C.CAT_AMOUNT)
    VALUES (?, ?, ?, ?);


INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (1,1,'user01', 2 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (2,5,'user01', 3 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (3,7,'user01', 5 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (4,12,'user02', 1 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (5,30,'user02', 2 );

SELECT * FROM cart_tbl;
COMMIT;

/*
주문하기
 
*/
-- 장바구니 리스트 조회
SELECT rownum, P.pro_up_folder, P.pro_img, P.pro_name, P.pro_price, P.pro_price * C.cart_amount as price
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- 전체금액 : 100000
SELECT SUM(P.pro_price * C.cat_amount) as totalprice
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- 장바구니에서 수량변경
-- 수량을 직접변경
UPDATE cart_tbl
    SET CAT_AMOUNT = 10
WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;
-- 유의!!!!(수량을 누적)
UPDATE cart_tbl
    SET CAT_AMOUNT = CAT_AMOUNT + 10
WHERE CAT_CODE = 1;

-- 장바구니 상품삭제 ( CAT_CODE : 장바구니코드 )
DELETE FROM cart_tbl WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;

-- 장바구니 비우기 : 로그인 한 사용자 데이타만 삭제해야 한다.(주의)
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';

--5.주문내용 테이블
CREATE TABLE ORDER_TBL(
        ORD_CODE            NUMBER                  PRIMARY KEY,
        MBSP_ID             VARCHAR2(15)            NOT NULL,
        ORD_NAME            VARCHAR2(30)            NOT NULL,
        ORD_ADDR_NUM        CHAR(5)                 NOT NULL,
        ORD_ADDR_BASIC      VARCHAR2(50)            NOT NULL,
        ORD_ADDR_DETAIL     VARCHAR2(50)            NOT NULL,
        ORD_TEL             VARCHAR2(20)            NOT NULL,
        ORD_PRICE           NUMBER                  NOT NULL,
        ORD_REGDATE         DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);

--6.주문상세 테이블
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TBL(ORD_CODE),
        PRO_NUM         NUMBER      NOT NULL REFERENCES PRODUCT_TBL(PRO_NUM),
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,  -- 역정규화
        PRIMARY KEY (ORD_CODE ,PRO_NUM) 
);
/*

장바구니 -> 주문하기 클릭 후 -> 주문정보 페이지

*/
-- 주문정보 페이지 구성

-- 주문자 정보 내역
SELECT  *
FROM mbsp_tbl
WHERE mbsp_id = 'user01';



/*
트랜잭션(예외처리포함)기능을 적용해야 되는경우?
하나의 기능에 복수의 작업을 할 경우(INSERT, UPDATE, DELETE, MERGE 등)
*/


/*
주문정보를 입력 후 주문하기 진행을 할 경우 세부적인 작업이 동시에 이루어진다.

트랜잭션(예외처리포함)기능을 적용해야한다.
- 주문정보 입력(주문테이블, 주문상세태이블)
- 포인트 변경
- 장바구니 삭제
- 결제

*/

SELECT ORD_CODE, SUM(DT_AMOUNT * DT_PRICE) FROM ORDETAIL_TBL WHERE ORD_CODE = ?;
-- 주문정보 입력
--장바구니 내역참조
SELECT * FROM cart_tbl WHERE mbsp_id = 'user01';

--1)주문테이블 
INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
VALUES (1,'user01','홍길동','10050','전라북도 고창','성삼면 100리','010-555-5555',20000);

--2)주문상세테이블

INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 5, 3, 1000);
INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 7, 5, 1000);

--3)장바구니테이블
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';

--4) 포인트 사용
UPDATE mbsp_tbl
SET mbsp_point = mbsp_point - 50    -- 50 포인트 값
WHERE mbsp_id = 'user01';

COMMIT;

-- 주문내역 조회 리스트

SELECT * FROM ORDER_TBL;
SELECT * FROM ORDETAIL_TBL;

-- 상품, 주문, 주문상세 조인을 이용한 주문내역조회
SELECT rownum, OD.ORD_REGDATE, P.PRO_NAME , OT.DT_AMOUNT * OT.DT_PRICE  as SALEPRICE
FROM ORDER_TBL od   INNER JOIN ORDETAIL_TBL ot
ON od.ord_code = ot.ord_code
INNER JOIN PRODUCT_TBL p
ON OT.PRO_NUM = P.PRO_NUM
WHERE od.mbsp_id = 'user01';


-- 위의 4가지 작업을 프로시저로 구성(트랜잭션 적용)
CREATE OR REPLACE PROCEDURE UDP_ORDERINFO_PROCESS
(
    p_ord_code          IN    order_tbl.ord_code%TYPE,
    p_mbsp_id           IN    mbsp_tbl.mbsp_id%TYPE,
    p_ord_name          IN    order_tbl.ord_name%TYPE,
    p_ord_addr_num      IN    order_tbl.ord_addr_num%TYPE,
    p_ord_addr_basic    IN    order_tbl.addr_basic%TYPE,
    p_ord_addr_detail   IN    order_tbl.ord_addr_detail%TYPE,
    p_ord_tel           IN    order_tbl.ord_tel%TYPE,
    p_ord_price         IN    order_tbl.ord_price%TYPE,
    
    
    /*
    아래 3개의 매개변수는 장바구니의 상품개수만큼 데이타가 존재해야 한다.
    예) 장바구니 데이타 3개 인 경우 매개변수의 값도 3개의 내용을 가져야 한다.
    */
    p_pro_num           IN    ,
    p_dt_amount         IN      ,
    p_dt_price          IN      ,
    
    
    
    p_mbsp_point        IN     mbsp_tbl.mbsp_point%TYPE 
)
IS

BEGIN
    --1)주문테이블 입력
    INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
        VALUES (1,p_mbsp_id,'홍길동','10050','전라북도 고창','성삼면 100리','010-555-5555',20000);
    --2)주문상세테이블 입력   
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 5, 3, 1000);
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 7, 5, 1000);
    
    --3)장바구니테이블 삭제
    DELETE FROM cart_tbl WHERE mbsp_id = 'user01';
    
    --4)회원테이블 포인트 변경
    UPDATE mbsp_tbl
        SET mbsp_point = mbsp_point - 50    -- 50 포인트 값
    WHERE mbsp_id = 'user01';

    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
END;


--7.리뷰 테이블
CREATE TABLE REVIEW_TBL(
        REW_NUM         NUMBER                      PRIMARY KEY,
        MBSP_ID         VARCHAR2(15)                NOT NULL,
        PRO_NUM         NUMBER                      NOT NULL,
        REW_CONTENT     VARCHAR2(200)               NOT NULL,
        REW_SCORE       NUMBER                      NOT NULL,
        REW_REGDATE     DATE DEFAULT SYSDATE        NOT NULL,
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID),
        FOREIGN KEY(PRO_NUM) REFERENCES PRODUCT_TBL(PRO_NUM)
);

--상품후기 입력
SELECT * FROM ORDETAIL_TBL;

INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (1, 'user01',5,'무난하다.', 4 );
INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (2, 'user01',7,'아주 좋다.', 5 );
    
    
COMMIT;    
SELECT * FROM  review_tbl; 

-- 상품상세설명(앞부분)/ 상품후기(뒷부분)

SELECT * FROM PRODUCT_TBL WHERE PRO_NUM = 5;

SELECT * FROM review_tbl WHERE PRO_NUM = 5;


--8.게시판 테이블
DROP TABLE BOARD_TBL;
CREATE TABLE BOARD_TBL(
        BRD_NUM         NUMBER CONSTRAINTS PK_BOARD_BRD_NUM PRIMARY KEY,
        MBSP_ID         VARCHAR2(15)            NOT NULL,
        BRD_TITLE       VARCHAR2(100)           NOT NULL,
        BRD_CONTENT     VARCHAR2(4000)          NOT NULL,
        BRD_REGDATE     DATE DEFAULT SYSDATE    NOT NULL
        -- FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);

--9.관리자(ADMIN) 테이블
CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(15)   PRIMARY KEY,
    ADMIN_PW    CHAR(60)       NOT NULL,
    ADMIN_VISIT_DATE    DATE
);

-- 인덱스 힌트 문법설명
-- BOARD_TBL 게시판테이블 더미데이터 작업
DROP SEQUENCE BOARD_NUM_SEQ;
CREATE SEQUENCE BOARD_NUM_SEQ;

INSERT INTO BOARD_TBL (BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
VALUES (BOARD_NUM_SEQ.NEXTVAL, 'USER01', '제목1', '내용1', SYSDATE);

INSERT INTO BOARD_TBL (BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
SELECT BOARD_NUM_SEQ.NEXTVAL, MBSP_ID, BRD_TITLE, BRD_CONTENT, SYSDATE FROM BOARD_TBL;

COMMIT;

SELECT * FROM BOARD_TBL ORDER BY BRD_NUM DESC;

/*
인덱스 힌트 명령어
INDEX : 오름차순. INDEX_ASC
INDEX_DESC : 내림차순
*/

SELECT /*+INDEX_DESC(b PK_BOARD_BRD_NUM) */
    BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM
    BOARD_TBL b;

-- 페이징쿼리 설명
-- 키워드 rownum 사용
SELECT * FROM BOARD_TBL WHERE ROWNUM <= 10 ORDER BY BRD_NUM DESC;

SELECT * FROM BOARD_TBL;

-- 위의 동작원리 떄문에 인라인 뷰를 사용
SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM ( -- 인라인 뷰로 인하여, ROWNUM에 의한 RN별칭컬럼명이 바깥쪽 쿼리입장에서는 물리적인 데이타로 보게된다.
    SELECT /*+INDEX_DESC(b PK_BOARD_BRD_NUM)*/
    ROWNUM RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
    FROM BOARD_TBL b
)
WHERE RN >=1 AND RN <=3;

SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM (
    SELECT /*+INDEX_DESC(b PK_BOARD_BRD_NUM)*/
    ROWNUM RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
    FROM BOARD_TBL b
)
WHERE RN >=4 AND RN <=6;


-- Foreign key (참조키)
DROP TABLE PARENT_DEMO;
CREATE TABLE PARENT_DEMO
(
    P_IDX       NUMBER          PRIMARY KEY,
    P_NAME      VARCHAR2(10)    NOT NULL
);

INSERT INTO PARENT_DEMO(P_IDX, P_NAME)
            VALUES(1, 'A');
INSERT INTO PARENT_DEMO(P_IDX, P_NAME)
            VALUES(2, 'B');
INSERT INTO PARENT_DEMO(P_IDX, P_NAME)
            VALUES(3, 'C');            

DROP TABLE CHILD_DEMO;
-- 제약조건을 적용하는 유형
--1)컬럼수준 제약
CREATE TABLE CHILD_DEMO
(
    C_IDX       NUMBER          PRIMARY KEY,
    C_NAME      VARCHAR2(10)    NOT NULL,
    P_IDX       NUMBER          NOT NULL REFERENCES PARENT_DEMO(P_IDX)
);

SELECT * FROM PARENT_DEMO;
INSERT INTO CHILD_DEMO(C_IDX, C_NAME, P_IDX)
            VALUES(1, '테스트',1 );
            
INSERT INTO CHILD_DEMO(C_IDX, C_NAME, P_IDX)
            VALUES(1, '테스트',4 );    -- 무결성 에러        

--2)테이블수준 제약
CREATE TABLE CHILD_DEMO
(
    C_IDX       NUMBER          PRIMARY KEY,
    C_NAME      VARCHAR2(10)    NOT NULL,
    P_IDX       NUMBER          NULL,
    FOREIGN KEY(P_IDX) REFERENCES PARENT_DEMO(P_IDX)
    ON DELETE SET NULL
);

-- 참조키가 설정되었을 경우에는
/*
1)부모테이블을 삭제 할려면, 자식테이블을 먼저 삭제해야 한다.(부모테이블 먼저 삭제 안됨)
2)부모테이블의 데이타를 삭제할려면, 자식테이블에서 참조하고 있는 데이타를 먼저 삭제해야 함.

-- FOREIGN KEY 설정시 옵션 명령어
-- ON  DELETE CASCADE , ON  DELETE SET NULL
1)ON  DELETE CASCADE : 부모테이블의 데이타를 삭제하면, 자식테이블도 데이타가 자동 삭제
2)ON  DELETE SET NULL : 부모테이블의 데이타를 삭제하면, 자식테이블에서는 데이타를  NULL 로 처리
*/



-- 자식테이블에서 1을 사용중이므로, 부모테이블서 1을 삭제 못함.
DELETE FROM PARENT_DEMO
WHERE P_IDX = 1;

-- 자식테이블에서 2를 사용하지 않으므로, 부모테이블서 2를 삭제 가능.
DELETE FROM PARENT_DEMO
WHERE P_IDX = 2;

SELECT * FROM PARENT_DEMO;
SELECT * FROM CHILD_DEMO;

-- ON DELETE CASCADE 옵션 설정된 상태에서는 부모 데이타가 참조되어도 삭제가 됨
-- 자식데이타도 삭제가 자동으로 됨
DELETE FROM PARENT_DEMO
WHERE P_IDX = 1;

-- ON DELETE SET NULL 옵션 설정된 상태에서는 부모 데이타가 참조되어도 삭제가 됨
-- 자식데이타는 NULL 로 변경. (주의: 컬럼이 NULL 로 되어야 한다.)
DELETE FROM PARENT_DEMO
WHERE P_IDX = 1;
























