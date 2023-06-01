package com.joripcom.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
import com.joripcom.domain.MemberVO;
import com.joripcom.domain.PageDTO;
import com.joripcom.domain.ProductVO;
import com.joripcom.domain.RWVO;
import com.joripcom.dto.CategoryDTO;
import com.joripcom.dto.PriceDTO;
import com.joripcom.dto.RWDTO;
import com.joripcom.service.AdProductService;
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
	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
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
	public String pro_list(@ModelAttribute("cri") Criteria cri, @PathVariable("categ_cd") Integer categ_cd, @PathVariable("categ_name") String categ_name, CategoryDTO categ, PriceDTO price, Model model) {
		
		categ_cd = categ.getCateg_cd();
		categ_name = categ.getCateg_name();
		model.addAttribute("categ_cd", categ_cd);
		model.addAttribute("categ_name", categ_name);
		
		List<ProductVO> pro_list = productService.pro_list(cri, categ, price);
		model.addAttribute("pro_list", pro_list);
		
		pro_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		int count = productService.pro_count(cri, categ, price);
		PageDTO pageDTO = new PageDTO(count, cri);
		model.addAttribute("pageMaker", pageDTO);
		
		return "/product/pro_list";
	}
	
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String folderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	@GetMapping("pro_detail")
	public void pro_detail(Integer p_no, RWVO rw, HttpSession session, Model model) {
		
		ProductVO vo = productService.pro_detail(p_no);
		vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		
		model.addAttribute("productVO", vo);
		
//		log.info(session.getAttribute("loginStatus"));
		if(session.getAttribute("loginStatus") != null) {
			String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
			rw.setU_id(u_id);
			productService.rw_insert(rw);
			
//			log.info(productService.rw_list(((MemberVO) session.getAttribute("loginStatus")).getU_id()));
			
			
			List<RWDTO> rw_list = productService.rw_list(u_id);
			RWDTO rwThumbnail = rw_list.get(0);
			rwThumbnail.setP_up_folder(rwThumbnail.getP_up_folder().replace("\\", "/"));
			session.setAttribute("rwThumbnail", rwThumbnail);
		}
	}
	
	@GetMapping("/rw_list")
	public void rw_list(HttpSession session, Model model) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		List<RWDTO> rw_list = productService.rw_list(u_id);
		
		rw_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("rw_list", rw_list);
		
	}
	
	@GetMapping("/pro_search")
	public void pro_search(@ModelAttribute("cri") Criteria cri, CategoryDTO categ, PriceDTO price, Model model) {
		
		List<ProductVO> pro_list = productService.pro_search(cri, categ, price);
		log.info(pro_list);
		model.addAttribute("pro_list", pro_list);
		
		pro_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		int count = productService.pro_searchCount(cri, categ, price);
		log.info(count);
		PageDTO pageDTO = new PageDTO(count, cri);
		model.addAttribute("pageMaker", pageDTO);
		model.addAttribute("categoryList", adProductService.getCategoryList());
		CategoryDTO categoryDTO = new CategoryDTO(categ.getFirstCategory(), categ.getSecondCategory());
		model.addAttribute("category", categoryDTO);
		
		if(categoryDTO.getFirstCategory() != null) {
		model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryDTO.getFirstCategory()));

		}
		
	}

}
