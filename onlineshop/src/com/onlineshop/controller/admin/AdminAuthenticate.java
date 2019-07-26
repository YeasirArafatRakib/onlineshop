package com.onlineshop.controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineshop.bean.AdminProfileData;
import com.onlineshop.model.AdminProfileDAO;


//@WebServlet("/admin/*")
public class AdminAuthenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HttpSession session = null;
	AdminProfileData admindata = new AdminProfileData();
	AdminProfileDAO admindao = new AdminProfileDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session = request.getSession();
		
		
		if(session.getAttribute("adminEmail") == null)
		{
			response.sendRedirect("/onlineshop/JSP/admin/adminLogin.jsp");
		}
		else
		{
			String submit= request.getParameter("submit");
			System.out.println(submit + " admin Profile class");
			if(submit == null)
			{
				response.sendRedirect("/onlineshop/dashboardcontroller");
			}
			else
			{
				if(submit.contentEquals("AdminLogout"))
				{
					session.removeAttribute("adminEmail");
					request.getSession(false);
					session.setAttribute("adminEmail", null);
					session.invalidate();
					response.sendRedirect("/onlineshop/JSP/admin/adminLogin.jsp");
				}
			}
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
session = request.getSession();
		
		String submit = request.getParameter("submit").toString();
		String email= request.getParameter("email").toString();
		String password= request.getParameter("password").toString();
		
		System.out.println(submit + " in doPost method");
		if(submit != null)
		{
			if(submit.contentEquals("AdminLogin"))
			{
				boolean loginsts = false;
				System.out.println("Admin login block");
				admindata.setAdminEmail(email);
				admindata.setAdminPass(password);
				try {
					loginsts = admindao.adminLogin(admindata);
					System.out.println("Admin status " + loginsts);
					if(loginsts)
					{
						String adminname = admindata.getAdminName();
						String adminemail = admindata.getAdminEmail();
						session.setAttribute("adminName",adminname);
						session.setAttribute("adminEmail", adminemail);
						System.out.println("successfully admin logged in");
						response.sendRedirect("/onlineshop/dashboardcontroller");
						
					}
					else
					{
						request.setAttribute("error", "Email or Password Invalid");
						request.getRequestDispatcher("/JSP/admin/adminLogin.jsp").include(request, response);
						System.out.println("login unsuccessfull");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
		else 
		{
			request.setAttribute("error", "Something goes wrong!!");
			request.getRequestDispatcher("/JSP/admin/adminLogin.jsp").include(request, response);
			System.out.println("Something is going wrong!! in doPost panel");
		}
		
	}

}
