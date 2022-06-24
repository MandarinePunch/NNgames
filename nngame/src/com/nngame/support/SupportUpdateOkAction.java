package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.support.dao.SupportDAO;
import com.nngame.support.dao.SupportDTO;

// 업데이트 버튼을 누르면 실행되는 컨트롤러
public class SupportUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		SupportDAO sdao = new SupportDAO();
		SupportDTO sdto = new SupportDTO();
		
		// 이 컬럼이 필요합니다..
		String support_writer = request.getParameter("support_writer");
		
		// 업데이트 할 내용들을 dto에 담아준다.
		sdto.setSupport_num(Integer.parseInt(request.getParameter("support_num")));
		sdto.setSupport_type(request.getParameter("support_type"));
		sdto.setSupport_title(request.getParameter("support_title"));
		sdto.setSupport_content(request.getParameter("support_content"));
		
		// 업데이트
		sdao.updateBoard(sdto);
		
		// 업데이트 뒤에는 데이터를 따로 뿌려줄 필요가 없어 redirect로
		forward.setRedirect(true);
		forward.setPath("/support/List");
		
		return forward;
	}
}
