package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;
import com.joripcom.domain.RWVO;
import com.joripcom.dto.CategoryDTO;
import com.joripcom.dto.PriceDTO;
import com.joripcom.dto.RWDTO;

public interface ProductService {
	
	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> subCategoryList(Integer categ_cd);
	
	List<ProductVO> pro_list(Criteria cri, CategoryDTO categ, PriceDTO price);
	
	int pro_count(Criteria cri, CategoryDTO categ, PriceDTO price);

	ProductVO pro_detail(Integer p_no);

	void rw_insert(RWVO vo);
	
	List<RWDTO> rw_list(String u_id);
	
	List<ProductVO> pro_search(Criteria cri, CategoryDTO categ, PriceDTO price);
	
	int pro_searchCount(Criteria cri, CategoryDTO categ, PriceDTO price);

}
