package com.nngame.gamedetail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.gamedetail.dao.GameDetailDAO;
import com.nngame.user.dao.UserDTO;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		UserDTO udto = (UserDTO) session.getAttribute("udto");
		GameDetailDAO gddao = new GameDetailDAO();
		
		String strReviewNum = request.getParameter("review_num");
		String strUserNum = request.getParameter("user_num");
		String strGameNum = request.getParameter("game_num");
		
		// 해당 리뷰 삭제를 위해
		int reviewNum = (strReviewNum != null) ? Integer.parseInt(strReviewNum) : -1;
		// 리뷰 작성자와 현재 로그인된 유저를 비교하기 위해
		int userNum = (strUserNum != null) ? Integer.parseInt(strUserNum) : -2;
		int currentUserNum = (udto != null) ? udto.getUser_num() : -1;
		// 해당 페이지로 다시 돌아가게 하기 위해
		int gameNum = (strGameNum != null) ? Integer.parseInt(strGameNum) : -1;
		
		// 작성자와 로그인된 유저가 같은지 비교
		if(userNum == currentUserNum) {
			gddao.deleteReview(reviewNum);
			
			forward.setPath("/game/detail?game_num=" + gameNum);
			forward.setRedirect(true);
		} else {
			// 이미 화면에서 작성자가 아니면 삭제버튼을 안보이게 했는데
			// 그럼에도 불구하고 여기로 왔다는 것은 url을 통한 강제 접근임
			
			forward.setPath("/warning/approach");
			forward.setRedirect(true);
		}
				
		return forward;
	}

}









