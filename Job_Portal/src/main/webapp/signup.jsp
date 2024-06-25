<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<%@ include file="components/allcss.jsp"%>

<style type="text/css">
</style>
</head>
<body style="background-color: #f0f1f2 ">
	<%@ include file="components/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Register</p>

						<c:if test="${not empty success }">
							<p class="text-success text-center fs-4">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<c:if test="${not empty error }">
							<p class="text-danger text-center fs-4">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="addUser" method="post">
							<div class="mb-3">
								<label class="form-label">Name</label> <input required
									name="name" type="text" class="form-control" />
							</div>
							
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control" />
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="pass" type="password" class="form-control" />
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12">Singup</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>