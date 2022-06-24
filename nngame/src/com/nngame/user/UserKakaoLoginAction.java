package com.nngame.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserKakaoLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		
		String usernick = "Kakao_" + request.getParameter("kakaonick");
		String userid = request.getParameter("kakaoEmail");
		String userpw = "ka";
		String age = request.getParameter("kakaoage");
		String birth = request.getParameter("kakaobirth");
		String userbirth = "2099-01-01";
		
		switch(age) {
		case "1~9":
			userbirth = "2014";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "10~14":
			userbirth = "2009";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "15~19":
			userbirth = "2004";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "20~29":
			userbirth = "1994";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "30~39":
			userbirth = "1984";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "40~49":
			userbirth = "1974";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "50~59":
			userbirth = "1964";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "60~69":
			userbirth = "1954";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "70~79":
			userbirth = "1944";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "80~89":
			userbirth = "1934";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		case "90~":
			userbirth = "1924";
			userbirth += "-" + birth.substring(0,2);
			userbirth += "-" + birth.substring(2);
			break;
		}
		
		udto.setUser_email(userid);
		udto.setUser_pwd(userpw);
		udto.setUser_nickname(usernick);
		udto.setUser_phone("010-0000-0000");
		udto.setUser_birth(userbirth);
		
		PrintWriter out;

		try {

			if (udao.login(userid, userpw)) { // 로그인 성공
				System.out.println("로그인 성공");
				udto = udao.getUserData(userid);
				udto.setUser_pwd("ka");
				
				request.getSession().setAttribute("udto", udto);

				out = response.getWriter();

				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("location.replace('/');");
				out.print("</script>");
				out.flush();

			} else { // 로그인 실패시 회원가입 시작
				if (udao.join(udto)) { // 회원가입 성공
					System.out.println("카카오 연동 가입 성공");

					out = response.getWriter();
					response.setContentType("text/html; charset=utf-8");
					out.println("<script language='javascript'>");
					out.println("alert('연동 회원가입이 완료되었습니다. 다시로그인 해주세요.')");
					out.println("location.replace('/user/login');");
					out.print("</script>");
					out.flush();

				} else { // 회원가입 실패
					System.out.println("카카오 연동 가입 실패");
					out = response.getWriter();
					response.setContentType("text/html; charset=utf-8");
					out.println("<script language='javascript'>");
					out.println("alert('연동 회원가입에 실패했습니다. ERROR: 회원가입 email중복')");
					out.println("location.replace('/');");
					out.print("</script>");
					out.flush();
				}
			}
		} catch (IOException e) {
			System.out.println("카카오 연동 에러");
		}

		forward.setRedirect(true);
		return forward;
	}
}
