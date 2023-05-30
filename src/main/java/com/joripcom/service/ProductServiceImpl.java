package com.joripcom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.ProductVO;
import com.joripcom.domain.RWVO;
import com.joripcom.dto.CategoryDTO;
import com.joripcom.dto.PriceDTO;
import com.joripcom.dto.RWDTO;
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
	public List<ProductVO> pro_list(Criteria cri, CategoryDTO categ, PriceDTO price) {
		
		return productMapper.pro_list(cri, categ, price);
	}

	@Override
	public int pro_count(Criteria cri, CategoryDTO categ, PriceDTO price) {
		
		return productMapper.pro_count(cri, categ, price);
	}

	@Override
	public ProductVO pro_detail(Integer p_no) {
		
		return productMapper.pro_detail(p_no);
	}

	@Override
	public void rw_insert(RWVO vo) {
		productMapper.rw_insert(vo);
		
	}

	@Override
	public List<RWDTO> rw_list(String u_id) {
		
		return productMapper.rw_list(u_id);
	}

	@Override
	public List<ProductVO> pro_search(Criteria cri, CategoryDTO categ, PriceDTO price) {
		
		return productMapper.pro_search(cri, categ, price);
	}

	@Override
	public int pro_searchCount(Criteria cri, CategoryDTO categ, PriceDTO price) {
		
		return productMapper.pro_searchCount(cri, categ, price);
	}

}
