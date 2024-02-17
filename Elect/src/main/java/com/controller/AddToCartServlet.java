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
import com.entity.signup_entity;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
        	HttpSession session1 =request.getSession();
        	 signup_entity s1=(signup_entity)session1.getAttribute("userlogin");
            
            if(s1!=null){
            	
            	request.setAttribute("user_login",s1);
            }
            
        	
//        	out.print("add to cart servlet");

            ArrayList<product_entity> cartList = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("id"));
            product_entity cm = new product_entity();
            cm.setId(id);
            cm.setQuantity(1);
            HttpSession session = request.getSession();
            ArrayList<product_entity> cart_list = (ArrayList<product_entity>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                
                response.sendRedirect("index.jsp");
            } else {
                cartList = cart_list;

                boolean exist = false;
                for (product_entity c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<body style='background-color:#000'><h3 style='color:#01ff01; text-align: center'>Item Already in Cart. <a href='cart.jsp' style='color:#fff'>GO to Cart Page</a></h3></body");
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("cart.jsp");
                }
            }
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
