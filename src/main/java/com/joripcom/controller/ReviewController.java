package com.joripcom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.PageDTO;
import com.joripcom.domain.ReviewVO;
import com.joripcom.service.ReviewService;

import lombok.Setter;

@RestController
@RequestMapping("/review/*")
public class ReviewController {
	
	@Setter(onMethod_ = {@Autowired})
	private ReviewService reviewService;
	
	@GetMapping("/list/{p_no}/{page}")
	public ResponseEntity<Map<String, Object>> review_list(@PathVariable("p_no") int p_no, @PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		
		List<ReviewVO> list = reviewService.review_list(cri, p_no);
		map.put("list", list);
		
		PageDTO pageMaker = new PageDTO(reviewService.review_count(p_no), cri);
		map.put("pageMaker", pageMaker);
		
		entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReviewVO vo) {
		ResponseEntity<String> entity = null;
		
		reviewService.create(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@PatchMapping(value = "/modify", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo) {
		ResponseEntity<String> entity = null;
		
		reviewService.modify(vo);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
	}
	
	@DeleteMapping(value = "/delete/{rev_no}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("rev_no") Integer rev_no) {
		ResponseEntity<String> entity = null;
		
		reviewService.delete(rev_no);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		
		return entity;
	}

}
