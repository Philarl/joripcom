package com.joripcom.mapper;

import java.util.List;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;

public interface AdOrderMapper {
	
	List<OrderVO> orderList(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	List<AdOrderDetailVO> orderDetail(Integer ord_no);

}
