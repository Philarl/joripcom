package com.joripcom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joripcom.domain.MemberVO;
import com.joripcom.dto.CartDTO;
import com.joripcom.service.CartService;
import com.joripcom.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderController {
	
	@Setter(onMethod_ = {@Autowired})
	private OrderService orderService;
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	
	@GetMapping("/order_info")
	public void order_info(HttpSession session, Model model) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
		List<CartDTO> cart_list = cartService.cart_list(u_id);
		
		cart_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("cart_total_price", cartService.cart_total_price(u_id));
	}

}
