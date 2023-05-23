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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joripcom.domain.CartVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.MemberVO;
import com.joripcom.dto.CartDTO;
import com.joripcom.service.CartService;
import com.joripcom.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
public class CartController {
	
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@PostMapping("/cart_add")
	@ResponseBody
	public ResponseEntity<String> cart_add(CartVO vo, HttpSession session) {
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
	
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session, Model model) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		List<CartDTO> cart_list = cartService.cart_list(u_id);
		
		cart_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("cart_list", cart_list);
		if(cart_list.size() != 0) {
			model.addAttribute("cart_total_price", cartService.cart_total_price(u_id));
		}
		
	}
	
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String folderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	@PostMapping("/cart_amount_change")
	@ResponseBody
	public ResponseEntity<String> cart_amount_change(Integer cart_no, Integer cart_amt) {
		ResponseEntity<String> entity = null;
		
		if(cartService.cart_amount_change(cart_no, cart_amt) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@PostMapping("/cart_delete")
	@ResponseBody
	public ResponseEntity<String> cart_delete(Integer cart_no) {
		ResponseEntity<String> entity = null;
		
		if(cartService.cart_delete(cart_no) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	@GetMapping("/cart_empty")
	public String cart_empty(HttpSession session) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
		cartService.cart_empty(u_id);
		return "redirect:/cart/cart_list";
	}
	

}
