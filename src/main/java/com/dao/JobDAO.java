package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Job;

public class JobDAO {

	private Connection conn;

	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addJobs(Job j) {

		boolean f = false;

		try {

			String query = "insert into job(title, description, category, qualification, status, location) values (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getQualification());
			ps.setString(5, j.getStatus());
			ps.setString(6, j.getLocation());
			// ps.setString(6, j.getPdate());

			int cnt = ps.executeUpdate();

			if (cnt != 0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Job> getJobs() { // list of job entity
		List<Job> list = new ArrayList<Job>();
		Job j = null;

		try {

			String query = "select * from job order by id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				j = new Job();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8) + "");
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Job getJobsById(int id) { // list of job entity
		Job j = null;

		try {

			String query = "select * from job where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				j = new Job();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8) + "");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}

	public boolean updateJob(Job j) {

		boolean f = false;

		try {

			String query = "update job set title=?, description=?, category=?, qualification=?, status=?, location=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getQualification());
			ps.setString(5, j.getStatus());
			ps.setString(6, j.getLocation());
			ps.setInt(7, j.getId());
			// ps.setString(6, j.getPdate());

			int cnt = ps.executeUpdate();

			if (cnt != 0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteJob(int id) {
		boolean f = false;

		try {

			String query = "delete from job where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Job> getJobsForUser() { // list of job entity
		List<Job> list = new ArrayList<Job>();
		Job j = null;

		try {

			String query = "select * from job where status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				j = new Job();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8) + "");
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Job> getJobLocOrDom(String category, String location) {

		List<Job> list = new ArrayList<Job>();

		Job j = null;

		try {

			String query = "select * from job where category=? or location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, category);
			ps.setString(2, location);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Job();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8) + "");
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Job> getJobLocAndDom(String category, String location) {

		List<Job> list = new ArrayList<Job>();

		Job j = null;

		try {

			String query = "select * from job where category=? and location=? order by id DESC";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, category);
			ps.setString(2, location);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Job();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setQualification(rs.getString(5));
				j.setStatus(rs.getString(6));
				j.setLocation(rs.getString(7));
				j.setPdate(rs.getTimestamp(8) + "");
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public boolean appliedJob(int id, String profile, String name, String email, String phone, String resume, String availability) {
		boolean f = false;
		
		try {
			
			String query = "insert into jobApplication(jobId, jobProfile, name, email, phone, resume, availability) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			ps.setString(2, profile);
			ps.setString(3, name);
			ps.setString(4, email);
			ps.setString(5, phone);
			ps.setString(6, resume);
			ps.setString(7, availability);
			
			int cnt = ps.executeUpdate();
			
			if(cnt != 0) {
				f = true;
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
