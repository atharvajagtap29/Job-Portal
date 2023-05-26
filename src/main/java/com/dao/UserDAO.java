package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(User u) {
		boolean f = false;
		try {

			String query = "insert into user(name, username, email, password, qualification, role) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getQualification());
			ps.setString(6, "User");

			int cnt = ps.executeUpdate();
			if (cnt == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User login(String uname, String pass) {
		User u = null;

		try {

			String query = "select * from user where username=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, uname);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new User();

				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setUsername(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setQualification(rs.getString(6));
				u.setRole(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean updateUser(User u) {
		boolean f = false;

		try {
			
			String query = "update user set name=?, username=?, email=?, qualification=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getQualification());
			ps.setInt(5, u.getId());
			
			int cnt = ps.executeUpdate();
			
			if(cnt == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
