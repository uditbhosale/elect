package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class jdbc_connection {
	
public static Connection con;

public static Connection getConnection() {
	
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/elect","root","123456789");
	}
	
	catch(Exception e) {
		
		e.printStackTrace();
	}
	
	
	return con;
	
	
}
	

}
