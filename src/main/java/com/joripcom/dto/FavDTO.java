package com.joripcom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FavDTO {
	
	private Integer fav_no;
	private Integer p_no;
	private String u_id;
	private String p_up_folder;
	private String p_img;
	private String p_name;
	private Integer p_px;
	private Long p_dc;
	private String p_purchasable;

}
