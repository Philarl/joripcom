/*
������ ������Ʈ ���̺� ���� SQL
���� ������ : 2023-05-15
*/

-- 1. ȸ�� ���̺�
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

-- 2. ī�װ� ���̺�
DROP TABLE CATEG_TBL CASCADE CONSTRAINTS;
CREATE TABLE CATEG_TBL(
    CATEG_CD        NUMBER          CONSTRAINT PK_CATEG_CD PRIMARY KEY,
    PAR_CATEG_CD    NUMBER,
    CATEG_NAME      VARCHAR2(50)    NOT NULL
);
ALTER TABLE CATEG_TBL
ADD FOREIGN KEY(PAR_CATEG_CD) REFERENCES CATEG_TBL (CATEG_CD);

/* 1�� ī�װ� ���� �Է�*/
INSERT INTO CATEG_TBL VALUES (1, NULL, '��ǻ�� ��ǰ');
INSERT INTO CATEG_TBL VALUES (2, NULL, '������ PC');
INSERT INTO CATEG_TBL VALUES (3, NULL, 'Ű����, ���콺, ������ġ');
INSERT INTO CATEG_TBL VALUES (4, NULL, '�����');
INSERT INTO CATEG_TBL VALUES (5, NULL, '������ �� �Ҹ�ǰ');
INSERT INTO CATEG_TBL VALUES (6, NULL, '��Ÿ �׼�����');

/* 2�� ī�װ� ���� �Է�*/
INSERT INTO CATEG_TBL VALUES (101, 1, 'CPU');
INSERT INTO CATEG_TBL VALUES (102, 1, '���κ���');
INSERT INTO CATEG_TBL VALUES (103, 1, '�޸�');
INSERT INTO CATEG_TBL VALUES (104, 1, 'SSD');
INSERT INTO CATEG_TBL VALUES (105, 1, 'HDD');
INSERT INTO CATEG_TBL VALUES (106, 1, '�׷���ī��');
INSERT INTO CATEG_TBL VALUES (107, 1, 'ODD');
INSERT INTO CATEG_TBL VALUES (108, 1, '���̽�');
INSERT INTO CATEG_TBL VALUES (109, 1, '�Ŀ�');
INSERT INTO CATEG_TBL VALUES (110, 1, '��/Ʃ�׿�ǰ');
INSERT INTO CATEG_TBL VALUES (111, 1, '����ī��');
INSERT INTO CATEG_TBL VALUES (112, 1, 'Ŀ���� ����');

INSERT INTO CATEG_TBL VALUES (201, 2, '��õPC');
INSERT INTO CATEG_TBL VALUES (202, 2, '�귣��PC');
INSERT INTO CATEG_TBL VALUES (203, 2, '�۾���PC');
INSERT INTO CATEG_TBL VALUES (204, 2, '���ӿ�PC');
INSERT INTO CATEG_TBL VALUES (205, 2, '�繫��PC');

INSERT INTO CATEG_TBL VALUES (301, 3, 'Ű����');
INSERT INTO CATEG_TBL VALUES (302, 3, '���콺');
INSERT INTO CATEG_TBL VALUES (303, 3, '����ũž��Ʈ');
INSERT INTO CATEG_TBL VALUES (304, 3, '���콺�е�');
INSERT INTO CATEG_TBL VALUES (305, 3, '�����ϵ�');
INSERT INTO CATEG_TBL VALUES (306, 3, '�������̽�/���嵵ŷ');
INSERT INTO CATEG_TBL VALUES (307, 3, 'USB');
INSERT INTO CATEG_TBL VALUES (308, 3, '�޸�ī��/������');
INSERT INTO CATEG_TBL VALUES (309, 3, 'NAS/DAS');

INSERT INTO CATEG_TBL VALUES (401, 4, '�Ϲ� �����');
INSERT INTO CATEG_TBL VALUES (402, 4, '���ػ� �����');
INSERT INTO CATEG_TBL VALUES (403, 4, '���̹� �����');
INSERT INTO CATEG_TBL VALUES (404, 4, '��ġ/����� �����');
INSERT INTO CATEG_TBL VALUES (405, 4, '�����/�ֺ����');
INSERT INTO CATEG_TBL VALUES (406, 4, '����;�/�׼�����');
INSERT INTO CATEG_TBL VALUES (407, 4, '����� ���� ���̺�');

