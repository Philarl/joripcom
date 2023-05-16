package com.joripcom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.MemberVO;
import com.joripcom.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = {@Autowired})
	private AdminMapper adminMapper;

	@Override
	public MemberVO login(String u_id) {
		
		return adminMapper.login(u_id);
	}

}
