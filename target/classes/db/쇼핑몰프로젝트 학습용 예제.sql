/*
�ۼ��� : �ڱ⵿
������ : 2019-03-06
������Ʈ�� : ���θ�
*/
DROP TABLE MBSP_TBL CASCADE CONSTRAINTS;

--1.ȸ������ ���̺�
CREATE TABLE MBSP_TBL(
        MBSP_ID             VARCHAR2(15)            CONSTRAINT PK_MBSP_ID PRIMARY KEY,
        MBSP_NAME           VARCHAR2(30)            NOT NULL,
        MBSP_EMAIL          VARCHAR2(50)            NOT NULL,
        MBSP_PASSWORD       CHAR(60)                NOT NULL,   -- ��й�ȣ ��ȣȭ ó��
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

-- ȸ�����

--1)ȸ������
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user01','ȫ�浿','user01@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�1','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user02','�̽¿�','user02@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�2','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user03','�����','user03@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�3','N');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user04','������','user04@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�4','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user05','����ȣ','user05@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�5','N');   

COMMIT;

--2)���̵� �ߺ�üũ
-- ����Ÿ ���� �� ���
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user01'; -- ���̵� ���Ұ���
-- ����Ÿ ���� �� �� ���
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user06'; -- ���̵� ��밡��

--3)ȸ������
--3.1)��й�ȣȮ��
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.2) ȸ������ ����������
SELECT MBSP_ID, MBSP_NAME, MBSP_PASSWORD, MBSP_ZIPCODE, MBSP_ADDR, MBSP_DEADDR, MBSP_PHONE, MBSP_NICK, MBSP_RECEIVE, MBSP_POINT, MBSP_DATESUB, MBSP_UPDATEDATE, MBSP_LASTLOGIN
FROM MBSP_TBL
WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.3) ȸ������ �����ϱ�
UPDATE MBSP_TBL
    SET MBSP_PASSWORD = ?, MBSP_ZIPCODE = ?, MBSP_ADDR = ?, MBSP_DEADDR = ?, MBSP_PHONE = ?, MBSP_RECEIVE = ?
WHERE MBSP_ID = ?;

--4) ȸ������ �����ϱ�
--4.1) ��й�ȣ Ȯ��
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--4.2) �����ϱ�
DELETE FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--5)���̵�׺�й�ȣã��
--5.1)���̵� ã��(���� ����)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_NAME = '�����' AND MBSP_EMAIL = 'user03@abc.co.kr';
--5.2)��й�ȣ ã��(���� ����)
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = 'user03' AND MBSP_EMAIL = 'user03@abc.co.kr';


--6)�α��� ���(��й�ȣ�� ��ȣȭ ó�� �� ��쿡�� ���� �߻�)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--��Г��� ��ȣȭ �� ���
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = ?;

--��� �÷����� ��ȣȭ �� �����͸� �о�ͼ�, ���ϴ� �޼ҵ带 ���Ͽ� �۾��ϰ� �ȴ�.

--2.ī�װ� ���̺�
-- ī�װ� ����
-- 2�� ī�װ� - �����ڵ�(<- 1�� ī�װ� �ڵ�)
CREATE TABLE CATEGORY_TBL(
        CAT_CODE            VARCHAR2(20)    PRIMARY KEY,
        CAT_PRTCODE         VARCHAR2(20)    NULL,
        CAT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CAT_PRTCODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);

-- / -> /

-- 1�� ī�װ� : TOP(1) PANTS(2) SHIRTS(3) OUTER(4) SHOES(5) BAG(6) ACC(7)
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