INSERT INTO CATEG_TBL VALUES (501, 5, '��ũ�� ������/���ձ�');
INSERT INTO CATEG_TBL VALUES (502, 5, '�������� ������/���ձ�');
INSERT INTO CATEG_TBL VALUES (503, 5, '�����/�÷���/����');
INSERT INTO CATEG_TBL VALUES (504, 5, '��/������/3D/��Ʈ');
INSERT INTO CATEG_TBL VALUES (505, 5, '��ĳ��/���ڵ�');
INSERT INTO CATEG_TBL VALUES (506, 5, '�繫���');
INSERT INTO CATEG_TBL VALUES (507, 5, '��ũ/���/�巳');
INSERT INTO CATEG_TBL VALUES (508, 5, '�繫/�������');

INSERT INTO CATEG_TBL VALUES (601, 6, '��Ÿ');

select categ_cd, par_categ_cd, categ_name from categ_tbl where par_categ_cd is NULL;


-- 3. ��ǰ ���̺�
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

-- 1�� ī�װ� ���ý� ��ǰ ���
SELECT p_no, categ_cd, p_name, p_px, p_dc, p_mfr, p_dtl, p_up_folder, p_img, p_amt, p_purchasable, register_date, modify_date
FROM p_tbl
WHERE CATEG_CD IN (SELECT CATEG_CD FROM CATEG_TBL WHERE PAR_CATEG_CD = 1);

-- 2�� ī�װ� ���ý� ��ǰ ���
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

-- ��ǰ �̹��� ���̺�
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

-- 4. ��ٱ��� ���̺�
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

-- ��ٱ��Ͽ� �ֱ�
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
-- ��ٱ��� ���
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
-- ��ٱ��� ���� ����
UPDATE
    cart_tbl
SET
    cart_amt = ?
WHERE
    cart_no = ?;
-- ��ٱ��Ͽ��� ����
DELETE FROM
    cart_tbl
WHERE
    cart_no = ?;
-- ��ٱ��� �ݾ� ���
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
-- ��ٱ��� ����
DELETE FROM
    cart_tbl
WHERE
    u_id = ?;
    
-- �� ��� ���̺�
DROP TABLE FAV_TBL CASCADE CONSTRAINTS;
CREATE TABLE FAV_TBL(
    FAV_NO  NUMBER      CONSTRAINT PK_FAV_NO PRIMARY KEY,
    P_NO    NUMBER,
    U_ID    VARCHAR2(20),
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO),
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);
CREATE SEQUENCE SEQ_FAV_NO;
-- ���� �ֱ�
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

-- �ֱ� �� ��ǰ ���̺�
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

-- �ֱ� �� ��ǰ ����Ʈ
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

-- 5. �ֹ� ���̺�
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

-- 6. �ֹ� �� ���̺�
DROP TABLE OD_TBL CASCADE CONSTRAINTS;
CREATE TABLE OD_TBL(
    ORD_NO  NUMBER  CONSTRAINT PK_ORD_NO_P_NO PRIMARY KEY,
    P_NO    NUMBER,
    OD_AMT  NUMBER  NOT NULL,
    OD_SUM  NUMBER  NOT NULL,
    FOREIGN KEY (ORD_NO) REFERENCES ORD_TBL (ORD_NO),
    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
);

-- ���� ���̺�
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

-- 7. �Խ��� ���̺�
DROP TABLE BRD_TBL CASCADE CONSTRAINTS;
CREATE TABLE BRD_TBL (
    BRD_NO_SEQ NUMBER           CONSTRAINT PK_BRD_NO_SEQ PRIMARY KEY,
    U_ID        VARCHAR2(20),
    BRD_TITLE  VARCHAR2(100)   NOT NULL,
    BRD_CONTENT   VARCHAR2(4000)  NOT NULL,
    WRITE_DATE  DATE            DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
);



-- 8. �ı� ���̺�
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

-- ���� ���̺�
DROP TABLE CPN_TBL CASCADE CONSTRAINTS;
CREATE TABLE CPN_TBL (
    CPN_NO      NUMBER          CONSTRAINT PK_CPN_NO PRIMARY KEY,
    CPN_ID      VARCHAR2(50)    NOT NULL,
    DC_RATE     NUMBER,
    DC_SUM      NUMBER,
    DC_DETAIL   VARCHAR2(300)   NOT NULL,
    CPN_STATUS  CHAR(1)         NOT NULL
);

-- ������ ���̺�
DROP TABLE CSTG_TBL CASCADE CONSTRAINTS;
CREATE TABLE CSTG_TBL (
    U_ID        VARCHAR2(50)    CONSTRAINT PK_CSTG_TBL PRIMARY KEY,
    CPN_NO      NUMBER,
    CPN_USED    CHAR(1)         NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID),
    FOREIGN KEY (CPN_NO) REFERENCES CPN_TBL (CPN_NO)
);

-- ȯ�� ���� ���̺�
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