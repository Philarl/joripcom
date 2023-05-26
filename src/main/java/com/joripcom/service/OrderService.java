package com.joripcom.service;

import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PaymentVO;

public interface OrderService {
	
	void order_save(OrderVO o_vo, PaymentVO p_vo);

}
