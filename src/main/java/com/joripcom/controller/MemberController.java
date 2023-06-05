package com.joripcom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.joripcom.domain.MemberVO;
import com.joripcom.dto.EmailDTO;
import com.joripcom.dto.KakaoUserInfoDto;
import com.joripcom.dto.RWDTO;
import com.joripcom.service.MemberService;
import com.joripcom.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;
	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
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
	
	// 카카오 회원가입 JSP
	@GetMapping("/kakao_join")
	public void kakao_join(String kakao_id) {
		
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
		String msg_fav_dc = "";	
		
		if(member != null) {
			if(passwordEncoder.matches(vo.getU_pw(), member.getU_pw())) {
				session.setAttribute("loginStatus", member);
				
				memberService.now_visit(member.getU_id());
				url = "/";
				
				//찜 목록 할인 상품 체크
				int check_fav_dc = memberService.check_fav_dc(member.getU_id());
				
				if(check_fav_dc != 0) {
					msg_fav_dc = "isFavDC";
				}
				
				//최근 본 상품 썸네일
				String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
				if(productService.rw_list(u_id).isEmpty() == false) {
					List<RWDTO> rw_list = productService.rw_list(u_id);
					RWDTO rwThumbnail = rw_list.get(0);
					rwThumbnail.setP_up_folder(rwThumbnail.getP_up_folder().replace("\\", "/"));
					session.setAttribute("rwThumbnail", rwThumbnail);
					log.info("최근 : " + rwThumbnail);
				}
			}else {
				url = "/member/login";
				msg = "failPW";
			}
		}else {
			url = "/member/login";
			msg = "failID";
			
			log.info(member);
			log.info(vo.getU_id());
			log.info(memberService.login(vo.getU_id()));
			log.info(url);
			log.info(msg);
		}
		
		rttr.addFlashAttribute("msg", msg);
		rttr.addFlashAttribute("msg_fav_dc", msg_fav_dc);
		
		return "redirect:" + url;
	}
	
	//카카오 로그인
	@GetMapping("kakao_login")
	public String kakao_login(@RequestParam String code, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		String accessToken = getAccessToken(code);
		KakaoUserInfoDto dto = getKakaoUserInfo(accessToken);
		
		String msg_fav_dc = "";	
		
//		log.info("토큰 : " + accessToken);
		
//		log.info("유저 정보 : " + dto);
		
		String kakao_id = dto.getId().toString();
//		log.info("카카오아이디 : " + kakao_id);
		
		String url = "";
		if(memberService.idCheck(kakao_id) == null ) {
			url = "/member/kakao_join";
			rttr.addAttribute("kakao_id", kakao_id);
		}else {
			MemberVO member = memberService.login(kakao_id);
			session.setAttribute("loginStatus", member);
			session.setAttribute("kakaoLoginStatus", member);
			memberService.now_visit(kakao_id);
			url = "/";
			
			int check_fav_dc = memberService.check_fav_dc(kakao_id);
			
			if(check_fav_dc != 0) {
				msg_fav_dc = "isFavDC";
			}
			
			//최근 본 상품 썸네일
			String u_id = ((MemberVO) session.getAttribute("loginStatus")).getU_id();
			if(productService.rw_list(u_id).isEmpty() == false) {
				List<RWDTO> rw_list = productService.rw_list(u_id);
				RWDTO rwThumbnail = rw_list.get(0);
				rwThumbnail.setP_up_folder(rwThumbnail.getP_up_folder().replace("\\", "/"));
				session.setAttribute("rwThumbnail", rwThumbnail);
//				log.info("최근 : " + rwThumbnail);
			}
		}
		
		rttr.addFlashAttribute("msg_fav_dc", msg_fav_dc);
		
		return "redirect:" + url;
	}
	
	private String getAccessToken(String code) throws Exception {
		// HTTP Header 생성
		        HttpHeaders headers = new HttpHeaders();
		        headers.add("Content-type", "application/x-www-form-urlencoded");

		// HTTP Body 생성
		        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		        body.add("grant_type", "authorization_code");
		        body.add("client_id", "1401c401f827a987c8249ceec2e923ec");
		        body.add("redirect_uri", "http://localhost:8888/member/kakao_login");
		        body.add("code", code);

		// HTTP 요청 보내기
		        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(body, headers);
		        RestTemplate rt = new RestTemplate();
		        ResponseEntity<String> response = rt.exchange(
		                "https://kauth.kakao.com/oauth/token",
		                HttpMethod.POST,
		                kakaoTokenRequest,
		                String.class
		        );

		// HTTP 응답 (JSON) -> 액세스 토큰 파싱
		        String responseBody = response.getBody();
		        ObjectMapper objectMapper = new ObjectMapper();
		        JsonNode jsonNode = objectMapper.readTree(responseBody);
		        return jsonNode.get("access_token").asText();
		    }
	
	private KakaoUserInfoDto getKakaoUserInfo(String accessToken) throws Exception {
		// HTTP Header 생성
		        HttpHeaders headers = new HttpHeaders();
		        headers.add("Authorization", "Bearer " + accessToken);
		        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		        log.info("헤더 : " + headers);

		// HTTP 요청 보내기
		        HttpEntity<MultiValueMap<String, String>> kakaoUserInfoRequest = new HttpEntity<>(headers);
		        RestTemplate rt = new RestTemplate();
		        ResponseEntity<String> response = rt.exchange(
		                "https://kapi.kakao.com/v2/user/me",
		                HttpMethod.POST,
		                kakaoUserInfoRequest,
		                String.class
		        );
//		        log.info("HTTP 응답 : " + response);

		        String responseBody = response.getBody();
//		        log.info("응답 내용" + responseBody);
		        ObjectMapper objectMapper = new ObjectMapper();
		        JsonNode jsonNode = objectMapper.readTree(responseBody);
//		        log.info("json 내용 : " + jsonNode);
		        Long id = jsonNode.get("id").asLong();
//		        log.info("아이디 : " + id);
//		        String email = jsonNode.get("kakao_account")
//		                .get("email").asText();
//		        log.info("이메일 : " + email);

		        return new KakaoUserInfoDto(id);
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
		String db_u_pw = memberService.login(u_id).getU_pw();
		
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
		String db_u_pw = memberService.login(u_id).getU_pw();
		
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

		if(session.getAttribute("kakaoLoginStatus") == null) {
			if(passwordEncoder.matches(u_pw, check_u_pw)) {
				memberService.delete(u_id);
				
				body = "delete";
				session.invalidate();
			}else {
				body = "failPW";
			}
		}else {
			memberService.delete(u_id);
			
			body = "delete";
			session.invalidate();
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
		
		String u_email = memberService.findPW(vo.getU_id()).getU_email();
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
