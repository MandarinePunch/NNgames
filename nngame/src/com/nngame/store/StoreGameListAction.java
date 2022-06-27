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
		
		// param 가져오기
		int genre = Integer.parseInt( request.getParameter("genre") );

		// 전체 게임수 가져오기
		int totalCnt = sdao.getStoreGameCnt();
		int genreCnt = sdao.getGenreCnt(genre);
		
		// 정렬하기
		String sort = request.getParameter("store-sort");
		
		// 보내기
		// 정렬
		request.setAttribute("sort", sort);
		// 장르
		request.setAttribute("genre", genre);
		
		// 전체게임리스트
		if( genre == 0 ) {
			// 게임수
			request.setAttribute("totalCnt", totalCnt);
			
			if( sort == null || sort.equals("ABC") ) {
				request.setAttribute("gamelist", sdao.getStoreGameList());
				
			}else if( sort.equals("DESC") ){
				request.setAttribute("gamelist", sdao.getSortListDESC());
				
			}else if( sort.equals("ASC") ) {
				request.setAttribute("gamelist", sdao.getSortListASC());
				
			}
		
		// 장르게임리스트
		}else{
			// 장르게임수
			request.setAttribute("totalCnt", genreCnt);
			
			if( sort == null || sort.equals("ABC") ) {
				request.setAttribute("gamelist", sdao.getGenreList(genre));
				
			}else if( sort.equals("DESC") ){
				request.setAttribute("gamelist", sdao.getSortGenreDESC(genre));
				
			}else if( sort.equals("ASC") ) {
				request.setAttribute("gamelist", sdao.getSortGenreASC(genre));
				
				
			}
			
			
			
			
			
			
		}
		
		
		// forward방식으로 보내기
		forward.setRedirect(false);
		forward.setPath( request.getContextPath() + "/store.jsp?sort="+sort );
		
		return forward;
	}

}
