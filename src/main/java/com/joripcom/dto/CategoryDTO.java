package com.joripcom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryDTO {
	
	private Integer firstCategory;
	private Integer secondCategory;
	private Integer categ_cd;
	private String categ_name;
	
	public CategoryDTO(Integer firstCategory, Integer secondCategory) {
		this.firstCategory = firstCategory;
		this.secondCategory = secondCategory;
	}

}
