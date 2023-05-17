package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;

public interface AdProductService {

	List<CategoryVO> getCategoryList();

	List<CategoryVO> subCategoryList(Integer categ_cd);
	
	void pro_insert(ProductVO vo);
	
	List<ProductVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);

}
