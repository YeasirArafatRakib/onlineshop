<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipping Address</title>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-8">
		

		<h2 class="text-center text-primary">Shipping Address</h2>
		<form action="/myprojectpractise/user" method="post">
			<div class="form-group">
				<label>*User Name</label>
					<input class="form-control" type="text" name="shipping_name" required placeholder="Enter Reciever Name" >
			</div>

			<div class="form-group">
				<label>*Email</label>
					<input class="form-control" type="email" name="shipping_email" required placeholder="Enter Reciever Email" >
			</div>

			<div class="form-group">
				<label>*Contact No</label>
					<input class="form-control" type="text" name="shipping_contact" required placeholder="Enter Contact No" >
			</div>
				<div class="row">
					<div class="col-md-4">
									
						<div class="form-group">
							<select class="form-control">
								<option value="">Select Division</option>
								<option value="Dhaka">Dhaka</option>
								<option value="Chattogram">Chattogram</option>
								<option value="Sylhet">Sylhet</option>
								<option value="Khulna">Khulna</option>
								<option value="Barishal">Barishal</option>
								<option value="Rajshahi">Rajshahi</option>
								<option value="Rangpur">Rangpur</option>
								<option value="Mymensingh">Mymensingh</option>
							</select>
						</div>
					</div>
					
					<div class="col-md-4">
			
						<div class="form-group">
							<select class="form-control">
								<option value="">Select District</option>
								<option value="Dhaka">Dhaka</option>
								<option value="Chattogram">Chattogram</option>
								<option value="Sylhet">Sylhet</option>
								<option value="Khulna">Khulna</option>
								<option value="Barishal">Barishal</option>
								<option value="Rajshahi">Rajshahi</option>
								<option value="Rangpur">Rangpur</option>
								<option value="Mymensingh">Mymensingh</option>
							</select>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<select class="form-control">
								<option value="">Select City</option>
								<option value="Dhaka">Dhaka</option>
								<option value="Chattogram">Chattogram</option>
								<option value="Sylhet">Sylhet</option>
								<option value="Khulna">Khulna</option>
								<option value="Barishal">Barishal</option>
								<option value="Rajshahi">Rajshahi</option>
								<option value="Rangpur">Rangpur</option>
								<option value="Mymensingh">Mymensingh</option>
							</select>
						</div>
					</div>
				</div>
			
			<div class="form-group">
				<label>*Address</label>
				<textarea class="form-control"></textarea>
			</div>
			
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="exampleRadios" value="Bkash" >
			  <label class="form-check-label" for="exampleRadios1">Bkash </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="exampleRadios" value="Rocket" >
			  <label class="form-check-label" for="exampleRadios1">Rocket </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="radio" name="exampleRadios" value="COD" >
			  <label class="form-check-label" for="exampleRadios1">Cash On Delivery </label>
			</div>
			<div class="form-group">
				<input type="submit" class="form-control btn-success mb-1" name="delivery" value="Deliver To This Address">
			</div>
		</form>
		</div>
		
		<div class="col-md-4">
			<div class="border rounded">
				<h2 class="text-center">Use This Address</h2>
				<form method="post" action="">
					<input readonly class="form-control-plaintext" name="Name" value="Yeasir Arafat Rakib">
					<input readonly class="form-control-plaintext" name="Address" value="Barishal Notullabad 8200">
					<input readonly class="form-control-plaintext" name="Division" value="Barishal">
					<input readonly class="form-control-plaintext" name="Phone" value="+8801765114900">
					<input type="submit" class="form-control btn-danger mb-1" name="delivery" value="Deliver To This Address">
				</form>
				<div class="row">
					<div class="col-sm-6"><a class="btn btn-block btn-primary btn-sm w-5" href="#">Edit</a></div>
					<div class="col-sm-6"><a class="btn btn-block btn-warning btn-sm w-5 float-right" href="#">Delete</a></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>