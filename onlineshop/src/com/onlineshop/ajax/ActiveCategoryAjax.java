package com.onlineshop.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineshop.bean.CategoryData;
import com.onlineshop.model.CategoryDAO;

/**
 * Servlet implementation class ActiveCategoryAjax
 */
@WebServlet("/ActiveCategoryAjax")
public class ActiveCategoryAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello ajax in get");
		  response.setContentType("text/html");  
		  PrintWriter out = response.getWriter(); 
		  out.write("hello get method");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello ajax in post");
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		out.write("hello post method");
		CategoryDAO catdao = new CategoryDAO();
		try {
			List<CategoryData> category = catdao.viewCategory();
			out.print("<html><body>");
			out.print("<table><tr>");
			for(CategoryData cat : category)
			{
				out.print("<td>"+cat.getCatName()+"</td>");
				out.print("<td>"+cat.getCatStatus()+"</td>");
			}
			out.print("</tr></table>");
			out.print("</body></html>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
