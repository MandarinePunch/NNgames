package com.nngame.gamedetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.gamedetail.dao.GameDetailDAO;
import com.nngame.user.dao.UserDTO;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		GameDetailDAO gddao = new GameDetailDAO();
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		
		int gameNum = Integer.parseInt(request.getParameter("game_num"));
		String strStarRate = request.getParameter("rating");
		
		// 별점
		int starRate = (strStarRate != null) ? Integer.parseInt(strStarRate) : 0;
		
		// 리뷰 내용
		String reviewContent = request.getParameter("review_content");
		
		// 유저 로그인 여부 체크
		if(udto != null) {
			int userNum = udto.getUser_num();
			
			// 리뷰 테이블에 insert
			gddao.insertReview(gameNum, userNum, reviewContent, starRate);
			
			forward.setPath("/game/detail?game_num=" + gameNum);
		} else {
			forward.setPath("/user/login");
		}
		
		forward.setRedirect(true);
		
		return forward;
	}

}











