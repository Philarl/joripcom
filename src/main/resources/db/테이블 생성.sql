/*
조립컴 프로젝트 테이블 생성 SQL
최종 수정일 : 2023-05-15
*/

-- 1. 회원 테이블
DROP TABLE U_TBL CASCADE CONSTRAINTS;
CREATE TABLE U_TBL(
    U_ID            VARCHAR2(20)            CONSTRAINT PK_U_ID PRIMARY KEY,
    U_NAME          VARCHAR2(30)            NOT NULL,
    U_PW            VARCHAR2(60)            NOT NULL,
    U_EMAIL         VARCHAR2(30) UNIQUE     NOT NULL,
    U_ZIPCODE       VARCHAR2(10)            NOT NULL,
    U_ADDR          VARCHAR2(100)           NOT NULL,
    U_ADDR_DTL      VARCHAR2(100)           NOT NULL,
    U_PHONE         VARCHAR2(15)            NOT NULL,
    U_NIC           VARCHAR2(20) UNIQUE     NOT NULL,
    CHECK_EMAIL_RX  CHAR(1) DEFAULT 'N'     NOT NULL,
    U_GRADE         CHAR(1) DEFAULT 0       NOT NULL,
    U_PTS           NUMBER DEFAULT 0        NOT NULL,
    JOIN_DATE       DATE DEFAULT SYSDATE    NOT NULL,
    MODIFY_DATE     DATE DEFAULT SYSDATE    NOT NULL,
    LAST_LOGIN_DATE DATE DEFAULT SYSDATE    NOT NULL
);

-- 2. 카테고리 테이블
DROP TABLE CATEG_TBL CASCADE CONSTRAINTS;
CREATE TABLE CATEG_TBL(
    CATEG_CD        NUMBER          CONSTRAINT PK_CATEG_CD PRIMARY KEY,
    PAR_CATEG_CD    NUMBER,
    CATEG_NAME      VARCHAR2(50)    NOT NULL
);
ALTER TABLE CATEG_TBL
ADD FOREIGN KEY(PAR_CATEG_CD) REFERENCES CATEG_TBL (CATEG_CD);

/* 1차 카테고리 정보 입력*/
INSERT INTO CATEG_TBL VALUES (1, NULL, '컴퓨터 부품');
INSERT INTO CATEG_TBL VALUES (2, NULL, '조립형 PC');
INSERT INTO CATEG_TBL VALUES (3, NULL, '키보드, 마우스, 저장장치');
INSERT INTO CATEG_TBL VALUES (4, NULL, '모니터');
INSERT INTO CATEG_TBL VALUES (5, NULL, '프린터 및 소모품');
INSERT INTO CATEG_TBL VALUES (6, NULL, '기타 액세서리');

/* 2차 카테고리 정보 입력*/
INSERT INTO CATEG_TBL VALUES (101, 1, 'CPU');
INSERT INTO CATEG_TBL VALUES (102, 1, '메인보드');
INSERT INTO CATEG_TBL VALUES (103, 1, '메모리');
INSERT INTO CATEG_TBL VALUES (104, 1, 'SSD');
INSERT INTO CATEG_TBL VALUES (105, 1, 'HDD');
INSERT INTO CATEG_TBL VALUES (106, 1, '그래픽카드');
INSERT INTO CATEG_TBL VALUES (107, 1, 'ODD');
INSERT INTO CATEG_TBL VALUES (108, 1, '케이스');
INSERT INTO CATEG_TBL VALUES (109, 1, '파워');
INSERT INTO CATEG_TBL VALUES (110, 1, '쿨러/튜닝용품');
INSERT INTO CATEG_TBL VALUES (111, 1, '사운드카드');
INSERT INTO CATEG_TBL VALUES (112, 1, '커스텀 수랭');

INSERT INTO CATEG_TBL VALUES (201, 2, '추천PC');
INSERT INTO CATEG_TBL VALUES (202, 2, '브랜드PC');
INSERT INTO CATEG_TBL VALUES (203, 2, '작업용PC');
INSERT INTO CATEG_TBL VALUES (204, 2, '게임용PC');
INSERT INTO CATEG_TBL VALUES (205, 2, '사무용PC');

INSERT INTO CATEG_TBL VALUES (301, 3, '키보드');
INSERT INTO CATEG_TBL VALUES (302, 3, '마우스');
INSERT INTO CATEG_TBL VALUES (303, 3, '데스크탑세트');
INSERT INTO CATEG_TBL VALUES (304, 3, '마우스패드');
INSERT INTO CATEG_TBL VALUES (305, 3, '외장하드');
INSERT INTO CATEG_TBL VALUES (306, 3, '외장케이스/외장도킹');
INSERT INTO CATEG_TBL VALUES (307, 3, 'USB');
INSERT INTO CATEG_TBL VALUES (308, 3, '메모리카드/리더기');
INSERT INTO CATEG_TBL VALUES (309, 3, 'NAS/DAS');

