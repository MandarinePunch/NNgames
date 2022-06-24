package com.nngame.gamedetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.gamedetail.dao.GameDetailDAO;
import com.nngame.gamedetail.dao.GameDetailDTO;

public class GameDetailShowAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		int game_num = Integer.parseInt(request.getParameter("game_num"));
		
		GameDetailDAO gddao = new GameDetailDAO();
		GameDetailDTO gddto = gddao.getGameDetail(game_num);
		
		if(gddto != null) {			
			request.setAttribute("gameDetail", gddto);
			
			forward.setPath("/gamedetail.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}
	
}
