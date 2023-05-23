package com.joripcom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartDTO {
	
	private Integer cart_no;
	private Integer p_no;
	private String u_id;
	private Integer cart_amt;
	private String p_up_folder;
	private String p_img;
	private String p_name;
	private Integer p_px;
	private Integer sum;

}
