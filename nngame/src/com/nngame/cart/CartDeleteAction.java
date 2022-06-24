package com.nngame.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;

public class CartDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		CartDAO cdao = new CartDAO();
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		
		if(cdao.deleteCart(cart_num)) {
			forward.setPath("/cart/List");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
