<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LogIn</title>
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
						<div class="fs-2 text-center">
						<p>Login</p>
						</div>

						<c:if test="${not empty success}">
							<p class="text-center text-success fs-5">${success}</p>
							<c:remove var="success" scope="session" />
						</c:if>

						<c:if test="${not empty error}">
							<p class="text-center text-danger fs-5">${error}</p>
							<c:remove var="error" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="pass" type="password" class="form-control" />
							</div>
							<button type="submit" class="btn bg-primary text-white col-md-12 badge-pill">Login</button>
						</form>
						<br>Don't have an account? <a href="singup.jsp"
							class="text-decoration-none">Create account</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>