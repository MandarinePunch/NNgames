package com.nngame.search;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.search.dao.SearchDAO;

public class SearchGameListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		SearchDAO sdao = new SearchDAO();
		
		//param 받기
		String keyword = request.getParameter("searchTerm");
		
		// 검색된 게임수 가져오기
		int totalCnt = sdao.getSearchGameCnt(keyword);
		// 정렬하기
		String sort = request.getParameter("store-sort");
		
		// 보내기
		// 검색어
		request.setAttribute("keyword",keyword);
		
		// 게임수
		request.setAttribute("totalCnt",totalCnt);
		
		// 정렬
		request.setAttribute("sort", sort);
		
		// 검색된 게임리스트
		if( sort == null || sort.equals("ABC") ) {
			request.setAttribute("gamelist", sdao.getSearchGameList(keyword));
			
		}else if( sort.equals("DESC") ){
			request.setAttribute("gamelist", sdao.getSearchListDESC(keyword));
			
		}else if( sort.equals("ASC") ) {
			request.setAttribute("gamelist", sdao.getSearchListASC(keyword));
			
		}else if( sort.equals("DISCOUNT")){
			totalCnt = sdao.getSearchDiscountCnt(keyword);
			request.setAttribute("totalCnt",totalCnt);
			
			request.setAttribute("gamelist", sdao.getSearchDiscount(keyword));
			
		}
		
		
		
		
		// forward방식으로 보내기
		forward.setRedirect(false);
		forward.setPath( request.getContextPath() + "/search.jsp" );
		
		return forward;
	}

}