INSERT INTO CATEG_TBL VALUES (401, 4, '일반 모니터');
INSERT INTO CATEG_TBL VALUES (402, 4, '고해상도 모니터');
INSERT INTO CATEG_TBL VALUES (403, 4, '게이밍 모니터');
INSERT INTO CATEG_TBL VALUES (404, 4, '터치/산업용 모니터');
INSERT INTO CATEG_TBL VALUES (405, 4, '어댑터/주변기기');
INSERT INTO CATEG_TBL VALUES (406, 4, '모니터암/액세서리');
INSERT INTO CATEG_TBL VALUES (407, 4, '모니터 관련 케이블');

INSERT INTO CATEG_TBL VALUES (501, 5, '잉크젯 프린터/복합기');
INSERT INTO CATEG_TBL VALUES (502, 5, '레이저젯 프린터/복합기');
INSERT INTO CATEG_TBL VALUES (503, 5, '복사기/플로터/포토');
INSERT INTO CATEG_TBL VALUES (504, 5, '라벨/영수증/3D/도트');
INSERT INTO CATEG_TBL VALUES (505, 5, '스캐너/바코드');
INSERT INTO CATEG_TBL VALUES (506, 5, '사무기기');
INSERT INTO CATEG_TBL VALUES (507, 5, '잉크/토너/드럼');
INSERT INTO CATEG_TBL VALUES (508, 5, '사무/복사용지');

INSERT INTO CATEG_TBL VALUES (601, 6, '기타');

select categ_cd, par_categ_cd, categ_name from categ_tbl where par_categ_cd is NULL;


-- 3. 상품 테이블
DROP TABLE P_TBL CASCADE CONSTRAINTS;
CREATE TABLE P_TBL(
    P_NO            NUMBER          CONSTRAINT PK_P_NO PRIMARY KEY,
    CATEG_CD        NUMBER,
    P_NAME          VARCHAR2(300)    NOT NULL,
    P_PX            NUMBER          NOT NULL,
    P_DC            NUMBER          NOT NULL,
    P_MFR           VARCHAR2(30)    NOT NULL,
    P_DTL           VARCHAR2(4000)  NOT NULL,
    P_UP_FOLDER     VARCHAR2(100)    NOT NULL,
    P_IMG           VARCHAR2(100)    NOT NULL,
    P_AMT           NUMBER          NOT NULL,
    P_PURCHASABLE   CHAR(1)         NOT NULL,
    REGISTER_DATE   DATE DEFAULT SYSDATE NOT NULL,
    MODIFY_DATE     DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (CATEG_CD) REFERENCES CATEG_TBL (CATEG_CD)
);
DROP SEQUENCE SEQ_P_NO;
CREATE SEQUENCE SEQ_P_NO;
/*
p_no, categ_cd, p_name, p_px, p_dc, p_mfr, p_dtl, p_up_folder, p_img, p_amt, p_purchasable, register_date, modify_date
*/

-- 1차 카테고리 선택시 상품 출력
SELECT p_no, categ_cd, p_name, p_px, p_dc, p_mfr, p_dtl, p_up_folder, p_img, p_amt, p_purchasable, register_date, modify_date
FROM p_tbl
WHERE CATEG_CD IN (SELECT CATEG_CD FROM CATEG_TBL WHERE PAR_CATEG_CD = 1);

-- 2차 카테고리 선택시 상품 출력
SELECT p_no, categ_cd, p_name, p_px, p_dc, p_mfr, p_dtl, p_up_folder, p_img, p_amt, p_purchasable, register_date, modify_date
FROM p_tbl
WHERE CATEG_CD = 101;

SELECT RN, p_no, categ_cd, p_name, p_px, p_dc, p_mfr, p_dtl, p_up_folder, p_img, p_amt, p_purchasable, register_date, modify_date
		FROM (
				SELECT /*+INDEX_DESC(p_tbl pk_p_no) */
						ROWNUM RN, p_no, categ_cd, p_name, p_px, p_dc, p_mfr, p_dtl, p_up_folder, p_img, p_amt, p_purchasable, register_date, modify_date
				FROM p_tbl
				WHERE 
					categ_cd in (SELECT categ_cd FROM categ_tbl WHERE par_categ_cd = 1) and
					ROWNUM <= 1 * 10
			)
		WHERE RN > 0 * 10;

