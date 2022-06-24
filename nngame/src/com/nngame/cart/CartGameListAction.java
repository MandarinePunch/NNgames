package com.nngame.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;
import com.nngame.cart.dao.CartDTO;
import com.nngame.user.dao.UserDTO;

public class CartGameListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		CartDAO cdao = new CartDAO();
		
		// 로그인된 유저의 세션을 가져옴
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		
		// 장바구니에 담은 게임 목록
		if(udto != null) {
			// 해당 유저의 장바구니만 보여주기 위해
			int user_num = udto.getUser_num();
			
			List<CartDTO> cartgamelist = cdao.getCartGamelist(user_num);
		
			// request
			request.setAttribute("cartgamelist", cartgamelist);
			
			// path
			forward.setPath("/cart.jsp");
			forward.setRedirect(false);
		} else {
			forward.setPath("/");
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
	
	
}
