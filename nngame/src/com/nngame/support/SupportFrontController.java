package com.nngame.support;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.ActionForward;

@WebServlet(name = "SupportFrontController", urlPatterns = "/support/*")
public class SupportFrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
		
		if(requestURI.equals("/support/List")) {			// 고객지원 목록
			forward = new SupportListAction().execute(request, response);
			
		} else if(requestURI.equals("/support/detail")) {	// 고객지원 글 상세
			forward = new SupportDetailAction().execute(request, response);
			
		} else if(requestURI.equals("/support/delete")) {	// 고객지원 글 삭제
			forward = new SupportDeleteAction().execute(request, response);
			
		} else if(requestURI.equals("/support/update")) {	// 고객지원 글 수정
			forward = new SupportUpdateAction().execute(request, response);
			
		} else if(requestURI.equals("/support/updateOk.io")) {	// 고객지원 글 수정 성공
			forward = new SupportUpdateOkAction().execute(request, response);
			
		} else if(requestURI.equals("/support/insert")) {	// 고객지원 글 작성(단순 경로 지정)
			forward = new ActionForward(false, "/support_jsp/qna_write.jsp");
			
		} else if(requestURI.equals("/support/insertOk.io")) {	// 고객지원 글 작성 성공
			forward = new SupportWriteOkAction().execute(request, response);
			
		}
		
		if(forward != null) {			
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
	}
}








