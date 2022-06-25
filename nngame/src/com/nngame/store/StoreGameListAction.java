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
		// 전체게임리스트
		if( genre == 0 ) {
			// 게임수
			request.setAttribute("totalCnt", totalCnt);
			
			
			if( sort == null || sort.equals("ABC") ) {
				System.out.println(sort+"전체사전순");
				request.setAttribute("storegamelist", sdao.getStoreGameList());
				
			}else if( sort.equals("DESC") ){
				System.out.println(sort+"전체오름순");
				request.setAttribute("storegamelist", sdao.getSortListDESC());
				
			}else if( sort.equals("ASC") ) {
				System.out.println(sort+"전체내림순");
				request.setAttribute("storegamelist", sdao.getSortListASC());
				
			}
		
		// 장르게임리스트
		}else{
			request.setAttribute("totalCnt", genreCnt);
			if( sort == null || sort.equals("ABC") ) {
				System.out.println("장르사전순");
				request.setAttribute("storegamelist", sdao.getGenreList(genre));
				
			}else if( sort.equals("DESC") ){
				System.out.println("장르오름순");
				request.setAttribute("storegamelist", sdao.getSortGenreDESC(genre));
				
				
			}else if( sort.equals("ASC") ) {
				System.out.println("장르내림순");
				request.setAttribute("storegamelist", sdao.getSortGenreASC(genre));
				
				
			}
			
			
			
			
			
			
		}
		
		
		// forward방식으로 보내기
		forward.setRedirect(false);
		forward.setPath( request.getContextPath() + "/store.jsp" );
		
		return forward;
	}

}
