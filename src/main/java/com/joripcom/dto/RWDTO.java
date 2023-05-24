package com.joripcom.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RWDTO {
	
	private Integer rw_no;
	private Integer p_no;
	private String u_id;
	private Date rw_date;

	private String p_up_folder;
	private String p_img;
	private String p_name;
	private Integer p_px;
}
