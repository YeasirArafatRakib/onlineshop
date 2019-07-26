<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	

	//response.setIntHeader("Refresh", 5);
	response.setHeader("Cache-Control","no-cache,no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires",0); //Proxies	

/* 	if (session.getAttribute("UserEmail") != null) {
		out.print("from login page ");
		response.sendRedirect("/myprojectpractise/ProductManagement");
	} */
	
	
	
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/90b97a2be8.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="container-fluid">
	<h3 class="text-center text-warning"><c:out value="${error}" /></h3>
	</div>
	
	<div class="container-fluid h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-lg-3"></div>
			<div class="col-lg-6" >
				<h2 class="text-center text-primary">User Login</h2>
				<form action="/myprojectpractise/" method="post" >
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
					  </div>
					  <input class="form-control" type="email" name="email" required placeholder="Enter Email...">
					</div>

					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text"><i class="fas fa-unlock"></i></span>
					  </div>
					  <input class="form-control" type="password" name="password" required placeholder="Enter Password...">
					</div>					
					
					<div>
						<input class="btn btn-primary btn-block" type="submit" value="UserLogin"
							name="submit">
					</div>


				</form>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
	
	
	
	
	
</body>
</html>