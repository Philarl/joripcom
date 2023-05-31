package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.ReviewVO;

public interface ReviewService {
	
	List<ReviewVO> review_list(Criteria cri, int p_no);
	
	int review_count(int p_no);
	
	void create(ReviewVO vo);
	
	void modify(ReviewVO vo);

}
