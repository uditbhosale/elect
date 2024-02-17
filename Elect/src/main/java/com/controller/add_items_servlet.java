package com.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.connection.jdbc_connection;
import com.entity.product_entity;
import com.model.promodel;

/**
 * Servlet implementation class add_items_servlet
 */
@WebServlet("/add_items_servlet")
@MultipartConfig(maxFileSize = 16177215)
public class add_items_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_items_servlet() {
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
		
		//InputStream check_image=null;
		String id2=request.getParameter("id");
		int id=0;
		id=Integer.parseInt(id2);
		System.out.println(id);
		String name=request.getParameter("product_name");
		System.out.println(name);
		String description=request.getParameter("description");
		System.out.println(description);
		InputStream inputstream=null;
		String message=null;
		Part filepart=request.getPart("image");
		System.out.println(filepart);
		if(filepart!=null) {
			System.out.println(filepart.getName());
			System.out.println(filepart.getSize());
			System.out.println(filepart.getContentType());
			inputstream=filepart.getInputStream();
		}
		String price=request.getParameter("price");
		System.out.println(price);
		String num_price=request.getParameter("price2");
		double price2=0;
		price2=Double.parseDouble(num_price);
		System.out.println(price2);
		
		
			
		
		
		
		
		
		
		try {
			
			promodel ps=new promodel(jdbc_connection.getConnection());
			
			int row=ps.insert_product(id,name,description,inputstream,price,price2);
			
			if(row>0) {
				
				response.sendRedirect("additems.jsp");
			}
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		if(inputstream!=null) {
			
			inputstream.close();
		}
		
		
		filepart.delete();
	}

}
