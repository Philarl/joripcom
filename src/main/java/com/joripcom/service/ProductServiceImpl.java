package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;
import com.joripcom.mapper.ProductMapper;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = {@Autowired})
	private ProductMapper productMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		
		return productMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> subCategoryList(Integer categ_cd) {
		
		return productMapper.subCategoryList(categ_cd);
	}

	@Override
	public List<ProductVO> pro_list(Criteria cri, Integer categ_cd) {
		
		return productMapper.pro_list(cri, categ_cd);
	}

	@Override
	public int pro_count(Criteria cri, Integer categ_cd) {
		
		return productMapper.pro_count(cri, categ_cd);
	}

}
