<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	if (session.getAttribute("adminName") == null) {
		out.print("from login page ");
		response.sendRedirect("/myprojectpractise/JSP/admin/adminLogin.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<!-- side navigation -->
			<div class="col-lg-2">

				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link " href="adminDashboard.jsp">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link " href="productView.jsp">View
							Product</a></li>
					<li class="nav-item"><a class="nav-link " href="productAdd.jsp">Add
							Product</a></li>
					<li class="nav-item"><a class="nav-link " href="productManage.jsp">Manage
							Product</a></li>
					<li class="nav-item"><a class="nav-link " href="orderView.jsp">View
							Order</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Manage
							Order</a></li>
				</ul>

			</div>

			<!-- main layout -->

			<div class="col-lg-8">

				<div>
					<h1 class="text-center text-warning">DashBoard</h1>
					<h3 class="text-muted">Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book. It
						has survived not only five centuries, but also the leap into
						electronic typesetting, remaining essentially unchanged. It was
						popularised in the 1960s with the release of Letraset sheets
						containing Lorem Ipsum passages, and more recently with desktop
						publishing software like Aldus PageMaker including versions of
						Lorem Ipsum.</h3>
				</div>

			</div>
		</div>
	</div>
</body>
</html>