package com.joripcom.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.joripcom.dto.EmailDTO;

import lombok.Setter;

@Service
public class EmailServiceImpl implements EmailService {
	
	@Setter(onMethod_ = {@Autowired})
	private JavaMailSender mailSender;
	
	@Override
	public void sendMail(EmailDTO dto, String message) {
		
		
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiverMail()));
			msg.addFrom(new InternetAddress[] {new InternetAddress(dto.getSenderMail(), dto.getSenderName())});
			msg.setSubject(dto.getSubject(), "utf-8");
			msg.setText(message, "utf-8");
			
			mailSender.send(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
