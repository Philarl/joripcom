package com.joripcom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joripcom.domain.MemberVO;
import com.joripcom.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	//아이디 중복체크
	@GetMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String u_id) {
		ResponseEntity<String> entity = null;
		
		String isUse = "";
		if(memberService.idCheck(u_id) != null) {
			isUse = "no";
		}else {
			isUse = "yes";
		}
		
		entity = new ResponseEntity<String>(isUse, HttpStatus.OK);
		
		return entity;
	}
	
	// 회원가입 JSP
	@GetMapping("/join")
	public void join() {
		
	}
	
	// 회원가입 기능
	@PostMapping("/join")
	public String join(MemberVO vo) {
		
		vo.setU_pw(passwordEncoder.encode(vo.getU_pw()));
		
		memberService.join(vo);
		
		return "redirect:/login";
	}
	
	// 로그인 JSP
	@GetMapping("/login")
	public void login() {
		
	}
	
	// 로그인 기능
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		return "redirect:/";
	}

}
