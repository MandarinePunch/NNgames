package com.nngame.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;
import com.nngame.cart.dao.CartDTO;
import com.nngame.payment.dao.PaymentDAO;
import com.nngame.user.dao.UserDTO;

public class PaymentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 결제가 완료되었을 때
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String pay_method = request.getParameter("pay_method");
		String gameNum = request.getParameter("game_num");
		
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		
		if(udto != null) {
			int user_num = udto.getUser_num();
			
			CartDAO cdao = new CartDAO();
			List<CartDTO> cartlist = cdao.getCartGamelist(user_num);
			PaymentDAO pdao = new PaymentDAO();
			
			// 게임 상세에서 바로 구매했을 경우
			if(gameNum != null) {
				int game_num = Integer.parseInt(gameNum);
				
				pdao.insertPayLog(game_num, user_num, pay_method);
				pdao.insertLibrary(game_num, user_num);
			} else {				
				// 장바구니 개수만큼 라이브러리에 넣어야하므로 for문을 돌린다
				for(CartDTO cdto : cartlist) {
					int game_num = cdto.getGame_num();
					
					pdao.insertPayLog(game_num, user_num, pay_method);
					pdao.insertLibrary(game_num, user_num);
				}
				// 결제 완료 후에는 장바구니 비워줌
				cdao.deleteAllCart(user_num);
			}
			
			forward.setPath("/payment/payOk");
		} else {
			forward.setPath("/user/login");
		}
		
		forward.setRedirect(true);
		
		return forward;
	}

}







