package com.joripcom.mapper;

import java.util.List;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;

public interface AdProductMapper {
	// 1차 카테고리
	List<CategoryVO> getCategoryList();
	// 2차 카테고리
	List<CategoryVO> subCategoryList(Integer categ_cd);
	// 상품 등록
	void pro_insert(ProductVO vo);
	// 페이징 기능
	List<ProductVO> getListWithPaging(Criteria cri);
	// 총 상품 수
	int getTotalCount(Criteria cri);
	// 카테고리 정보
	CategoryVO get(Integer cat_code);

}
