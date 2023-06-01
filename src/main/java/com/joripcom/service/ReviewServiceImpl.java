package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.ReviewVO;
import com.joripcom.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = {@Autowired})
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> review_list(Criteria cri, int p_no) {
		
		return reviewMapper.review_list(cri, p_no);
	}

	@Override
	public int review_count(int p_no) {
		
		return reviewMapper.review_count(p_no);
	}

	@Override
	public void create(ReviewVO vo) {
		reviewMapper.create(vo);
		
	}

	@Override
	public void modify(ReviewVO vo) {
		reviewMapper.modify(vo);
		
	}

	@Override
	public void delete(Integer rev_no) {
		reviewMapper.delete(rev_no);
		
	}

}
