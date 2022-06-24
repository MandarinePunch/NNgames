package com.nngame.user;

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
			forward.setPath("/login/login.jsp");
		}
		
		//forward.setRedirect(false);
		forward.setRedirect(true);
		
		return forward;
	}
}
