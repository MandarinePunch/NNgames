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
		
		// 정렬하기
		String sort = request.getParameter("store-sort");
		
		// 보내기
		// 게임수
		request.setAttribute("totalCnt", totalCnt);
		
		// 전체게임리스트
		if( sort == null || sort.equals("ABC") ) {
			request.setAttribute("storegamelist", sdao.getStoreGameList());
		}else if( sort.equals("DESC") ){
			request.setAttribute("storegamelist", sdao.getSortListDESC());
		}else if( sort.equals("ASC") ) {
			request.setAttribute("storegamelist", sdao.getSortListASC());
		}
		
		
		
		// forward방식으로 보내기
		forward.setRedirect(false);
		forward.setPath( request.getContextPath() + "/store.jsp" );
		
		return forward;
	}

}
