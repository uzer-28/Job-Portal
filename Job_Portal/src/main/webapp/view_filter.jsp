<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<%@ page import="com.entity.User"%>
<%@ page import="com.entity.Job"%>
<%@ page import="com.db.DBconnect"%>
<%@ page import="com.dao.JobDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-View Job</title>
<%@ include file="components/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<%
	if (session.getAttribute("user") == null) {

		session.setAttribute("error", "Please Login.");
		response.sendRedirect("login.jsp");
	} else {

		//User user = (User) session.getAttribute("user");

		//if (user.getRole() != "Admin") {
		//	session.setAttribute("error", "Please Login as Admin.");
		//	response.sendRedirect("login.jsp");
		//}

	%>

	<%@ include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary fs-4">All Jobs</h5>

				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">${success}</div>
					<c:remove var="success" />
				</c:if>
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
					<c:remove var="error" />
				</c:if>

				<%
				String location = request.getParameter("location");
				String category = request.getParameter("category");
				String msg = "";
				
				JobDAO dao = new JobDAO(DBconnect.getConnection());
				List<Job> list = null;
				
				if(location.equals("location") && category.equals("category")) {
					list = new ArrayList<Job>();	
					msg = "No Jobs Available.";
				}
				else if(location.equals("location") || category.equals("category")){
					list = dao.getJobsByLocOrCate(location, category);
				}
				else {
					list = dao.getJobsByLocAndCate(location, category);
				}
				
				if(list.isEmpty()){
					%>
					<h5 class="text-center text-danger">No Jobs Available</h5>
					<%
				}
				else if(list != null) {
				
				for (Job job : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h5 class="card-title"><%=job.getTitle()%></h5>
						<p class="card-text"><%=job.getDescription().substring(0, 100) + "..." %></p>
						<br>
						<div class="form-row">
							<div class="form-group col-md-3 " style="display: inline-block">
								<input type="text" readonly
									value="Location: <%=job.getLocation()%>"
									class="form-control form-control-sm" id="inputAddress"
									name="title">
							</div>
							<div class="form-group col-md-3 " style="display: inline-block">
								<input type="text" readonly
									value="Category: <%=job.getCategory()%>"
									class="form-control form-control-sm" id="inputAddress"
									name="title">
							</div>
							<div class="form-group col-3 " style="display: inline-block">
								<input type="text" readonly value="Status: <%=job.getStatus()%>"
									class="form-control form-control-sm" id="inputAddress"
									name="title">
							</div>
						</div>
						<p>
							Publish Date :
							<%=job.getPdate()%></p>
						<div class="text-center">
							<a href="one_view.jsp?id=<%=job.getId() %>"
								class="btn btn-sm btn-primary">View More</a> 
								
						</div>
					</div>
				</div>
				<%
				}
				}else{
					 %>
					 <h5 class="text-center text-danger"><%=msg %></h5>
					 <%
				}
				%>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>

</html>