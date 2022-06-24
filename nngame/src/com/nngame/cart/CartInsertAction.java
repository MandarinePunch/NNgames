package com.nngame.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;
import com.nngame.user.dao.UserDTO;

public class CartInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		
		int user_num = (udto != null) ? udto.getUser_num() : -1;
		int game_num = Integer.parseInt(request.getParameter("game_num"));
		
		CartDAO cdao = new CartDAO();
		
		// 현재 유저의 장바구니에 있는 게임을 불러옴
		List<Integer> alreadyInsertGame = cdao.getGameNum(user_num);
		
		// 라이브러리도 똑같이 가져와서 이미 있는 게임이라면 못담게 해주자
		
		if(user_num != -1) {
			// 이미 있는 게임인지 확인 flag
			boolean flag = false;
			
			// 이미 있다면 flag를 true로
			for(int gameNum : alreadyInsertGame) {
				if(gameNum == game_num) {
					flag = true;
					break;
				}
			}
			
			// 장바구니에 없는 게임이라면 insert
			if(!flag) {			
				cdao.insertCart(game_num, user_num);
				request.setAttribute("success", true);	
			} else {
				request.setAttribute("success", false);
			}
			
			forward.setPath("/game/detail?game_num=" + game_num);
			forward.setRedirect(false);
		} else {
			forward.setPath("/user/login");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
