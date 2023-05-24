package com.joripcom.mapper;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.MemberVO;

public interface MemberMapper {
	
	//아이디 중복체크
	String idCheck(String u_id);
	//회원가입
	void join(MemberVO vo);
	//로그인
	MemberVO login(String u_id);
	//최근로그인시간
	void now_visit(String u_id);
	//회원정보수정
	void modify(MemberVO vo);
	//비밀번호변경
	void pwchange(@Param("u_id") String u_id, @Param("new_u_pw") String new_u_pw);
	//회원탈퇴
	void delete(String u_id);
	//아이디찾기
	String findID(String u_email);
	//비밀번호찾기
	MemberVO findPW(String u_id);
	//임시비밀번호
	void tempPW(@Param("u_id") String u_id, @Param("new_u_pw") String new_u_pw);
	//찜목록 할인여부 확인
	int check_fav_dc(String u_id);
}
