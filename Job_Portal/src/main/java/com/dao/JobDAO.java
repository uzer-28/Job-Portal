package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Job;

public class JobDAO {

	private Connection con;

	public JobDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJob(Job job) throws Exception {
		boolean res = false;

		String query = "insert into jobs(title, description, category, status, location) values(?,?,?,?,?)";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, job.getTitle());
		st.setString(2, job.getDescription());
		st.setString(3, job.getCategory());
		st.setString(4, job.getStatus());
		st.setString(5, job.getLocation());

		int i = st.executeUpdate();

		if (i == 1) {
			return res = true;
		}

		return res;

	}

	public List getAllJobs() throws Exception {

		List<Job> list = new ArrayList<Job>();
		Job job = null;

		String query = "select * from jobs order by pdate desc";

		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			job = new Job();

			job.setId(rs.getInt(1));
			job.setTitle(rs.getString(2));
			job.setDescription(rs.getString(3));
			job.setCategory(rs.getString(4));
			job.setStatus(rs.getString(5));
			job.setLocation(rs.getString(6));
			job.setPdate(rs.getString(7));

			list.add(job);
		}

		return list;
	}
	
	public List getAllActiveJobs() throws Exception {

		List<Job> list = new ArrayList<Job>();
		Job job = null;

		String query = "select * from jobs where status='Active' order by pdate desc";

		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			job = new Job();

			job.setId(rs.getInt(1));
			job.setTitle(rs.getString(2));
			job.setDescription(rs.getString(3));
			job.setCategory(rs.getString(4));
			job.setStatus(rs.getString(5));
			job.setLocation(rs.getString(6));
			job.setPdate(rs.getString(7));

			list.add(job);
		}

		return list;
	}

	public Job getJobById(int id) throws Exception{
		Job job = null;

		String query = "select * from jobs where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();

		if (rs.next()) {

			job = new Job();

			job.setId(rs.getInt(1));
			job.setTitle(rs.getString(2));
			job.setDescription(rs.getString(3));
			job.setCategory(rs.getString(4));
			job.setStatus(rs.getString(5));
			job.setLocation(rs.getString(6));
			job.setPdate(rs.getString(7));

		}

		return job;
	}
	
	public boolean editJob(Job job) throws Exception {
		boolean res = false;

		String query = "update jobs set title=?, description=?, category=?, status=?, location=? where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, job.getTitle());
		st.setString(2, job.getDescription());
		st.setString(3, job.getCategory());
		st.setString(4, job.getStatus());
		st.setString(5, job.getLocation());
		st.setInt(6, job.getId());

		int i = st.executeUpdate();

		if (i == 1) {
			return res = true;
		}

		return res;

	}
	
	public boolean deletePost(int id) throws Exception {
		
		boolean res = false;
		
		String query = "delete from jobs where id=?";

		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		int i = st.executeUpdate();

		if (i == 1) {
			res = true;
		}

		return res;
	}
	
	public List getJobsByLocOrCate(String location, String category) throws Exception {

		List<Job> list = new ArrayList<Job>();
		Job job = null;

		String query = "select * from jobs where location=? or category=? order by pdate desc";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, location);
		st.setString(2, category);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			job = new Job();

			job.setId(rs.getInt(1));
			job.setTitle(rs.getString(2));
			job.setDescription(rs.getString(3));
			job.setCategory(rs.getString(4));
			job.setStatus(rs.getString(5));
			job.setLocation(rs.getString(6));
			job.setPdate(rs.getString(7));

			list.add(job);
		}

		return list;
	}
	
	public List getJobsByLocAndCate(String location, String category) throws Exception {

		List<Job> list = new ArrayList<Job>();
		Job job = null;

		String query = "select * from jobs where location=? and category=? order by pdate desc";

		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, location);
		st.setString(2, category);
		ResultSet rs = st.executeQuery();

		while (rs.next()) {

			job = new Job();

			job.setId(rs.getInt(1));
			job.setTitle(rs.getString(2));
			job.setDescription(rs.getString(3));
			job.setCategory(rs.getString(4));
			job.setStatus(rs.getString(5));
			job.setLocation(rs.getString(6));
			job.setPdate(rs.getString(7));

			list.add(job);
		}

		return list;
	}
}
