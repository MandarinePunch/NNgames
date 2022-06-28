package com.nngame.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		ActionForward forward = new ActionForward();
		PrintWriter writer = null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//시퀀스, #{userid}, #{userpw}, #{usernickname}, #{userphone}, #{userbirth}, SYSDATE 
		user.setUser_email(request.getParameter("user_email"));
		user.setUser_pwd(request.getParameter("user_pwd"));
		user.setUser_nickname(request.getParameter("user_nickname"));
		user.setUser_phone(request.getParameter("user_phone"));
		user.setUser_birth(request.getParameter("user_birth"));
		
		if(udao.join(user)) {		// 회원가입 성공
			response.setContentType("text/html; charset=UTF-8");
			writer.println("<script>alert('회원가입 완료!');location.replace('/user/login');</script>"); 	
			writer.close();
			forward.setRedirect(true);
			forward.setPath("/user/login");
		} else {					// 회원가입 실패
			System.out.println("회원가입 실패 이메일 중복");
			response.setContentType("text/html; charset=UTF-8");
			writer.println("<script>alert('회원가입 실패: ERROR 이메일 중복');location.replace('/');</script>"); 	
			writer.close();
			forward.setRedirect(true);
			forward.setPath("/");
		}
		
		return forward;
	}
}
