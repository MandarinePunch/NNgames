package com.nngame.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;
import com.nngame.library.dao.LibraryDAO;
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
		LibraryDAO ldao = new LibraryDAO();
		
		// 현재 유저의 장바구니에 있는 게임을 불러옴
		List<Integer> alreadyInsertGame = cdao.getGameNum(user_num);
		// 라이브러리도 똑같이 가져와서 이미 있는 게임이라면 못담게 해주자
		List<Integer> alreadyInLib = ldao.getGameNum(user_num);
		
		if(user_num != -1) {
			// 이미 있는 게임인지 확인 flag
			boolean cartFlag = false;
			// 라이브러리에 있는 게임인지 확인 flag
			boolean libFlag = false;
			
			// 이미 있다면 flag를 true로
			if(alreadyInsertGame != null) {				
				for(int gameNum : alreadyInsertGame) {
					if(gameNum == game_num) {
						cartFlag = true;
						break;
					}
				}
			}
			// 이미 있다면 flag를 true로
			if(alreadyInLib != null) {				
				for(int gameNum : alreadyInLib) {
					if(gameNum == game_num) {
						libFlag = true;
						break;
					}
				}
			}
			
			// 라이브러리 및 장바구니에 해당 게임 없음
			if(!cartFlag && !libFlag) {			
				cdao.insertCart(game_num, user_num);
				request.setAttribute("success", true);
				
			// 라이브러리에 게임 존재
			} else if(libFlag) {
				request.setAttribute("success", "inLib");
				
			// 장바구니에 게임 존재
			} else if(cartFlag) {
				request.setAttribute("success", "inCart");
			
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
