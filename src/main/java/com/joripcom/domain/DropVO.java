package com.joripcom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DropVO {
	/*
	CREATE TABLE UDROP_TBL(
	    UDROP_ID            VARCHAR2(20)            CONSTRAINT PK_UDROP_ID PRIMARY KEY,
	    U_NAME          VARCHAR2(30)            NOT NULL,
	    U_PW            VARCHAR2(60)            NOT NULL,
	    UDROP_EMAIL         VARCHAR2(30) UNIQUE     NOT NULL,
	    U_ZIPCODE       VARCHAR2(10)            NOT NULL,
	    U_ADDR          VARCHAR2(100)           NOT NULL,
	    U_ADDR_DTL      VARCHAR2(100)           NOT NULL,
	    U_PHONE         VARCHAR2(15)            NOT NULL,
	    UDROP_NIC           VARCHAR2(20) UNIQUE     NOT NULL,
	    CHECK_EMAIL_RX  CHAR(1) DEFAULT 'N'     NOT NULL,
	    U_GRADE         CHAR(1) DEFAULT 0       NOT NULL,
	    U_PTS           NUMBER DEFAULT 0        NOT NULL,
	    DROP_DATE       DATE DEFAULT SYSDATE    NOT NULL
	);
	 */
	
	private String u_id;
	private String u_name;
	private String u_pw;
	private String u_email;
	private String u_zipcode;
	private String u_addr;
	private String u_addr_dtl;
	private String u_phone;
	private String u_nic;
	private String check_email_rx;
	private String u_grade; 
	private Integer u_pts;
	private Date join_date;
	private Date modify_date;
	private Date last_login_date;

}
