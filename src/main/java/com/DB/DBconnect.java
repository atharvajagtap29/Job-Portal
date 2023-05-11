package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static Connection conn;

	public static Connection getConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
	
	public static void main(String[] args) {
		Connection c = getConn();
		
		if(c!=null) {
			System.out.println("hey");
		} else {
			System.out.println("nay");
		}
	}

}
