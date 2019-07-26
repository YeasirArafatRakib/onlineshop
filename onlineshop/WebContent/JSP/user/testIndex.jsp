<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="/myprojectpractise/assets/custom.css">

<style type="text/css">


@charset "ISO-8859-1";

.card-product .img-wrap {
    border-radius: 3px 3px 0 0;
    overflow: hidden;
    position: relative;
    height: 220px;
    text-align: center;
}
.card-product .img-wrap img {
    max-height: 100%;
    max-width: 100%;
    object-fit: cover;
}
.card-product .info-wrap {
    overflow: hidden;
    padding: 15px;
    border-top: 1px solid #eee;
}
.card-product .bottom-wrap {
    padding: 15px;
    border-top: 1px solid #eee;
}

.label-rating { margin-right:10px;
    color: #333;
    display: inline-block;
    vertical-align: middle;
}

.card-product .price-old {
    color: #999;
}

</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header Start -->
		
	<div class="jumbotron jumbotron-fluid">
	  <div class="container text-center">
	    <h1 class="display-4">Amazon</h1>
	    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
	  </div>
	</div>
	<!--Header End-->
	<!-- NAV BAR -->
	<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light ">

		<a class="navbar-brand" href="#">Company Icon</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item active"><a class="nav-link"
					href="/myprojectpractise/user">Home <span class="sr-only">(current)</span></a></li>
				<%
						if (session.getAttribute("UserName") != null) {
					%>
				<li class="nav-item"><a class="nav-link"
					href="/myprojectpractise/user?submit=logout">Logout</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/myprojectpractise/user?submit=orderview">My Orders</a></li>
				<%
						} else {
					%>
				<li class="nav-item"><a class="nav-link" href="/myprojectpractise/user?submit=userlogin">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/myprojectpractise/user?submit=registration">Registration</a></li>
				<%
						}
					%>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
					</div></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

	</nav>

	<div class="container "></div>
	<!-- Nav Bar End  http://placehold.it/700x400-->
	<div class="container-fluid mt-2">
		<div class="row">
	      <div class="col-md-5">
	        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	          <div class="carousel-inner">
	            <div class="carousel-item active">
	              <img src="/myprojectpractise/images/${product.photo}" class="d-block w-100" height="500px"  alt="...">
	            </div>
	            <div class="carousel-item">
	              <img src="/myprojectpractise/images/${product.photo}" class="d-block w-100" height="500px"  alt="...">
	            </div>
	            <div class="carousel-item">
	              <img src="/myprojectpractise/images/${product.photo}" class="d-block w-100" height="500px"  alt="...">
	            </div>
	          </div>
	          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="sr-only">Previous</span>
	          </a>
	          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="sr-only">Next</span>
	          </a>
	        </div>
	      </div>
	      <div class="col-md-7">
	        <p class="mt-2 new">New</p>
	        <h2><b>Title</b>:${product.title}</h2>
	        <p>Product Code: </p>
	        <p class="price">${product.price} </p>
	        <p><b>Availability:</b>In Stock</p>
	        <p><b>Condition:</b>New</p>
	        <p><b>Brand:</b> ${product.brand} </p>
	        <label>Quantity:</label>
	        <form action="" method="">
	        <input  type="text" name="quantity" value="1">
	        <input type="hidden" name="id" value="${product.id}">
	        <button type="submit" class="btn btn-default cart" name="submit" value="addcart">Add to Cart</button>
	        </form>
	        <a href="/myprojectpractise/user?submit=order&id=${product.id}" class="btn btn-primary">Buy Now</a>
	        <h4>Descriptions:</h4>
	
	        <p class="text">${product.description} </p>
	      </div>
	  </div>
	</div>


</body>
</html>




















