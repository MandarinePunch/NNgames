package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.user.dao.UserDTO;

public class SupportWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		
		if(udto != null) {
			forward.setPath("/support_jsp/qna_write.jsp");
			forward.setRedirect(false);
		} else {
			forward.setPath("/user/login");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
