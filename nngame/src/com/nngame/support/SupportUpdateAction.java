package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.support.dao.SupportDAO;
import com.nngame.support.dao.SupportDTO;
import com.nngame.user.dao.UserDTO;

public class SupportUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		// dao 선언 및 글 번호 가져옴
		String support_num = request.getParameter("support_num");
		SupportDAO sdao = new SupportDAO();
		
		// url 접근 막기 위해 user 가져옴
		HttpSession session = request.getSession();
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		SupportDTO sdto = sdao.getOneWriting(support_num);
		
		int userNum = (udto != null) ? udto.getUser_num() : -1;
		int supportUserNum = (sdto != null) ? sdto.getUser_num() : -2;
		
		// 로그인된 유저와 글 작성자가 다를경우
		if(userNum != supportUserNum) {
			forward.setRedirect(true);
			forward.setPath("/warning/approach");
		} else {									
			// 글 내용들을 업데이트 해주기위해 dto로 넘긴다.
			request.setAttribute("supportDTO", sdto);
			
			// 내용이 넘겨져야 하므로 forward 방식으로 넘겨준다.
			forward.setRedirect(false);
			forward.setPath("/support_jsp/qna_modify.jsp");
		}
		
		return forward;
	}
}
