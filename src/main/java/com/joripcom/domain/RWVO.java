package com.joripcom.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RWVO {
	/*
	CREATE TABLE RW_TBL (
	    RW_NO   NUMBER  CONSTRAINT PK_RW_NO PRIMARY KEY,
	    P_NO    NUMBER,
	    U_ID    VARCHAR2(20),
	    RW_DATE DATE DEFAULT SYSDATE,
	    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO),
	    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
	);
	*/
	
	private Integer rw_no;
	private Integer p_no;
	private String u_id;
	private Date rw_date;
}
