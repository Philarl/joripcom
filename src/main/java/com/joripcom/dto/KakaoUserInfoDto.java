package com.joripcom.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KakaoUserInfoDto {
	
	private Long id;
	
	public KakaoUserInfoDto(Long id) {
		
		this.id = id;
	
	}
//	private String email;
//	
//	public KakaoUserInfoDto(Long id, String email) {
//		this.id = id;
//		this.email = email;
//	}
}
