package com.onlineshop.controller.admin;

import java.io.IOException;
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
 * Servlet implementation class ProductManagement
 */
@WebServlet("/CategoryManagement")
public class CategoryManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CategoryDAO catdao = new CategoryDAO();
	CategoryData catdata = new CategoryData();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = request.getParameter("submit");
		System.out.println(submit +" value test in doGet method...");
		if(submit != null)
		{
			switch(submit)
			{

				case "AddCategory" :
				{
					response.sendRedirect("/onlineshop/JSP/admin/category/categoryAdd.jsp");
					break;
				}
				case "EditCategory" :
				{
					editCategory(request,response);	
					break;
				}
//				case "ViewCategory" :
//				{
//					System.out.println("view category");
//					viewCategory(request,response);
//					break;
//				}
				case "DeleteCategory" :
				{
					deleteCategory(request,response);	
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
			System.out.println("view category with null submit...");
			viewCategory(request,response);
		}
		
	}
	
	private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("id"));
		System.out.println(cid);
		try {
			boolean deleteSts = catdao.deleteCategoryInfo(cid);
			if(deleteSts)
			{
				response.sendRedirect("/onlineshop/CategoryManagement");
			}
			else
			{
				response.sendRedirect("/onlineshop/JSP/404page.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void editCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("id"));
		System.out.println(cid);
		try {
			catdata = catdao.getCategoryInfo(cid);
			request.setAttribute("catdata", catdata);
			request.setAttribute("action", "edit");
			request.getRequestDispatcher("/JSP/admin/category/categoryAdd.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	private void viewCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<CategoryData> categorydata = catdao.viewCategory();
			request.setAttribute("category", categorydata);
			request.getRequestDispatcher("/JSP/admin/category/categoryView.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = request.getParameter("submit");
		
		switch(submit)
		{
			case "AddCategory":
			{
				AddCategoryPost(request,response);
				break;
			}
			case "EditCategory":
			{
				EditCategoryPost(request,response);
				break;
			}
			case "C":
			{
				break;
			}
			default:
			{
				break;
			}
		}
		
	}

	private void EditCategoryPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
		int catId = Integer.parseInt(request.getParameter("catId"));
		String name = request.getParameter("catName").toString();
		String status = request.getParameter("catStatus").toString();
		System.out.println(catId + name + status);
		catdata.setCatName(name);
		catdata.setCatStatus(status);

		try {
			boolean updatests = catdao.updateCategoryInfo(catId, catdata);
			if(updatests)
			{
				response.sendRedirect("/onlineshop/CategoryManagement");
			}
			else
			{
				request.setAttribute("error", "Not Successfull..Something is wrong!!");
				request.getRequestDispatcher("/JSP/admin/category/categoryAdd.jsp").include(request, response);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	private void AddCategoryPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("catName").toString();
		String status = request.getParameter("catStatus").toString();
		catdata.setCatName(name);
		catdata.setCatStatus(status);
		
		try {
			boolean addsts = catdao.addCategory(catdata);
			if(addsts)
			{
				response.sendRedirect("/onlineshop/CategoryManagement");
			}
			else
			{
				request.setAttribute("error", "Not Successfull..Something is wrong!!");
				request.getRequestDispatcher("/JSP/admin/category/categoryAdd.jsp").include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}

}
