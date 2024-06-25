<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
      <c:if test="${empty user }"> 
      
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
       </c:if> 
       
       <c:if test="${ user.role eq 'user' }"> 
      
       <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
       </c:if> 
        
        <c:if test="${user.role eq 'Admin'}">
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin.jsp">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="addjob.jsp"><i class="fas fa-plus-circle"></i> Post Job</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="viewjobs.jsp"><i class="fas fa-eye"></i> View Job</a>
        </li>
        
        </c:if>
               
        
            
          
      </ul>
      <form class="form-inline my-2 my-lg-0">
           
      <c:if test="${user.role eq 'Admin' }">       
        <a href="#" class="btn btn-light "><i class="fas fa-user-tie"></i> Admin</a>
        <a href="logout" class="btn btn-light "><i class="fas fa-sign-in-alt"></i> Logout</a>
        
        </c:if>
        
        <c:if test="${user.role eq 'user' }">       
        <a href="#" class="btn btn-light " data-bs-toggle="modal" data-bs-target="#exampleModal">
        <i class="fas fa-user-tie" ></i> ${user.name } </a>
        <a href="logout" class="btn btn-light "><i class="fas fa-sign-in-alt"></i> Logout</a>
        
        </c:if>
      
      <c:if test="${empty user }"> 
      
        <a href="login.jsp" class="btn btn-light "><i class="fas fa-sign-in-alt"></i> Login</a>
        <a href="signup.jsp" class="btn btn-light "><i class="fas fa-user-tie"></i> Signup</a>
       </c:if> 
      </form>
    </div>
  </div>
</nav>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card">
        	<div class="card-body">
        		<div class="text-center text-primary">
        			<i class="fas fa-user-circle fa-3x"></i>
        		</div>
        		<table class="table">
        			<tbody>
        		
        				
        				<tr>
        					<th scope="row">Name</th>
        					<th>${user.name }</th>
        				</tr>
        				
        				<tr>
        					<th scope="row">Qualification</th>
        					<th>${user.qualification }</th>
        				</tr>
        				
        				<tr>
        					<th scope="row">Email</th>
        					<th>${user.email }</th>
        				</tr>
        			</tbody>
        		</table>
        	</div>
        
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="editProfile.jsp?id=${user.id }" class="btn btn-primary">Edit</a>
      </div>
    </div>
  </div>
</div>