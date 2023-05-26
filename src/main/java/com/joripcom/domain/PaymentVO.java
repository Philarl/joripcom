package com.joripcom.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	/*
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
	*/
	
	private Integer pay_no;
	private Integer ord_no;
	private String u_id;
	private String pay_method;
	private Integer pay_px;
	private String pay_user;
	private String pay_bank;
	private Date pay_date;
	private String pay_memo;

}
