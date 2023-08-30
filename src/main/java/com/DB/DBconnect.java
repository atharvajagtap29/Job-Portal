package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {

	private static Connection conn;

	private static String Localusername = "root";
	private static String Localpassword = "root";

	private static String RDSusername = "admin";
	private static String RDSpassword = "rootpass1";

	private static String EC2username = "admin";
	private static String EC2password = "Admin#123";

	public static Connection getConn() throws SQLException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 //conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal",
			 //Localusername, Localpassword);
			// conn =
			// DriverManager.getConnection("jdbc:mysql://database-1.cw6ytvpftuvq.ap-south-1.rds.amazonaws.com:3306/jobportal",
			// RDSusername, RDSpassword);

			// conn =
			// DriverManager.getConnection("jdbc:mysql://database-1.cw6ytvpftuvq.ap-south-1.rds.amazonaws.com:3306/jobportal?"+"user=admin&password=rootpass1");

			conn = DriverManager
					.getConnection("jdbc:mysql://35.154.119.128:3306/jobportal",
							EC2username, EC2password);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void main(String[] args) throws SQLException {
		Connection c = getConn();

		if (c != null) {
			System.out.println("Success");
		} else {
			System.out.println("Failed");
		}
	}

}
