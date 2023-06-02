package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;

public interface AdOrderMapper {
	// 주문 목록
	List<OrderVO> orderList(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	// 주문 개수
	int getTotalCount(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	// 주문 상세
	List<AdOrderDetailVO> orderDetail(Integer ord_no);
	// 주문 상세에서 상품 삭제
	void orderDetailProductDelete(@Param("ord_no") Integer ord_no, @Param("p_no") Integer p_no);
	// 주문 내역 삭제 : 1) 결제 내용 삭제
	void orderDeletePayment(Integer ord_no);
	// 주문 내역 삭제 : 2) 주문 상세 내역 삭제
	void orderDeleteDetail(Integer ord_no);
	// 주문 내역 삭제 : 3) 주문 내역 삭제
	void orderInfoDelete(Integer ord_no);
}
