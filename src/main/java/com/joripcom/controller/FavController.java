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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joripcom.domain.CartVO;
import com.joripcom.domain.FavoriteVO;
import com.joripcom.domain.MemberVO;
import com.joripcom.dto.FavDTO;
import com.joripcom.service.CartService;
import com.joripcom.service.FavService;
import com.joripcom.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/fav/*")
public class FavController {
	
	@Setter(onMethod_ = {@Autowired})
	private FavService favService;
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@PostMapping("/fav_add")
	@ResponseBody
	public ResponseEntity<String> fav_add(FavoriteVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		vo.setU_id(u_id);
		
		if(favService.fav_add(vo) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/fav_list")
	public void fav_list(HttpSession session, Model model) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		List<FavDTO> fav_list = favService.fav_list(u_id);
		
		fav_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("fav_list", fav_list);
		
	}
	
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String folderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	@PostMapping("/fav_add_cart")
	@ResponseBody
	public ResponseEntity<String> fav_add_cart(CartVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		vo.setU_id(u_id);
		
		if(cartService.cart_add(vo) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PostMapping("/fav_delete")
	@ResponseBody
	public ResponseEntity<String> fav_delete(Integer fav_no) {
		ResponseEntity<String> entity = null;
		
		if(favService.fav_delete(fav_no) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/fav_empty")
	public String fav_empty(HttpSession session) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
		favService.fav_empty(u_id);
		return "redirect:/fav/fav_list";
	}
}
