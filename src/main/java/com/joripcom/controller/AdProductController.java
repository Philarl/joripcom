package com.joripcom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joripcom.domain.CategoryVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.PageDTO;
import com.joripcom.domain.ProductVO;
import com.joripcom.dto.CategoryDTO;
import com.joripcom.service.AdProductService;
import com.joripcom.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/product/*")
public class AdProductController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	@Resource(name = "uploadCkEditorPath")
	private String uploadCkEditorPath;
	
	//상품등록 JSP
	@GetMapping("/pro_insert")
	public void pro_insert(Model model) {
		
		model.addAttribute("categoryList", adProductService.getCategoryList());
		
	}
	
	//2차 카테고리 표시
	@GetMapping("/subCategory/{categ_cd}")
	@ResponseBody
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("categ_cd") Integer categ_cd) {
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.subCategoryList(categ_cd), HttpStatus.OK);
		
		return entity;
	}
	
	//상품등록 기능
	@PostMapping("/pro_insert")
	public String pro_insert(ProductVO vo, RedirectAttributes rttr) {
		
//		log.info("상품정보: " + vo);
//		log.info("업로드패스 : " + uploadPath);
		
		String uploadDateFolder = FileUtils.getFolder();
		String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
		
//		log.info("업로드데이트폴더 : " + uploadDateFolder);
//		log.info("세이브이미지네임 : " + saveImageName);
		
		vo.setP_img(saveImageName);
		vo.setP_up_folder(uploadDateFolder);
		
//		log.info("상품정보: " + vo);
		
		adProductService.pro_insert(vo);
		
		return "redirect:/admin/product/pro_list";
	}
	
	//이미지 업로드 기능
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 클라이언트에게 보내는 정보에 대한 설명
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			// 1) 업로드 작업
			String fileName = upload.getOriginalFilename(); // 클라이언트에서 보낸 파일이름
			byte[] bytes = upload.getBytes(); // 클라이언트에서 보낸 업로드되는 파일을 바이트배열로 확보
			
			String uploadPath = uploadCkEditorPath + fileName;
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.flush();
			
			log.info("파일업로드 : " + uploadPath);
			
			// 2)업로드한 파일 정보를 CKEditor에게 보내는 작업
			printWriter = res.getWriter();
			
			//톰캣 설정에서 external web module로 업로드 폴더 contextpath 설정
			String fileUrl = "/upload/" + fileName;
			// {"filename":"sample.jpg", "uploaded":1, "url":"/uploadsample.jpg"}
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) printWriter.close();
		}
	}
	
	// 이미지 출력 기능
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String folderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	@GetMapping("/pro_list")
	public void pro_list(@ModelAttribute("cri") Criteria cri, CategoryDTO categ, Model model) {
		
		List<ProductVO> pro_list = adProductService.getListWithPaging(cri, categ);
//		log.info(firstCategory());
//		log.info(categ.getSecondCategory());
		
		
//		log.info("폴더경로: " + pro_list.get(0).getP_up_folder());
		
		pro_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
//		log.info("폴더경로: " + pro_list.get(0).getP_up_folder());
		
		model.addAttribute("pro_list", pro_list);
		
		int total = adProductService.getTotalCount(cri);
		
		PageDTO pageDTO = new PageDTO(total, cri);
		CategoryDTO categoryDTO = new CategoryDTO(categ.getFirstCategory(), categ.getSecondCategory());
		model.addAttribute("pageMaker", pageDTO);
		model.addAttribute("categoryList", adProductService.getCategoryList());
		model.addAttribute("category", categoryDTO);
		
		if(categoryDTO.getFirstCategory() != null) {
		model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryDTO.getFirstCategory()));

//		log.info(adProductService.subCategoryList(categoryDTO.getFirstCategory()));
		}
		
//		log.info(adProductService.getCategoryList());
	}
	
	// 상품 수정 JSP
	@GetMapping("/pro_modify")
	public void pro_modify(Integer p_no, Integer categ_cd, @ModelAttribute("cri") Criteria cri, Model model) {
		ProductVO productVO = adProductService.get_modify(p_no);
		productVO.setP_up_folder(productVO.getP_up_folder().replace("\\", "/"));
		
		model.addAttribute("productVO", productVO);
		CategoryVO categoryVO = adProductService.get_category(categ_cd);
		model.addAttribute("categoryVO", categoryVO);
		model.addAttribute("categoryList", adProductService.getCategoryList());
		model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryVO.getCateg_cd()));
	}
	
	// 상품 수정 기능
	@PostMapping("/pro_modify")
	public String modify(ProductVO vo, RedirectAttributes rttr) {
		
		if(!vo.getUploadFile().isEmpty()) {
			FileUtils.deleteFile(uploadPath, vo.getP_up_folder(), vo.getP_img());
			
			String uploadDateFolder = FileUtils.getFolder();
			String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
			
			vo.setP_img(saveImageName);
			vo.setP_up_folder(uploadDateFolder); 
		}
		
		adProductService.pro_modify(vo);
		
		rttr.addFlashAttribute("msg", "pro_modify");
		
		return "redirect:/admin/product/pro_list";
	}
	
	// 상품 삭제 기능
	@PostMapping("/pro_delete")
	public String delete(ProductVO vo, RedirectAttributes rttr) {
		
		adProductService.pro_delete(vo.getP_no());
		
		rttr.addFlashAttribute("msg", "pro_delete");
		
		return "redirect:/admin/product/pro_list";
	}
	
	//선택 상품 수정 기능
	@PostMapping("/pro_checked_modify")
	@ResponseBody
	public ResponseEntity<String> pro_checked_modify(
			@RequestParam("p_no_arr[]") List<Integer> p_no_arr,
			@RequestParam("p_px_arr[]") List<Integer> p_px_arr,
			@RequestParam("p_purchasable_arr[]") List<String> p_purchasable_arr
													) {
		ResponseEntity<String> entity = null;
		
		List<ProductVO> pro_list = new ArrayList<ProductVO>();
		
		for(int i=0; i<p_no_arr.size(); i++) {
			ProductVO productVO = new ProductVO();
			productVO.setP_no(p_no_arr.get(i));
			productVO.setP_px(p_px_arr.get(i));
			productVO.setP_purchasable(p_purchasable_arr.get(i));
			
			pro_list.add(productVO);
		}
		
		adProductService.pro_checked_modify(pro_list);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	//선택 상품 삭제 기능
	@PostMapping("/pro_checked_delete")
	@ResponseBody
	public ResponseEntity<String> pro_checked_delete(@RequestParam("p_no_arr[]") List<Integer> p_no_arr) {
		ResponseEntity<String> entity = null;
		
		adProductService.pro_checked_delete(p_no_arr);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}

}
