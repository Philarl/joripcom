package com.joripcom.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	/*
	CREATE TABLE U_TBL(
	    U_ID            VARCHAR2(15)            CONSTRAINT PK_U_ID PRIMARY KEY,
	    U_NAME          VARCHAR2(30)            NOT NULL,
	    U_PW            VARCHAR2(15)            NOT NULL,
    	U_EMAIL         VARCHAR2(50) UNIQUE     NOT NULL,
	    U_ZIPCODE       CHAR(5)                 NOT NULL,
	    U_ADDR          VARCHAR2(50)            NOT NULL,
	    U_ADDR_DTL      VARCHAR2(50)            NOT NULL,
	    U_PHONE         VARCHAR2(15)            NOT NULL,
	    U_NIC           VARCHAR2(20) UNIQUE     NOT NULL,
	    CHECK_EMAIL_RX  CHAR(1)                 NOT NULL,
	    U_GRADE         CHAR(1) DEFAULT 0       NOT NULL,
	    U_PTS           NUMBER DEFAULT 0        NOT NULL,
	    JOIN_DATE       DATE DEFAULT SYSDATE    NOT NULL,
	    MODIFY_DATE     DATE DEFAULT SYSDATE    NOT NULL,
	    LAST_LOGIN_DATE DATE DEFAULT SYSDATE    NOT NULL
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
	
	private Date backup_u_date;

}
