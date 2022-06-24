package com.nngame.cart;

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

@WebServlet(name = "CartFrontController", urlPatterns = "/cart/*")
public class CartFrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
		
		if(requestURI.equals("/cart/List")) {			// 장바구니 게임 리스트
			forward = new CartGameListAction().execute(request, response);
			
		} else if(requestURI.equals("/cart/delete")) {	// 선택 게임 삭제
			forward = new CartDeleteAction().execute(request, response);
			
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
	
