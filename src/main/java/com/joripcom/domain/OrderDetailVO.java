package com.joripcom.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailVO {
	/*
	CREATE TABLE OD_TBL(
	    ORD_NO  NUMBER  CONSTRAINT PK_ORD_NO_P_NO PRIMARY KEY,
	    P_NO    NUMBER,
	    OD_AMT  NUMBER  NOT NULL,
	    OD_SUM  NUMBER  NOT NULL,
	    FOREIGN KEY (ORD_NO) REFERENCES ORD_TBL (ORD_NO),
	    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO)
	);
	*/
	
	private Integer ord_no;
	private Integer p_no;
	private Integer od_amt;
	private Integer od_sum;

}
