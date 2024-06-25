package com.entity;

public class User {

	private int id;
	private String name, email, qualification, role, pass;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}		

	public User(int id, String name, String email, String qualification, String role, String pass) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.qualification = qualification;
		this.role = role;
		this.pass = pass;
	}

	public User(String name, String email, String qualification, String role, String pass) {
		super();
		this.name = name;
		this.email = email;
		this.qualification = qualification;
		this.role = role;
		this.pass = pass;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
}
