package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.connection.jdbc_connection;
import com.entity.signup_entity;
import com.model.promodel;

/**
 * Servlet implementation class signup_servlet
 */
@WebServlet("/signup_servlet")
public class signup_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup_servlet() {
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
		
		
		
		String firstname=request.getParameter("firstname");
		System.out.println(firstname);
		String lastname=request.getParameter("lastname");
		System.out.println(lastname);
		String email=request.getParameter("email");
		System.out.println(email);
		String password=request.getParameter("password");
		System.out.println(password);
		
		signup_entity s=new signup_entity();
		s.setFirstname(firstname);
		s.setLastname(lastname);
		s.setEmail(email);
		s.setPassword(password);
		
		
		try {
			
			promodel ps=new promodel(jdbc_connection.getConnection());
			
			boolean b=ps.user_signup(s);
			
			if(b) {
				
				
				response.sendRedirect("login.jsp");
			}
			
			
			else {
				
				response.sendRedirect("signup.jsp");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		
		
	}

}
