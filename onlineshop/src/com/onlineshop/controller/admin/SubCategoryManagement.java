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
import com.onlineshop.bean.SubCategoryData;
import com.onlineshop.model.CategoryDAO;
import com.onlineshop.model.SubCategoryDAO;


@WebServlet("/SubCategoryManagement")
public class SubCategoryManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SubCategoryData subdata = new SubCategoryData();
	SubCategoryDAO subdao = new SubCategoryDAO();
	CategoryDAO catdao = new CategoryDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = request.getParameter("submit");
		System.out.println(submit +" value test in doGet method...");
		if(submit != null)
		{
			switch(submit)
			{

				case "AddSubCategory" :
				{
					addSubCategory(request,response);
					break;
				}
				case "EditSubCategory" :
				{
					editSubCategory(request,response);	
					break;
				}
				case "DeleteSubCategory" :
				{
					deleteSubCategory(request,response);	
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
			viewSubCategory(request,response);
		}
		

	}


	private void addSubCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<CategoryData> category = catdao.viewCategory();
			request.setAttribute("category", category);
			request.getRequestDispatcher("/JSP/admin/subcategory/subCategoryAdd.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	private void editSubCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("id"));
		System.out.println(cid);
		try {
			subdata = subdao.getSubCategoryInfo(cid);
			List<CategoryData> category = catdao.viewCategory();
			request.setAttribute("category", category);
			request.setAttribute("subcatdata", subdata);
			request.setAttribute("action", "edit");
			request.getRequestDispatcher("/JSP/admin/subcategory/subCategoryAdd.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	private void deleteSubCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int sId = Integer.parseInt(request.getParameter("id"));
		System.out.println(sId);
		try {
			boolean deleteSts = subdao.deleteSubCategoryInfo(sId);
			if(deleteSts)
			{
				response.sendRedirect("/onlineshop/SubCategoryManagement");
			}
			else
			{
				response.sendRedirect("/onlineshop/JSP/404page.jsp");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	private void viewSubCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<SubCategoryData> subcategorydata = subdao.viewSubCategory();
			request.setAttribute("subcategory", subcategorydata);
			request.getRequestDispatcher("/JSP/admin/subcategory/subCategoryView.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit = request.getParameter("submit");
		System.out.println(submit +" value test in doPost method...");
		if(submit != null)
		{
			switch(submit)
			{

			case "AddSubCategory":
			{
				AddSubCategoryPost(request,response);
				break;
			}
			case "EditSubCategory":
			{
				EditSubCategoryPost(request,response);
				break;
			}
			}
		}
	}


	private void EditSubCategoryPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sId = Integer.parseInt(request.getParameter("subCatId"));
		String name = request.getParameter("subCatName").toString();
		String status = request.getParameter("subCatStatus").toString();
		int catId = Integer.parseInt(request.getParameter("catId"));
		subdata.setSubCatName(name);
		subdata.setCatId(catId);
		subdata.setSubCatStatus(status);
		try {
			boolean updatests = subdao.updateSubCategoryInfo(sId, subdata);
			if(updatests)
			{
				response.sendRedirect("/onlineshop/SubCategoryManagement");
			}
			else
			{
				request.setAttribute("error", "Not Successfull..Something is wrong!!");
				request.getRequestDispatcher("/JSP/admin/subcategory/subcategoryAdd.jsp").include(request, response);			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}


	private void AddSubCategoryPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
		String name = request.getParameter("subCatName").toString();
		int id = Integer.parseInt(request.getParameter("catId"));
		String status = request.getParameter("subCatStatus").toString();
		subdata.setSubCatName(name);
		subdata.setCatId(id);
		subdata.setSubCatStatus(status);
		try {
			
			boolean addsts = subdao.addSubCategory(subdata);
			if(addsts)
			{
				response.sendRedirect("/onlineshop/SubCategoryManagement");
			}
			else
			{
				request.setAttribute("error", "Not Successfull..Something is wrong!!");
				request.getRequestDispatcher("/JSP/admin/subcategory/subCategoryAdd.jsp").include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

}
