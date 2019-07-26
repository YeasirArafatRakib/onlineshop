
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

