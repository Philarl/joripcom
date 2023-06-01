package com.joripcom.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	/*
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
	    PAY_METHOD          VARCHAR2(15)    NOT NULL,
	    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
	);
	*/
	
	private Integer ord_no;
	private String u_id;
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr;
	private String ord_addr_dtl;
	private String ord_phone;
	private String ord_email;
	private Integer ord_sum;
	private Date order_date;
	private String pay_method;
}
