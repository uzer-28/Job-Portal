package com.dao;
import java.sql.*;

import com.entity.User;

public class UserDAO {
	
	private Connection con;

	public UserDAO(Connection con) {
		
		this.con = con;
	}
	
	public boolean addUser(User user) throws Exception {
		boolean res = false;
		
		String query = "insert into userdata(name, email, qualification, pass, role) values(?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getQualification());
		st.setString(4, user.getPass());
		st.setString(5, "user");
		int i = st.executeUpdate();
		
		if(i == 1) {
			res = true;
		}
		
		return res;
	}
	
	public boolean editUser(User user) throws Exception {
		boolean res = false;
		
		String query = "update userdata set name=?, email=?, qualification=?, pass=?, role=? where id=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getQualification());
		st.setString(4, user.getPass());
		st.setString(5, "user");
		st.setInt(6, user.getId());
		int i = st.executeUpdate();
		
		if(i == 1) {
			res = true;
		}
		
		return res;
	}
	
	public User login(String email, String pass) throws Exception {
		User user = null;
		
		String query = "select * from userdata where email=? and pass=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, email);
		st.setString(2, pass);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			user = new User();
			
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setQualification(rs.getString(4));
			user.setPass(rs.getString(5));
			user.setRole(rs.getString(6));
			
		}
		
		return user;
	}
	
	public User getUserById(int id) throws Exception {
		User user = null;
		
		String query = "select * from userdata where id=?";
		
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			user = new User();
			
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setQualification(rs.getString(4));
			user.setPass(rs.getString(5));
			user.setRole(rs.getString(6));
			
		}
		
		return user;
	}

}





