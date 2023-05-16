package com.joripcom.service;

import com.joripcom.domain.MemberVO;
import com.joripcom.dto.EmailDTO;

public interface MemberService {
	
	String idCheck(String u_id);
	
	void join(MemberVO vo);

	MemberVO login(String u_id);

	void now_visit(String u_id);

	void modify(MemberVO vo);

	void pwchange(String u_id, String new_u_pw);

	void delete(String u_id);

	String findID(String u_email);
	
	void sendMail(EmailDTO dto, String message);

	MemberVO findPW(String u_id);
	
	void tempPW(String u_id, String new_u_pw);

}
