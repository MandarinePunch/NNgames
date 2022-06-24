package com.nngame.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.store.dao.StoreDAO;

public class StoreGenreListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		StoreDAO sdao = new StoreDAO();
		
		
		// 장르별 선택시 param
		int genre = Integer.parseInt( request.getParameter("genre") );
		
		// 장르별 게임수 가져오기
		int totalCnt = sdao.getGenreCnt(genre);
		
		
		// 보내기
		// 게임수
		request.setAttribute("totalCnt", totalCnt);
		
		// 장르게임리스트
		
		
		
		
		// forward방식으로 보내기
		forward.setRedirect(false);
		forward.setPath( request.getContextPath() + "/store.jsp" );
		
		
		
		
		return forward;
	}

}
