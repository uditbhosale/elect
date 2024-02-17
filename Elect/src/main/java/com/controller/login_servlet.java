package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.jdbc_connection;
import com.entity.signup_entity;
import com.model.promodel;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String email=request.getParameter("email");
		System.out.println(email);
		
		String password=request.getParameter("password");
		System.out.println(password);
		
		
		
		signup_entity s=new signup_entity();
		s.setEmail(email);
		s.setPassword(password);
		
		
		try {	
			
			promodel ps=new promodel(jdbc_connection.getConnection());
			
			signup_entity b1=ps.user_login(email, password);
			
			if(b1!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("user_login",b1);
				
				if(email.equals("udit13022002@gmail.com")&&password.equals("123456789")){
					
					response.sendRedirect("dashboard.jsp");
				}
				else {
				response.sendRedirect("index.jsp");
				}
				
			}
			else {
				
				response.sendRedirect("login.jsp");
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
			
		}
		
		
	}

}
