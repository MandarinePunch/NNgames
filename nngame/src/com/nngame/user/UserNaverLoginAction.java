package com.nngame.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserNaverLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		
		String usernick = "Naver_" + request.getParameter("navernick");
		String userid = request.getParameter("naverEmail");
		String userpw = "na";
		String age = request.getParameter("naverage");
		String birth = request.getParameter("naverbirth");
		String userbirth = age + "-" + birth;
		String phone = request.getParameter("naverphone");
		
		udto.setUser_email(userid);
		udto.setUser_pwd(userpw);
		udto.setUser_nickname(usernick);
		udto.setUser_phone(phone);
		udto.setUser_birth(userbirth);
		
		PrintWriter out;

		try {

			if (udao.login(userid, userpw)) { // 로그인 성공
				System.out.println("로그인 성공");
				udto = udao.getUserData(userid);
				udto.setUser_pwd("na");
				
				request.getSession().setAttribute("udto", udto);

				out = response.getWriter();

				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("location.replace('/');");
				out.print("</script>");
				out.flush();

			} else { // 로그인 실패시 회원가입 시작
				if (udao.join(udto)) { // 회원가입 성공
					System.out.println("네이버 연동 가입 성공");

					out = response.getWriter();
					response.setContentType("text/html; charset=utf-8");
					out.println("<script language='javascript'>");
					out.println("alert('연동 회원가입이 완료되었습니다. 다시로그인 해주세요.')");
					out.println("location.replace('/user/login');");
					out.print("</script>");
					out.flush();

				} else { // 회원가입 실패
					System.out.println("네이버 연동 가입 실패");
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
			System.out.println("네이버 연동 에러");
		}

		forward.setRedirect(true);
		return forward;
	}
}
