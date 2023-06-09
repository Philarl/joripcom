package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PaymentVO;

public interface AdOrderMapper {
	// 주문 목록
	List<OrderVO> orderList(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	// 주문 개수
	int getTotalCount(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	// 주문 상세
	List<AdOrderDetailVO> orderDetail(Integer ord_no);
	// 주문 상세에서 상품 삭제 : 1) 주문 상세 삭제
	void orderDetailProductDelete(@Param("ord_no") Integer ord_no, @Param("p_no") Integer p_no);
	// 주문 번호에 해당하는 결제 테이블 호출
	PaymentVO getPayment(Integer ord_no);
	// 주문 번호에 해당하는 주문 테이블 호출
	OrderVO getOrder(Integer ord_no);
	// 주문 상세에서 상품 삭제 : 2) 결제 테이블 데이터 변경
	void modifyPaymentODPD(@Param("ord_no") Integer ord_no, @Param("od_amt") Integer od_amt, @Param("od_px") Integer od_px, @Param("p_vo") PaymentVO p_vo);
	// 주문 상세에서 상품 삭제 : 3) 주문 테이블 데이터 변경
	void modifyOrderODPD(@Param("ord_no") Integer ord_no, @Param("od_amt") Integer od_amt, @Param("od_px") Integer od_px, @Param("o_vo") OrderVO o_vo);
	// 주문 내역 삭제 : 1) 결제 내용 삭제
	void orderDeletePayment(Integer ord_no);
	// 주문 내역 삭제 : 2) 주문 상세 내역 삭제
	void orderDeleteDetail(Integer ord_no);
	// 주문 내역 삭제 : 3) 주문 내역 삭제
	void orderInfoDelete(Integer ord_no);
}
