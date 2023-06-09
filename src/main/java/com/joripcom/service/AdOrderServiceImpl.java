package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PaymentVO;
import com.joripcom.mapper.AdOrderMapper;

import lombok.Setter;

@Service
public class AdOrderServiceImpl implements AdOrderService {
	
	@Setter(onMethod_ = {@Autowired})
	private AdOrderMapper adOrderMapper;

	@Override
	public List<OrderVO> orderList(Criteria cri, String sDate, String eDate) {
		
		return adOrderMapper.orderList(cri, sDate, eDate);
	}

	@Override
	public int getTotalCount(Criteria cri, String sDate, String eDate) {
		
		return adOrderMapper.getTotalCount(cri, sDate, eDate);
	}

	@Override
	public List<AdOrderDetailVO> orderDetail(Integer ord_no) {
		
		return adOrderMapper.orderDetail(ord_no);
	}

	@Transactional
	@Override
	public void orderDetailDelete(Integer ord_no, Integer p_no, Integer od_amt, Integer od_px, PaymentVO p_vo, OrderVO o_vo) {
		adOrderMapper.orderDetailProductDelete(ord_no, p_no);
		adOrderMapper.modifyPaymentODPD(ord_no, od_amt, od_px, p_vo);
		adOrderMapper.modifyOrderODPD(ord_no, od_amt, od_px, o_vo);
		
	}
	
	@Transactional
	@Override
	public void orderDelete(Integer ord_no) {
		adOrderMapper.orderDeletePayment(ord_no);
		adOrderMapper.orderDeleteDetail(ord_no);
		adOrderMapper.orderInfoDelete(ord_no);
	}

	@Override
	public PaymentVO getPayment(Integer ord_no) {
		
		return adOrderMapper.getPayment(ord_no);
	}

	@Override
	public OrderVO getOrder(Integer ord_no) {
		
		return adOrderMapper.getOrder(ord_no);
	}

}
