package com.joripcom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.joripcom.dto.EmailDTO;
import com.joripcom.service.EmailService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/email/*")
public class EmailController {
	
	@Setter(onMethod_ = {@Autowired})
	private EmailService emailService;
	
	
	@GetMapping("/send")
	public ResponseEntity<String> send(EmailDTO dto, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		String authCode = "";
		for(int i=0; i<6; i++) {
			authCode += String.valueOf((int)(Math.random() * 10));
		}
		
		log.info("인증코드: " + authCode);
		
		session.setAttribute("authCode", authCode);
		
		try {
			emailService.sendMail(dto, authCode);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@GetMapping("/comfirmAuthcode")
	public ResponseEntity<String> confirmAuthCode(String authCode, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		String confirm_authCode = (String) session.getAttribute("authCode");
		
		if(authCode.equals(confirm_authCode)) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			session.removeAttribute("authCode");
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}

}
