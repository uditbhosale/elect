package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.print.DocFlavor.STRING;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.jdbc_connection;
import com.entity.orders_address;
import com.entity.product_entity;
import com.model.promodel;
import com.mysql.cj.Session;

/**
 * Servlet implementation class checkaddress
 */
@WebServlet("/checkaddress")
public class checkaddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkaddress() {
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
		
		try (PrintWriter out=response.getWriter()){
			Date currentDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date = dateFormat.format(currentDate);
			System.out.println("Current date: " + date);
			
			promodel ps1=new promodel(jdbc_connection.getConnection());
			List<orders_address> b1=ps1.display_details();
			int userId=Integer.parseInt(request.getParameter("userId"));
			System.out.println(userId);
			double price=Double.parseDouble(request.getParameter("price"));
			System.out.println(price);
			double totalprice=Double.parseDouble(request.getParameter("totalprice"));
			HttpSession session = request.getSession();
			session.setAttribute("totalprice",totalprice);
			ArrayList<product_entity> cartList=(ArrayList<product_entity>)session.getAttribute("cart-list");
				
			 boolean orderPlaced = ps1.placeOrder(cartList, userId, date, price);
			 request.setAttribute("cart_list", cartList);
			 
			 for(product_entity p:cartList) {
				 
				 System.out.println(p.getPrice2());
			 }
			 
			 if(orderPlaced==true) {
				 System.out.println("Inserted in pre_order");
			 }
			if (b1.isEmpty()) {
		        response.sendRedirect("address.jsp");
		    }
			
			for (orders_address od : b1) {
				
				if(od.getId()>0) {
					
					out.println(od.getId());
					
					response.sendRedirect("address_submit.jsp");
				}
				
				
				
			
		}
			

			
		
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
