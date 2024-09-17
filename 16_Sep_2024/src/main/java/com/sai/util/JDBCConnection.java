package com.sai.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {

	 private static final String URL = "jdbc:mysql://localhost:3306/tmf_food_delivary";
	    private static final String USER = "root";
	    private static final String PASSWORD = "Sai@01Mysql"; 
	    
	    public static Connection getConnection() throws SQLException, ClassNotFoundException {
	       
	        Class.forName("com.mysql.jdbc.Driver");
	        return DriverManager.getConnection(URL, USER, PASSWORD);
	    }
	
}
