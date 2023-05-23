package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.CartVO;
import com.joripcom.dto.CartDTO;
import com.joripcom.mapper.CartMapper;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = {@Autowired})
	private CartMapper cartMapper;

	@Override
	public int cart_add(CartVO vo) {
		
		return cartMapper.cart_add(vo);
	}

	@Override
	public List<CartDTO> cart_list(String u_id) {
		
		return cartMapper.cart_list(u_id);
	}

	@Override
	public int cart_amount_change(Integer cart_no, Integer cart_amt) {
		
		return cartMapper.cart_amount_change(cart_no, cart_amt);
	}

	@Override
	public int cart_delete(Integer cart_no) {
		
		return cartMapper.cart_delete(cart_no);
	}

	@Override
	public int cart_total_price(String u_id) {
		
		return cartMapper.cart_total_price(u_id);
	}

	@Override
	public void cart_empty(String u_id) {
		cartMapper.cart_empty(u_id);
		
	}
	
	

}
