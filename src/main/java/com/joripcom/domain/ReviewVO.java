package com.joripcom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	/*
	CREATE TABLE REV_TBL (
	    REV_NO      NUMBER          CONSTRAINT PK_REV_NO PRIMARY KEY,
	    U_NIC       VARCHAR2(20),
	    P_NO        NUMBER,
	    REV_CONTENT  VARCHAR2(200)   NOT NULL,
	    REV_SCORE    NUMBER          NOT NULL,
	    REV_REGDATE  DATE DEFAULT SYSDATE NOT NULL,
	    FOREIGN KEY (U_NIC) REFERENCES U_TBL (U_NIC),
	    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
	);
	*/
	
	private Integer rev_no;
	private String u_nic;
	private int p_no;
	private String rev_content;
	private int rev_score;
	private Date rev_regdate;
}
