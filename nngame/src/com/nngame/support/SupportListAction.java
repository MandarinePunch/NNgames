package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.support.dao.SupportDAO;

public class SupportListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		SupportDAO sdao = new SupportDAO();
		
		// board의 모든 리스트 및 개수를 받아옴
		int count = sdao.getSupportCount();
		
		// 페이징 처리
		String temp = request.getParameter("page");
		
		int page = 0;
		page = (temp == null) ? 1 : Integer.parseInt(temp);

		// 한 페이지에 10개의 글을 보여줄 것, 페이지 넘버는 5의 배수로 해줌 (이것도 넘겨줄까..? 유지보수 편하게)
		int countList = 10;
		int countPage = 5;
		
		// 페이지 열 설정(10줄)
		int endRow = page * countList;
		int startRow = endRow - 9;
		
		// 페이지 
		int startPage = (page - 1) / countPage * countPage + 1;
		int endPage = startPage + countPage - 1;
		
		int totalPage = (count - 1) / countList + 1;
		
		endPage = (endPage > totalPage) ? totalPage : endPage;
		
		// request
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", page);
		
		request.setAttribute("supportList", sdao.getBoardList(startRow, endRow));
		request.setAttribute("totalCount", count);
		
		// 경로 세팅
		forward.setRedirect(false);
		forward.setPath("/support_jsp/qna.jsp");
		
		return forward;
	}
}
