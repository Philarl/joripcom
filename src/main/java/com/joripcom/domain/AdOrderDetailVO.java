package com.joripcom.domain;

import lombok.Data;

@Data
public class AdOrderDetailVO {
	
	private Integer ord_no;
	private Integer p_no;
	private Integer od_amt;
	private Integer od_sum;
	private String p_name;
	private String p_up_folder;
	private String p_img;

}
