package com.onlineshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.onlineshop.bean.AdminProfileData;
import com.onlineshop.utils.DBConnection;

public class AdminProfileDAO {
	
	Connection con = null;
	ResultSet rs = null;
	String sql = "";
	DBConnection db =new DBConnection();
	
	public boolean adminLogin(AdminProfileData admindata) throws SQLException
	{
		boolean sts = false;
		System.out.println("coming for login in dao class");
		String email = admindata.getAdminEmail();
		String password = admindata.getAdminPass();
		System.out.println(email + " and " +password);
		con = db.createConnection();
		sql= "SELECT * FROM admin WHERE a_email = ? AND password=?";
		PreparedStatement statement = con.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, password);
		rs = statement.executeQuery();
		if(rs.next())
		{
			
			sts = true;
			admindata.setAdminName(rs.getString(2));
			admindata.setAdminEmail(rs.getString(3));
		}
		else
		{
			sts = false;
		}
		con.close();
		return sts;
	}

}
