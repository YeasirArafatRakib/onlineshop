package com.onlineshop.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection  implements ConncetionEntities {
	Connection con = null;
	
	@Override
	public Connection createConnection() {
		
		try {
			Class.forName(Driver);
			con = DriverManager.getConnection(URL, UserName, Password);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return con;
	}

}