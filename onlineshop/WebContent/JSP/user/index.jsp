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
<link rel="stylesheet" href="/ProductProject/asset/customcss/style.css">

<style>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/90b97a2be8.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
					href="/myprojectpractise/">Home <span class="sr-only">(current)</span></a></li>
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
			
			<button type="button" class="btn btn-primary">
			  Cart <span class="badge badge-light">4</span>
			</button>
		</div>

	</nav>

	<div class="container "></div>
	<!-- Nav Bar End  http://placehold.it/700x400-->
	<div class="container-fluid mt-2">
		<div class="row">
			<c:forEach var="product" items="${product}">
			
			
				<div class="col-md-3 col-sm-6">
					<figure class="card card-product">
						<a  href="/myprojectpractise/user?submit=view&id=${product.id}"><div class="img-wrap"><img src="/myprojectpractise/images/${product.photo}"></div></a>
						<figcaption class="info-wrap">
								<a  href="/myprojectpractise/user?submit=view&id=${product.id}"><h4 class="title">${product.title}</h4></a>
								<p class="desc">${product.brand}</p>
								<div class="rating-wrap">
									<div class="label-rating"><i class="fab fa-font-awesome"></i>132 reviews</div>
									<div class="label-rating"><i class="fas fa-grin"></i>154 orders </div>
								</div> <!-- rating-wrap.// -->
						</figcaption>
						<div class="bottom-wrap">
							<a href="/myprojectpractise/user?submit=view&id=${product.id}" class="btn btn-sm btn-primary float-right">View</a>	
							<div class="price-wrap h5">
								<span class="price-new">${product.price}</span> <del class="price-old">${product.price }</del>
							</div> <!-- price-wrap.// -->
						</div> <!-- bottom-wrap.// -->
					</figure>
				</div> <!-- col // -->
				
			</c:forEach>
		</div>
		</div>


</body>
</html>