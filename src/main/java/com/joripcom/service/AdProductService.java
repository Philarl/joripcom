package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;
import com.joripcom.dto.CategoryDTO;

public interface AdProductService {

	List<CategoryVO> getCategoryList();

	List<CategoryVO> subCategoryList(Integer categ_cd);
	
	void pro_insert(ProductVO vo);
	
	List<ProductVO> getListWithPaging(Criteria cri, CategoryDTO categ);
	
	int getTotalCount(Criteria cri);

	CategoryVO get_category(Integer categ_cd);
	
	ProductVO get_modify(Integer p_no);

	void pro_modify(ProductVO vo);

	void pro_delete(Integer p_no);

	void pro_checked_modify(List<ProductVO> pro_list);

	void pro_checked_delete(List<Integer> p_no_arr);

}
