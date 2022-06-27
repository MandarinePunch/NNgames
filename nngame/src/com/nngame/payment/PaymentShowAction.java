package com.nngame.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.cart.dao.CartDAO;
import com.nngame.library.dao.LibraryDAO;
import com.nngame.library.dao.LibraryDTO;
import com.nngame.user.dao.UserDTO;

public class PaymentShowAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 결제 전 입력 화면
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		LibraryDAO ldao = new LibraryDAO();
		// 고민...
		CartDAO cdao = new CartDAO();
		
		String isCart = request.getParameter("isCart");
		String game_price = request.getParameter("game_price");
		String game_discount = request.getParameter("game_discount");
		
		// 로그인 여부 체크
		if(udto != null) {
			
			// 게임 상세에서 바로 접근
			if(isCart == null) {
				boolean libFlag = false;
				boolean cartFlag = false;
				int user_num = udto.getUser_num();
				// 라이브러리 및 장바구니에 이미 있는 게임 체크를 위해
				List<Integer> alreadyInLib = ldao.getGameNum(user_num);
				List<Integer> alreadyInCart = cdao.getGameNum(user_num);
				
				int game_num = Integer.parseInt(request.getParameter("game_num"));
				
				// 라이브러리에 있는지 체크
				if(alreadyInLib != null) {					
					for(int gameNum : alreadyInLib) {
						if(game_num == gameNum) {
							libFlag = true;
							break;
						}
					}
				}
				// 카트에 있는지 체크
				if(alreadyInCart != null) {					
					for(int gameNum : alreadyInCart) {
						if(game_num == gameNum) {
							cartFlag = true;
							break;
						}
					}
				}
				
				// 라이브러리 및 장바구니에 해당 게임 없음
				if(!libFlag && !cartFlag) {
					request.setAttribute("game_price", game_price);
					request.setAttribute("game_num", game_num);
					request.setAttribute("game_discount", game_discount);
					forward.setPath("/payment_jsp/payment.jsp");
					
				// 라이브러리에 게임 존재
				} else if(libFlag){	
					request.setAttribute("success", "inLib");
					forward.setPath("/game/detail?game_num=" + game_num);
					
				// 장바구니에 게임 존재
				} else if(cartFlag) {
					request.setAttribute("success", "inCart");
					forward.setPath("/game/detail?game_num=" + game_num);
				}
				
			// 장바구니에서 접근
			} else {
				request.setAttribute("game_price", game_price);
				request.setAttribute("game_discount", game_discount);
				
				forward.setPath("/payment_jsp/payment.jsp");
			}
			
			forward.setRedirect(false);
			
		} else {
			forward.setPath("/user/login");
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}
