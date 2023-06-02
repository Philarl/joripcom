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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joripcom.domain.AdOrderDetailVO;
import com.joripcom.domain.Criteria;
import com.joripcom.domain.OrderVO;
import com.joripcom.domain.PageDTO;
import com.joripcom.service.AdOrderService;
import com.joripcom.util.FileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/order/*")
@Log4j
public class AdOrderController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdOrderService adOrderService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@GetMapping("/order_list")
	public void orderList(@ModelAttribute("cri") Criteria cri, @ModelAttribute("sDate") String sDate, @ModelAttribute("eDate") String eDate, Model model) {
		
		List<OrderVO> orderList = adOrderService.orderList(cri, sDate, eDate);
		model.addAttribute("orderList", orderList);
		int total = adOrderService.getTotalCount(cri, sDate, eDate);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	@GetMapping("order_detail")
	@ResponseBody
	public ResponseEntity<List<AdOrderDetailVO>> orderDetail(Integer ord_no) {
		ResponseEntity<List<AdOrderDetailVO>> entity = null;
		
		entity = new ResponseEntity<List<AdOrderDetailVO>>(adOrderService.orderDetail(ord_no), HttpStatus.OK);
		
		return entity;
	}
	
	@GetMapping("/displayImage")
	@ResponseBody
	public ResponseEntity<byte[]> displayImage(String folderName, String fileName) throws Exception {
		
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	@PostMapping("/order_detail_product_delete")
	@ResponseBody
	public ResponseEntity<String> orderDetailProductDelete(Integer ord_no, Integer p_no) {
		ResponseEntity<String> entity = null;
		
		adOrderService.orderDetailDelete(ord_no, p_no);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	@PostMapping("/order_delete")
	public String orderDelete(Integer ord_no, RedirectAttributes rttr) {
		
		adOrderService.orderDelete(ord_no);
		return "redirect:/admin/order/order_list";
	}

}
