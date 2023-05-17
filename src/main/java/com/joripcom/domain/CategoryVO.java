package com.joripcom.domain;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class CategoryVO {
	/*
	CREATE TABLE CATEG_TBL(
	    CATEG_CD        NUMBER          CONSTRAINT PK_CATEG_CD PRIMARY KEY,
	    PAR_CATEG_CD    NUMBER,
	    CATEG_NAME      VARCHAR2(50)    NOT NULL
	);
	ALTER TABLE CATEG_TBL
	ADD FOREIGN KEY(PAR_CATEG_CD) REFERENCES CATEG_TBL (CATEG_CD);
	*/
	
	private Integer categ_cd;
	private Integer par_categ_cd;
	private String categ_name;

}
