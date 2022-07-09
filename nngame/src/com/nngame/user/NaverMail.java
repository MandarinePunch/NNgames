package com.nngame.user;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class NaverMail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		
		return new PasswordAuthentication("email@email.com", "password");
	}
}
