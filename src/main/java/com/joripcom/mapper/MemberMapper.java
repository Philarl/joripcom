package com.joripcom.mapper;

import com.joripcom.domain.MemberVO;

public interface MemberMapper {
	
	String idCheck(String u_id);
	
	void join(MemberVO vo);

}
