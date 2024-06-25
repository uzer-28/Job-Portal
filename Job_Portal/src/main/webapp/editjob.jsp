<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Job"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-Edit Job</title>
<%@ include file="components/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="components/navbar.jsp"%>

	<%
	if (session.getAttribute("user") == null) {

		session.setAttribute("error", "Please Login as Admin.");
		response.sendRedirect("login.jsp");
	} else {

		User user = (User) session.getAttribute("user");

		if (user.getRole() != "Admin") {
			session.setAttribute("error", "Please Login as Admin.");
			response.sendRedirect("login.jsp");
		}

		if (request.getParameter("id") == null) {
			out.println("Sorry, no post found at this id!");

		} else {
			int id = Integer.parseInt(request.getParameter("id"));

			JobDAO dao = new JobDAO(DBconnect.getConnection());
			Job job = dao.getJobById(id);
	%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<h5>Add Jobs</h5>

						<c:if test="${not empty success}">
							<div class="alert alert-success" role="alert">${success}</div>
							<c:remove var="success" />
						</c:if>
						<c:if test="${not empty error}">
							<div class="alert alert-danger" role="alert">${error}</div>
							<c:remove var="error" />
						</c:if>

					</div>

					<form class="row g-3" action="editJob" method="post">
						<input type="hidden" value="<%=job.getId()%>" name="id">

						<div class="col-12">
							<label for="inputAddress" class="form-label">Title</label> <input
								type="text" class="form-control" id="inputAddress"
								value="<%=job.getTitle()%>" name="title">
						</div>

						<div class="col-md-4">
							<label for="inputCity" class="form-label">City</label> <select
								name="location" class="form-select" id="inputCity">
								<option selected value="<%=job.getLocation()%>"><%=job.getLocation()%></option>
								<option value="Pune">Pune</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Odisha">Odisha</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="Gujurat">Gujurat</option>
								<option value="Bhubaneswar">Bhubaneswar</option>
								<option value="Delhi">Delhi</option>
								<option value="Banglore">Banglore</option>
								<option value="Chennai">Chennai</option>
								<option value="Hydrabad">Hydrabad</option>
							</select>
						</div>

						<div class="col-md-4">
							<label for="inputState" class="form-label">Category</label> <select
								id="inputState" class="form-select" name="category">
								<option selected value="<%=job.getCategory()%>"><%=job.getCategory()%></option>
								<option value="IT">IT</option>
								<option value="Devloper">Devloper</option>
								<option value="Banking">Banking</option>
								<option value="Engineer">Engineer</option>
								<option value="Teacher">Teacher</option>
								<option value="Intern">Intern</option>
							</select>
						</div>

						<div class="col-md-4">
							<label class="form-label">Status</label> <select
								class="form-select" name="status" value="<%=job.getStatus()%>">
								<option class="Active" value="<%=job.getStatus()%>"><%=job.getStatus()%></option>
								<option class="Active" value="Active">Active</option>
								<option class="Inactive" value="Inactive">Inactive</option>
							</select>
						</div>


						<div class="form-group">
							<label>Description</label>
							<textarea required rows="5" name="description"
								class="form-control"> <%=job.getDescription()%>
							</textarea>
						</div>
						<button class="btn btn-success col-md-2">Update Job</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<%
	}
	}
	%>
</body>
</html>