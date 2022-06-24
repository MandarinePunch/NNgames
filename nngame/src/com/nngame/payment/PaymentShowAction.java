package com.nngame.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDTO;

public class PaymentShowAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		
		// 로그인 여부 체크
		if(udto != null) {			
			// game_price 파라미터 가져옴
			String game_price = request.getParameter("game_price");
			String game_num = request.getParameter("game_num");
			
			request.setAttribute("game_price", game_price);
			request.setAttribute("game_num", game_num);
			
			forward.setPath("/payment_jsp/payment.jsp");
			forward.setRedirect(false);
		} else {
			forward.setPath("/user/login");
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}