-- 1��ī�װ� TOP : '1'
-- 2�� ī�װ� : ����Ƽ ��Ʈ ������/�ĵ�Ƽ ������Ƽ ���� ����Ƽ/7��Ƽ
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('8','1','����Ƽ');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('9','1','��Ʈ');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('10','1','������/�ĵ�Ƽ');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('11','1','������Ƽ');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('12','1','����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES ('13','1','����Ƽ/7��Ƽ');

-- 1��ī�װ� PANTS : '2'
-- 2��ī�װ� : ������� û���� ������ ����� �ݹ���
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('14','2','�������');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('15','2','û����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('16','2','������');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('17','2','�����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('18','2','�ݹ���');
    
-- 1��ī�װ� SHIRTS : '3'
-- 2��ī�װ� : ���/���̳� ������ üũ/���� û���� ��Ʈ������ 

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('19','3','���/���̳�');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('20','3','������');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('21','3','üũ/����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('22','3','û����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('23','3','��Ʈ������'); 
    
    
-- 1��ī�װ� OUTER : '4'
-- 2��ī�װ� : �е� ��Ʈ ��Ʈ/������ ���� �����/MA-1 �����/���� �ĵ�/����

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('24','4','�е�');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('25','4','��Ʈ');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('26','4','��Ʈ/������');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('27','4','����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('28','4','�����/MA-1');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('29','4','�����/����');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('30','4','�ĵ�/����');  
    
-- 1��ī�װ� SHOES : '5'
-- 2��ī�װ� : ����Ŀ�� ����/���� Ű���̽Ź�/��â ������/�ɸ�/����
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('31','5','����Ŀ��');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('32','5','����/����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('33','5','Ű���̽Ź�/��â');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('34','5','������/�ɸ�/����');
   
-- 1��ī�װ� BAG : '6'
-- 2��ī�װ� : ���� ��Ʈ/����� ũ�ν��� Ŭ��ġ
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('35','6','����'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('36','6','��Ʈ/�����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('37','6','ũ�ν���');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('38','6','Ŭ��ġ');    
-- 1��ī�װ� ACC : '7'
-- 2��ī�װ� : �縻/��Ÿ�� ���� ���÷�/�尩 ���̿��� ��Ʈ/�ð� ��Ÿ
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('39','7','�縻/��Ÿ��');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('40','7','����');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('41','7','���÷�/�尩');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('42','7','���̿���');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('43','7','��Ʈ/�ð�');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES ('44','7','��Ÿ');
    

SELECT * FROM category_tbl;
COMMIT;
ROLLBACK;

-- 0���� �����ϴ� ���� ���̺��� ����� ������ number�� �ϸ� �ȵǰ� varchar2�� �ؾߵ�
SELECT 055 FROM DUAL;
SELECT '055' FROM DUAL;

SELECT * FROM category_tbl WHERE cat_prtcode = 1;

SELECT * FROM category_tbl WHERE cat_prtcode IS NOT NULL;
    
--3.��ǰ���� ���̺�
DROP TABLE PRODUCT_TBL;

/*
����Ÿ�� �����Ѵٴ� �������ǿ���
���̺��� �÷��� 
    NOT NULL -> NUL �� ���� ����
    NULL -> NOT NULL �� ���� �Ұ���

*/
-- CLOB : ���� 4000BYTE �ʰ� ���� �Ǵ�
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

-- ��ǰ����۾�
-- 1��ī�װ� : TOP (�ڵ� : 1)
-- 2��ī�װ� : ����Ƽ(�ڵ� : 8)
-- ��¥ � \ ��� (���� ��ο� ���� ����)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (1,'8','A',10000,0.1,'����','��¼����¼��','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (2,'8','A',10000,0.1,'����','��¼����¼��','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (3,'8','A',10000,0.1,'����','��¼����¼��','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (4,'8','A',10000,0.1,'����','��¼����¼��','\2023\04\06','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_up_folder,pro_img,pro_amount,pro_buy) 
VALUES (5,'8','A',10000,0.1,'����','��¼����¼��','\2023\04\06','abc.gif',10,'Y');

-- 2��ī�װ� : ��Ʈ(�ڵ� : 9)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (6,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (7,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (8,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (9,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (10,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- 2��ī�װ� : ������&�ĵ�Ƽ(�ڵ� : 10)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (11,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (12,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (13,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (14,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (15,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- 2��ī�װ� : ������Ƽ(�ڵ� : 11)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (16,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (17,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (18,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (19,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (20,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');


-- 2��ī�װ� : ����(�ڵ� : 12)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (21,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (22,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (23,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (24,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (25,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- 2��ī�װ� : ����Ƽ&7��Ƽ(�ڵ� : 13)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (26,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (27,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (28,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (29,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (30,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- ��ǰ���̺� ����Ʈ
SELECT * FROM product_tbl;

UPDATE product_tbl
    SET CAT_CODE = 8
WHERE PRO_NUM = 1;

COMMIT;

-- category_tbl(ī�װ�) CAT_CODE �÷��� 8 ����Ÿ�� ����

DELETE FROM category_tbl
WHERE CAT_CODE = 8;


/*********************************************************************
- ��ǰ����


**********************************************************************/
-- 1��ī�װ� ���
SELECT * FROM category_tbl WHERE CAT_PRTCODE IS NULL;

-- 1������(TOP : 1)�� �ش��ϴ� 2��ī�װ� ���
SELECT * FROM category_tbl WHERE CAT_PRTCODE = 1;

-- ��ǰ����Ʈ ���
SELECT * FROM product_tbl WHERE CAT_CODE = ?;

-- 1��ī�װ� ����(TOP : �ڵ� 1) : ��ǰ����Ʈ ���
-- 1��ī�װ� TOP �� 2��ī�װ� �ڵ带 ��ȸ����.
-- ��, TOP(1)�� 1��ī�װ��� ������ �ִ� 2��ī�װ�
SELECT CAT_CODE FROM category_tbl
WHERE CAT_PRTCODE = 1 ;

SELECT * FROM product_tbl
WHERE CAT_CODE IN (
                    SELECT CAT_CODE FROM category_tbl
                        WHERE CAT_PRTCODE = 1
                    );

-- 2��ī�װ� ����Ƽ(�ڵ� : 8) �� �ش��ϴ� ��ǰ����Ʈ ��ȸ�϶�.
SELECT * FROM product_tbl WHERE CAT_CODE = 8;


-- ��ǰ�󼼼���
/*
��ǰ����Ʈ���� ��ǰ �ϳ��� �����Ͽ��� �� ������ ������

*/
SELECT * FROM product_tbl WHERE PRO_NUM = 1;

-- ���û�ǰ����
DELETE product_tbl
WHERE pro_num in (4, 2);

-- ���û�ǰ����
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
--4.��ٱ��� ���̺�
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
--��ٱ��Ͽ� �α��� ����ڰ� ��ǰ�� �߰���, ������ ���� ��������, ���������ʴ� ���� ��ǰ�߰�

merge into cart_tbl
using dual
on (mbsp_id = 'id��' and pro_num = '��ǰ�ڵ�')
when matched then
    update
        set cart_amount = cart_amount + ����
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
�ֹ��ϱ�
 
*/
-- ��ٱ��� ����Ʈ ��ȸ
SELECT rownum, P.pro_up_folder, P.pro_img, P.pro_name, P.pro_price, P.pro_price * C.cart_amount as price
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- ��ü�ݾ� : 100000
SELECT SUM(P.pro_price * C.cat_amount) as totalprice
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- ��ٱ��Ͽ��� ��������
-- ������ ��������
UPDATE cart_tbl
    SET CAT_AMOUNT = 10
WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;
-- ����!!!!(������ ����)
UPDATE cart_tbl
    SET CAT_AMOUNT = CAT_AMOUNT + 10
WHERE CAT_CODE = 1;

-- ��ٱ��� ��ǰ���� ( CAT_CODE : ��ٱ����ڵ� )
DELETE FROM cart_tbl WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;

-- ��ٱ��� ���� : �α��� �� ����� ����Ÿ�� �����ؾ� �Ѵ�.(����)
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';

--5.�ֹ����� ���̺�
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

--6.�ֹ��� ���̺�
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TBL(ORD_CODE),
        PRO_NUM         NUMBER      NOT NULL REFERENCES PRODUCT_TBL(PRO_NUM),
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,  -- ������ȭ
        PRIMARY KEY (ORD_CODE ,PRO_NUM) 
);
/*

��ٱ��� -> �ֹ��ϱ� Ŭ�� �� -> �ֹ����� ������

*/
-- �ֹ����� ������ ����

-- �ֹ��� ���� ����
SELECT  *
FROM mbsp_tbl
WHERE mbsp_id = 'user01';



/*
Ʈ�����(����ó������)����� �����ؾ� �Ǵ°��?
�ϳ��� ��ɿ� ������ �۾��� �� ���(INSERT, UPDATE, DELETE, MERGE ��)
*/


/*
�ֹ������� �Է� �� �ֹ��ϱ� ������ �� ��� �������� �۾��� ���ÿ� �̷������.

Ʈ�����(����ó������)����� �����ؾ��Ѵ�.
- �ֹ����� �Է�(�ֹ����̺�, �ֹ������̺�)
- ����Ʈ ����
- ��ٱ��� ����
- ����

*/

SELECT ORD_CODE, SUM(DT_AMOUNT * DT_PRICE) FROM ORDETAIL_TBL WHERE ORD_CODE = ?;
-- �ֹ����� �Է�
--��ٱ��� ��������
SELECT * FROM cart_tbl WHERE mbsp_id = 'user01';

--1)�ֹ����̺� 
INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
VALUES (1,'user01','ȫ�浿','10050','����ϵ� ��â','����� 100��','010-555-5555',20000);

--2)�ֹ������̺�

INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 5, 3, 1000);
INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 7, 5, 1000);

--3)��ٱ������̺�
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';

--4) ����Ʈ ���
UPDATE mbsp_tbl
SET mbsp_point = mbsp_point - 50    -- 50 ����Ʈ ��
WHERE mbsp_id = 'user01';

COMMIT;

-- �ֹ����� ��ȸ ����Ʈ

SELECT * FROM ORDER_TBL;
SELECT * FROM ORDETAIL_TBL;

-- ��ǰ, �ֹ�, �ֹ��� ������ �̿��� �ֹ�������ȸ
SELECT rownum, OD.ORD_REGDATE, P.PRO_NAME , OT.DT_AMOUNT * OT.DT_PRICE  as SALEPRICE
FROM ORDER_TBL od   INNER JOIN ORDETAIL_TBL ot
ON od.ord_code = ot.ord_code
INNER JOIN PRODUCT_TBL p
ON OT.PRO_NUM = P.PRO_NUM
WHERE od.mbsp_id = 'user01';


-- ���� 4���� �۾��� ���ν����� ����(Ʈ����� ����)
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
    �Ʒ� 3���� �Ű������� ��ٱ����� ��ǰ������ŭ ����Ÿ�� �����ؾ� �Ѵ�.
    ��) ��ٱ��� ����Ÿ 3�� �� ��� �Ű������� ���� 3���� ������ ������ �Ѵ�.
    */
    p_pro_num           IN    ,
    p_dt_amount         IN      ,
    p_dt_price          IN      ,
    
    
    
    p_mbsp_point        IN     mbsp_tbl.mbsp_point%TYPE 
)
IS

BEGIN
    --1)�ֹ����̺� �Է�
    INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
        VALUES (1,p_mbsp_id,'ȫ�浿','10050','����ϵ� ��â','����� 100��','010-555-5555',20000);
    --2)�ֹ������̺� �Է�   
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 5, 3, 1000);
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 7, 5, 1000);
    
    --3)��ٱ������̺� ����
    DELETE FROM cart_tbl WHERE mbsp_id = 'user01';
    
    --4)ȸ�����̺� ����Ʈ ����
    UPDATE mbsp_tbl
        SET mbsp_point = mbsp_point - 50    -- 50 ����Ʈ ��
    WHERE mbsp_id = 'user01';

    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
END;


--7.���� ���̺�
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

--��ǰ�ı� �Է�
SELECT * FROM ORDETAIL_TBL;

INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (1, 'user01',5,'�����ϴ�.', 4 );
INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (2, 'user01',7,'���� ����.', 5 );
    
    
COMMIT;    
SELECT * FROM  review_tbl; 

-- ��ǰ�󼼼���(�պκ�)/ ��ǰ�ı�(�޺κ�)

SELECT * FROM PRODUCT_TBL WHERE PRO_NUM = 5;

SELECT * FROM review_tbl WHERE PRO_NUM = 5;


--8.�Խ��� ���̺�
DROP TABLE BOARD_TBL;
CREATE TABLE BOARD_TBL(
        BRD_NUM         NUMBER CONSTRAINTS PK_BOARD_BRD_NUM PRIMARY KEY,
        MBSP_ID         VARCHAR2(15)            NOT NULL,
        BRD_TITLE       VARCHAR2(100)           NOT NULL,
        BRD_CONTENT     VARCHAR2(4000)          NOT NULL,
        BRD_REGDATE     DATE DEFAULT SYSDATE    NOT NULL
        -- FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);

--9.������(ADMIN) ���̺�
CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(15)   PRIMARY KEY,
    ADMIN_PW    CHAR(60)       NOT NULL,
    ADMIN_VISIT_DATE    DATE
);

-- �ε��� ��Ʈ ��������
-- BOARD_TBL �Խ������̺� ���̵����� �۾�
DROP SEQUENCE BOARD_NUM_SEQ;
CREATE SEQUENCE BOARD_NUM_SEQ;

INSERT INTO BOARD_TBL (BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
VALUES (BOARD_NUM_SEQ.NEXTVAL, 'USER01', '����1', '����1', SYSDATE);

INSERT INTO BOARD_TBL (BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
SELECT BOARD_NUM_SEQ.NEXTVAL, MBSP_ID, BRD_TITLE, BRD_CONTENT, SYSDATE FROM BOARD_TBL;

COMMIT;

SELECT * FROM BOARD_TBL ORDER BY BRD_NUM DESC;

/*
�ε��� ��Ʈ ��ɾ�
INDEX : ��������. INDEX_ASC
INDEX_DESC : ��������
*/

SELECT /*+INDEX_DESC(b PK_BOARD_BRD_NUM) */
    BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM
    BOARD_TBL b;

-- ����¡���� ����
-- Ű���� rownum ���
SELECT * FROM BOARD_TBL WHERE ROWNUM <= 10 ORDER BY BRD_NUM DESC;

SELECT * FROM BOARD_TBL;

-- ���� ���ۿ��� ������ �ζ��� �並 ���
SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM ( -- �ζ��� ��� ���Ͽ�, ROWNUM�� ���� RN��Ī�÷����� �ٱ��� �������忡���� �������� ����Ÿ�� ���Եȴ�.
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


-- Foreign key (����Ű)
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
-- ���������� �����ϴ� ����
--1)�÷����� ����
CREATE TABLE CHILD_DEMO
(
    C_IDX       NUMBER          PRIMARY KEY,
    C_NAME      VARCHAR2(10)    NOT NULL,
    P_IDX       NUMBER          NOT NULL REFERENCES PARENT_DEMO(P_IDX)
);

SELECT * FROM PARENT_DEMO;
INSERT INTO CHILD_DEMO(C_IDX, C_NAME, P_IDX)
            VALUES(1, '�׽�Ʈ',1 );
            
INSERT INTO CHILD_DEMO(C_IDX, C_NAME, P_IDX)
            VALUES(1, '�׽�Ʈ',4 );    -- ���Ἲ ����        

--2)���̺���� ����
CREATE TABLE CHILD_DEMO
(
    C_IDX       NUMBER          PRIMARY KEY,
    C_NAME      VARCHAR2(10)    NOT NULL,
    P_IDX       NUMBER          NULL,
    FOREIGN KEY(P_IDX) REFERENCES PARENT_DEMO(P_IDX)
    ON DELETE SET NULL
);

-- ����Ű�� �����Ǿ��� ��쿡��
/*
1)�θ����̺��� ���� �ҷ���, �ڽ����̺��� ���� �����ؾ� �Ѵ�.(�θ����̺� ���� ���� �ȵ�)
2)�θ����̺��� ����Ÿ�� �����ҷ���, �ڽ����̺��� �����ϰ� �ִ� ����Ÿ�� ���� �����ؾ� ��.

-- FOREIGN KEY ������ �ɼ� ��ɾ�
-- ON  DELETE CASCADE , ON  DELETE SET NULL
1)ON  DELETE CASCADE : �θ����̺��� ����Ÿ�� �����ϸ�, �ڽ����̺� ����Ÿ�� �ڵ� ����
2)ON  DELETE SET NULL : �θ����̺��� ����Ÿ�� �����ϸ�, �ڽ����̺����� ����Ÿ��  NULL �� ó��
*/



-- �ڽ����̺��� 1�� ������̹Ƿ�, �θ����̺� 1�� ���� ����.
DELETE FROM PARENT_DEMO
WHERE P_IDX = 1;

-- �ڽ����̺��� 2�� ������� �����Ƿ�, �θ����̺� 2�� ���� ����.
DELETE FROM PARENT_DEMO
WHERE P_IDX = 2;

SELECT * FROM PARENT_DEMO;
SELECT * FROM CHILD_DEMO;

-- ON DELETE CASCADE �ɼ� ������ ���¿����� �θ� ����Ÿ�� �����Ǿ ������ ��
-- �ڽĵ���Ÿ�� ������ �ڵ����� ��
DELETE FROM PARENT_DEMO
WHERE P_IDX = 1;

-- ON DELETE SET NULL �ɼ� ������ ���¿����� �θ� ����Ÿ�� �����Ǿ ������ ��
-- �ڽĵ���Ÿ�� NULL �� ����. (����: �÷��� NULL �� �Ǿ�� �Ѵ�.)
DELETE FROM PARENT_DEMO
WHERE P_IDX = 1;
























