package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.order;
import com.entity.signup_entity;

/**
 * Servlet implementation class buynow
 */
@WebServlet("/buynow")
public class buynow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buynow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try(PrintWriter out=response.getWriter()){
			SimpleDateFormat formatter =new SimpleDateFormat("yyyy-mm-dd");
			Date date=new Date();
			HttpSession session1 =request.getSession();
       	 signup_entity s1=(signup_entity)session1.getAttribute("userlogin");
			if(s1!=null) {
				int id=Integer.parseInt(request.getParameter("id"));
				
				
				
				order o=new order();
				o.setId(id);
				o.setUid(s1.getId());
				
				o.setDate(formatter.format(date));
				
			}
			else {
				response.sendRedirect("login.jsp");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
