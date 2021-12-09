<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Online Music Store</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body style="background-color: #B2D8E0">

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
				style="background-color: #191970">
  			<a class="navbar-brand" href="http://localhost:8090/Instrument_Payment/list">
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			American Musical Supply</a>
  

  			<div class="collapse navbar-collapse" id="navbarSupportedContent">
    			<ul class="navbar-nav mr-auto">
					<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Payment</a></li>
				</ul>
    			<form class="form-inline my-2 my-lg-0">
      				<input class="form-control mr-sm-2" style="background-color: #e8f6f9" type="search" placeholder="Search" aria-label="Search">
    			</form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			</div>
		</nav>
	</header>
	<br>
	
	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Payments</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">
					New Payment</a>
			</div>
			<br>
			<table class="table table-bordered" style="background-color: #e8f6f9">
				<thead>
					<tr>
						<th>ID</th>
						<th>Instrument</th>
						<th>Name on Card</th>
						<th>Card No</th>
						<th>CVV</th>
						<th>Expire Date</th>
						<th>Amount (Rs:)</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="payment" items="${listPayment}">

						<tr>
							<td><c:out value="${payment.id}" /></td>
							<td><c:out value="${payment.instrument}" /></td>
							<td><c:out value="${payment.name}" /></td>
							<td><c:out value="${payment.card}" /></td>
							<td><c:out value="${payment.cvv}" /></td>
							<td><c:out value="${payment.expire}" /></td>
							<td><c:out value="${payment.amount}" /></td>
							<td>
							&nbsp;&nbsp;&nbsp;
							<a href="edit?id=<c:out value='${payment.id}' />"> <button type="button" class="btn btn-warning btn-sm"> Edit </button></a>
							&nbsp;
							<a href="delete?id=<c:out value='${payment.id}' />"> <button type="button" class="btn btn-danger btn-sm"> Delete </button></a>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>

			</table>
		</div>
	</div>
	
	<br>
	<footer style="bottom:0;margin-top:140px; ">
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #292929">
			<table style="color:white; width:200%; border:0px; " >
			<tr>
				<th style="width:38%;"> Infront of SLIIT Malabe Campus, <br>
					American Musical Supply,<br>
				    New Kandy Rd, <br>
				    Malabe 10115.<br>
				</th>
				<th style="width:35%">Thank you for visiting our web page. <br><br>
				
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
				<a href="https://www.facebook.com/" class="fa fa-facebook"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://twitter.com/?lang=en" class="fa fa-twitter"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://lk.linkedin.com/" class="fa fa-linkedin"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://www.youtube.com/" class="fa fa-youtube"></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="https://www.instagram.com/" class="fa fa-instagram"></a>
				</th>
				
				<th style="width:25%"><br>Privacy Policy<br>
				Terms & Conditions<br>
				Disclaimer<br>
				Contact<br><br>
				</th>
			</tr>
			
			<tr style="background-color:red;"> 
				<th style="text-align:center;" colspan="3" ><br> ©  Copyright 2021 <br><br>
				</th>
			</tr>
			</table>
			
		</nav>
	</footer>
</body>
</html>