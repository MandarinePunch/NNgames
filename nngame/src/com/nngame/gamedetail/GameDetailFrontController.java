package com.nngame.gamedetail;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import org.apache.ibatis.session.SqlSession;

import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;
import com.nngame.cart.dao.CartDTO;
import com.nngame.support.SupportListAction;
import com.nngame.user.UserExitAction;
import com.nngame.user.UserJoinAction;
import com.nngame.user.UserLogOutAction;
import com.nngame.user.UserLoginOkAction;
import com.nngame.user.UserPwFindAction;

@WebServlet(name = "GameDetailFrontController", urlPatterns = "/game/*")
public class GameDetailFrontController extends HttpServlet{
	
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
		
		if(requestURI.equals("/game/detail")) {			
			forward = new GameDetailShowAction().execute(request, response);
			
		} else if(requestURI.equals("/game/writeReview.io")){
			forward = new ReviewWriteAction().execute(request, response);
			
		} else if(requestURI.equals("/game/reviewDelete")) {
			forward = new ReviewDeleteAction().execute(request, response);
			
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
	
