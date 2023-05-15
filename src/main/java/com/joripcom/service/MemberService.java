package com.joripcom.service;

import com.joripcom.domain.MemberVO;

public interface MemberService {
	
	String idCheck(String u_id);
	
	void join(MemberVO vo);

}
