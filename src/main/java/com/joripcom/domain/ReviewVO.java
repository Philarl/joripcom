package com.joripcom.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	/*
	CREATE TABLE REV_TBL (
	    REV_NO      NUMBER          CONSTRAINT PK_REV_NO PRIMARY KEY,
	    U_ID        VARCHAR2(50),
	    P_NO        NUMBER,
	    REV_CONTENT  VARCHAR2(200)   NOT NULL,
	    REV_SCORE    NUMBER          NOT NULL,
	    REV_REGDATE  DATE DEFAULT SYSDATE NOT NULL,
	    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID),
	    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
	);
	*/
	
	private Integer rev_no;
	private String u_id;
	private int p_no;
	private String rev_content;
	private int rev_score;
	private Date rev_regdate;
}
