package com.joripcom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.PageDTO;
import com.joripcom.dto.CategoryDTO;
import com.joripcom.service.AdProductService;
import com.joripcom.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@ControllerAdvice(basePackages = {"com.joripcom.controller"})
@Log4j
public class GlobalControllerAdvice {
	
	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	@ModelAttribute
	public void categoryList(Criteria cri, CategoryDTO categ, Model model) {
//		log.info("1차 카테고리 목록");
		
		List<CategoryVO> cateList = productService.getCategoryList();
		model.addAttribute("cateList", cateList);
		
		CategoryDTO categoryDTO = new CategoryDTO(categ.getFirstCategory(), categ.getSecondCategory());
		model.addAttribute("category", categoryDTO);
		model.addAttribute("categoryList", adProductService.getCategoryList());
		int total = adProductService.getTotalCount(cri);
		PageDTO pageDTO = new PageDTO(total, cri);
		model.addAttribute("pageMaker", pageDTO);
		if(categoryDTO.getFirstCategory() != null) {
			model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryDTO.getFirstCategory()));
			}
		
	}
	
	@GetMapping("/subCategory/{categ_cd}")
	@ResponseBody
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("categ_cd") Integer categ_cd) {
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.subCategoryList(categ_cd), HttpStatus.OK);
		
		return entity;
	}

}
