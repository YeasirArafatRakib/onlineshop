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
					<li class="nav-item"><a class="nav-link " href="/onlineshop/dashboardcontroller">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop/ProductManagement?submit=ViewProduct">View Product</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop/ProductManagement?submit=productAdd">Add Product</a></li>
					<li class="nav-item"><a class="nav-link " href="productManage.jsp">Manage Product</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop/CategoryManagement?submit=AddCategory">Add Categories</a></li>
					<li class="nav-item"><a class="nav-link active"	href="#">View SubCategories</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop/SubCategoryManagement?submit=AddSubCategory">Add SubCategories</a></li>
					<li class="nav-item"><a class="nav-link " href="orderView.jsp">View Order</a></li>
					<li class="nav-item"><a class="nav-link " href="orderManage.jsp">Manage Order</a></li>
					<li class="nav-item"><a class="nav-link " href="/onlineshop/admin?submit=AdminLogout">Logout</a></li>
				</ul>

			</div>

			<!-- main layout -->

			<div class="col-lg-8">

				<div>
					<h1 class="text-center text-warning">Category List</h1>
					
					<div>
						<table class="table table-hover ">
							<thead>
								<tr>
									<th>Sub Id</th>
									<th>Sub Name</th>
									<th>Cat Name</th>
									<th>Status</th>
									<th>Action</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="subcat" items="${subcategory }">
							
								<tr>
									<td><c:out value="${subcat.subCatId }"></c:out></td>
									<td><c:out value="${subcat.subCatName }"></c:out></td>
									<td><c:out value="${subcat.catName }"></c:out></td>
									<td><c:out value="${subcat.subCatStatus }"></c:out></td>
									<td>
									<a href="/onlineshop/SubCategoryManagement?submit=EditSubCategory&id=${subcat.subCatId}">Edit</a>
									<a href="/onlineshop/SubCategoryManagement?submit=DeleteSubCategory&id=${subcat.subCatId}">Delete</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
							</table>
					</div>

				</div>
				
								
				<hr>
				<div>
					<input onclick="activeCategoryFile()" type="button" value="Check Active" name="">
				</div>
				
				<!-- check activate category -->
				<div class="" id="activeCategory">
				
				</div>

			</div>

			
			<div class="col-lg-2">
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	function activeCategoryFile() {
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		     document.getElementById("activeCategory").innerHTML = this.responseText;
		    }
		  };
		  xhttp.open("POST", "/onlineshop/ActiveCategoryAjax", true);
		  xhttp.send();
		}
	
	</script>
	
</body>
</html>