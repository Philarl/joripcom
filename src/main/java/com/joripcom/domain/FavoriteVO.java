package com.joripcom.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FavoriteVO {
	/*
	CREATE TABLE FAV_TBL(
	    FAV_NO  NUMBER      CONSTRAINT PK_FAV_NO PRIMARY KEY,
	    P_NO    NUMBER,
	    U_ID    VARCHAR2(20),
	    FOREIGN KEY (P_NO) REFERENCES P_TBL (P_NO),
	    FOREIGN KEY (U_ID) REFERENCES U_TBL (U_ID)
	);
	*/
	
	private Integer fav_no;
	private Integer p_no;
	private String u_id;

}
