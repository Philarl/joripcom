package com.joripcom.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.CartVO;
import com.joripcom.dto.CartDTO;

public interface CartService {

	int cart_add(CartVO vo);

	List<CartDTO> cart_list(String u_id);

	int cart_amount_change(@Param("cart_no") Integer cart_no, @Param("cart_amt") Integer cart_amt);

	int cart_delete(Integer cart_no);

	int cart_total_price(String u_id);

	void cart_empty(String u_id);

}
