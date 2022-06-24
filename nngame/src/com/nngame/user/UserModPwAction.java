package com.nngame.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserModPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		
		String user_email = request.getParameter("modid");
		String user_beforepw = request.getParameter("modpw");
		String user_pwd = request.getParameter("modnewpw");
		
		PrintWriter out;
		
		try {
			if (udao.login(user_email, user_beforepw)) {
				udao.modPw(user_email, user_pwd);
				
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('비밀번호가 변경되었습니다.')");
				out.println("location.replace('/myPage.jsp');");
				out.print("</script>");
				out.flush();
			} else {
				System.out.println("패스워드 변경 유저정보 검색 실패");
				
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('현재 비밀번호가 일치하지 않습니다.')");
				out.println("location.replace('/myPage.jsp');");
				out.print("</script>");
				out.flush();
			}
		} catch (IOException e) {
			System.out.println("Pw변경 PrintWriter 에러");
		}
		
		forward.setPath("/myPage.jsp");
		forward.setRedirect(true);
		return forward;
	}
}