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
<title>Home</title>
<%@ include file="components/allcss.jsp"%>

<style type="text/css">
</style>
</head>
<body style="background-color: #f0f1f2">

<%
	if (session.getAttribute("user") == null) {

		session.setAttribute("error", "Please Login.");
		response.sendRedirect("login.jsp");
	} else {

		//User user = (User) session.getAttribute("user");

		//if (user.getRole() != "user") {
		//	session.setAttribute("error", "Please Login as User.");
		//	response.sendRedirect("login.jsp");
		//}

	%>

	<%@ include file="components/navbar.jsp"%>
	
	<div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-black mt-2">All Jobs</h5>
            </div>

<c:if test="${not empty success}">
							<div class="alert alert-success" role="alert">${success}</div>
							<c:remove var="success" />
						</c:if>
						<c:if test="${not empty error}">
							<div class="alert alert-danger" role="alert">${error}</div>
							<c:remove var="error" />
						</c:if>

            <div class="card">
                <div class="card-body">

                    <form action="view_filter.jsp" class="form-inline" method="get">
                        <div class="form-group col-md-4 mt-1" style="display:inline-block">
                            
                            <label for="inputCity" class="form-label fw-bold">Location</label> <select
								name="location" class="form-select" id="inputCity">
								<option selected value="location">--Select--</option>
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

                        <div class="form-group col-md-4 mt-1 ms-4" style="display:inline-block">
                           
                            <label for="inputState" class="form-label fw-bold">Category</label> <select
								id="inputState" class="form-select" name="category">
								<option selected value="category" >--Select--</option>
								<option value="IT">IT</option>
								<option value="Devloper">Devloper</option>
								<option value="Banking">Banking</option>
								<option value="Engineer">Engineer</option>
								<option value="Teacher">Teacher</option>
								<option value="Intern">Intern</option>
							</select>
                        </div>
						<div class="col-md-3 ms-4" style="display:inline-block">
						<button class="btn btn-success form-label " >Submit</button>
						</div>						                       
                        </div>                                                
                    </form>
                                              
                </div>
            </div>
        </div>
    </div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">			

				<%
				JobDAO dao = new JobDAO(DBconnect.getConnection());
				List<Job> list = dao.getAllActiveJobs();
				
				for (Job job : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h5 class="card-title"><%=job.getTitle()%></h5>
						<p class="card-text"><%=job.getDescription().substring(0, 100)+"..." %></p>
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
	}
				%>
			</div>
		</div>
	</div>
	

	

</body>
</html>