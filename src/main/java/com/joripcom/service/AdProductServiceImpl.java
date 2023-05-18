package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;
import com.joripcom.mapper.AdProductMapper;

import lombok.Setter;

@Service
public class AdProductServiceImpl implements AdProductService {
	
	@Setter(onMethod_ = {@Autowired})
	private AdProductMapper adProductMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		
		return adProductMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> subCategoryList(Integer categ_cd) {
		
		return adProductMapper.subCategoryList(categ_cd);
	}

	@Override
	public void pro_insert(ProductVO vo) {
		adProductMapper.pro_insert(vo);
		
	}

	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
		
		return adProductMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		
		return adProductMapper.getTotalCount(cri);
	}

	@Override
	public CategoryVO get_category(Integer categ_cd) {
		
		return adProductMapper.get_category(categ_cd);
	}

	@Override
	public ProductVO get_modify(Integer p_no) {
		
		return adProductMapper.get_modify(p_no);
	}

	@Override
	public void pro_modify(ProductVO vo) {
		adProductMapper.pro_modify(vo);
		
	}

	@Override
	public void pro_delete(Integer p_no) {
		adProductMapper.pro_delete(p_no);
		
	}

	@Override
	public void pro_checked_modify(List<ProductVO> pro_list) {
		adProductMapper.pro_checked_modify(pro_list);
		
	}

	@Override
	public void pro_checked_delete(List<Integer> p_no_arr) {
		adProductMapper.pro_checked_delete(p_no_arr);
		
	}

}
