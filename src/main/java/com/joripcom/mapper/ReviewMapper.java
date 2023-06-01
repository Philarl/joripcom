package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.ReviewVO;

public interface ReviewMapper {
	// 상품 후기 목록
	List<ReviewVO> review_list(@Param("cri") Criteria cri, @Param("p_no") int p_no);
	// 상품 후기 개수
	int review_count(int p_no);
	// 상품 후기 저장
	void create(ReviewVO vo);
	// 상품 후기 수정
	void modify(ReviewVO vo);
	// 상품 후기 삭제
	void delete(Integer rev_no);

}
