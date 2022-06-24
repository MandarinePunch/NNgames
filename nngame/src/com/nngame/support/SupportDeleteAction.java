package com.nngame.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.support.dao.SupportDAO;
import com.nngame.support.dao.SupportDTO;
import com.nngame.user.dao.UserDTO;

// 글 삭제 컨트롤러
public class SupportDeleteAction implements Action {
	
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
			// 글 삭제
			// 세션에 있는 유저 넘버 가져와서 비교후 현재 usernum가 랑 다르면 함수 실행 안되게 하기(url접근 방지)
			sdao.deleteBoard(support_num);
			
			// 삭제하면 정보를 줄 필요가 없으므로 redirect로 넘겨줌
			forward.setRedirect(true);
			forward.setPath("/support/List");
		}
		
		return forward;
	}
}
