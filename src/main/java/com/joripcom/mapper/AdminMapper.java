package com.joripcom.mapper;

import com.joripcom.domain.MemberVO;

public interface AdminMapper {
	//관리자 로그인
	MemberVO login(String u_id);

}
