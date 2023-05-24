package com.joripcom.service;

import java.util.List;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;
import com.joripcom.domain.RWVO;
import com.joripcom.dto.RWDTO;

public interface ProductService {
	
	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> subCategoryList(Integer categ_cd);
	
	List<ProductVO> pro_list(Criteria cri, Integer categ_cd);
	
	int pro_count(Criteria cri, Integer categ_cd);

	ProductVO pro_detail(Integer p_no);

	void rw_insert(RWVO vo);
	
	List<RWDTO> rw_list(String u_id);

}
