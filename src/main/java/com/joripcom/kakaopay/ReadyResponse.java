package com.joripcom.kakaopay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#prepare-request
public class ReadyResponse {
	
	private String tid;
	
	private String next_redirect_pc_url;

}
