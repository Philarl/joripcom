package com.joripcom.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	List<ProductVO> getListWithPaging(@Param("cri") Criteria cri, @Param("categ") CategoryVO categ);
	// 총 상품 수
	int getTotalCount(Criteria cri);
	// 카테고리 정보
	CategoryVO get_category(Integer categ_cd);
	// 상품수정 정보 읽어오기
	ProductVO get_modify(Integer p_no);
	// 상품 수정
	void pro_modify(ProductVO vo);
	// 상품 삭제
	void pro_delete(Integer p_no);
	// 선택 상품 수정
	void pro_checked_modify(List<ProductVO> pro_list);
	// 선택 상품 삭제
	void pro_checked_delete(List<Integer> p_no_arr);

}
