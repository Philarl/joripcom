package com.joripcom.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	/*
	CREATE TABLE P_TBL(
	    P_NO            NUMBER          CONSTRAINT PK_P_NO PRIMARY KEY,
	    CATEG_CD        NUMBER,
	    P_NAME          VARCHAR2(50)    NOT NULL,
	    P_PX            NUMBER          NOT NULL,
	    P_DC            NUMBER          NOT NULL,
	    P_MFR           VARCHAR2(30)    NOT NULL,
	    P_DTL           CLOB            NOT NULL,
	    P_UP_FOLDER     VARCHAR2(50)    NOT NULL,
	    P_IMG           VARCHAR2(50)    NOT NULL,
	    P_AMT           NUMBER          NOT NULL,
	    P_PURCHASABLE   CHAR(1)         NOT NULL,
	    REGISTER_DATE   DATE DEFAULT SYSDATE NOT NULL,
	    MODIFY_DATE     DATE DEFAULT SYSDATE NOT NULL,
	    FOREIGN KEY (CATEG_CD) REFERENCES CATEG_TBL (CATEG_CD)
	);
	*/
	
	private Integer p_no;
	private Integer categ_cd;
	private String p_name;
	private Integer p_px;
	private Integer p_dc;
	private String p_mfr;
	private String p_dtl;
	private String p_up_folder;
	private String p_img;
	private Integer p_amt;
	private String p_purchasable;
	private Date register_date;
	private Date modify_date;
	
	private MultipartFile uploadFile;

}
