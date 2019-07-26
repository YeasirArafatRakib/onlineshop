<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%


	response.setHeader("Cache-Control","no-cache,no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setDateHeader("Expires",0); //Proxies
	

	if (session.getAttribute("adminEmail") == null) {
		response.sendRedirect("/onlineshop/JSP/admin/adminLogin.jsp");
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
					<li class="nav-item"><a class="nav-link " href="/onlineshop//dashboardcontroller">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop//ProductManagement?submit=ViewProduct">View Product</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop//ProductManagement?submit=productAdd">Add Product</a></li>
					<li class="nav-item"><a class="nav-link " href="productManage.jsp">Manage Product</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop//CategoryManagement">View Categories</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Add SubCategories</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop//CategoryManagement">View Categories</a></li>
					<li class="nav-item"><a class="nav-link " href="orderView.jsp">View Order</a></li>
					<li class="nav-item"><a class="nav-link " href="orderManage.jsp">Manage Order</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop//admin?submit=AdminLogout">Logout</a></li>
				</ul>

			</div>

			<!-- main layout -->

			<div class="col-lg-8">
				<div>
				<c:if test="${action == 'edit'}">
					<h1 class="text-center text-warning">Manage SubCategory</h1>
				</c:if>
				<c:if test="${action == null}">
					<h1 class="text-center text-warning">Add SubCategory</h1>
				</c:if>
				
					<div>
						<form action="/onlineshop/SubCategoryManagement" method="post">
							<c:if test="${action == 'edit'}">
							
								<div class="form-group">
									<label>Category Id</label>
									<input class="form-control" type="text" name="subCatId" value="${subcatdata.subCatId}" readonly >
								</div>
							</c:if>
							
							<div class="form-group">
								<label>SubCategory Name</label>
								<input class="form-control" type="text" name="subCatName" required value="${subcatdata.subCatName}">
							</div>
							<div class="form-group">	
								<label>Category</label>
								<select class="form-control" name="catId">	
									<c:forEach var = "cat" items="${category}">
										
										<option value="${cat.catId }" ${cat.catId eq subcatdata.catId ? 'selected' : '' }><c:out value="${cat.catName }"></c:out></option>
									</c:forEach> 
								</select>
							</div>
						
							<div class="form-group">	
								<label>Status</label>
								<select class="form-control" name="subCatStatus">	
								<c:choose>  
								    <c:when test="${subcatdata.subCatStatus =='Deactive'}">  
								        <option value="Active" >Active</option>
										<option value="Deactive"selected>Deactive</option> 
								    </c:when>  
								    <c:otherwise>  
								    	<option value="Active" >Active</option>
										<option value="Deactive">Deactive</option>  
								    </c:otherwise>  
								</c:choose> 
								</select>
							</div>
							
							<c:if test="${action =='edit'}">
								<div class="form-group">
									<input class= "btn btn-primary btn-block" type="submit" name="submit" value="EditSubCategory">
								</div>
							</c:if>
							
							<c:if test="${action == null}">
								<div class="form-group">
									<input class= "btn btn-primary btn-block" type="submit" name="submit" value="AddSubCategory">
								</div>
							</c:if>

						</form>
					</div>
				</div>

			</div>
			<div class="col-lg-2">
			</div>
		</div>
	</div>
	
</body>
</html>