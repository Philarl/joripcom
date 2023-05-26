package com.joripcom.kakaopay;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
// https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#approve-response-amount
public class Amount {
	
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;

}
