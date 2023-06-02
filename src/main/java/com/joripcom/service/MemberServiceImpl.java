package com.joripcom.service;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.joripcom.domain.MemberVO;
import com.joripcom.dto.EmailDTO;
import com.joripcom.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private JavaMailSender mailSender;

	@Override
	public String idCheck(String u_id) {
		
		return memberMapper.idCheck(u_id);
	}

	@Override
	public void join(MemberVO vo) {
		memberMapper.join(vo);
		
	}

	@Override
	public MemberVO login(String u_id) {
		
		return memberMapper.login(u_id);
	}

	@Override
	public void now_visit(String u_id) {
		memberMapper.now_visit(u_id);
		
	}

	@Override
	public void modify(MemberVO vo) {
		memberMapper.modify(vo);
		
	}

	@Override
	public void pwchange(String u_id, String new_u_pw) {
		memberMapper.pwchange(u_id, new_u_pw);
		
	}

	@Override
	public void delete(String u_id) {
		memberMapper.delete(u_id);
		
	}

	@Override
	public String findID(String u_email) {
		
		return memberMapper.findID(u_email);
	}

	@Override
	public void sendMail(EmailDTO dto, String message) {
		
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiverMail()));
			msg.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			msg.setSubject(dto.getSubject(), "utf-8");
			msg.setText(message, "utf-8");
			
			mailSender.send(msg);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

	@Override
	public MemberVO findPW(String u_id) {
		
		return memberMapper.findPW(u_id);
	}

	@Override
	public void tempPW(String u_id, String new_u_pw) {
		memberMapper.tempPW(u_id, new_u_pw);
		
	}

	@Override
	public int check_fav_dc(String u_id) {
		
		return memberMapper.check_fav_dc(u_id);
	}

//	TODO : Transactional로 회원 탈퇴 -> 탈퇴 회원 목록 추가 기능 묶기
	@Override
	public void add_drop(MemberVO vo) {
		memberMapper.add_drop(vo);
		
	}

}
