package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.DropVO;
import com.joripcom.domain.MemberVO;

public interface AdMemberMapper {
	//회원 목록
	List<MemberVO> memberList(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	//회원 숫자
	int getTotalCount(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	//탈퇴 회원 목록
	List<MemberVO> dropList(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
	// 탈퇴 회원 숫자
	int getTotalDropCount(@Param("cri") Criteria cri, @Param("sDate") String sDate, @Param("eDate") String eDate);
}
