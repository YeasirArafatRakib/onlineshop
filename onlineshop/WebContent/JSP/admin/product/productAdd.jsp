<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%


	response.setHeader("Cache-Control","no-cache,no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires",0); //Proxies
	

	if (session.getAttribute("adminEmail") == null) {
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
					<li class="nav-item"><a class="nav-link " href="/myprojectpractise/ProductManagement">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link " href="/myprojectpractise/ProductManagement?submit=productView">View
							Product</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Add
							Product</a></li>
					<li class="nav-item"><a class="nav-link " href="productManage.jsp">Manage
							Product</a></li>
					<li class="nav-item"><a class="nav-link " href="orderView.jsp">View
							Order</a></li>
					<li class="nav-item"><a class="nav-link " href="orderManage.jsp">Manage
							Order</a></li>
				</ul>

			</div>

			<!-- main layout -->

			<div class="col-lg-8">

				<div>
					<h1 class="text-center text-warning">Dash Board</h1>
					<div>
						<form action="/myprojectpractise/ProductManagement" method="post" enctype = "multipart/form-data">
							
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" type="text" name="title" required>
							</div>
							<div class="form-group">
								<label>Price</label>
								<input class="form-control" type="number" name="price" required>
							</div>
							<div class="form-group">
								<label>Select Photo</label>
								<input class="form-control-file" type="file" name="photo" required>
							</div>
							<div>
								<label>Description</label>
								<textarea class="form-control" name="description"required></textarea>
							</div>
<!-- 

							<div class="form-group">
								<label>Categories</label>
								<select class="form-control" name="categories" required>
									<c:forEach var="proCat" items="${proCat }">
										<option value="${proCat.catId }"><c:out value="${proCat.catName }"></c:out></option>
									</c:forEach>
									
								</select>
							</div>
 -->						
							<div class="form-group">	
								<label>Sub Categories</label>
								<select class="form-control" name="sub_categories" required>
									<c:forEach var="proSubCat" items="${proSubCat }">
										<option value="${proSubCat.sId }"><c:out value="${proSubCat.sName }"></c:out></option>
									</c:forEach>
									
								</select>
							</div>
							
							
							
							<div class="form-group">
								<label>Brands</label>
								
								<select class="form-control" name="brands" required>
									<c:forEach var="proBrand" items="${proBrand }">
										<option value="${proBrand.bId }"><c:out value="${proBrand.bName }"></c:out></option>
									</c:forEach>
									
								</select>
								
							</div>
							
							
							
							<div class="form-group">
								<input class= "btn btn-primary btn-block" type="submit" name="submit" value="Add Product">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>