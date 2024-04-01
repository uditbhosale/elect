package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.product_entity;

/**
 * Servlet implementation class RemoveProduct
 */
@WebServlet("/RemoveProduct")
public class RemoveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try(PrintWriter out=response.getWriter()) {
			
			String id1=request.getParameter("id");
			int id=Integer.parseInt(id1);
            HttpSession session = request.getSession();
            ArrayList<product_entity> cartList = (ArrayList<product_entity>) session.getAttribute("cart-list");
            
            if (cartList != null) {
             
                for (product_entity product : cartList) {
                    if (product.getId() == id) {
                        cartList.remove(product);
                        break; 
                    }
                }
                
               
                session.setAttribute("cart-list", cartList);
            }
            
            
            response.sendRedirect("cart.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
