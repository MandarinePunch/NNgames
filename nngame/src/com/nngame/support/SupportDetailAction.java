package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.support.dao.SupportDAO;
import com.nngame.support.dao.SupportDTO;


public class SupportDetailAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String support_num = request.getParameter("support_num");
		
		// 선택한 게시글의 정보를 받아옴
		SupportDAO sdao = new SupportDAO();
		SupportDTO sdto = sdao.getOneWriting(support_num);
		
		request.setAttribute("supportDTO", sdto);
		
		// 정보를 불러와야 하기에 forward 방식으로 넘겨줌
		forward.setRedirect(false);
		forward.setPath("/support_jsp/qna_detail.jsp");
		
		return forward;
	}
}