-- 상품 이미지 테이블
DROP TABLE PIMG_TBL CASCADE CONSTRAINTS;
CREATE TABLE PIMG_TBL(
    PIMG_NO         NUMBER          CONSTRAINT PK_PIMG_NO PRIMARY KEY,
    P_NO            NUMBER,
    PIMG_OG_NAME    VARCHAR2(300)   NOT NULL,
    PIMG_SV_NAME    VARCHAR2(300)   NOT NULL,
    PIMG_SIZE       NUMBER          NOT NULL,
    SAVE_DATE       DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
);
ALTER TABLE P_TBL
ADD FOREIGN KEY (PIMG_NO) REFERENCES PIMG_TBL (PIMG_NO);

-- 4. 장바구니 테이블
DROP TABLE CART_TBL CASCADE CONSTRAINTS;
CREATE TABLE CART_TBL(
    CART_NO         NUMBER          CONSTRAINT PK_CART_NO PRIMARY KEY,
    P_NO            NUMBER,
    U_ID            VARCHAR2(20),
    CART_AMT   NUMBER          NOT NULL,
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO),
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);
CREATE SEQUENCE seq_cart_no;

-- 장바구니에 넣기
MERGE INTO
    CART_TBL
USING
    DUAL
ON
    (u_id = ? and p_no = ?)
WHEN MATCHED THEN
    UPDATE
        SET
            cart_amt = cart_amt + ?
WHEN NOT MATCHED THEN
    INSERT
        (cart_no, p_no, u_id, cart_amt)
    VALUES
        (seq_cart_no.nextval, ?, ?, ?);
-- 장바구니 목록
SELECT
    ROWNUM rn, c.cart_no, c.p_no, c.u_id, c.cart_amt, p.p_up_folder, p.p_img, p.p_img, p.p_px, (p.p_px * c.cart_amt) as sum
FROM
    p_tbl p
        INNER JOIN
            cart_tbl c
ON
    p.p_no = c.p_no
WHERE
    c.u_id = ?;
-- 장바구니 수량 변경
UPDATE
    cart_tbl
SET
    cart_amt = ?
WHERE
    cart_no = ?;
-- 장바구니에서 빼기
DELETE FROM
    cart_tbl
WHERE
    cart_no = ?;
-- 장바구니 금액 계산
SELECT
    sum(p.p_px * c.cart_amt)
FROM
    p_tbl p
        INNER JOIN
            cart_tbl c
ON
    p.p_no = c.p_no
WHERE
    c.u_id = ?;
-- 장바구니 비우기
DELETE FROM
    cart_tbl
WHERE
    u_id = ?;
    
-- 찜 목록 테이블
DROP TABLE FAV_TBL CASCADE CONSTRAINTS;
CREATE TABLE FAV_TBL(
    FAV_NO  NUMBER      CONSTRAINT PK_FAV_NO PRIMARY KEY,
    P_NO    NUMBER,
    U_ID    VARCHAR2(20),
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO),
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);
CREATE SEQUENCE SEQ_FAV_NO;
-- 찜목록 넣기
MERGE INTO
    fav_tbl
USING
    DUAL
ON
(u_id = '2800881507' and p_no = 8)
WHEN NOT MATCHED THEN
    INSERT
        (fav_no, p_no, u_id)
    VALUES
        (seq_fav_no.nextval, 8, '2800881507');

-- 최근 본 상품 테이블
DROP TABLE RW_TBL CASCADE CONSTRAINTS;
CREATE TABLE RW_TBL (
    RW_NO   NUMBER  CONSTRAINT PK_RW_NO PRIMARY KEY,
    P_NO    NUMBER,
    U_ID    VARCHAR2(20),
    RW_DATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO),
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);
DROP SEQUENCE SEQ_RW_NO;
CREATE SEQUENCE SEQ_RW_NO;

-- 최근 본 상품 리스트
SELECT
		ROWNUM rn, rw_no, p_no, u_id, rw_date
	FROM
		(
		SELECT
			rw_no, p_no, u_id, rw_date
		FROM
			rw_tbl
		WHERE
			u_id = '2800881507'
		ORDER BY
			rw_date DESC
		)
	WHERE
		rownum < 21;

-- 5. 주문 테이블
DROP TABLE ORD_TBL CASCADE CONSTRAINTS;
CREATE TABLE ORD_TBL(
    ORD_NO              NUMBER          CONSTRAINT PK_ORD_NO PRIMARY KEY,
    U_ID                VARCHAR2(20),
    ORD_NAME            VARCHAR2(30)    NOT NULL,
    ORD_ZIPCODE         CHAR(5)         NOT NULL,
    ORD_ADDR            VARCHAR2(50)    NOT NULL,
    ORD_ADDR_DTL        VARCHAR2(50)    NOT NULL,
    ORD_PHONE           VARCHAR2(20)    NOT NULL,
    ORD_EMAIL           VARCHAR2(30)    NOT NULL,
    ORD_SUM             NUMBER          NOT NULL,
    ORDER_DATE          DATE            DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);
