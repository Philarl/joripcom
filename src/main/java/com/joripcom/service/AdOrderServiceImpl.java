package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;
import com.joripcom.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {
	
	@Setter(onMethod_ = {@Autowired})
	private AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> orderList(Criteria cri) {
		
		return adOrderMapper.orderList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		return adOrderMapper.getTotalCount(cri);
	}

	@Override
	public List<AdOrderDetailVO> orderDetail(Integer ord_no) {
		
		return adOrderMapper.orderDetail(ord_no);
	}

}
