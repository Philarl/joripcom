package com.joripcom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joripcom.domain.MemberVO;
import com.joripcom.dto.EmailDTO;
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
		
		return "redirect:/member/login";
	}
	
	// 로그인 JSP
	@GetMapping("/login")
	public void login() {
		
	}
	
	// 로그인 기능
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		MemberVO member = memberService.login(vo.getU_id());
		
		String url = "";
		String msg = "";
		
		if(member != null) {
			if(passwordEncoder.matches(vo.getU_pw(), member.getU_pw())) {
				session.setAttribute("loginStatus", member);
				
				memberService.now_visit(member.getU_id());
				url = "/";
			}else {
				url = "/member/login";
				msg = "failPW";
			}
		}else {
			url = "/member/login";
			msg = "failID";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 사용자 세션정보가 모두 소멸
		
		return "redirect:/";
	}
	
	@GetMapping(value = {"/modify", "/mypage"})
	public void modify(Model model, HttpSession session) {
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		
		model.addAttribute("memberVO", memberService.login(u_id));
		
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		String url = "";
		String msg = "";
		
		String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
		String db_u_pw = ((MemberVO) memberService.login(u_id)).getU_pw();
		
		if(passwordEncoder.matches(vo.getU_pw(), db_u_pw)) {
			memberService.modify(vo);
			
			msg = "modify";
			url = "/";
		}else {
			msg = "failPW";
			url = "/member/modify";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@PostMapping("/pwchange")
	@ResponseBody
	public ResponseEntity<String> pwchange(String old_u_pw, String new_u_pw, HttpSession session) {
		ResponseEntity<String> entity = null;
		String body = "";
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String u_id = vo.getU_id();
		String db_u_pw = ((MemberVO) memberService.login(u_id)).getU_pw();
		
		if(passwordEncoder.matches(old_u_pw, db_u_pw) ) {
			String enc_u_pw = passwordEncoder.encode(new_u_pw);
			memberService.pwchange(u_id, enc_u_pw);
			
			body = "success";
		}else {
			body = "failPW";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> delte(String u_pw, HttpSession session) {
		ResponseEntity<String> entity = null;
		String body = "";
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String u_id = vo.getU_id();
		String check_u_pw = vo.getU_pw();
		
		if(passwordEncoder.matches(u_pw, check_u_pw)) {
			memberService.delete(u_id);
			
			body = "delete";
			session.invalidate();
		}else {
			body = "failPW";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/findID")
	@ResponseBody
	public ResponseEntity<String> findID(EmailDTO dto, String u_email) {
		ResponseEntity<String> entity = null;
		String body = "";
		
		String u_id = memberService.findID(u_email);
		
		log.info("아이디: " + u_id + ", 이메일: " + u_email);
		
		if(memberService.findID(u_email) != null) {
			dto.setSubject("조립컴 아이디 찾기 메일입니다.");	
			memberService.sendMail(dto, u_id);
			body = "emailOn";
			
		}else {
			body = "emailOff";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("/findPW")
	@ResponseBody
	public ResponseEntity<String> findPW(EmailDTO dto, MemberVO vo, Model model) {
		ResponseEntity<String> entity = null;
		String body = "";
		String u_id = vo.getU_id();
		String tempPW = "";
		for(int i=0; i<6; i++) {
			tempPW += String.valueOf((int)(Math.random() * 10));
		}
		String new_u_pw = passwordEncoder.encode(tempPW);
		model.addAttribute("new_u_pw", new_u_pw);
		
		String u_email = ((MemberVO) memberService.findPW(vo.getU_id())).getU_email();
		dto.setReceiverMail(u_email);
		
		log.info("아이디: " + u_id + ", 이메일: " + u_email);
		
		if(memberService.findPW(u_id) != null) {
			dto.setSubject("조립컴 임시 비밀번호 메일입니다.");
			memberService.sendMail(dto, tempPW);
			memberService.tempPW(u_id, new_u_pw);
			body = "idOn";
		}else {
			body = "idOff";
		}
		
		entity = new ResponseEntity<String>(body, HttpStatus.OK);
		
		return entity;
	}

}
