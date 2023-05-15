package com.joripcom.service;

import com.joripcom.dto.EmailDTO;

public interface EmailService {
	
	void sendMail(EmailDTO dto, String message);

}
