package com.joripcom.mapper;

import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PaymentVO;

public interface OrderMapper {
	
	//주문정보 저장
	void order_save(OrderVO o_vo);
	//주문상세정보 저장 (+장바구니)
	void order_detail_save(Integer ord_no);
	//결제정보 저장
	void payment_save(PaymentVO p_vo);
}
