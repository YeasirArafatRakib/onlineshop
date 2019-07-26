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
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/ProductManagement">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">View Product</a></li>
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/ProductManagement?submit=productAdd">Add Product</a></li>
					<li class="nav-item"><a class="nav-link "
						href="productManage.jsp">Manage Product</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${pageContext.request.contextPath}/ProductManagement?submit=ViewCategory">View Categories</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${pageContext.request.contextPath}/ProductManagement?submit=AddCategory">Add Categories</a></li>
					<li class="nav-item"><a class="nav-link "
						href="${pageContext.request.contextPath}/ProductManagement?submit=EditCategory">Manage Categories</a></li>
					<li class="nav-item"><a class="nav-link " href="orderManage.jsp">Manage Categories</a></li>
					<li class="nav-item"><a class="nav-link " href="orderView.jsp">View Order</a></li>
					<li class="nav-item"><a class="nav-link " href="orderManage.jsp">Manage Order</a></li>
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/admin?submit=AdminLogout">Logout</a></li>
				</ul>


			</div>

			<!-- main layout -->

			<div class="col-lg">

				<div>
					<h1 class="text-center text-warning">Products List</h1>
					
					<div>
						<table class="table table-hover ">
							<thead>
								<tr>
									<th>ID</th>
									<th>Title</th>
									<th>Price</th>
									<th>Photos</th>
									<th>Descriptions</th>
									<th>Brand</th>
									<th>Categories</th>
									<th>Sub Categories</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="prd" items="${listproduct }">
							
								<tr>
									<td><c:out value="${prd.id }"></c:out></td>
									<td><c:out value="${prd.title }"></c:out></td>
									<td><c:out value="${prd.price }"></c:out></td>
									<td><img src="/myprojectpractise/images/${prd.photo}" alt="${prd.title }" width="200px" height="150px" /></td>
									<td><c:out value="${prd.description }"></c:out></td>
									<td><c:out value="${prd.brand }"></c:out></td>
									<td><c:out value="${prd.categories }"></c:out></td>
									<td><c:out value="${prd.sub_categories }"></c:out></td>
								</tr>
								</c:forEach>
							</tbody>
							</table>
					</div>
					
				</div>

			</div>
		</div>
	</div>
	
</body>
</html>