<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="components/allcss.jsp"%>

<style type="text/css">
.back-img{
	background: url("img/por3.png");
	width: 100%;
	height: 91.5vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>

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

	%>

	<%@ include file="components/navbar.jsp"%>


	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white p-4">
				Welcome Admin
			</h1>
		</div>
	</div>
<%} %>
</body>
</html>