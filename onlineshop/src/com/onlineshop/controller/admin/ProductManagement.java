package com.onlineshop.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ProductManagement")
public class ProductManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = request.getParameter("submit");
		System.out.println(submit +" value test in doGet method...");
		if(submit != null)
		{
			switch(submit)
			{
				case "AddProduct" :
				{
					break;
				}
				case "EditProduct" :
				{
					break;
				}
				case "ViewProduct" :
				{
					break;
				}
				default :
				{	
					break;
				}
			}
		}
		else
		{
			response.sendRedirect(request.getServletContext()+"/JSP/admin/adminDashboard.jsp");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
