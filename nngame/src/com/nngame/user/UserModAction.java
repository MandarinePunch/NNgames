package com.nngame.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserModAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		
		String user_email = request.getParameter("user_email");
		String user_nickname = request.getParameter("user_nickname");
		String user_phone = request.getParameter("user_phone");
		
		udao.usermod(user_email, user_nickname, user_phone);
		
		udto = udao.getUserData(user_email);
		
		String isLinked = udao.isLinkUser(user_email);
		if(isLinked.equals("ka") || isLinked.equals("na")) {
			System.out.println("연동유저, 연동 파라미터값 부여됨");
			udto.setUser_pwd(isLinked);
		} else {
			System.out.println("연동 유저 아님");
		}
		
		System.out.println(udto);
		
		request.getSession().setAttribute("udto", udto);
		forward.setPath("/");
		
		forward.setRedirect(true);
		return forward;
	}
}