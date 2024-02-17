package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.jdbc_connection;
import com.entity.product_entity;
import com.model.promodel;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		String searchTerm = request.getParameter("term");
        System.out.println(searchTerm);
        
        try {
            System.out.println("Before search_items");
            promodel ps = new promodel(jdbc_connection.getConnection());
            List<product_entity> l1 = ps.search_items(searchTerm, searchTerm);
            
            System.out.println("After search_items");
            
            request.setAttribute("searchResults", l1);
            request.setAttribute("searchTerm", searchTerm);

            RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
            dispatcher.forward(request, response);


            	
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
		
	}

}
