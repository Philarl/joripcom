package com.joripcom.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.PageDTO;
import com.joripcom.domain.ProductVO;
import com.joripcom.service.ProductService;
import com.joripcom.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class ProductController {
	
	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/subCategory/{categ_cd}")
	@ResponseBody
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("categ_cd") Integer categ_cd) {
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(productService.subCategoryList(categ_cd), HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping(value = {"/pro_list/{categ_cd}/{categ_name}"})
	public String pro_list(@ModelAttribute("cri") Criteria cri, @PathVariable("categ_cd") Integer categ_cd, @PathVariable("categ_name") String categ_name, Model model) {
		
		model.addAttribute("categ_cd", categ_cd);
		model.addAttribute("categ_name", categ_name);
		
		List<ProductVO> pro_list = productService.pro_list(cri, categ_cd);
		model.addAttribute("pro_list", pro_list);
		
		pro_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		int count = productService.pro_count(cri, categ_cd);
		PageDTO pageDTO = new PageDTO(count, cri);
		model.addAttribute("pageMaker", pageDTO);
		
		return "/product/pro_list";
	}
	
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String folderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}

}
