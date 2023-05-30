package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.ReviewVO;

public interface ReviewMapper {
	
	List<ReviewVO> review_list(@Param("cri") Criteria cri, @Param("p_no") int p_no);
	
	int review_count(int p_no);

}
