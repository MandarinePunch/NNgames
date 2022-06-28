package com.nngame.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String userid = request.getParameter("user_email");
		String userpw = request.getParameter("user_pwd");
		
		if(udao.login(userid,userpw)) {		// 로그인 성공
			System.out.println("로그인 성공");
			udto = udao.getUserData(userid);
			System.out.println(udto);
			System.out.println(udto.getUser_email());
			
			request.getSession().setAttribute("udto", udto);
			forward.setPath("/");
		} else {							// 로그인 실패
			System.out.println("로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
			writer.println("<script>alert('아이디 또는 비밀번호를 확인해주세요.');location.replace('/user/login');</script>"); 	
			writer.close();
			forward.setPath("/user/login");
		}
		
		//forward.setRedirect(false);
		forward.setRedirect(true);
		
		return forward;
	}
}
