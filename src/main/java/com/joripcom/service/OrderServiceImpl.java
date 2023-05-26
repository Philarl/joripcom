package com.joripcom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PaymentVO;
import com.joripcom.mapper.CartMapper;
import com.joripcom.mapper.OrderMapper;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = {@Autowired})
	private OrderMapper orderMapper;
	@Setter(onMethod_ = {@Autowired})
	private CartMapper cartMapper;

	@Transactional
	@Override
	public void order_save(OrderVO o_vo, PaymentVO p_vo) {
		
		orderMapper.order_save(o_vo);
		
		orderMapper.order_detail_save(o_vo.getOrd_no());
		
		p_vo.setOrd_no(o_vo.getOrd_no());
		orderMapper.payment_save(p_vo);
		
		cartMapper.cart_empty(o_vo.getU_id());
		
		
	}

}
