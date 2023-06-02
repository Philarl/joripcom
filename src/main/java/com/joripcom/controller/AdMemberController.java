package com.joripcom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joripcom.domain.Criteria;
import com.joripcom.domain.DropVO;
import com.joripcom.domain.MemberVO;
import com.joripcom.domain.PageDTO;
import com.joripcom.service.AdMemberService;
import com.joripcom.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/member/*")
@Log4j
public class AdMemberController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdMemberService adMemberService;
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	@GetMapping("/member_list")
	public void memberList(@ModelAttribute("cri") Criteria cri, @ModelAttribute("sDate") String sDate, @ModelAttribute("eDate") String eDate, Model model) {
		List<MemberVO> memberList = adMemberService.memberList(cri, sDate, eDate);
		model.addAttribute("memberList", memberList);
		int total = adMemberService.getTotalCount(cri, sDate, eDate);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	@GetMapping("/drop_list")
	public void dropList(@ModelAttribute("cri") Criteria cri, @ModelAttribute("sDate") String sDate, @ModelAttribute("eDate") String eDate, Model model) {
		List<DropVO> dropList = adMemberService.dropList(cri, sDate, eDate);
		model.addAttribute("dropList", dropList);
		int total = adMemberService.getTotalCount(cri, sDate, eDate);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}

}
