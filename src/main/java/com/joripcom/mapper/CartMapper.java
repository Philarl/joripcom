package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.CartVO;
import com.joripcom.dto.CartDTO;

public interface CartMapper {
	// 장바구니에 넣기
	int cart_add(CartVO vo);
	// 장바구니 목록
	List<CartDTO> cart_list(String u_id);
	// 장바구니 수량 변경
	int cart_amount_change(@Param("cart_no") Integer cart_no, @Param("cart_amt") Integer cart_amt);
	// 장바구니 빼기
	int cart_delete(Integer cart_no);
	// 장바구니 금액 계산
	int cart_total_price(String u_id);
	// 장바구니 비우기
	void cart_empty(String u_id);

}
