package com.nngame.search;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nngame.action.ActionForward;
import com.nngame.store.StoreGameListAction;
import com.nngame.store.StoreGenreListAction;

@WebServlet(name = "SearchFrontController", urlPatterns = "/search/*")
public class SearchFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String requestURI = request.getRequestURI();
		ActionForward forward = null;
		
	
		switch(requestURI) {
			case "/search/Searchgamelist":
				forward = new SearchGameListAction().execute(request, response);
				break;
			
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
