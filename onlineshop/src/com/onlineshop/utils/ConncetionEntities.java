package com.onlineshop.utils;

import java.sql.Connection;

public interface ConncetionEntities {
	String Driver = "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/onlineshop";
	String UserName = "root";
	String Password = "";
	Connection createConnection();
}
