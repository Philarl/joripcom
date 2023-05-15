package com.joripcom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.MemberVO;
import com.joripcom.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;

	@Override
	public String idCheck(String u_id) {
		
		return memberMapper.idCheck(u_id);
	}

	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
		
	}

}
