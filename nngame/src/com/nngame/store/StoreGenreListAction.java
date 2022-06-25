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
//		int genre = Integer.parseInt( request.getParameter("genre") );
//		
//		// 장르별 게임수 가져오기
//		int totalCnt = sdao.getGenreCnt(genre);
//		
//		// 정렬하기
//		String sort = request.getParameter("store-sort");
//		
//		// 보내기
//		// 게임수
//		request.setAttribute("totalCnt", totalCnt);
//		
//		// 장르게임리스트
//		
//		if( sort == null || sort.equals("ABC") ) {
//			System.out.println("장르사전순");
//			request.setAttribute("storegamelist", sdao.getGenreList(genre));
//			
//		}else if( sort.equals("DESC") ){
//			System.out.println("장르오름순");
//			request.setAttribute("storegamelist", sdao.getSortGenreDESC(genre));
//			
//			
//		}else if( sort.equals("ASC") ) {
//			System.out.println("장르내림순");
//			request.setAttribute("storegamelist", sdao.getSortGenreASC(genre));
//			
//			
//		}
//		
//		
//		
//		
//		
//		// forward방식으로 보내기
//		forward.setRedirect(false);
//		forward.setPath( request.getContextPath() + "/store.jsp" );
		
		
		
		
		return forward;
	}

}
