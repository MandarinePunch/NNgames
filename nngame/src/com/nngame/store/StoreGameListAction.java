package com.nngame.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.store.dao.StoreDAO;

public class StoreGameListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		StoreDAO sdao = new StoreDAO();
		
		// 전체 게임수 가져오기
		int totalCnt = sdao.getStoreGameCnt();
		
		
		// 보내기
		// 게임수
		request.setAttribute("totalCnt", totalCnt);
		
		// 전체게임리스트
		request.setAttribute("storegamelist", sdao.getStoreGameList());
		
		// forward방식으로 보내기
		forward.setRedirect(false);
		forward.setPath( request.getContextPath() + "/store.jsp" );
		
		return forward;
	}

}
