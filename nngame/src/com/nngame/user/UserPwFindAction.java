package com.nngame.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.encrypt.SHA256;
import com.nngame.user.dao.UserDAO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.Properties;
import java.util.Random;

public class UserPwFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();

		String user_email = request.getParameter("user_email");
		String findout = udao.findpw(user_email);

		if (findout != null) {
			request.setAttribute("findout", "이메일로 패스워드를 전송해드렸습니다.");
			request.getSession().setAttribute("findout", findout);
			
			//////////////////////////////////////////////
			String from = "qkrwnsgh345@naver.com";
			String to = user_email;
			
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.naver.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			
			//인증 번호 생성기
            StringBuffer temp =new StringBuffer();
            Random rnd = new Random();
            for(int i=0;i<10;i++)
            {
                int rIndex = rnd.nextInt(3);
                switch (rIndex) {
                case 0:
                    // a-z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                    break;
                case 1:
                    // A-Z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                    break;
                case 2:
                    // 0-9
                    temp.append((rnd.nextInt(10)));
                    break;
                }
            }
            // 일회용 비밀번호
            String oneOffPassword = "";
            
			try {
				Authenticator auth = new NaverMail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject("nngames 임시비밀번호 입니다.");
				Address fromAddr = new InternetAddress(from, "NNgame");
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				//일회용 비밀번호 부여
				oneOffPassword = temp.toString();
				
				msg.setContent("임시 비밀번호 : " + oneOffPassword, "text/html;charset=UTF8");
				Transport.send(msg);
			} catch (Exception e) {
				System.out.println("이메일 발송 오류");
			}
			//////////////////////////////////////////////
			
			System.out.println("해싱 전 비밀번호 : " + oneOffPassword);
			// 비밀번호 해싱
			oneOffPassword = SHA256.getSHA256(oneOffPassword);
			System.out.println("해싱 후 비밀번호 : " + oneOffPassword);
			
			// 해싱된 비밀번호로 db에 수정
			udao.modPw(user_email, oneOffPassword);
			
		} else {
			request.setAttribute("findout", "아이디가 없습니다.");
		}
		
		forward.setPath("/user/findpw");
		forward.setRedirect(false);
		return forward;
	}
}