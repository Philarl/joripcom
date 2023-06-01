package com.joripcom.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void orderList(Criteria cri, Model model) {
		
		List<OrderVO> orderList = adOrderService.orderList(cri);
		model.addAttribute("orderList", orderList);
		int total = adOrderService.getTotalCount(cri);
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

}
