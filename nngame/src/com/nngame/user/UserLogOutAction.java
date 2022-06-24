package com.nngame.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;

public class UserLogOutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		request.getSession().invalidate();
		
		forward.setRedirect(true);
		forward.setPath("/");
		
		return forward;
	}
}