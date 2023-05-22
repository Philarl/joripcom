package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;

public interface ProductMapper {
	
	// 1차카테고리
	List<CategoryVO> getCategoryList();
	// 2차카테고리
	List<CategoryVO> subCategoryList(Integer categ_cd);
	// 상품목록
	List<ProductVO> pro_list(@Param("cri") Criteria cri, @Param("categ_cd") Integer categ_cd);
	// 상품개수
	int pro_count(@Param("cri") Criteria cri, @Param("categ_cd") Integer categ_cd);
}
