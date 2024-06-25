package com.db;
import java.sql.*;

public class DBconnect {
	
	private static Connection con;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/jobPortal", "postgres", "Q@92");
		return con;
	}

}
