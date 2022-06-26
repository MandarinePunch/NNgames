package com.nngame.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.gamedetail.dao.GameDetailDAO;
import com.nngame.support.dao.SupportDAO;
import com.nngame.support.dao.SupportDTO;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserModAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		UserDAO udao = new UserDAO();
		UserDTO udto = new UserDTO();
		SupportDAO sdao = new SupportDAO();
		
		int user_num = 0;
		
		// 고객지원 닉네임도 같이 업데이트 해주기 위해
		if(udto != null) {
			user_num = ((UserDTO) session.getAttribute("udto")).getUser_num();
		}
		
		String user_email = request.getParameter("user_email");
		String user_nickname = request.getParameter("user_nickname");
		String user_phone = request.getParameter("user_phone");
		
		// 유저 정보 및 고객지원 닉네임 업데이트
		udao.usermod(user_email, user_nickname, user_phone);
		sdao.updateUserName(user_nickname, user_num);
		
		udto = udao.getUserData(user_email);
		
		String isLinked = udao.isLinkUser(user_email);
		if(isLinked.equals("ka") || isLinked.equals("na")) {
			System.out.println("연동유저, 연동 파라미터값 부여됨");
			udto.setUser_pwd(isLinked);
		} else {
			System.out.println("연동 유저 아님");
		}
		
		System.out.println(udto);
		
		session.setAttribute("udto", udto);
		forward.setPath("/");
		
		forward.setRedirect(true);
		return forward;
	}
}