DROP SEQUENCE seq_ord_no;
CREATE SEQUENCE seq_ord_no;

-- 6. 주문 상세 테이블
DROP TABLE OD_TBL CASCADE CONSTRAINTS;
CREATE TABLE OD_TBL(
    ORD_NO  NUMBER  CONSTRAINT PK_ORD_NO_P_NO PRIMARY KEY,
    P_NO    NUMBER,
    OD_AMT  NUMBER  NOT NULL,
    OD_SUM  NUMBER  NOT NULL,
    FOREIGN KEY (ORD_NO) REFERENCES ORD_TBL (ORD_NO),
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
);

-- 결제 테이블
DROP TABLE PAY_TBL;
CREATE TABLE PAY_TBL (
    PAY_NO      NUMBER CONSTRAINT PK_PAY_NO NOT NULL,
    ORD_NO      NUMBER,
    U_ID        VARCHAR2(20),
    PAY_METHOD  VARCHAR2(15)    NOT NULL,
    PAY_PX      NUMBER          NOT NULL,
    PAY_USER    VARCHAR2(15)    NOT NULL,
    PAY_BANK    VARCHAR2(15)    NOT NULL,
    PAY_DATE    DATE DEFAULT SYSDATE,
    PAY_MEMO    VARCHAR2(100)   NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID),
    FOREIGN KEY (ORD_NO) REFERENCES ORD_TBL (ORD_NO)
);
DROP SEQUENCE seq_pay_no;
CREATE SEQUENCE seq_pay_no;

-- 7. 게시판 테이블
DROP TABLE BRD_TBL CASCADE CONSTRAINTS;
CREATE TABLE BRD_TBL (
    BRD_NO_SEQ NUMBER           CONSTRAINT PK_BRD_NO_SEQ PRIMARY KEY,
    U_ID        VARCHAR2(20),
    BRD_TITLE  VARCHAR2(100)   NOT NULL,
    BRD_CONTENT   VARCHAR2(4000)  NOT NULL,
    WRITE_DATE  DATE            DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);



-- 8. 후기 테이블
DROP TABLE REV_TBL CASCADE CONSTRAINTS;
CREATE TABLE REV_TBL (
    REV_NO      NUMBER          CONSTRAINT PK_REV_NO PRIMARY KEY,
    U_ID        VARCHAR2(50),
    P_NO        NUMBER,
    REV_CONTENT  VARCHAR2(200)   NOT NULL,
    REV_STAR    NUMBER          NOT NULL,
    WRITE_DATE  DATE            DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID),
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
);

-- 쿠폰 테이블
DROP TABLE CPN_TBL CASCADE CONSTRAINTS;
CREATE TABLE CPN_TBL (
    CPN_NO      NUMBER          CONSTRAINT PK_CPN_NO PRIMARY KEY,
    CPN_ID      VARCHAR2(50)    NOT NULL,
    DC_RATE     NUMBER,
    DC_SUM      NUMBER,
    DC_DETAIL   VARCHAR2(300)   NOT NULL,
    CPN_STATUS  CHAR(1)         NOT NULL
);

-- 쿠폰함 테이블
DROP TABLE CSTG_TBL CASCADE CONSTRAINTS;
CREATE TABLE CSTG_TBL (
    U_ID        VARCHAR2(50)    CONSTRAINT PK_CSTG_TBL PRIMARY KEY,
    CPN_NO      NUMBER,
    CPN_USED    CHAR(1)         NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID),
    FOREIGN KEY (CPN_NO) REFERENCES CPN_TBL (CPN_NO)
);

-- 환불 정보 테이블
DROP TABLE RFD_TBL CASCADE CONSTRAINTS;
CREATE TABLE RFD_TBL(
    RFD_NO              NUMBER          CONSTRAINT PK_RFD_NO PRIMARY KEY,
    U_ID                VARCHAR2(50),
    P_NO                NUMBER,
    ORD_NAME            VARCHAR2(30)    NOT NULL,
    ORD_ZIPCODE         CHAR(5)         NOT NULL,
    ORD_ADDR            VARCHAR2(50)    NOT NULL,
    ORD_ADDR_DETAILS    VARCHAR2(50)    NOT NULL,
    ORD_PHONE           VARCHAR2(20)    NOT NULL,
    RFD_SUM             NUMBER          NOT NULL,
    REFUND_DATE          DATE            DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID),
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
);

COMMIT;