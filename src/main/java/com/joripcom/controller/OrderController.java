package com.joripcom.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joripcom.domain.MemberVO;
import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PaymentVO;
import com.joripcom.dto.CartDTO;
import com.joripcom.kakaopay.ApproveResponse;
import com.joripcom.kakaopay.ReadyResponse;
import com.joripcom.service.CartService;
import com.joripcom.service.KakaoPayService;
import com.joripcom.service.MemberService;
import com.joripcom.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
public class OrderController {

	@Resource(name = "cid")
	private String cid;
	
	@Setter(onMethod_ = {@Autowired})
	private OrderService orderService;
	@Setter(onMethod_ = {@Autowired})
	private CartService cartService;
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	@Setter(onMethod_ = {@Autowired})
	private KakaoPayService kakaoPayService;
	
	@GetMapping("/order_info")
	public void order_info(HttpSession session, Model model) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
		List<CartDTO> cart_list = cartService.cart_list(u_id);
		
		cart_list.forEach(vo -> {
			vo.setP_up_folder(vo.getP_up_folder().replace("\\", "/"));
		});
		
		String order_productName = cart_list.get(0).getP_name() + "외 " + (cart_list.size() - 1) + "건";
		model.addAttribute("order_productName", order_productName);
		model.addAttribute("cart_list", cart_list);
		model.addAttribute("cart_total_price", cartService.cart_total_price(u_id));
		model.addAttribute("memberVO", memberService.login(u_id));
	}

	@GetMapping("/orderReady")
	public ReadyResponse orderReady(String pay_type, String order_productName, OrderVO o_vo, PaymentVO p_vo, HttpSession session) {
		ReadyResponse readyResponse = new ReadyResponse();
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
		o_vo.setU_id(u_id);
		p_vo.setU_id(u_id);
		
		log.info("주문정보 : " + o_vo);
		log.info("결제정보 : " + p_vo);
		log.info(pay_type);
		
		if(pay_type.equals("kakaopay")) {
			
			p_vo.setPay_bank("kakaopay");
			p_vo.setPay_user(p_vo.getU_id());
			
			orderService.order_save(o_vo, p_vo);

			String approval_url = "http://localhost:8888/order/orderApproval";
			String cancel_url = "http://localhost:8888/order/orderCancel";
			String fail_url = "http://localhost:8888/order/orderFail";
			log.info(approval_url + ", " + cancel_url + ", " + fail_url);
			
			readyResponse = kakaoPayService.payReady(cid, o_vo.getOrd_no(), u_id, order_productName, 1, o_vo.getOrd_sum(), 0, approval_url, cancel_url, fail_url);
			
			log.info("요청정보 : " + readyResponse);
			log.info("결제고유번호(tid): " + readyResponse.getTid());
			log.info("결제요청URL(QR코드): " + readyResponse.getNext_redirect_pc_url());
			
			session.setAttribute("tid", readyResponse.getTid());
			session.setAttribute("ord_no", o_vo.getOrd_no());
		}else if(pay_type.equals("bank")) {
			orderService.order_save(o_vo, p_vo);
		}
		
		return readyResponse;
	}
	
	@GetMapping("/orderApproval")
	public String orderApproval(String pg_token, HttpSession session) {
		String tid = (String) session.getAttribute("tid");
		session.removeAttribute("tid");
		Integer ord_no = (Integer) session.getAttribute("ord_no");
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
//		ApproveResponse approveResponse = kakaoPayService.payApprove(cid, tid, ord_no, u_id, pg_token);
		
		return "redirect:/order/order_complete";
	}
}
