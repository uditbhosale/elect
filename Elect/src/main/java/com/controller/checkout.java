package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.jdbc_connection;
import com.entity.orders_address;
import com.model.promodel;

/**
 * Servlet implementation class checkout
 */
@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkout() {
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
		
		
		
		try {
					String contact1=request.getParameter("contact");
					String zipcode=request.getParameter("zip");
					
					
					
					long contact=0;
					long zip=0;
					
					
					
					contact=Long.parseLong(contact1);
				    System.out.println(contact);	
					zip=Long.parseLong(zipcode);
					System.out.println(zip);
					String fullname=request.getParameter("fullname");
					System.out.println(fullname);
					String address=request.getParameter("address");
					System.out.println(address);
					String city=request.getParameter("city");
					System.err.println(city);
					String country=request.getParameter("country");
					System.out.println(country);
					
					
					orders_address o=new orders_address();
		
		
			promodel ps=new promodel(jdbc_connection.getConnection());
			
			boolean b=ps.order_address(fullname,contact,address,city,zip,country);
			
			if(b) {
				
				response.sendRedirect("paynow.jsp");
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
	
		
		}
			
			
		
	
	

			}
