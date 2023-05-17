package com.joripcom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joripcom.domain.MemberVO;
import com.joripcom.service.AdminService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	@Setter(onMethod_ = {@Autowired})
	private AdminService adminService;
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("")
	public String login() {
		return "/admin/login";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		MemberVO admin = adminService.login(vo.getU_id());
		String url = "";
		String msg = "";
		
		if(admin != null) {
			if(passwordEncoder.matches(vo.getU_pw(), admin.getU_pw())) {
				session.setAttribute("adminLoginStatus", admin);
				
//				adminService.now_visit(vo.getU_id());
				url = "/admin/admin_menu";
			}else {
				url = "/admin/";
				msg = "failPW";
			}
		}else {
			
			url = "/admin/";
			msg = "failID";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return "redirect:" + url;
	}
	
	@GetMapping("/admin_menu")
	public void admin_menu() {
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/admin/";
	}

}
