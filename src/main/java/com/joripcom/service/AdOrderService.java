package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;

public interface AdOrderService {
	
	List<OrderVO> orderList(Criteria cri, String sDate, String eDate);
	
	int getTotalCount(Criteria cri, String sDate, String eDate);
	
	List<AdOrderDetailVO> orderDetail(Integer ord_no);
	
	void orderDetailDelete(Integer ord_no, Integer p_no);
	
	void orderDelete(Integer ord_no);
}
