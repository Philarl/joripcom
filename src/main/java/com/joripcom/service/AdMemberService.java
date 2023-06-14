package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.DropVO;
import com.joripcom.domain.MemberVO;

public interface AdMemberService {

	List<MemberVO> memberList(Criteria cri, String sDate, String eDate);

	int getTotalCount(Criteria cri, String sDate, String eDate);

	List<MemberVO> dropList(Criteria cri, String sDate, String eDate);

	int getTotalDropCount(Criteria cri, String sDate, String eDate);

}
