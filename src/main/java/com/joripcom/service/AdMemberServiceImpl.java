package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.DropVO;
import com.joripcom.domain.MemberVO;
import com.joripcom.mapper.AdMemberMapper;

import lombok.Setter;

@Service
public class AdMemberServiceImpl implements AdMemberService {
	
	@Setter(onMethod_ = {@Autowired})
	private AdMemberMapper adMemberMapper;

	@Override
	public List<MemberVO> memberList(Criteria cri, String sDate, String eDate) {
		
		return adMemberMapper.memberList(cri, sDate, eDate);
	}

	@Override
	public int getTotalCount(Criteria cri, String sDate, String eDate) {
		
		return adMemberMapper.getTotalCount(cri, sDate, eDate);
	}

	@Override
	public List<MemberVO> dropList(Criteria cri, String sDate, String eDate) {
		
		return adMemberMapper.dropList(cri, sDate, eDate);
	}

	@Override
	public int getTotalDropCount(Criteria cri, String sDate, String eDate) {

		return adMemberMapper.getTotalDropCount(cri, sDate, eDate);
	}

}
