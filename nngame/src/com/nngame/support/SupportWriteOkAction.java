package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.support.dao.SupportDAO;
import com.nngame.support.dao.SupportDTO;
import com.nngame.user.dao.UserDTO;

public class SupportWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		// 수정중(세션 수정되면 여기도 바꾸자)
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		// udto가 null 이 아니면, 즉 로그인이 되어있으면
		if(udto != null) {
			SupportDAO sdao = new SupportDAO();
			SupportDTO sdto = new SupportDTO();
			
			sdto.setSupport_type(request.getParameter("support_type"));
			sdto.setSupport_title(request.getParameter("support_title"));
			sdto.setSupport_content(request.getParameter("support_content"));
			
			//udto에 있는 username, usernum 가져올것
			sdto.setUser_num(udto.getUser_num());
			sdto.setSupport_writer(udto.getUser_nickname());
			
			//dao 실행
			sdao.insertBoard(sdto);
			
			int num = sdao.getDetailNum();
			
			//경로 목록으로 해줄지 다른 페이지를 만들어서 처리해줄지 고민해보자
			forward.setPath("/support/detail?support_num=" + num);
		} else {
			// 로그인 페이지로 이동시킬것
			forward.setPath("/support/List");
		}
		
		forward.setRedirect(true);
		
		return forward;
	}

}












