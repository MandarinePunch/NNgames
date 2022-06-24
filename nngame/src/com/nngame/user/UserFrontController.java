package com.nngame.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.ActionForward;

@WebServlet(name = "UserFrontController", urlPatterns = "/user/*")
public class UserFrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		ActionForward forward = null;

		if(requestURI.equals("/user/userJoin.io")) {
			forward = new UserJoinAction().execute(request, response);
		} else if(requestURI.equals("/user/userLoginOk.io")) {
			forward = new UserLoginOkAction().execute(request, response);
		} else if(requestURI.equals("/user/userPwFind")) {
			forward = new UserPwFindAction().execute(request, response);
		} else if(requestURI.equals("/user/userLogout.io")) {
			forward = new UserLogOutAction().execute(request, response);
		} else if(requestURI.equals("/user/userExit.io")) {
			new UserExitAction().execute(request, response);
		} else if(requestURI.equals("/user/userMod.io")) {
			forward = new UserModAction().execute(request, response);
		} else if(requestURI.equals("/user/userModPw.io")) {
			new UserModPwAction().execute(request, response);
		} else if(requestURI.equals("/user/kakaoLogin.io")) {
			new UserKakaoLoginAction().execute(request, response);
		}
		
		if(forward != null) {			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
}
