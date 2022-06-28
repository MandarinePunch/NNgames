package com.nngame.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.Action;
import com.nngame.action.ActionForward;
import com.nngame.encrypt.SHA256;
import com.nngame.user.dao.UserDAO;
import com.nngame.user.dao.UserDTO;

public class UserExitAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		ActionForward forward = new ActionForward();
		
		String user_email = request.getParameter("user_email");
		// 비밀번호 해싱
		String user_pwd = SHA256.getSHA256(request.getParameter("user_pwd"));
		
		if(udao.login(user_email,user_pwd)) {		// 로그인 성공하면 회원삭제 실행
			System.out.println("패스워드 일치, 회원탈퇴 시작");
			udao.userExit(user_email);
			
			PrintWriter out;
			try {
				out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('회원탈퇴가 완료되었습니다.')");
				out.println("location.replace('/');");
				out.print("</script>");
				out.flush();
			} catch (IOException e) {
				System.out.println("탈퇴 성공 PrintWrtier 오류");
			}

			request.getSession().invalidate();	// 세션 날리기
			forward.setRedirect(true);
			forward.setPath("/");
		} else {							// 로그인 실패하면 얼럿창 띄우고 다시 mypage
			try {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('패스워드가 일치하지 않습니다.')");
				out.println("location.replace('/user/myPage');");
				out.print("</script>");
				out.flush();
			} catch (IOException e) {
				System.out.println("PrintWriter 오류");
			}

			System.out.println("패스워드 불일치");
			forward.setRedirect(true);
			forward.setPath("/myPage.jsp");
		}
		
		return forward;
	}
}