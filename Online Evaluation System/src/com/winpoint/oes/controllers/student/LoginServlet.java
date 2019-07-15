package com.winpoint.oes.controllers.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.winpoint.oes.helpers.common.LoginHelper;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {	
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws IOException 
     * @throws ServletException 
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		//extracting the parameters
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//passing parameters to helper.
		if(new LoginHelper().validateLogin(email, password)) {
			System.out.println("login success");
			System.out.println("email = " + email);
			System.out.println("password = " + password);
		}
		else {
			System.out.println("login failure");
			System.out.println("email = " + email);
			System.out.println("password = " + password);
		}
		
		
	}
}
