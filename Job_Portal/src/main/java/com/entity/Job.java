package com.entity;

public class Job {

	private  int id;
	private String title, category, location, pdate, description, status;

	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Job(int id, String title, String category, String location, String description,
			String status) {
		super();
		this.id = id;
		this.title = title;
		this.category = category;
		this.location = location;
		this.description = description;
		this.status = status;
	}

	public Job(String title, String category, String location, String description, String status) {
		super();
		this.title = title;
		this.category = category;
		this.location = location;
		this.description = description;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
